#include <iostream>
using namespace std;

// constructor starts when the object is created , and deconstructor ends at the
// last ; sample codsample code for itt.

class person {
public:
  person();
  ~person();
};

person::person() { cout << "start"; }

person::~person() { cout << "end!"; }

int main() {
  person *sid = new person;

  delete sid;
  sid = 0;
  return 0;
}
