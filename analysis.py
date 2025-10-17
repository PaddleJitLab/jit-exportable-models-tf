import argparse
import re
import json

REGEX_MODEL_START = re.compile(r"start run model (?P<model_name>.+)")
REGEX_TF_STATE = re.compile(r"Export model by TensorFlow (?P<state>successed|failed)")


def cli():
    parser = argparse.ArgumentParser(description="Model dy2st success rate analysis")
    parser.add_argument("input", type=str, help="Input log path")
    return parser.parse_args()

def parse_log(log_file: str):
    result: dict[str, bool] = {}
    with open(log_file, "r") as f:
        lines = f.readlines()
        model_name = None
        for line in lines:
            if not line.startswith("[JIT]"):
                continue
            if match := REGEX_MODEL_START.search(line):
                model_name = match.group("model_name")
                result.setdefault(model_name, [False, False])
            elif match := REGEX_TF_STATE.search(line):
                assert model_name is not None
                assert match.group("state") in {"successed", "failed"}
                tf_state = match.group("state") == "successed"
                result[model_name] = tf_state
    return result

def main():
    args = cli()
    result = parse_log(args.input)
    print(json.dumps(result, indent=4))
    tf_success_rate = sum(1 for v in result.values() if v) / len(result) * 100
    print(f"TensorFlow success rate: {tf_success_rate:.2f}%")

if __name__ == "__main__":
    main()