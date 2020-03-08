import os

winClass = window.get_active_title()

if 'Google 스프레드시트' in winClass:
    os.system('google-chrome --app-id=felcaaldnbdncclmgdcncolpebgiejap --profile-directory=Default')
elif 'Google 문서' in winClass:
    os.system('google-chrome --app-id=aohghmighlieiainnegkcijnfilokake --profile-directory=Default')
else:
    keyboard.send_keys('<ctrl>+n')