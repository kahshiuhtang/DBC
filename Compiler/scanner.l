%{
    #include "scanner.h"
%}

%%
";"               return SCOLON;
"::"              return DCOLON;
":"               return COLON;
"{"               return LBRACK;
"}"               return RBRACK;
"("               return LPAREN;
")"               return RPAREN;
">>"              return RSHIFT;
"+"               return PLUS;
"-"               return MINUS;
"/"               return DIV;
"*"               return MULT;
"||"              return LOR;
"&&"              return LAND;
"!"               return NOT;
"&"               return AMPERSAND;
"|"               return BOR;
"~"               return BNOT;
"^"               return XOR;
"=="              return EQUALS;
">="              return GTE;
"<="              return LTE;
">"               return GT;
"<"               return LT;
"="               return ASSIGN;

"int"           return INT;
"long"           return LONG;
"double"       return DOUBLE;
"float"         return FLOAT;
"bool"          return BOOL;
"char"          return CHAR;

"true"          return TRUE;   
"false"         return FALSE;
"sql"           return SQL;


"for"           return FOR;
"while"         return WHILE;
"if"            return IF;
"elif"          return ELIF;
"else"          return ELSE;

"fn"            return FN;
"funcs"         return FUNCS;
"impl"          return IMPL;
"ext"           return EXT;
"static"        return STATIC;
"struct"        return STRUCT;
"use"           return USE;
"enum"          return ENUM;

"null"          return NULL;
"return"        return RETURN;

"add"           return SADD;
"constraint"    return CONSTRAINT;
"all"           return ALL;
"alt"           return ALT;
"column"        return COLUMN;
"table"         return TABLE;
"and"           return SAND;
"any"           return ANY;
"as"            return AS;
"asc"           return ASC;
"desc"          return DESC;
"between"       return BETWEEN;
"create"        return CREATE;
"index"         return INDEX;
"database"      return DATABASE;
"unique"        return UNIQUE;
"default"       return DEFAULT;
"delete"        return DELETE;
"drop"      return DROP;
"procedure" return PROCEDURE;
"exec"      return EXEC;
"exists"    return EXISTS;
"foreign"   return FOREIGN;
"from"      return FROM;
"full"      return FULL;
"outer"     return OUTER;
"inner"     return INNER;
"join"      return JOIN;
"groupby"   return GROUPBY;
"in"        return IN;
"insertinto" return INSERTINTO;
"is"        return IS;
"left"      return LEFT;
"right"     return RIGHT;
"or"        return SOR;
"limit"     return LIMIT;
"orderby"   return ORDERBY;
"primary"   return PRIMARY;
"select"    return SELECT;
"set"       return SET;
"union"     return UNION;
"where"     return WHERE;
"top"       return TOP;

[a-zA-Z][a-zA-Z0-9]*    return ID;

[ \t\n]                 ;

%%
int yywrap(void){
    return 1;
}