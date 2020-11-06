# CS3423: COMPILERS-II #

## MINI ASSIGNMENT 3 ##

---------------------------------------------------------------------------------------------------

### Shreyas Havaldar, CS18BTECH11042 ###

---------------------------------------------------------------------------------------------------

#### Files Submitted ####

- *METHOD-I: b_to_d_1.l and b_to_d_1.y*

- *METHOD-II: b_to_d_2.l and b_to_d_2.y*

- *METHOD-III: b_to_d_3.l and b_to_d_3.y*

- *README.md*

- *report.pdf*

---------------------------------------------------------------------------------------------------

#### Compilation and Execution ####

- To process lex specification file, run, in the directory where file is stored:

```

lex <file-name>.l
```

- To process yacc grammar file, run,  in the directory where file is stored:

```

yacc -d <file-name>.y
```

- "-d" is a flag to create a header file **y.tab.c** that defines all used tokens in addition to the C language source code file produced.

- Compiling and linking the two C language source files created by the above commands, in the directory where file is stored:

```

 gcc lex.yy.c y.tab.c -ll -lm
```

- "-ll" flag to link against Solaris's **libl** lex library (available in /usr/lib/libl.so)

- "-lm" flag to enable use of **math.h** C library for power function.

- To run the generated output file, in the directory where file is stored:

```

./a.out
```

#### Input Format ####

- One single binary number followed by new line character. No whitespaces/tabspaces allowed. Refer to each method source yacc files for more details.

#### Sample Outputs: Prints the input number in decimal notation between two empty lines if no error ####

- Method I

```

shreyas@shreyas:~/Documents/SEM_V/Compilers-II/Mini-3$ lex b_to_d_1.l 
shreyas@shreyas:~/Documents/SEM_V/Compilers-II/Mini-3$ yacc -d b_to_d_1.y 
shreyas@shreyas:~/Documents/SEM_V/Compilers-II/Mini-3$ gcc lex.yy.c y.tab.c -ll -lm
shreyas@shreyas:~/Documents/SEM_V/Compilers-II/Mini-3$ ./a.out 
111

7
shreyas@shreyas:~/Documents/SEM_V/Compilers-II/Mini-3$ ./a.out 
111.1

Invalid Syntax: Input must contain only characters '1' or '0'.
shreyas@shreyas:~/Documents/SEM_V/Compilers-II/Mini-3$ ./a.out 
11 11

Invalid Syntax: Input must contain only characters '1' or '0'. No white-space or tab-space allowed.
shreyas@shreyas:~/Documents/SEM_V/Compilers-II/Mini-3$ ./a.out 
01

1
shreyas@shreyas:~/Documents/SEM_V/Compilers-II/Mini-3$ ./a.out 
1234

Invalid Syntax: Input must contain only characters '1' or '0'.
shreyas@shreyas:~/Documents/SEM_V/Compilers-II/Mini-3$ ./a.out 
invalid

Invalid Syntax: Input must contain only characters '1' or '0'.

```

- Method-II

```

shreyas@shreyas:~/Documents/SEM_V/Compilers-II/Mini-3$ lex b_to_d_2.l 
shreyas@shreyas:~/Documents/SEM_V/Compilers-II/Mini-3$ yacc -d b_to_d_2.y 
shreyas@shreyas:~/Documents/SEM_V/Compilers-II/Mini-3$ gcc lex.yy.c y.tab.c -ll -lm
shreyas@shreyas:~/Documents/SEM_V/Compilers-II/Mini-3$ ./a.out 
111.111

7.875000
shreyas@shreyas:~/Documents/SEM_V/Compilers-II/Mini-3$ ./a.out 
11 .1

Invalid Syntax: Input must contain only characters '1' or '0'. No white-space or tab-space allowed.
shreyas@shreyas:~/Documents/SEM_V/Compilers-II/Mini-3$ ./a.out 
111

syntax error, unexpected $end, expecting POI
shreyas@shreyas:~/Documents/SEM_V/Compilers-II/Mini-3$ ./a.out 
01.010

1.250000
shreyas@shreyas:~/Documents/SEM_V/Compilers-II/Mini-3$ ./a.out 
4321

Invalid Syntax: Input must contain only characters '1' or '0' and exactly one '.'
shreyas@shreyas:~/Documents/SEM_V/Compilers-II/Mini-3$ ./a.out 
1 ... 0

Invalid Syntax: Input must contain only characters '1' or '0'. No white-space or tab-space allowed.
shreyas@shreyas:~/Documents/SEM_V/Compilers-II/Mini-3$ ./a.out 
hello!

Invalid Syntax: Input must contain only characters '1' or '0' and exactly one '.'

```

- Method III

```

shreyas@shreyas:~/Documents/SEM_V/Compilers-II/Mini-3$ lex b_to_d_3.l 
shreyas@shreyas:~/Documents/SEM_V/Compilers-II/Mini-3$ yacc -d b_to_d_3.y 
shreyas@shreyas:~/Documents/SEM_V/Compilers-II/Mini-3$ gcc lex.yy.c y.tab.c -ll -lm
shreyas@shreyas:~/Documents/SEM_V/Compilers-II/Mini-3$ ./a.out 
101.1001

5.562500
shreyas@shreyas:~/Documents/SEM_V/Compilers-II/Mini-3$ ./a.out 
1 . 1

Invalid Syntax: Input must contain only characters '1' or '0'. No white-space or tab-space allowed.
shreyas@shreyas:~/Documents/SEM_V/Compilers-II/Mini-3$ ./a.out 
010.23

Invalid Syntax: Input must contain only characters '1' or '0' and exactly one '.'
shreyas@shreyas:~/Documents/SEM_V/Compilers-II/Mini-3$ ./a.out 
1...1

syntax error, unexpected POI, expecting ZERO or ONE
shreyas@shreyas:~/Documents/SEM_V/Compilers-II/Mini-3$ ./a.out 
101

syntax error, unexpected $end, expecting POI
shreyas@shreyas:~/Documents/SEM_V/Compilers-II/Mini-3$ ./a.out 
7

Invalid Syntax: Input must contain only characters '1' or '0' and exactly one '.'

```
