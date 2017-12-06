from i3pystatus import Status

STATUS = Status()

STATUS.register(
    'clock',
    format='%a %-d %b %X KW%V',
)

STATUS.register(
    'pulseaudio',
    format='♪{volume}',
)

STATUS.register('load')

STATUS.register('cpu_usage')

STATUS.register(
    'temp',
    format='{temp:.0f}°C',
)

STATUS.register(
    'battery',
    format='{status}/{consumption:.2f}W {percentage:.2f}% [{percentage_design:.2f}%] {remaining:%E%hh:%Mm}',
    status={
        'DIS': '↓',
        'CHR': '↑',
        'FULL': '=',
    },
    not_present_text='',
)

STATUS.register(
    'network',
    interface='eth0',
    format_up='{interface} {v4cidr} {bytes_recv}KB/s',
    format_down='',
)

STATUS.register(
    'network',
    interface='wlan0',
    format_up='{essid} {quality:03.0f}% {v4cidr} {bytes_recv}KB/s',
    format_down='',
)

STATUS.register(
    'openvpn',
    vpn_name='z10n'
)

STATUS.register(
    'openvpn',
    vpn_name='tsm'
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
