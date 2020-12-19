// Shreyas Havaldar, CS18BTECH11042
// Method-I: Converting only integer binary input 

// Note: Works only for integer binary input, does not work for floating point values like 111.01, please refer to Method-II and Method-II for that.

%define parse.error verbose
%{
    #include<stdio.h> 
    #include<stdlib.h> 	
	extern int yylex();
	void yyerror(const char*s);
%}

// Tokens being used
%token ZERO ONE 

// Calculation and printing of converted value
%%
	N: L {printf("\n%d\n", $$);} 
	L: L B {$$ = $1*2 + $2;}
	| B {$$ = $1;}
	B: ZERO {$$= $1;}
	| ONE {$$ = $1;};
%%

void yyerror(const  char *s){ // If input contains anything other than 0 or 1, displaying error and exiting.
	printf("\n%s\n", s); 
	exit(1);
}

int main(){
	yyparse();
	return 0;
}
