TF_VENV=$1
ROOT=`pwd`

meowda init init_env.sh
source init_env.sh

git clone https://github.com/PaddleJitLab/BackgroundMattingV2-TensorFlow --depth 10
cd BackgroundMattingV2-TensorFlow
git checkout master
meowda activate $TF_VENV
python export.py
