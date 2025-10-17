TF_VENV=$1
ROOT=`pwd`

meowda init init_env.sh
source init_env.sh

git clone https://github.com/PaddleJitLab/yolov5_in_tf2_keras --depth 10
cd yolov5_in_tf2_keras
git checkout master
meowda activate $TF_VENV
meowda install opencv-python -q
python export.py
