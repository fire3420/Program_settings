import os
winClass = window.get_active_class()

#if 'gnome-terminal-server.Gnome-terminal' in winClass:
if 'pcmanfm-qt.pcmanfm-qt' in winClass:
    window.activate('pcmanfm-qt.pcmanfm-qt', switchDesktop=True, matchClass=True)
else:
    os.system("pcmanfm-qt")