#include <iostream>
using namespace std;

/* prototype functions  this are usually copies of functions! this is like
 declaring func before only lel */

int secret(int a);
int secret(int a, int b);

int main() { cout << secret(5) << " " << secret(10, 10); }

/* writing two versions of the functions ( also func overloading ) , needs diff
 parameters or types to be used */

int secret(int a) { return a; }

int secret(int a, int b) { return a + b; }
