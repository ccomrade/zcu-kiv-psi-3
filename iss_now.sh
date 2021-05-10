#!/bin/sh

iss_data=$(http 'api.open-notify.org/iss-now.json')

iss_lat=$(echo "$iss_data" | jq -r '.iss_position.latitude')
iss_lng=$(echo "$iss_data" | jq -r '.iss_position.longitude')

sun_data=$(http 'api.sunrise-sunset.org/json' lat==$iss_lat lng==$iss_lng formatted==0)

dawn_timedate=$(echo "$sun_data" | jq -r '.results.sunrise')
dusk_timedate=$(echo "$sun_data" | jq -r '.results.sunset')

# timestamps
dawn=$(date -d "$dawn_timedate" '+%s')
dusk=$(date -d "$dusk_timedate" '+%s')

now=$(date '+%s')

if [ $now -gt $dawn ] && [ $now -lt $dusk ]
then
	side="illuminated"
else
	side="unlit"
fi

# 2 hours before dawn or 2 hours after dusk
if [ $now -lt $dawn ] && [ $now -gt $((dawn - 7200)) ] \
|| [ $now -gt $dusk ] && [ $now -lt $((dusk - 7200)) ]
then
	conditions="ideal"
else
	conditions="not ideal"
fi

echo "The ISS is currently on the ${side} side of the Earth"
echo "Observation conditions are ${conditions}"
