#include <stdio.h>
#include "scanner.h"

extern int yylex();
extern int yylineno;
extern char *yytext;

int main(void)
{
    int ntoken, vtoken;

    ntoken = yylex();
    while (ntoken)
    {
        ntoken = yylex();
    }
    return 0;
}