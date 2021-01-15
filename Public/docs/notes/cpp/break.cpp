#include <iostream>
using namespace std;

int main() {
  int a = 5;

  for (int i = 0; i < 10; i++) {
    if (i == a) {
      cout << i << '\n' << "done";
      break;
    } else {
      cout << i << '\n';
    }
  }
}
