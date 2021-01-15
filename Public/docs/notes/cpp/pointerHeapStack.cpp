#include <iostream>
using namespace std;

/*-->  heap and stack

✦ Heap: The heap is a common area in memory where you can store global
variables.

✦ Stack: The stack is the area where the computer stores both the informa-
tion about the functions being called and the local variables for those
functions.

*/
int main() {
  int num = 5;
  int *ptr;

  ptr = &num;
  *ptr = 6087;

  cout << num << endl;

  // adding a var or such at heap! with the use of initializers.
  string *nStr = new string("bruh");
  cout << *nStr;

  // other method of assigning a value !
  int *n = new int;
  *n = 55;
  cout << *n;

  // smol arrowed notation
  //
  string *sent = new string("bruh this is...");
  cout << sent->length();

  delete sent; // freeing up pointers + set it to null 
}

// ✦ Dereferencing :)
