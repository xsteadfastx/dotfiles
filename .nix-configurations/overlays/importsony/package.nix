{
  imagingedge4linux,
  networkmanager,
  rclone,
  writeShellScriptBin,
  ...
}:
writeShellScriptBin "importsony" ''
  set -euo pipefail

  SSID=""
  PASSWORD=""
  DEV="wlp2s0"

  TMPDIR=$(mktemp -p ~/tmp -d -t photoprism-XXXXXXX)

  NMCLI=${networkmanager}/bin/nmcli

  CURRENT_SSID=$($NMCLI -t c show --active | grep "$DEV" | head -n 1 | cut -d ':' -f 1)

  $NMCLI dev wifi connect "$SSID" password "$PASSWORD"

  echo "Waiting..."
  sleep 6

  ${imagingedge4linux}/bin/imagingedge4linux -o $TMPDIR

  if [ -n "$CURRENT_SSID" ]; then
    echo "Reconnecting to the previously connected network..."
    $NMCLI con up "$CURRENT_SSID"
  else
    echo "No previously connected network found."
    exit 1
  fi

  # echo "Removing tmp dir $TMPDIR..."
  # rm -rf $TMPDIR

  echo "Done."
''
