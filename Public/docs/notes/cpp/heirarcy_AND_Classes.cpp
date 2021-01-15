#include <iostream>
using namespace std;

// this way classes can inherit properties , methods etc of other
// classes
class SoloDistro {
public:
  string name;

  void distroName();
};

void SoloDistro::distroName() { cout << 'r'; }

class basedDistro : public SoloDistro {
public:
  int rating;
};

int main() {
  basedDistro artix;

  artix.name = "arti xlinux :)";

  artix.distroName();
}
// derived / inheritted class cant use acess the code in private
