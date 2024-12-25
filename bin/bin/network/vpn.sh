#!/usr/bin/env zsh

# Description: 
# This script automates the process of connecting and disconnecting OpenVPN. 
# If the first argument is 'c', it attempts to connect to OpenVPN by selecting
# a configuration and password file. If the first argument is not 'c', it disconnects OpenVPN if it's running.

# Check if OpenVPN is running by searching for its process
vpn_running() {
    pgrep -f openvpn &> /dev/null
}

# If the first argument is 'c', connect to OpenVPN
if [[ "$1" == "c" ]]; then
    # If OpenVPN is already running, show a notification and exit
    if vpn_running; then
        notify-send -h string:bgcolor:#00000E "OpenVPN already connected"
        exit
    fi

    # select protocol and set corresponding directory
    protocol=$(echo "udp\ntcp" | fzf --prompt="select protocol: " --cycle) || exit
    if [ "$protocol" = "udp" ]; then
        dir="$HOME/.config/openvpn/config/udp"
    else
        dir="$HOME/.config/openvpn/config/tcp"
    fi

    # Use fd to find and select a config file for OpenVPN
    config_file=$(fd . $dir -a -H -t f | fzf --prompt='Select config file: ' --cycle --delimiter / --with-nth -1) || exit
    
    # Use fd to find and select the password file for OpenVPN
    pass_file=$(fd . "$HOME/.config/openvpn/pass" -a -H -t f | fzf --prompt='Select pass file: ' --cycle --delimiter / --with-nth -1) || exit

    # attempt to connect to OpenVPN
        sudo -b openvpn --config "$config_file" --auth-user-pass "$pass_file"

    # Wait for up to 30 seconds for the VPN interface (tun0) to be created
        for _ in {1..30}; do
            if ip link show tun0 &> /dev/null; then
                # If tun0 interface is found, OpenVPN is connected
                notify-send -h string:bgcolor:#00000E "OpenVPN connected"
                exit 0
            fi
            sleep 1
        done

        # If connection fails, show an error notification and kill the OpenVPN process
        notify-send -h string:bgcolor:#ff4f44 "OpenVPN connection failed"
        sudo killall openvpn &> /dev/null
else
    # If the first argument is not 'c', attempt to disconnect OpenVPN
    if vpn_running; then
        # If OpenVPN is running, disconnect and notify the user
        echo "Disconnecting VPN. Please enter root password."
        if sudo killall openvpn &> /dev/null; then
            notify-send -h string:bgcolor:#00000E "OpenVPN disconnected"
        fi
    else
        # If OpenVPN is not running, notify the user
        notify-send -h string:bgcolor:#00000E "OpenVPN is not running"
    fi
fi
