#include <iostream>
using namespace std;

int main() {
  string words = "this is a cat";
  cout << words << endl;

  // add and remove stuffs
  words.insert(words.length(), " and a dog");
  words.replace(0, 4, "bruh");
  words.erase(3, 4);
  cout << words;
}
