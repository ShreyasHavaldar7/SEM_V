%define parse.error verbose
%{
    #include<stdio.h> 
    #include<stdlib.h> 	
	extern int yylex();
	void yyerror(const char*s);
%}
%token ZERO ONE // List of valid tokens
%%
	N: L {printf("\n%d\n", $$);} // Calculation and printing of converted value
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
