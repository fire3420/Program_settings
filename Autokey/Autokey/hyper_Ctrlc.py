winClass = window.get_active_class()

#if 'gnome-terminal-server.Gnome-terminal' in winClass:
if 'konsole.konsole' in winClass:
    keyboard.send_keys('<ctrl>+<shift>+c')
else:
    keyboard.send_keys('<ctrl>+c')