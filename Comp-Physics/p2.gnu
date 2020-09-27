set term postscript eps enhanced "Helvetica" 16 color 
set out 'fig02.eps' 
set multiplot 
set key box spacing 1.5
set title "Figure 2"
set xlabel "x" 
set ylabel "y (in log scale)" 
set log y
set xrange[-1:22]
set size 1,1 
plot "data02.txt" u 1:2 w lp pt 2 lw 1.5 lc rgb '#b2182b' ps 0.9 t'x vs y from data02', "data03.txt" u 1:2 w lp pt 3 lw 1.5 lc rgb '#2166ac' ps 0.9 t'x vs y from data03'

set size 0.6,0.6
set origin 0.3,0.12
set xtics font "Helvetica, 9" offset 0,0.5
set ytics font "Helvetica, 9" 
set key font "Helvetica, 9" spacing 1.5
set title "Figure 1" font "Helvetica, 9"
set xlabel "x" font "Helvetica,11" offset 0,1
set ylabel "y and z (in log scale)" font "Helvetica, 11" offset 5,0
set title "Figure 1"
set log y
set xrange[1:10]
f(x)= exp(A*x + B)
g(x)= exp(C*x + D)
fit f(x) "data01.txt" u 1:2:5 yerrors via A,B
fit g(x) "data01.txt" u 1:3:6 yerrors via C,D
plot "data01.txt" u 1:2:5 w err pt 13 lc rgb '#f03b20' ps 0.5 t'x vs y', "data01.txt" u 1:3:6 w err pt 5 lc rgb '#542788' ps 0.5 t'x vs z', f(x) w l lc rgb '#f1a340' t'y_{fit} = exp(-0.49*x + 9.86)', g(x) w l lc rgb '#998ec3' t'z_{fit} = exp(-0.43*x + 7.81)'
unset multiplot