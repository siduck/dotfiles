#include <iostream>
using namespace std;

// passing the number's address rather than itself !
// func takes a pointer rather than a number

void changeNum(
    int *temp) { // if the number is just used as arg then its passing by val or
                 // if referenced the passing by reference
  *temp += 10;
  cout << "in function lul " << *temp << endl;
}

int main() {
  int mynum = 1;
  cout << "before function : " << mynum << endl;

  changeNum(&mynum);

  /* ampersand to make a reference which passes the address
   of the number instead of the num itself */

  cout << "after function : " << mynum << endl;
}
