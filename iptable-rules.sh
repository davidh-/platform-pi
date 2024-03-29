#!/bin/sh

# Add firewall rules
sudo iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
sudo iptables -t nat -A POSTROUTING -o wlan0 -j MASQUERADE
sudo iptables -A FORWARD -i wlan0 -o uap0 -m state --state RELATED,ESTABLISHED -j ACCEPT
sudo iptables -A FORWARD -i uap0 -o wlan0 -j ACCEPT
sudo netfilter-persistent save


# exported version
# iptables-save > /some/file
# iptables-restore < /some/file
# Generated by iptables-save v1.8.7 on Sun May 21 05:31:30 2023
*filter
:INPUT ACCEPT [644798:254362054]
:FORWARD ACCEPT [19331:6690158]
:OUTPUT ACCEPT [457346:440984209]
-A FORWARD -i wlan0 -o uap0 -m state --state RELATED,ESTABLISHED -j ACCEPT
-A FORWARD -i uap0 -o wlan0 -j ACCEPT
-A FORWARD -i eth0 -o wlan0 -j ACCEPT
COMMIT
# Completed on Sun May 21 05:31:30 2023
# Generated by iptables-save v1.8.7 on Sun May 21 05:31:30 2023
*nat
:PREROUTING ACCEPT [5842:975359]
:INPUT ACCEPT [2225:444131]
:OUTPUT ACCEPT [533:48531]
:POSTROUTING ACCEPT [279:26357]
-A POSTROUTING -o eth0 -j MASQUERADE
-A POSTROUTING -o wlan0 -j MASQUERADE
COMMIT
# Completed on Sun May 21 05:31:30 2023
