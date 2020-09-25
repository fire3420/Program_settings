# Enter script code
import os
is_sat = False
os.system("nvidia-settings -a [DPY:HDMI-1]/DigitalVibrance=-1024")

is_sat = store.get_value("is_sat")
if(not is_sat):
    is_sat = True
    store.set_value("is_sat",True)
    os.system("nvidia-settings -a [DPY:HDMI-1]/DigitalVibrance=-1024")
else:
    os.system("nvidia-settings -a [DPY:HDMI-1]/DigitalVibrance=0")
    is_sat = False
    store.set_value("is_sat",False)