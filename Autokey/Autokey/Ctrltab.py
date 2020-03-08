winClass = window.get_active_class()

if 'gnome-terminal-server.Gnome-terminal' in winClass:
    keyboard.send_keys('<ctrl>+<page_down>')
elif 'gedit.Gedit' in winClass:
    keyboard.send_keys('<ctrl>+<alt>+<page_down>')
elif 'Navigator.Firefox' in winClass:
    keyboard.send_keys('<ctrl>+<page_down>')
else:
    keyboard.send_keys('<ctrl>+<tab>')
