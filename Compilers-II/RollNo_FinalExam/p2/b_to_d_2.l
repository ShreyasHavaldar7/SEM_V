%{
	#include"y.tab.h"
	#include<stdio.h> 
    #include<stdlib.h> 
%}

%%

0 {return ZERO;}
1 {return ONE;}
"." {return POI;}

[ \t] {;}
\n return 0;
. return yytext[0];                                           ;
                                                
%%

int yywrap(void){
	return 1;
}

