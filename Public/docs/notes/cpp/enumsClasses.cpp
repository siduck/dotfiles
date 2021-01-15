#include <iostream>
using namespace std;

enum baes { sid, bee };

class distro {
public:
  string name;
  int rating;
  void bruh();
};

void distro::bruh() {
  cout << name << " and " << rating;
} // separating memmber functions

int main() {
  distro artix;
  artix.name = "artix";
  artix.rating = 8;

  artix.bruh();
}
/* using private and public , accessing their stuffs!
 
private:
  void TurnOnHeatingElement();
  void TurnOffHeatingElement();

public:
  void Bake(int Temperature);

void Oven::TurnOnHeatingElement();

*/
