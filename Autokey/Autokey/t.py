import os

winTitle = window.get_active_title()

if 'Tasks' in winTitle:
    os.system("xvkbd -no-jump-pointer -xsendevent -text '\C\An'")
elif 'Google 캘린더' in winTitle:
    os.system("xvkbd -no-jump-pointer -xsendevent -text '\C\A6'")
else:
    keyboard.send_keys('<alt>+t')
