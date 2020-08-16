#!/bin/bash 
declare -a parts=("7 Segments Display" "Buzzer" "D. Transfer function" "Gamepad" "IO 74xx595" "IO MCP23S17" "IO PCF8574" \
       	"Keypad" "LCD hd44780"  "LCD pcf8833"  "LCD pcd8544"  "LED Matrix"  "LEDs"  "MEM 24CXXX"  "Potentiometers" \
	"Push buttons"  "Push buttons (Analogic)"  "RGB LED"  "RTC ds1307"  "RTC pfc8563"  "Servo motor"\
	"Signal Generator" "Step motor" "Switchs" "Temperature System" "VCD Dump" "VCD Dump (Analogic)")

echo "<hr><br><hr><h1><a name=\"parts_\"></a>Examples by parts (Experimental)</h1>"

for part in "${parts[@]}";do
  echo  "<br><a href=\"#${part// /_}_\">${part} (Experimental)</a>"
done

for part in "${parts[@]}";do
  echo  "<hr><br><h2><a name=\"${part// /_}_\"></a>${part} (Experimental)</h2>"
  files=`grep "$part" */*/*/*.pcf`
  for file in $files; do
    board=`echo $file | awk -F/ '{print $1}'`
    proc=`echo $file | awk -F/ '{print $2}'`
    name=`echo $file | awk -F/ '{print $3}'`
    if ! test -z "$name" 
    then
     echo  "<a href=\"#${board}_${proc}_${name}\">$board | $proc | $name </a><br>";
    fi
  done
done 
