set term postscript eps enhanced "Helvetica" 16 color 
set out 'fig01.eps' 
set key spacing 1.5 autotitle columnhead
set title "Figure 1"
set xlabel "x" 
set ylabel "y and z (in log scale)" 
set log y
set xrange[1:10]
f(x)= exp(A*x + B)
g(x)= exp(C*x + D)
fit f(x) "data01.txt" u 1:2 via A,B
fit g(x) "data01.txt" u 1:3 via C,D
plot "data01.txt" u 1:2:5 w err pt 13 lc rgb '#f03b20' ps 0.9 t'x vs y', "data01.txt" u 1:3:6 w err pt 5 lc rgb '#542788' ps 0.9 t'x vs z', f(x) w l lc rgb '#f1a340' t'exp(Ax + B) fitted on y, A = -0.71, B = 10.60', g(x) w l lc rgb '#998ec3' t'exp(Cx + D) fitted on z, C = -0.55, D = 8.21'
