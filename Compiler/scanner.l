%{
    #include "scanner.h"
%}

%%
;               return SCOLON;
"int"           return INT;
"bool"          return BOOL;
"char"          return CHAR;


%%
int yywrap(void){
    return 1;
}