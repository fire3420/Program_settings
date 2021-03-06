apt-get update 
apt-get install -y tmux
apt-get install -y vim
apt-get install -y npm


curl -sL https://deb.nodesource.com/setup_12.x | sh
apt-get install -y nodejs 
yes | pip install jupyterlab
apt-get install -y git


# VIM
jupyter labextension install @axlair/jupyterlab_vim
jupyter labextension enable @axlair/jupyterlab_vim

# THEME
git clone https://github.com/fire3420/jupyterlab-theme-solarized-dark.git ~/.jupyter/theme_solardark
jupyter labextension install ~/.jupyter/theme_solardark && jupyter labextension enable ~/.jupyter/theme_solardark
# cd ~/jupyterlab-theme-solarized-dark && npm install && jupyter labextension link . && npm run build && jupyter lab build

#Jupytext
pip install jupytext
jupyter labextension install jupyterlab-jupytext
jupyter labextension enable jupyterlab-jupytext


# XPATH=/home/${USER}
# XPATH_SUB=/home/${USER}/.jupyter
#
# [ -d /home/${USER}/.jupyter ] && rm -rf /home/${USER}/.jupyter

[ ! -d /home/${USER}/.jupyter/lab ] &&  mkdir /home/${USER}/.jupyter/lab && mkdir /home/${USER}/.jupyter/lab/user-settings/
[ -f /home/${USER}/.jupyter/jupyter_notebook_config.py ] && rm /home/${USER}/.jupyter/jupyter_notebook_config.py

## config file
ln -ds ${PWD}/jupyter_notebook_config.py ~/.jupyter/
ln -ds ${PWD}/@jupyterlab ~/.jupyter/lab/user-settings/@jupyterlab

## other packages
jupyter labextension install jupyterlab-execute-time
jupyter labextension enable jupyterlab-execute-time
jupyter labextension install @lckr/jupyterlab_variableinspector
jupyter labextension enable @lckr/jupyterlab_variableinspector
jupyter labextension install @jupyterlab/toc
jupyter labextension enable @jupyterlab/toc
jupyter labextension install @jupyterlab/debugger
jupyter labextension enable @jupyterlab/debugger


