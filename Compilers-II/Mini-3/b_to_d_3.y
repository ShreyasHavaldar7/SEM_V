// Shreyas Havaldar, CS18BTECH11042
// Method-III: Reducing the non-terminals from Method-II by simply treating the left and right parts on either side of the decimal point using the same non-terminal

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
%type<nt> X

// Tokens being used
%token ZERO ONE POI

// Utilizing right recursion
%%
	N: X POI X {$$.val = $1.val + $3.val/pow(2,$3.l);
                printf("\n%f\n",$$.val);}

    X: B {$$.val = $1.val;
            $$.l = 1;}    
        | B X {$$.l = $2.l + 1;
                $$.val = $1.val*pow(2, $2.l) + $2.val;}
    
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
