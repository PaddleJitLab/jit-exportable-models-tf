TF_VENV=$1
ROOT=`pwd`

meowda init init_env.sh
source init_env.sh

git clone https://github.com/PaddleJitLab/keras_cv_attention_models --depth 10
cd keras_cv_attention_models
git checkout main
meowda activate $TF_VENV
meowda install tensorflow==2.15.0 tqdm -q
python export.py
