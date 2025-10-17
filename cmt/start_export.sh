TF_VENV=$1
ROOT=`pwd`

meowda init init_env.sh
source init_env.sh

git clone https://github.com/PaddleJitLab/tf-CMT --depth 10
cd tf-CMT
git checkout main
meowda activate $TF_VENV
python export.py
