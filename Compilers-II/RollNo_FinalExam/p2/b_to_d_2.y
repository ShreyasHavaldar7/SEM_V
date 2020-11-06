%define parse.error verbose
%{
    #include<stdio.h> 
    #include<stdlib.h>
    #include<math.h> 	
   	extern int yylex();
	void yyerror(const char*s);
%}
%union {
    struct {
        float val;
        int l;        
    }node;
}

%type<node> N
%type<node> B
%type<node> L
%type<node> R

%token ZERO ONE POI
%%
	N: L POI R {$$.val = $1.val + $3.val;
                printf("\n%f\n",$$.val);}

    L: B {$$.val=$1.val;
            $$.l=1;}    
        | B L {$$.l = $2.l + 1;
                $$.val = $1.val*pow(2, $2.l) + $2.val;}
    
    R: B {$$.val = $1.val/2;}
        | B R {$$.val=($1.val+$2.val)/2;}
    
    B: ZERO {$$.val = (float)0;}
        | ONE {$$.val = (float)1;};
%%

void yyerror(const char *s){
	printf("\n%s\n", s); 
	exit(1);
}

int main(){
	yyparse();
	return 0;
}
