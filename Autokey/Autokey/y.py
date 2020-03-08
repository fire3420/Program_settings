import os

winTitle = window.get_active_title()

if 'Google 캘린더' in winTitle:
    os.system("xvkbd -no-jump-pointer -xsendevent -text '\C\A1'")
else:
    keyboard.send_keys('<alt>+y')
