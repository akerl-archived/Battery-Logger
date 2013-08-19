set title "Battery"
set term png transparent nocrop enhanced size 800, 600
set output "health.png"

set grid
set pointsize 0.5
set key below 

set xdata time
set timefmt "%s"
set format x "%m/%d %H:%M"
set xtics  rotate by -90
set xlabel "Date/Time"

plot \
    "battery.log" using 1:6 t "Health (%)" lc rgb "blue", \
    "battery.log" using 1:10 t "Battery Temp (C)" lc rgb "red", \
    "battery.log" using 1:4 t "Charge (%)" lc rgb "gray", \
    "battery.log" using 1:($7 == 1 ? 3 : 1/0) w l t "Plugged In?" lw 5 , \
    "battery.log" using 1:($8 == 1 ? 2 : 1/0) w l t "Charging?" lw 5 lc rgb "orange", \
    "battery.log" using 1:($9 == 1 ? 2 : 1/0) w l t "Fully Charged?" lw 5 lc rgb "green"