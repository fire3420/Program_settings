XPATH=/home/${USER}/.config/autokey/data/
XPATH_SUB=/home/${USER}/.config/autokey/data/Autokey

[ -d $XPATH_SUB ] && rm -rf $XPATH_SUB

ln -ds ${PWD}/Autokey/ $XPATH/


