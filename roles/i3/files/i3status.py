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
    format='[ {icon}] {current_temp}{temp_unit}[ {update_error}]',
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
    format=' {usage}%'
)

STATUS.register(
    'temp',
    format='{temp:.0f}°C',
    alert_color=COL_RED,
)

STATUS.register(
    'battery',
    format='{status} {percentage:.0f}% {remaining:%E%hh:%Mm}',
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

STATUS.register(
    'network',
    interface='eth0',
    color_up=COL_GREEN,
    color_down=COL_RED,
    dynamic_color=False,
    format_up='{interface} {v4cidr} {kbs} kbs',
    format_down='',
)

STATUS.register(
    'network',
    interface='wlp3s0',
    color_up=COL_GREEN,
    color_down=COL_RED,
    dynamic_color=False,
    format_up=' {essid} {quality:03.0f}% {v4cidr} {kbs} kbs',
    format_down='',
)

STATUS.register(
    'openvpn',
    vpn_name='z10n',
    color_up=COL_GREEN,
    color_down=COL_RED,
)

STATUS.register(
    'openvpn',
    vpn_name='TSM',
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
