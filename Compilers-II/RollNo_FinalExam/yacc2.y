%{
#include<stdio.h>
#include<stdlib.h>
#include<math.h>
void yyerror(char *s);
%}

%union {
    struct
    {
    float val;
    int length;
    }node;
    }
  
%type<node> N
%type<node> L
%type<node> R
%type<node> B
%token ZERO ONE POINT

%%
N: L POINT R {$$.val=$1.val+$3.val;
            printf("\n%f\n",$$.val);}
       
L:B {$$.val=$1.val;
    $$.length=1;}

 |B L {$$.length=$2.length+1;
      $$.val=$1.val*pow(2,$2.length)+$2.val;}

R:B{$$.val=$1.val/2;}

 |B R {$$.val=($1.val+$2.val)/2;}    

B:ZERO {$$.val=(float)0;}
    |ONE {$$.val=(float)1;};
%%
int main()
{
while(yyparse());
}
yyerror(char *s)
{
fprintf(stdout,"\n%s\n",s);
exit(1);
}
