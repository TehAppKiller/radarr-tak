#!/bin/bash -e

# Define config file
config_file="$SNAP_DATA/config.xml"

# Check if config file exists
if [ ! -f $config_file ]; then
    echo "! Configuration file does not exist !"
else
    # Recover used port
	port=$(sed -nr 's/^.*<Port>(.*)<\/Port>/\1/p' $config_file)
	# Launch url
	xdg-open http://localhost:$port
fi
