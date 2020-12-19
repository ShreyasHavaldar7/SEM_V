// Shreyas Havaldar, CS18BTECH11042
// Method-II: Using 1 non-terminal each for left and right parts on either side of the decimal point and calculating independently

// Note: "." in the input is necessary, works only for floating point binary input, does not work for values like 111, instead enter 111.0

%define parse.error verbose
%{
    #include<stdio.h> 
    #include<stdlib.h>
    #include<math.h> 	
   	extern int yylex();
	void yyerror(const char*s);
%}

// Creating a union struct with two attributes in the form of value stored as val and length as l.
%union {
    struct {
        float val;
        int l;        
    }nt;
}

// Declaring non-terminals of type nt, that is to represent non-terminals
%type<nt> N
%type<nt> B
%type<nt> L
%type<nt> R

// Tokens being used
%token ZERO ONE POI

// Calculating and adding values on both sides of "." and printing after addition.
%%
	N: L POI R {$$.val = $1.val + $3.val;
                printf("\n%f\n",$$.val);}

    L: B {$$.val = $1.val;
            $$.l = 1;}    
        | B L {$$.l = $2.l + 1;
                $$.val = $1.val*pow(2, $2.l) + $2.val;}
    
    R: B {$$.val = $1.val/2;}
        | B R {$$.val=($1.val+$2.val)/2;}
    
    B: ZERO {$$.val = (float)0;}
        | ONE {$$.val = (float)1;};
%%

void yyerror(const char *s){ // If input contains invalid input, displaying error and exiting.
	printf("\n%s\n", s); 
	exit(1);
}

int main(){
	yyparse();
	return 0;
}
