%{
	// Shreyas Havaldar, CS18BTECH11042
	#include"y.tab.h"
	#include<stdio.h> 
    #include<stdlib.h> 
	void yyerror(const char*s);

%}

%%

0 {return ZERO;} //Defining token for 0
1 {return ONE;} //Defining token for 1
"." {return POI;} //Defining token for decimal point
[ \t] {yyerror("Invalid Syntax: Input must contain only characters '1' or '0'. No white-space or tab-space allowed.");}
\n return 0;
. yyerror("Invalid Syntax: Input must contain only characters '1' or '0' and exactly one '.'");                                           
                                                
%%

int yywrap(void){
	return 1;
}

