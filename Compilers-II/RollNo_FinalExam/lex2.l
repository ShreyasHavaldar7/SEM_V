%{ 
/* Definition section */
#include<stdio.h> 
#include<stdlib.h> 
#include"y.tab.h" 
%}

/* Rule Section */
%% 
0 {return ZERO;} 
1 {return ONE;} 
[.] {return POINT;} 
[ \t] {;} 
\n return 0; 
. {yyerror("INVALID SYNTAX");}
%% 

	
int yywrap() 
{ 
return 1; 
} 
