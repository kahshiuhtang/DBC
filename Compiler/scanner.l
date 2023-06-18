%{
    #include "scanner.h"
%}

%%
;               return SCOLON;
"int"           return INT;


%%
int yywrap(void){
    return 1;
}