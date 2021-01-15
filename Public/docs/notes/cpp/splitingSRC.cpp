#include <iostream>
using namespace std;
/*
#ifndef SAFESTUFF_H_INCLUDED
#define SAFESTUFF_H_INCLUDED */

void printBruh(string bruh);// in another header2 which includes #include "header1.h"

//#endif // SAFESTUFF_H_INCLUDED

// actual src file using header 2
int main() {
  printBruh("bruh"); 
}

// in header1
void printBruh(string bruh){
  cout << bruh;
}

/* to declare a global variable  ( tells the code that the var is external )
 extern int DoubleCheeseburgers; */
