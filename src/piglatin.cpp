#include <iostream>
#include <cstdlib>
#include <algorithm>
using namespace std;
string word, fLetter, lastPart;
int chars;

int main() {
  cout << "Input a word and it to be converted to Pig Latin... ";
getline(cin,word);
transform(word.begin(),word.end(),word.begin(),::tolower);
  cout<< word;
chars =word.length();
  fLetter = word[0];
for (int i=1; i<chars; i++){
  lastPart += word[i];
}
cout << " Characters: " + to_string(chars) + " First Letter: " + fLetter + " Rest of the word: " + lastPart + " Pig Latin word: " + lastPart + fLetter + "ay ";

}