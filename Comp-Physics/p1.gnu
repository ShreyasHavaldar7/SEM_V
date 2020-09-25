set term postscript eps enhanced "Helvetica" 22 color 
set out 'fig01.eps' 
set key box autotitle columnhead
set title "Figure 1"
set xlabel "x" 
set ylabel "y, z" 
set log y
set xrange[1:10]
f(x)= exp(A*x + B)
g(x)= exp(C*x + D)
fit f(x) "data01.txt" u 1:2 via A,B
fit g(x) "data01.txt" u 1:3 via C,D
plot "data01.txt" u 1:2:5 w err pt 13 lc rgb '#f03b20' ps 0.9 t'x vs y', "data01.txt" u 1:3:6 w err pt 5 lc rgb '#542788' ps 0.9 t'x vs z', f(x) w l lc rgb '#f1a340' t'Curve fitted on y', g(x) w l lc rgb '#998ec3' t'Curve fitted on z'