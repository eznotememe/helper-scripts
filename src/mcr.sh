!#/bin/bash

# The Mac changer script is assuming the wifi is disconnected from the access point, ethernet, loop back

# it uses the -r to randomly give you a new mac address

# wlp2s0 - The MediaTek Wifi Card
# enp2s0 - The Ethernet Card
# lo - The Loop back.

# This assumes you are using Debian 12 and have install macchanger. 
# Note: this should work on any debian based distro, Ubuntu, mint, zorin etc?

sudo macchanger -r wlp2s0 && sudo macchanger -r enp3s0 && sudo macchanger -r lo
