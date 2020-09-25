set term postscript eps enhanced "Helvetica" 22 color 
set out 'fig02.eps' 
set multiplot 
set key box autotitle columnhead
set title "Figure 2"
set xlabel "x" 
set ylabel "y" 
set log y
set xrange[-1:22]
set size 1,1 
plot "data02.txt" u 1:2 w lp pt 2 lc rgb '#8e0152' ps 0.9 t'x vs y from data02', "data03.txt" u 1:2 w lp pt 3 lc rgb '#276419' ps 0.9 t'x vs y from data03',

set size 0.6,0.6
set origin 0.25,0.12
set xtics font "Times-Roman, 10" offset 0,0.5
set ytics font "Times-Roman, 10" 
set key box font "Times-Roman, 10" 
set title "Figure 1" font "Times-Roman, 10"
set xlabel "x" font "Times-Roman, 12" offset 0,1.8
set ylabel "y, z" font "Times-Roman, 12" offset 6,0
set log y
set xrange[1:10]
f(x)= exp(A*x + B)
g(x)= exp(C*x + D)
fit f(x) "data01.txt" u 1:2 via A,B
fit g(x) "data01.txt" u 1:3 via C,D
plot "data01.txt" u 1:2:5 w err pt 13 lc rgb '#f03b20' ps 0.9 t'x vs y', "data01.txt" u 1:3:6 w err pt 5 lc rgb '#542788' ps 0.9 t'x vs z', f(x) w l lc rgb '#f1a340' t'Curve fitted on y', g(x) w l lc rgb '#998ec3' t'Curve fitted on z'
unset multiplot