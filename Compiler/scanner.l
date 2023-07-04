%{
    #include "scanner.h"
%}

%%
;               return SCOLON;
::              return DCOLON;
:               return COLON;
{               return LBRACK;
}               return RBRACK;
(               return LPAREN;
)               return RPAREN;
<<              return LSHIFT;
>>              return RSHIFT;
+               return PLUS;
-               return MINUS;
/               return DIV;
*               return MULT;
||              return LOR;
&&              return LAND;
!               return NOT;



"int"           return INT;
"long           return LONG;
"double         return DOUBLE;
"float"         return FLOAT;
"bool"          return BOOL;
"char"          return CHAR;

"for"           return FOR;
"while"         return WHILE;
"if"            return 
"elif"
"else"


[ \t\n]         ;

%%
int yywrap(void){
    return 1;
}