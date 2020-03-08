# Enter script code
from datetime import datetime
#date_time = datetime.now().strftime("%m/%d/%Y, %H:%M:%S")
date_time = datetime.now().strftime("%Y_%m%d_%H%M_")
keyboard.send_keys(date_time)	