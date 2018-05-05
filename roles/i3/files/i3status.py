import os

from i3pystatus import Status
from i3pystatus.weather import weathercom

COL_GREEN = '#5f8700'
COL_RED = '#d70000'
COL_BLUE = '0087ff'
COL_YELLOW = '#af8700'


STATUS = Status()

STATUS.register(
    'clock',
    format=' %a %-d %b %X KW%V',
)

STATUS.register(
    'weather',
    format='{icon} {current_temp}{temp_unit}[ {update_error}]',
    colorize=True,
    interval=900,
    backend=weathercom.Weathercom(
        location_code='GMNI2456:1:GM',
    )
)

STATUS.register(
    'pulseaudio',
    color_unmuted=COL_GREEN,
    color_muted=COL_RED,
    format_muted=' [muted]',
    format=' {volume}%'
)

STATUS.register('load')

STATUS.register(
    'cpu_usage',
    format=' {usage:03.0f}%',
    hints = {
        'separator': False
    },
)

if os.path.isdir('/sys/class/thermal/thermal_zone0'):
    STATUS.register(
        'temp',
        format='🌡 {temp:03.0f}°C',
        alert_color=COL_RED,
    )

STATUS.register(
    'battery',
    format='{status} {percentage:03.0f}% {remaining:%E%hh:%Mm}',
    critical_color=COL_RED,
    charging_color=COL_YELLOW,
    full_color=COL_GREEN,
    status={
        'DIS': '',
        'CHR': '',
        'FULL': '',
    },
    not_present_text='',
)

for eth in ['eth0', 'enp0s10', 'enx10653089536b']:
    STATUS.register(
        'network',
        interface=eth,
        color_up=COL_GREEN,
        color_down=COL_RED,
        dynamic_color=False,
        format_up='🖧 {interface}  {v4cidr}',
        format_down='',
    )

for wifi in ['wlan0', 'wlp3s0', 'wlp2s0']:
    STATUS.register(
        'network',
        interface=wifi,
        color_up=COL_GREEN,
        color_down=COL_RED,
        dynamic_color=False,
        format_up=' {essid} {quality:03.0f}%  {v4cidr}',
        format_down='',
    )

for vpn in ['z10n']:
    STATUS.register(
        'openvpn',
        vpn_name=vpn,
        color_up=COL_GREEN,
        color_down=COL_RED,
    )

STATUS.register(
    'mpd',
    format='{status} {artist} - {title}',
    status={
        'pause': '▷',
        'play': '▶',
        'stop': '◾',
    },
    host='10.8.0.30'
)

STATUS.run()
