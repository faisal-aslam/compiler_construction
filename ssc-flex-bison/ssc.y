%{
	#include <stdio.h>
	#include <stdlib.h>
	//contains our functions to be reused later by llvm.
	#include "IR.h"
	
	extern int yyparse();
	extern int yylex();
	extern FILE *yyin;
	void yyerror(const char *err);

	
	//#define DEBUGBISON
	//This code is for producing debug output.
	#ifdef DEBUGBISON
		#define debugBison(a) (printf("\n%d \n",a))
	#else
		#define debugBison(a)
	#endif
%}

%union {
	char *identifier;
	double double_literal;
	char *string_literal;
}

%token tok_printd
%token tok_prints
%token <identifier> tok_identifier
%token <double_literal> tok_double_literal
%token <string_literal> tok_string_literal

%type <double_literal> term expression

%left '+' '-' 
%left '*' '/'
%left '(' ')'

%start root

%%

root:	/* empty */				{debugBison(1);}  	
	| prints  root				{debugBison(2);}
	| printd  root				{debugBison(3);}
	| assignment  root			{debugBison(4);}
	; 

prints:	tok_prints '(' tok_string_literal ')' ';'   {debugBison(5); print("%s\n", $3); } 
	;

printd:	tok_printd '(' term ')' ';'		{debugBison(6); print("%lf\n", $3); }
	;

term:	tok_identifier				{debugBison(7); $$ = getValueFromSymbolTable($1); } 
	| tok_double_literal			{debugBison(8); $$ = $1; }
	;

assignment:  tok_identifier '=' expression ';'	{debugBison(9); setValueInSymbolTable($1, $3); } 
	;
expression: term				{debugBison(10); $$= $1;}
	   | expression '+' expression		{debugBison(11); $$ = performBinaryOperation ($1, $3, '+');}
	   | expression '-' expression		{debugBison(12); $$ = performBinaryOperation ($1, $3, '-');}
	   | expression '/' expression		{debugBison(13); $$ = performBinaryOperation ($1, $3, '/');}
	   | expression '*' expression		{debugBison(14); $$ = performBinaryOperation ($1, $3, '*');}
	   | '(' expression ')'			{debugBison(15); $$= $2;}
	   ;	   
	      
	   

%%

void yyerror(const char *err) {
	fprintf(stderr, "\n%s\n", err);
}

int main(int argc, char** argv) {
	if (argc > 1) {
		FILE *fp = fopen(argv[1], "r");
		yyin = fp; //read from file when its name is provided.
	} 
	if (yyin == NULL) { 
		yyin = stdin; //otherwise read from terminal
	}
	
	//yyparse will call internally yylex
	//It will get a token and insert it into AST
	int parserResult = yyparse();
	
	return EXIT_SUCCESS;
}

