winClass = window.get_active_class()

if 'gnome-terminal-server.Gnome-terminal' in winClass:
    keyboard.send_keys('<ctrl>+<page_up>')
elif 'Navigator.Firefox' in winClass:
    keyboard.send_keys('<ctrl>+<page_up>')
elif 'gedit.Gedit' in winClass:
    keyboard.send_keys('<ctrl>+<alt>+<page_up>')
else:
    keyboard.send_keys('<ctrl>+<shift>+<tab>')
