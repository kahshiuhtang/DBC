# DBC: A multilingual compiler

## Purpose

DBC is a compiler designed to integrate SQL-like queries into a procedural programming language while implementing Relational and Non-Relational database functionality in the same interface that is simpler than what exists today.

It is based on .dbl files, are written in a language defined by the rules below

---

## Design

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

By default, primitive types are stored on the program's stack.

<em><b>Pointer Types</em></b>

Every type has an associated pointer type. An asteriks follows the type declaration to signal a pointer type.

```
int*
```

---

<em><b>Statements</em></b>
Variable Declaration:

Function Declaration:

Operations:

If Statement

For Statement

While Statement

---

<em><b>Functions</em></b>

A function is a block of code defined not directly belonging to a class. They can be defined inside a method of a class. There are multiple ways to define a function, as listed below.

Normal Declaration:

Variable Assignment:

Annonymous:

---

<em>Enums</em>

Enums are defined as a set of possible values for a type

<em>Structs</em>

In this language, structs can hold many different variables inside one variable. They cannot contain other structs, only pointers to them.

<em>Methods</em>

A method is similar to a function, but is declared within the scope of a struct or an enum. All variables of the specified struct or enum type has access to that variable. They can be declared as follows:

```
TYPEDEF STRUCT ID (parameters){

}
IMPL ID{
  methods
}
```

Here, we assume that a struct has been defined. We used the implement keyword to associate certain methods with the struct. These methods are visible to all variables of that specific struct type.

<em><b>Built In Classes</em></b>

```
JSON
Query
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

```
