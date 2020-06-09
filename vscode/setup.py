from pathlib import Path
import sys
import getpass
import os
VSPATH = Path("/home") / getpass.getuser() / ".config" / "Code" / "User"
CODIUMPATH = Path("/home") / getpass.getuser() / ".config" / "VSCodium" / "User"
INSIDERPATH = Path("/home") / getpass.getuser() / ".config" / "Code\ -\ Insiders" / "User"
INSIDERPATH2 = Path("/home") / getpass.getuser() / ".config" / "Code - Insiders" / "User"

if VSPATH.is_dir():
    os.system(f"ln -fs {os.getcwd()}/keybindings.json {str(VSPATH)}/keybindings.json")
    os.system(f"ln -fs {os.getcwd()}/settings.json {str(VSPATH)}/settings.json")

if CODIUMPATH.is_dir():
    os.system(f"ln -fs {os.getcwd()}/keybindings.json {str(CODIUMPATH)}/keybindings.json")
    os.system(f"ln -fs {os.getcwd()}/settings.json {str(CODIUMPATH)}/settings.json")

if INSIDERPATH2.is_dir():
    os.system(f"ln -fs {os.getcwd()}/keybindings.json {str(INSIDERPATH)}/keybindings.json")
    os.system(f"ln -fs {os.getcwd()}/settings.json {str(INSIDERPATH)}/settings.json")