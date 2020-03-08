winClass = window.get_active_class()

if 'gnome-terminal-server.Gnome-terminal' in winClass:
    keyboard.send_keys('<ctrl>+<shift>+v')
else:
    keyboard.send_keys('<ctrl>+v')