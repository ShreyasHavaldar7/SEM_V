%{
	#include"y.tab.h"
	#include<stdio.h> 
    #include<stdlib.h> 
    extern int yylval;  
%}

%%

0 {yylval=0;return ZERO;} //Defining token for 0
1 {yylval=1;return ONE;} //Defining token for 1

[ \t] {;}
\n return 0;
. return yytext[0];                                           ;
                                                
%%

int yywrap(void){
	return 1;
}

