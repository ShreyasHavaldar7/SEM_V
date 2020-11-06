//FOR FRACTIONAL NUMBERS ONLY :CAN HANDLE INTEGREL VALUE ONLY IF DEFINED IN THE FRACTIONAL BINARY WAY: 11.00=>3.00 
/*
METHOD-3 TREATING THE LEFT AND RIGHT PARTS AS THE SAME NON-TERMINAL;HELPS IN REDUCING THE NO. OF NON-TERMINALS INTRODUCED
*/
%{
#include<stdio.h>
#include<stdlib.h>
#include<math.h>
extern int yylex();
void yyerror(char *string);
%}

%union {                              //defining union struct for defining attribute grammar
    struct
    {
    float val;                       //defining 2 attributes for storing value and length
    int length;
    }node;                           //declaring instance name as node        
    }

//declaring NON-TERMINALS of type node  
%type<node> N            
%type<node> X
%type<node> B

//defining tokens used
%token ZERO ONE POINT

//rules:UTILIZED RIGHT RECURSION
%%
N: X POINT X {$$.val=$1.val+$3.val/pow(2,$3.length);    printf("Answer=%f\n",$$.val);}       
       
X:B {$$.val=$1.val;  $$.length=1;}

 |B X {$$.length=$2.length+1;    $$.val=$1.val*pow(2,$2.length)+$2.val;}

B:ZERO {$$.val=(float)0;}
 |ONE {$$.val=(float)1;};
%%


int main()
{
while(yyparse());
}


void yyerror(char *string)
{
fprintf(stdout,"%s\n",string);
exit(1);
}
