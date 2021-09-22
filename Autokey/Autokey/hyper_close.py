# Enter script code
winClass = window.get_active_class()
if 'dolphin.dolphin' in winClass or 'qutebrowser.qutebrowser' in winClass:
    keyboard.send_keys('<ctrl>+q')
elif 'konsole.konsole' in winClass:
    keyboard.send_keys('<ctrl>+<shift>+q')
else:
    keyboard.send_keys('<alt>+<f4>')
    