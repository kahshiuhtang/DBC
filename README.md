# DBC: A multilingual compiler

## Purpose

DBC is a compiler designed to integrate SQL-like queries into a procedural programming language while implementing Relational and Non-Relational database functionality in the same interface that is simpler than what exists today.

It is based on .dbl files, are written in a language defined by the rules below

---

## Design

The language used in the .dbl files are based on queries in MySQL and the language Rust.

The DBC program will take one file as input. This file must be of the type .dbl.

```
dbc example.dbl
```

By default, DBC will compile the file down to an Assembly language that is based in Rust.

However, if any queries are discovered, the program will instead compile down to C++ to handle the interactions with database drivers

---

## Usage

<em>TO BE IMPLEMENTED</em>

---

## Language Design

<em><b>Variable Declaration</b></em>

Variables can be declared with a type or the VAR type, speicfying that the type of the variable is unknown. Variables can be declared with the following grammar rules:

```
var_decl;

undecl_var_decl;
```

Much of the design for variables was inspired by the Rust Programming Language. A variable can have one owner and once out of scope, it is treated as garbage and terminated. The owner of a variable is the scope the variable was declared in. In order to pass the variables to a different scope,

<em><b>Primitives Types</em></b>

```
   int: 4 bytes
 float: 4 bytes
  long: 8 bytes
double: 8 bytes
  char: 1 byte
  bool: 1 byte
  void: 1 byte
```

<em><b>Pointer Types</em></b>

Every type has an associated pointer type. An asterisks follows the type declaration to signal a pointer type. The grammar rule is:

```
pointer: type STAR;

STAR: *
```

To get the address of a variable, use the ampersand key before the variable name.

```
address: AMPERSAND
```

---

<em><b>Statements</em></b>
Operations:

The following mathematical operations are supported in .dbl files. They are as follows:

```
                     ADD: +
                SUBTRACT: -
                MULTIPLY: *
                  DIVIDE: /
                 MODULUS: %

              LEFT SHIFT: <<
            RIGHT SHIFT: >>
             BITWISE OR: |
           BITWISE AND : &
                    XOR: ^
            BITWISE NOT: ~


          GREATER THAN : >
             LESS THAN : <
 GREATER THAN OR EQUAL : >=
    LESS THAN OR EQUAL : <=

                 NEGATE: -
```

The following logical operations are supported in .dbl files. They are as follows:

```
AND: &&
OR: ||
NOT: !

EQUALS: ==
NOT EQUALS: !=
```

If Statement:

```
IF(condition){

}IF_EXTEND

IF_EXTEND: ELIF(CONDITION){} IF_EXTEND
         | ELSE{}
         |
```

For Statement

The first expression rule only consists of the declaration of variables. The condition can be any expression that evaluates to true or false. The last expression is any expression that does not declare

```
for(expression;condition;expression){

}
```

While Statement

```
while(condition){

}
```

---

<em><b>Functions</em></b>

A function is a block of code defined not directly belonging to a specific struct. Functions can be defined to stand alone or they can be assigned to a variable.

Normal Declaration:

```
fn(paramaters){

}
```

Anonymous Declaration:

```
(parameters){

}
```

---

<em>Enums</em>

Enums are defined as a set of possible values for a type

```
ENUM ID{
  enum_var
}
enum_var_list: enum_var, enum_var_list
             | enum_var
enum_var: ID(type)
        | ID
```

To use the value VALUE1 of an enum with the name of ID1:

```
enum_access: ID1::VALUE1;
```

<em>Structs</em>

In this language, structs can hold many different variables inside one variable. They cannot contain other structs, only pointers to them. A struct can be declared as follows:

```
STRUCT ID{
  _var_decl
}
```

To access any variables or methods belonging to a struct, use the dot operator

```
variable1.value1;

variable1.function1();
```

<em>Methods</em>

A method is similar to a function, but is declared within the scope of a struct or an enum. All variables of the specified struct or enum type has access to that variable. They can be declared as follows:

```
FUNCS ID{
  methods
}
```

Here, we assume that a struct has been defined. We used the implement keyword to associate certain methods with the struct. These methods are visible to all variables of that specific struct type.

<em>Inheritance</em>

Structs can inherit methods and variables associated with different structs. This is done with the EXT keyword.

```
STRUCT ID EXT ID{

}
FUNCS ID EXT ID{

}
```

Both the struct and it's functions must extend the same struct type. A struct type must only extend one other struct

An IMPL structure is a promise to implement certain functions. The functions inside an IMPL structure are declared but not defined.

```
IMPL ID{
  functions
}

functions : fn ID(parameters), functions
          | fn ID(parameters);

```

<em><b>MySQL</b></em>

All keywords in MySQL are recognized by the compiler. SQL keywords are put into a SQL block and separated by a semicolon. They can be assigned to a variable or let to run immediately.

```
SQL{
  sql_code;
}

var:sql code = SQL{
  sql_code;
}
```

<em><b>Importing</em></b>

To use variables defined in another .dbl file, use the USE keyword to import it. All imports must be defined before any other statements and expressions

```
use ID1;
use ID2;
```

<em><b>Built In Classes</em></b>

```
JSON
Table
Date
Array
```

Because of the purpose of the language, these types will be built into the language. They can treated as part of a library that is available to every file.

<em><b>Grammer Rules</em></b>

Some grammer rules were used above to help with the definition of several features. The rules are expanded below:

Accessibility: a field, method and constructor have an accessibility description. A PUBLIC accessibility indicates that the item (field, method or constructor) can be accessed by any file within the project. PROTECTED limits accessibility to the folder while PRIVATE limits accessibility to that file itself.

```
accessibility: PUBLIC
             | PRIVATE
             | PROTECTED
```

```
parameters: param parameters
          |

     param: type ID COMMA
          | type ID
```

A class can extend another class or it can implement interfaces. Only one class can be extended by

```
relation: EXTENDS ID
        | interfaces
        |

interfaces: ID
          | interfaces, ID
```

Type: A type can be one of the primitive types, a user defined type, a pointer to a variable of a defined types or an array of any defined type

```
type: INT
    | FLOAT
    | LONG
    | DOUBLE
    | CHAR
    | BOOL
    | ID
    | * type

array_decl: type array;

array: []
     | [] array

var_decl: _var_decl
        | _var_decl, var_decl
_var_decl: VAR:type ID

undecl_var_decl: VAR ID;


```
