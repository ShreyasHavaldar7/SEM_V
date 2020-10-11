set term postscript eps enhanced "Helvetica" 12 color 
set out 'fig06.eps' 
set key spacing 1.5
set title "Answer 6"
set xlabel "x" 
set ylabel "y"
set xrange[0:100]

f(x)= A*x*x + B*x + C

fit f(x) "sample.txt" u 1:2 via A,B,C
plot 'sample.txt' u 1:2 w p t'x vs y', f(x) w l lc rgb '#f03b20' lw 2 t'fit = -0.17*x^2 + 14.03*x + -12.93'
