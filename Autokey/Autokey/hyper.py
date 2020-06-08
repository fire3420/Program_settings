winClass = window.get_active_class()

if 'code.Code' in winClass or 'vscodium.VSCodium' in winClass or 'code - insiders.Code - Insiders' in winClass:
    keyboard.send_keys('<ctrl>+<alt>+b')
    