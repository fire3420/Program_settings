
Curr=$(pwd)

mkdir -p $(jupyter --data-dir)/nbextensions
cd $(jupyter --data-dir)/nbextensions
git clone https://github.com/lambdalisue/jupyter-vim-binding vim_binding
jupyter nbextension enable vim_binding/vim_binding

cd ${Curr}

jupyter serverextension enable jupytext

jupyter nbextension enable varInspector/main
jupyter nbextension enable execute_time/ExecuteTime
jupyter nbextension enable hide_input_all/main

jupyter nbextension enable toc2/main
jupyter nbextension enable notify/notify


XPATH=/home/${USER}
XPATH_SUB=/home/${USER}/.jupyter

[ -d /home/${USER}/.jupyter ] && rm -rf /home/${USER}/.jupyter

ln -ds ${PWD}/.jupyter /home/${USER}

