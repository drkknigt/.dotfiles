#!/usr/bin/env zsh

# Description: 
# This script automates the process of connecting and disconnecting OpenVPN. 
# It attempts to connect to OpenVPN by selecting a configuration and password file. If the vpn is already conected script disconnects it


# Check if OpenVPN is running by searching for its process
vpn_running() {
    pgrep -f openvpn &> /dev/null
}

# openvpn log file
openvpn_log="$HOME/.cache/openvpn.logfile"

# If OpenVPN is already running, show a notification and exit
if vpn_running; then
    echo "Disconnecting VPN. Please enter root password."
    if sudo killall openvpn &> /dev/null; then
        notify-send -h string:bgcolor:#00000E "OpenVPN disconnected"
    fi
    exit
fi

# select protocol and set corresponding directory
protocol=$(echo "udp\ntcp" | fzf --prompt="select protocol: " --cycle) || exit
dir="$HOME/.config/openvpn/config/$protocol"

# Use fd to find and select a config file for OpenVPN
config_file=$(fd . $dir -a -H -t f | fzf --prompt='Select config file: ' --cycle --delimiter / --with-nth -1) || exit

# Use fd to find and select the password file for OpenVPN
pass_file=$(fd . "$HOME/.config/openvpn/pass" -a -H -t f | fzf --prompt='Select pass file: ' --cycle --delimiter / --with-nth -1) || exit

# attempt to connect to OpenVPN in the background
sudo openvpn --config "$config_file" --auth-user-pass "$pass_file" &> $openvpn_log &
openvpn_pid=$!

# Wait for up to 30 seconds for the VPN interface (tun0) to be created
for _ in {1..30}; do
    if ip link show tun0 &> /dev/null; then
        # If tun0 interface is found, OpenVPN is connected
        notify-send -h string:bgcolor:#00000E "OpenVPN connected"
        exit 0
    fi
    tail -n1 $openvpn_log
    sleep 1
done

# If connection fails, show an error notification and kill the OpenVPN process
notify-send -h string:bgcolor:#ff4f44 "OpenVPN connection failed"
sudo kill $openvpn_pid &> /dev/null
wait $openvpn_pid 2>/dev/null
