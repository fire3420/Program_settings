import os
import time
winTitle = window.get_active_title()

if 'Tasks' in winTitle:
    os.system("xvkbd -no-jump-pointer -xsendevent -text '\C\Ai'")
    time.sleep(0.5)
    for ii in range(0,4):
        keyboard.send_keys('<shift>+<tab>')
elif 'Google 캘린더' in winTitle:
    os.system("xvkbd -no-jump-pointer -xsendevent -text '\C\A5'")
else:
    keyboard.send_keys('<alt>+d')
