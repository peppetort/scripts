#! /bin/bash


NETWORK=$(nmcli connection show | awk 'NR==2' | awk '{print $1}')
TORRESCALLANG="TorrescallaNG"
VODAFONETORRESCALLA="Vodafone-Torrescalla"

if [ "$NETWORK" == "$VODAFONETORRESCALLA" ]; then
	nmcli connection up $TORRESCALLANG &> /dev/null
	echo "Connesso a TorrescallaNG"
elif [ "$NETWORK" ==  "$TORRESCALLANG" ]; then
	nmcli connection up $VODAFONETORRESCALLA
	echo "Connesso a Vodafone-Torrescalla" &> /dev/null
else
	echo "Non sei connesso a nassuna rete tra Vodafone-Torrescalla e TorrescallaNG"
fi
