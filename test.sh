MYPROG=$( zenity --entry --title='MY LAUNCHER' --text='Type the name of application to run' )
sleep 0.5
wmctrl -lx | awk '{print $3}' | grep -i "$MYPROG"

if [ $? -eq 0 ]; then
    sleep 1         
    wmctrl -xa $MYPROG
   #as an alternative try the line bellow
   #wmctrl -a $MYPROG
    exit 1
else 
    $MYPROG &
    exit 0
fi