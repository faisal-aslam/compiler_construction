%{
	//Will be created by Bison later on but we will be creating it at the moment for testing.
	#include "ssc.tab.h"
	#include <stdlib.h>
	#include <stdio.h>
	#include <string>
	extern void yyerror(const char *msg);
	
	//#define DEBUGSSC
	//This code is for producing debug output.
	#ifdef DEBUGSSC
		#define debugFlex(a) (printf("\n%d: Token=<ID, lexeme>=<%d, %s>\n",yylineno, a, yytext))
	#else
		#define debugFlex(a)
	#endif
%}

%option yylineno 
%option noyywrap

%%

"printd"				{debugFlex(tok_printd); return tok_printd;}
"prints"				{debugFlex(tok_prints); return tok_prints;}
[a-zA-Z][a-zA-Z0-9_]*			{debugFlex(tok_identifier); yylval.identifier=strdup(yytext); return tok_identifier;}
[0-9]+(\.[0-9]+)?			{debugFlex(tok_double_literal); yylval.double_literal=atof(yytext); return tok_double_literal;}
\"[^"]*\"				{debugFlex(tok_string_literal); yylval.string_literal=strdup(yytext); return tok_string_literal;}
\/\/.*					{;}
[ \n\r\t]				{;}
"+"|"-"|"*"|"\/"|"="|";"|"("|")"	{debugFlex(yytext[0]); return yytext[0];} 
.					{debugFlex(-1); yyerror("this is a illegal lexeme"); exit(EXIT_FAILURE);}
%%

