%{

typedef struct
{
 char str[10000];
 int ival;
} tstruct;

#define YYSTYPE  tstruct

#include "pyturtle.tab.h"

%}

DIGIT [0-9]
NEG [-]

%%

{DIGIT}+	{
		 strcpy( yylval.str, yytext);
         	 yylval.ival = atoi(yytext);
         	 return NUM; }
{NEG}{DIGIT}+  	{
		 strcpy( yylval.str, yytext);
                 yylval.ival = atoi(yytext);
                 return NEGNUM; }
hatch		{ return HATCH; }
soup		{ return SOUP; }
turtle		{ return TURTLE; }
color		{ return COLOR; }
notrail		{ return NOTRAIL; }
trail		{ return TRAIL; }
forward		{ return FORWARD; }
turn		{ return TURN; }
right		{ return RIGHT; }
left		{ return LEFT; }
is		{ return IS; }
shell		{ return SHELL; }
endshell	{ return ENDSHELL; }
do		{ return DO; }
enddo		{ return ENDDO; }
instinct	{ return INSTINCT; }
endinstinct	{ return ENDINSTINCT; }
red		{ return RED; }
green		{ return GREEN; }
blue		{ return BLUE; }
black		{ return BLACK; }
white		{ return WHITE; }
yellow		{ return YELLOW; }
orange		{ return ORANGE; }
purple		{ return PURPLE; }
pink		{ return PINK; }



[a-zA-Z]+   { strcpy( yylval.str, yytext); return ID; }

[ \t\n]     /* ignore whitespace */  

<<EOF>>  	{ yyterminate(); }        /* signal end of dialogue */
;       	{ return yytext[0]; }
.        	{ return yytext[0]; }

%%
