import os

winTitle = window.get_active_title()

if 'Google 캘린더' in winTitle:
    os.system("xvkbd -no-jump-pointer -xsendevent -text '\C\Ah'")
else:
    keyboard.send_keys('<alt>+a')
