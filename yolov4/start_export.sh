TF_VENV=$1
ROOT=`pwd`

meowda init init_env.sh
source init_env.sh

git clone https://github.com/PaddleJitLab/tf2-yolov4 --depth 10
cd tf2-yolov4
git checkout master
meowda activate $TF_VENV
meowda install tensorflow==2.15.0 tensorflow_addons -q
python export.py
