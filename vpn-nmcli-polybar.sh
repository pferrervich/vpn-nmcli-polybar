#!/usr/bin/env bash

VPN_ENTRY="MY_VPN"


ACTIVE_CONNECTION=$(nmcli --mode tabular --terse connection show --active | grep vpn | cut -d ':' -f1) || true


if [[ "$ACTIVE_CONNECTION" == "$VPN_ENTRY" ]]; then
        echo "ON"
fi


if [[ "$ACTIVE_CONNECTION" != "$VPN_ENTRY" ]]; then
        echo "OFF"
fi




vpn_toggle_connection() {
# connects or disconnects vpn

if [[ "$ACTIVE_CONNECTION" == "$VPN_ENTRY" ]]; then
        nmcli con down id "$VPN_ENTRY"
        
else
   [[ "$ACTIVE_CONNECTION" != "$VPN_ENTRY" ]];
        nmcli con up id "$VPN_ENTRY" passwd-file /etc/vpn/pass.txt
fi

}


# cases for polybar click events
case "$1" in
	-t|--toggle-connection) vpn_toggle_connection ;;
esac
