TF_VENV=$1
ROOT=`pwd`

meowda init init_env.sh
source init_env.sh

git clone https://github.com/PaddleJitLab/yolact-tf2 --depth 10
cd yolact-tf2
git checkout main
meowda activate $TF_VENV
python export.py
