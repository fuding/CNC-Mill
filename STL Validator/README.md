
Description
===========
This is a [Unix](http://www.unix.org)-based Command Line Calculator Written in LEX & YACC.



Necessary Packages
==================
* [gcc Compiler](https://gcc.gnu.org/).
  * To install, type in `sudo apt-get install -y gcc`

* [lex](http://en.wikipedia.org/wiki/Lex_%28software%29)
  * To install, type in `sudo apt-get install -y flex`

* [yacc](http://en.wikipedia.org/wiki/Yacc)
  * To install, type in `sudo apt-get install -y bison`

To install the missing packages, type one of the following commands:

 1. `sudo ./install_missing`
 2. `make install-missing`

Build
=====
To build the source code on a Unix-based operating system, type in one of the following commands:
 1. `make`
 2. `make all`
 3. `make install`
 4. `make build`


Usage
=====

### PROGRAM OPTIONS

* If your calculations are held in a file, pass the file path/name as an argument. Make Sure only one argument is passed.


> DEFINING VARIABLES

* You first specift a variable name followed by assignment operator ('='), and then type in the numerical value you want to assign to the variable.

Examples:

	x = 10;
	y = -20;
	z = +30;

* Your variable may also be assigned to a mathematical equation.

Examples:

	x = 2 + 3;
	y = (2 +3)/ 2;
	z = -2+-10;

* You may also assign variables to variables.

Examples:

	a = -10;
	b = a;
	c = b * (2 - 3);
	d = ((a))  * (b) - (c)*2 + c/2;


*  You may declare multiple variables within one statement using a comma (',').

Examples:

	a = 10, b = -10, c = 20;
	a = (2 + 10), b = -1 * a, c = a - b;


> DATA TYPES

* The calculater accepts [integer](http://en.wikipedia.org/wiki/Integer_%28computer_science%29) values, [binary](http://en.wikipedia.org/wiki/Binary_number) numbers, and [hexdecimal](http://en.wikipedia.org/wiki/Hexadecimal) & [octal](http://en.wikipedia.org/wiki/Octal) representations.

Examples:

	a = 0xafff, b = 0b10110, c = 0o127, d = a + b + c;


> PRINTING VARIABLE VALUES

* Type variable name followed by a semicolon (';') to print its value to screen.

Examples:

	a;
	b;
	c; d; a;

* You may also make use of the comma operator (',') to print variable values. This forces the calculator to print multiple values in one line.

Examples:

	a, b, c;	


Syntax Rules
============
 1. All variables must be one-character long.
 2. Your variable must be within the range \[a-z] (lowercase ONLY).
 3. All statements must end with a semicolon (';').


Author
======
[Fadi Hanna Al-Kass](http://fadialkass.blogspot.com)
