import os

winTitle = window.get_active_title()

if 'Tasks' in winTitle:
    os.system("xvkbd -no-jump-pointer -xsendevent -text '\C\Ap'")
else:
    keyboard.send_keys('<alt>+1')
