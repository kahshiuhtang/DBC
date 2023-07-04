# Rust Assembly Language

## Description

This is a high-level Rust implementation of a RISC assembly language. It assumes that there are 16 64-bit registers and 32 32-bit registers.

# Registers

x0: zero (Zero)

x1: ra (Return Address)

x2: sp (Stack Pointer)

x3: gp (Global Pointer)

x10-11 a0-1 (function arguments/return value)

x12-17 a2-a7

x18-27 s2-11 (Saved Registers)

x28-31 t3-6 (Temporary Variable)

f0-5 ft0-5 (Float Temporaries)

f6-7 fs0-1 (Saved Registers)
f8-11 ft6-9 (Float Temporaries)

## Instructions

lb t0, 8(sp) Load Byte

sb t0, 8(sp) Store Byte

addi a0, t0, -10 Add Intermediate

add a0, t0, t1 Add Registers

sub a0, t0, t1 Subtract Registers

mul a0, t0, t1 Multiply Registers

div a1, s3, t3 Divide Registers

rem a1, s3, t3 Modulus

and a3, t3, s3 Logical And

or a3, t3, s3 Logical Or

beq a0, t0, label Branch Equal

bne a0, t0, label Branch Not Equal

bgt a0, t0, label Branch Greater Than

bge a0, t0, label Branch Greater Than Or Equal

blt a0, t0, label Branch Less Than

ble a0, t0, label Branch Less Than or Equal

## Psuedo-Instructions
