%{ 
#include<stdio.h> 
#include<stdlib.h> 
#include"y.tab.h" 
 
%} 

/* Rule Section */
%% 
0 return ZERO; 
1 return ONE; 
"." return DOT;
[ \t] {;} 
\n return 0; 
. return yytext[0]; 
%% 

	
int yywrap() 
{ 
return 1; 
} 
