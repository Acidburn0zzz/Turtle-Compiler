
%{

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>


typedef struct
{
 char str[10000];
 int ival;
}tstruct ;


#define YYSTYPE tstruct
#include "pyturtle.tab.h"

char currentTurtle[20] = "currentTurtle";


%}

%token NUM
%token NEGNUM
%token HATCH
%token SOUP
%token TURTLE
%token COLOR
%token NOTRAIL
%token TRAIL
%token FORWARD
%token TURN
%token RIGHT
%token LEFT
%token IS
%token SHELL
%token ENDSHELL
%token DO
%token ENDDO
%token INSTINCT
%token ENDINSTINCT
%token RED
%token GREEN
%token BLUE
%token BLACK
%token WHITE
%token YELLOW
%token ORANGE
%token PURPLE
%token PINK
%token ID

%%

hatch
    : HATCH SL SOUP   {
                        printf("import turtle\n");
                        printf("window = turtle.Screen()\n");
                                                printf("\n");
                        printf("%s", $2.str);
                                                printf("\n");
                        printf("window.mainloop()\n");
                      }
    ;

SL
    : INSTINCTLIST DL CL    {
                                                                strcpy($$.str, $1.str); strcat($$.str, "\n");
                                                            strcat($$.str, $2.str); strcat($$.str, "\n");
                                                                strcat($$.str, $3.str);
                                                        }
    | DL CL    {
                                                            strcpy($$.str, $1.str); strcat($$.str, "\n");
                                                            strcat($$.str, $2.str);
                                                        }
    | DL       {
                                                            strcpy($$.str, $1.str);
                                                        }
    ;

INSTINCTLIST
    : IDEF                              { strcpy($$.str, $1.str); }
    | IDEF INSTINCTLIST     { strcpy($$.str, $1.str); strcat($$.str, $2.str); }
    ;

IDEF
    :INSTINCT ID INCL ENDINSTINCT      {
                                                strcpy($$.str, "def ");
                                                strcat($$.str, $2.str);
                                                strcat($$.str, "(");
                                                strcat($$.str, "currentTurtle");
                                                strcat($$.str, "):\n");
                                                strcat($$.str, $3.str);
                                                                                   }
    ;

DL
    : DL D      { strcpy($$.str, $1.str); strcat($$.str, $2.str); }
    | D         { strcpy($$.str, $1.str); }
    ;

D
    : TURTLE ID ';'   {
                              strcpy($$.str,$2.str);
                              strcat($$.str, "=turtle.Turtle()");
                              strcat($$.str, "\n");
                              strcat($$.str,$2.str);
                              strcat($$.str, ".shape('turtle')");
                              strcat($$.str, "\n");
                              strcat($$.str,$2.str);
                              strcat($$.str, ".color('green')");
                              strcat($$.str, "\n");
                      }
    ;

CL
    : CL CMD    { strcpy($$.str, $1.str); strcat($$.str, $2.str); }
    | CMD       { strcpy($$.str, $1.str); }
    ;

CMD
    : ID TRAIL ';'  {
                           strcpy($$.str,$1.str);
                           strcat($$.str, ".pendown()");
                           strcat($$.str, "\n");
                    }
    | ID NOTRAIL ';' {
                            strcpy($$.str,$1.str);
                            strcat($$.str, ".penup()");
                            strcat($$.str, "\n");
                     }
    | ID COLOR CS ';'  {
                                strcpy($$.str, $1.str);
                                strcat($$.str, $3.str);
                       }
    | ID FORWARD NUM ';'  {
                                 strcpy($$.str,$1.str);
                                 strcat($$.str, ".forward(");
                                 strcat($$.str,$3.str);
                                 strcat($$.str, ")");
                                 strcat($$.str, "\n");
                          }
    | ID TURN NUM ';' {
                            strcpy($$.str, $1.str );
                            strcat($$.str, ".lt(");
                            strcat($$.str,$3.str);
                            strcat($$.str, ")");
                            strcat($$.str, "\n");
                      }
    | ID TURN NEGNUM ';' {
                            strcpy($$.str, $1.str );
                            strcat($$.str, ".lt(");
                            strcat($$.str,$3.str);
                            strcat($$.str, ")");
                            strcat($$.str, "\n");
                      }
    | ID RIGHT ';' {
                            strcpy($$.str, $1.str );
                            strcat($$.str, ".rt(90)\n");
                   }
    | ID LEFT ';' {
                                                        strcpy($$.str, $1.str );
                            strcat($$.str, ".lt(90)\n");
                  }
    | ID { strcpy(currentTurtle,$1.str); } SHELL SHLCL ENDSHELL ';'
                                                                                {
                                          strcpy($$.str,$4.str);
                                          strcat($$.str, "\n");
                                        }
    | ID { strcpy(currentTurtle,$1.str); } INSTINCT ID ';'
                                                                                                                        {
                                          strcpy($$.str,$4.str);
                                          strcat($$.str, "( ");
                                          strcat($$.str, $1.str);
                                          strcat($$.str, " );");
                                          strcat($$.str, "\n");
                                                            }
        | DO NUM DOL ENDDO ';' {
                                                        strcpy($$.str, "for x in range(0, ");
                                                        strcat($$.str, $2.str);
                                                        strcat($$.str, "):");
                                                        strcat($$.str, "\n");
                            strcat($$.str, $3.str);
                            strcat($$.str, "\n");
                                               }
    ;

DOL
    : DOL DLCMD    { strcpy($$.str, $1.str); strcat($$.str, $2.str); }
    | DLCMD        { strcpy($$.str, $1.str); }
    ;

DLCMD
    : ID TRAIL ';'  {
                           strcpy($$.str, "     " );
                           strcat($$.str,$1.str);
                           strcat($$.str, ".pendown()");
                           strcat($$.str, "\n");
                    }
    | ID NOTRAIL ';' {
                            strcpy($$.str, "     " );
                            strcat($$.str,$1.str);
                            strcat($$.str, ".penup()");
                            strcat($$.str, "\n");
                     }
    | ID COLOR CS ';'  {
                                strcpy($$.str, "     " );
                                strcat($$.str, $1.str);
                                strcat($$.str, $3.str);
                       }
    | ID FORWARD NUM ';'  {
                                 strcpy($$.str, "     " );
                                 strcat($$.str,$1.str);
                                 strcat($$.str, ".forward(");
                                 strcat($$.str,$3.str);
                                 strcat($$.str, ")");
                                 strcat($$.str, "\n");
                          }

    | ID TURN NUM ';' {
                                 strcpy($$.str, "     " );
                                                                 strcat($$.str, $1.str );
                                 strcat($$.str, ".lt(");
                                 strcat($$.str,$3.str);
                                 strcat($$.str, ")");
                                 strcat($$.str, "\n");
                      }
    | ID TURN NEGNUM ';' {
                        strcpy($$.str, "     " );
                        strcat($$.str, $1.str );
                        strcat($$.str, ".lt(");
                        strcat($$.str,$3.str);
                        strcat($$.str, ")");
                        strcat($$.str, "\n");
                   }
    | ID RIGHT ';' {
                         strcpy($$.str, "     " );
                         strcat($$.str, $1.str );
                         strcat($$.str, ".rt(90)\n");
                   }
    | ID LEFT ';' {
                         strcpy($$.str, "     " );
                         strcat($$.str, $1.str );
                         strcat($$.str, ".lt(90)\n");
                  }
    | ID { strcpy(currentTurtle,$1.str); } SHELL SHLCLTABS ENDSHELL ';'
                                                                                {
                                          strcpy($$.str,$4.str);
                                        }
    | ID { strcpy(currentTurtle,$1.str); } INSTINCT ID ';'
                                                                                {
                                          strcpy($$.str, "     " );
                                          strcat($$.str,$4.str);
                                          strcat($$.str, "( ");
                                          strcat($$.str, $1.str);
                                          strcat($$.str, " );");
                                          strcat($$.str, "\n");
                                        }
        | DO NUM DLCLTABS ENDDO ';'
                                                   {
                                                        strcpy($$.str, "     " );
                            strcat($$.str, "for x in range(0, ");
                                                        strcat($$.str, $2.str);
                                                        strcat($$.str, "):");
                                                        strcat($$.str, "\n");
                            strcat($$.str, $3.str);
                                               }
    ;

SHLCL
    : SHLCL SHLCMD        { strcpy($$.str, $1.str); strcat($$.str, $2.str); }
    | SHLCMD              { strcpy($$.str, $1.str); }
    ;

SHLCMD
    : TRAIL ';'   {
                           strcpy($$.str, currentTurtle );
                           strcat($$.str, ".pendown()");
						   strcat($$.str, "\n");
                  }
    | NOTRAIL ';'  {
                            strcpy($$.str, currentTurtle );
                            strcat($$.str, ".penup()");
                            strcat($$.str, "\n");
                   }
    | COLOR CS ';'  {
                         strcpy($$.str, currentTurtle );
                         strcat($$.str, $2.str);
                    }
    | FORWARD NUM ';'  {
                         strcpy($$.str, currentTurtle );
                         strcat($$.str, ".forward(");
                         strcat($$.str,$2.str);
                         strcat($$.str, ")");
                         strcat($$.str, "\n");
                        }
    | TURN NUM ';' {
                         strcpy($$.str, currentTurtle );
                         strcat($$.str, ".lt(");
                         strcat($$.str,$2.str);
                         strcat($$.str, ")");
                         strcat($$.str, "\n");
                   }
        | TURN NEGNUM ';' {
                        strcpy($$.str, currentTurtle );
                        strcat($$.str, ".lt(");
                        strcat($$.str,$2.str);
                        strcat($$.str, ")");
                        strcat($$.str, "\n");
                      }
    | RIGHT ';' {
                         strcpy($$.str, currentTurtle );
                         strcat($$.str, ".rt(90)\n");
                }

    | LEFT ';' {
                         strcpy($$.str, currentTurtle );
                         strcat($$.str, ".lt(90)\n");
               }
    | INSTINCT ID ';'   {
                            strcpy($$.str,$2.str);
                            strcat($$.str, "( ");
                            strcat($$.str, currentTurtle);
                            strcat($$.str, " );");
                            strcat($$.str, "\n");
                        }
    | DO NUM SHLCLTABS ENDDO ';'    {
                                    strcpy($$.str, "for x in range(0, ");
                                    strcat($$.str, $2.str);
                                    strcat($$.str, "):");
                                    strcat($$.str, "\n");
                                                                       strcat($$.str, $3.str);
                                }
    ;

SHLCLTABS
    : SHLCLTABS SHLCMDTABS        { strcpy($$.str, $1.str); strcat($$.str, $2.str); }
    | SHLCMDTABS              { strcpy($$.str, $1.str); }
    ;

SHLCMDTABS
    : TRAIL ';'   {
                           strcpy($$.str, "     " );
                           strcat($$.str, currentTurtle );
                           strcat($$.str, ".pendown()");
						   strcat($$.str, "\n");
                  }
    | NOTRAIL ';'  {
                            strcpy($$.str, "     " );
                            strcat($$.str, currentTurtle );
                            strcat($$.str, ".penup()");
                            strcat($$.str, "\n");
                   }
    | COLOR CS ';'  {
                         strcpy($$.str, "     " );
                         strcat($$.str, currentTurtle );
                         strcat($$.str, $2.str);
                    }
    | FORWARD NUM ';'  {
                         strcpy($$.str, "     " );
                         strcat($$.str, currentTurtle );
                         strcat($$.str, ".forward(");
                         strcat($$.str,$2.str);
                         strcat($$.str, ")");
                         strcat($$.str, "\n");
                        }
    | TURN NUM ';' {
                         strcpy($$.str, "     " );
                         strcat($$.str, currentTurtle );
                         strcat($$.str, ".lt(");
                         strcat($$.str,$2.str);
                         strcat($$.str, ")");
                         strcat($$.str, "\n");
                   }
        | TURN NEGNUM ';' {
                        strcpy($$.str, "     " );
                        strcat($$.str, currentTurtle );
                        strcat($$.str, ".lt(");
                        strcat($$.str,$2.str);
                        strcat($$.str, ")");
                        strcat($$.str, "\n");
                      }
    | RIGHT ';' {
                         strcpy($$.str, "     " );
                         strcat($$.str, currentTurtle );
                         strcat($$.str, ".rt(90)\n");
                }

    | LEFT ';' {
                         strcpy($$.str, "     " );
                         strcat($$.str, currentTurtle );
                         strcat($$.str, ".lt(90)\n");
               }
    | INSTINCT ID ';'   {
                            strcpy($$.str, "     " );
                                                        strcat($$.str,$2.str);
                            strcat($$.str, "( ");
                            strcat($$.str, currentTurtle);
                            strcat($$.str, " );");
                            strcat($$.str, "\n");
                        }
    | DO NUM SHLCL ENDDO ';'    {
                                    strcpy($$.str, "     " );
                                                                        strcat($$.str, "for x in range(0, ");
                                    strcat($$.str, $2.str);
                                    strcat($$.str, "):");
                                    strcat($$.str, "\n     ");
                                                                        strcat($$.str, $3.str);
                                }
    ;


DLCLTABS
    : DLCLTABS DLCMDTABS        { strcpy($$.str, $1.str); strcat($$.str, $2.str); }
    | DLCMDTABS              { strcpy($$.str, $1.str); }
    ;

DLCMDTABS
    : TRAIL ';'   {
                           strcpy($$.str, "          " );
                           strcat($$.str, currentTurtle );
                           strcat($$.str, ".pendown()");
						   strcat($$.str, "\n");
                  }
    | NOTRAIL ';'  {
                            strcpy($$.str, "          " );
                            strcat($$.str, currentTurtle );
                            strcat($$.str, ".penup()");
                            strcat($$.str, "\n");
                   }
    | COLOR CS ';'  {
                         strcpy($$.str, "          " );
                         strcat($$.str, currentTurtle );
                         strcat($$.str, $2.str);
                    }
    | FORWARD NUM ';'  {
                         strcpy($$.str, "          " );
                         strcat($$.str, currentTurtle );
                         strcat($$.str, ".forward(");
                         strcat($$.str,$2.str);
                         strcat($$.str, ")");
                         strcat($$.str, "\n");
                        }
    | TURN NUM ';' {
                         strcpy($$.str, "          " );
                         strcat($$.str, currentTurtle );
                         strcat($$.str, ".lt(");
                         strcat($$.str,$2.str);
                         strcat($$.str, ")");
                         strcat($$.str, "\n");
                   }
        | TURN NEGNUM ';' {
                        strcpy($$.str, "          " );
                        strcat($$.str, currentTurtle );
                        strcat($$.str, ".lt(");
                        strcat($$.str,$2.str);
                        strcat($$.str, ")");
                        strcat($$.str, "\n");
                      }
    | RIGHT ';' {
                         strcpy($$.str, "          " );
                         strcat($$.str, currentTurtle );
                         strcat($$.str, ".rt(90)\n");
                }

    | LEFT ';' {
                         strcpy($$.str, "          " );
                         strcat($$.str, currentTurtle );
                         strcat($$.str, ".lt(90)\n");
               }
    | INSTINCT ID ';'   {
                            strcpy($$.str, "          " );
                                                        strcat($$.str,$2.str);
                            strcat($$.str, "( ");
                            strcat($$.str, currentTurtle);
                            strcat($$.str, " );");
                            strcat($$.str, "\n");
                        }
    | ID TRAIL ';'   {
                           strcpy($$.str, "          " );
                           strcat($$.str, $1.str );
                           strcat($$.str, ".pendown()");
						   strcat($$.str, "\n");
                  }
    | ID NOTRAIL ';'  {
                            strcpy($$.str, "          " );
                            strcat($$.str, $1.str );
                            strcat($$.str, ".penup()");
                            strcat($$.str, "\n");
                   }
    | ID COLOR CS ';'  {
                         strcpy($$.str, "          " );
                         strcat($$.str, $1.str );
                         strcat($$.str, $3.str);
                    }
    | ID FORWARD NUM ';'  {
                         strcpy($$.str, "          " );
                         strcat($$.str, $1.str );
                         strcat($$.str, ".forward(");
                         strcat($$.str,$3.str);
                         strcat($$.str, ")");
                         strcat($$.str, "\n");
                        }
    | ID TURN NUM ';' {
                         strcpy($$.str, "          " );
                         strcat($$.str, $1.str );
                         strcat($$.str, ".lt(");
                         strcat($$.str,$3.str);
                         strcat($$.str, ")");
                         strcat($$.str, "\n");
                   }
    | ID TURN NEGNUM ';' {
                        strcpy($$.str, "          " );
                        strcat($$.str, $1.str );
                        strcat($$.str, ".lt(");
                        strcat($$.str,$3.str);
                        strcat($$.str, ")");
                        strcat($$.str, "\n");
                      }
    | ID RIGHT ';' {
                         strcpy($$.str, "          " );
                         strcat($$.str, $1.str );
                         strcat($$.str, ".rt(90)\n");
                }

    | ID LEFT ';' {
                         strcpy($$.str, "          " );
                         strcat($$.str, $1.str );
                         strcat($$.str, ".lt(90)\n");
               }
    | ID INSTINCT ID ';'   {
                            strcpy($$.str, "          " );							
                            strcat($$.str,$3.str);
                            strcat($$.str, "( ");
                            strcat($$.str, $1.str);
                            strcat($$.str, " );");
                            strcat($$.str, "\n");
                        }
    | DO NUM DLCLTABS ENDDO ';'    {
                                    strcpy($$.str, "     " );
                                    strcat($$.str, "for x in range(0, ");
                                    strcat($$.str, $2.str);
                                    strcat($$.str, "):");
                                    strcat($$.str, "\n     ");
                                    strcat($$.str, $3.str);
                                }
    ;

INCL
    : INCL INCMD    { strcpy($$.str, $1.str); strcat($$.str, $2.str); }
    | INCMD         { strcpy($$.str, $1.str); }
    ;

INCMD
    : TRAIL ';'   {
                           strcpy($$.str, "     " );
                           strcat($$.str, currentTurtle );
                           strcat($$.str, ".pendown()");
						   strcat($$.str, "\n");
                  }
    | NOTRAIL ';' {
                           strcpy($$.str, "     " );
                           strcat($$.str, currentTurtle );
                           strcat($$.str, ".penup()");
                           strcat($$.str, "\n");
                  }
    | COLOR CS ';'  {
                         strcpy($$.str, "     " );
                         strcat($$.str, currentTurtle );
                         strcat($$.str, $2.str);
                    }
    | FORWARD NUM ';'  {
                         strcpy($$.str, "     " );
                         strcat($$.str, currentTurtle );
                         strcat($$.str, ".forward(");
                         strcat($$.str,$2.str);
                         strcat($$.str, ")");
                         strcat($$.str, "\n");
                        }
    | TURN NUM ';' {
                        strcpy($$.str, "     " );
                        strcat($$.str, currentTurtle );
                        strcat($$.str, ".lt(");
                        strcat($$.str,$2.str);
                        strcat($$.str, ")");
                        strcat($$.str, "\n");
                   }
    | TURN NEGNUM ';' {
                        strcpy($$.str, "     " );
                        strcat($$.str, currentTurtle );
                        strcat($$.str, ".lt(");
                        strcat($$.str,$2.str);
                        strcat($$.str, ")");
                        strcat($$.str, "\n");
                   }
    | RIGHT ';' {
                           strcpy($$.str, "     " );
                           strcat($$.str, currentTurtle );
                           strcat($$.str, ".rt(90)\n");
                }

    | LEFT ';' {
                           strcpy($$.str, "     " );
                           strcat($$.str, currentTurtle );
                           strcat($$.str, ".lt(90)\n");
               }
    | SHELL SHLCLTABS ENDSHELL ';'
                                  {
                                          strcpy($$.str,$2.str);
                                  }
    | DO NUM DLCLTABS ENDDO ';'    {
                                                                        strcpy($$.str, "     " );
                                    strcat($$.str, "for x in range(0, ");
                                    strcat($$.str, $2.str);
                                    strcat($$.str, "):");
                                    strcat($$.str, "\n");
                                                                        strcat($$.str, $3.str);
                                }
    ;

CS
    : RED         { strcpy($$.str, ".color('red')\n"); }
    | BLUE        { strcpy($$.str, ".color('blue')\n"); }
    | GREEN       { strcpy($$.str, ".color('green')\n"); }
    | BLACK       { strcpy($$.str, ".color('black')\n"); }
    | WHITE       { strcpy($$.str, ".color('white')\n"); }
    | YELLOW      { strcpy($$.str, ".color('yellow')\n"); }
    | ORANGE      { strcpy($$.str, ".color('orange')\n"); }
    | PURPLE      { strcpy($$.str, ".color('purple')\n"); }
    | PINK        { strcpy($$.str, ".color('pink')\n"); }
    ;

%%


main ()
{
  yyparse ();
}

yyerror (char *s)  /* Called by yyparse on error */
{
  printf ("\terror: %s\n", s);
}

