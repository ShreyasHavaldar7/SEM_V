set term postscript eps enhanced "Helvetica" 16 color 
set out 'codeplot.eps' 
set key box spacing 1.5
set title "Code Plot"
set xlabel "x" 
set ylabel "y" 
set xrange[-1:7]
set yrange[0:5]

plot "data.txt" u 1:2 w lp pt 2 lw 1.5 lc rgb '#b2182b' ps 0.9 t'iteration step vs approx. root '
