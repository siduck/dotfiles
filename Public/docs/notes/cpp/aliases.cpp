#include <iostream>
using namespace std;

int main() {
  string install = "xbps-install";
  string &xi(install); // type &name(originalVar);

  xi = "bruh";
  cout << install;
}
