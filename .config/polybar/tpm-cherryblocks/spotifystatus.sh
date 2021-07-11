sp_stat=$(playerctl -p spotify status)

if [ "$sp_stat" = "Playing" ]
then
	echo ""
else
	echo ""
fi
