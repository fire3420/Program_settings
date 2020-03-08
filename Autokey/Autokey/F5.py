import os

winTitle = window.get_active_title()
winClass = window.get_active_class()

target = 'Chromium'
if target in winTitle:
    os.system("xvkbd -no-jump-pointer -xsendevent -text '\Ad'")
    keyboard.send_keys('https://tasks.google.com/embed/?origin=https://calendar.google.com&fullWidth=1')
    keyboard.send_keys('<enter>')
elif 'sqlitebrowser.DB Browser for SQLite' in winClass:
    keyboard.send_keys('<ctrl>+r')
else:
    os.system("xvkbd -no-jump-pointer -xsendevent -text '\[0xffc2]'")
