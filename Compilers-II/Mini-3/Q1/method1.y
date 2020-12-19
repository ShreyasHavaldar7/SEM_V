
%{ 
/* Definition section */
#include<stdio.h> 
#include<stdlib.h> 

extern int yylex();	
void yyerror(char *s); 
%} 
%token ZERO ONE 
%start N
%% 
N: L {printf("%d\n", $$);} 
L: L B {$$=$1*2+$2;} 
| B {$$=$1;} 
B:ZERO {$$=$1;} 
|ONE {$$=$1;}; 
%% 

//driver code 
int main() 
{ 
	yyparse();
	return 0;
} 

void yyerror(char *s) 
{ 
fprintf(stdout, "%s\n", s); 
} 


