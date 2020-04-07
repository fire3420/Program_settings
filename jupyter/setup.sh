yes | pip install jupyter_contrib_nbextensions
yes | pip install pixiedust
yes | pip install jupytext --upgrade

jupyter contrib nbextension install

Curr=$(pwd)

mkdir -p $(jupyter --data-dir)/nbextensions
cd $(jupyter --data-dir)/nbextensions
git clone https://github.com/lambdalisue/jupyter-vim-binding vim_binding
jupyter nbextension enable vim_binding/vim_binding

cd $(Curr)

mkdir ~/.jupyter/custom

jupyter serverextension enable jupytext


XPATH=/home/${USER}
XPATH_SUB=/home/${USER}/.jupyter

[ -d $XPATH_SUB ] && rm -rf $XPATH_SUB

ln -ds ${PWD}/.jupyter/ $XPATH/

