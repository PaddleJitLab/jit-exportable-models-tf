TF_VENV=$1
ROOT=`pwd`

meowda init init_env.sh
source init_env.sh

git clone https://github.com/PaddleJitLab/imgclsmob --depth 10
cd imgclsmob
git checkout master
meowda activate $TF_VENV
python export-cgnet.py