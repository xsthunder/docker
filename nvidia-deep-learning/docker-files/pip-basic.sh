set -x
set -e
# 清华源不稳定
# pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
pip config set global.index-url https://pypi.mirrors.ustc.edu.cn/simple/
yes | pip install scikit-learn nltk rouge tqdm==4.60 numpy seaborn pydot jupyter_contrib_nbextensions ipywidgets

# first install pip install jupyter-tensorboard in host
# copy ~/.jupyter
# for corresspoinding to host env install nbextension
jupyter contrib nbextension install --user
