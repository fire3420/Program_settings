winClass = window.get_active_class()

if 'code.Code' in winClass or 'vscodium.VSCodium' in winClass:
    keyboard.send_keys('<ctrl>+<shift>+<alt>+y')
    