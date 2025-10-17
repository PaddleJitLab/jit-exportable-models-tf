export PYTHONWARNINGS=ignore

ROOT=`pwd`
TF_VENV="tf-py310"
mkdir build
cd build

meowda init init_env.sh
source init_env.sh
repos=(
  "resnet"
  "fcn8sd"
  "ghostnet"
  "darknet53"
  "airnet50"
  "centernet"
  "dabnet"
  "diracnet"
  "efficientnet"
  "lffd"
  "wrnet"
  "cgnet"
  "fastscnn"
  "yolact-tf2"
  "detr-tensorflow"
  "yolov4"
  "yolov5"
  "beit2"
  "cmt"
  "background-mattingv2"
)
for repo in "${repos[@]}"; do
    # Init torch environment
    meowda create $TF_VENV -p 3.10 --local -c
    meowda activate $TF_VENV
    meowda install tensorflow==2.20 -q

    # Run model export
    echo "[JIT] start run model $repo"
    bash ../$repo/start_export.sh $TF_VENV
done 