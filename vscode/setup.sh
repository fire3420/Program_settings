VSPATH=/home/${USER}/.config/Code/User
CODIUMPATH=/home/${USER}/.config/VSCodium/User
INSIDERPATH=/home/${USER}/.config/"Code - Insiders"/User

ln -fs ${PWD}/keybindings.json $VSPATH/keybindings.json
ln -fs ${PWD}/settings.json $VSPATH/settings.json


ln -fs ${PWD}/keybindings.json $CODIUMPATH/keybindings.json
ln -fs ${PWD}/settings.json $CODIUMPATH/settings.json

ln -fs ${PWD}/keybindings.json $INSIDERPATH/keybindings.json
ln -fs ${PWD}/settings.json $INSIDERPATH/settings.json

