TF_VENV=$1
ROOT=`pwd`

meowda init init_env.sh
source init_env.sh

git clone https://github.com/PaddleJitLab/detr-tensorflow --depth 10
cd detr-tensorflow
git checkout main
meowda activate $TF_VENV
# Cannot init model in TF 2.20, we fallback to TF 2.15
meowda install tensorflow==2.15 -q
meowda install opencv-python "numpy<2" matplotlib -q
python export.py
