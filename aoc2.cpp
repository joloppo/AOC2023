#include <iostream>
#include <fstream>
using namespace std;
ifstream MyReadFile("aoc2.txt");


// each id has max vals for rgb
// if max vals use val

string mtext;

int main() {
    while (getline (MyReadFile, mtext)) {
        // Output the text from the file
        // find until ': ' char then save string
        int n = 4;
        if (n >= 0 && n <= mtext.length()) {
            std::string firstPart = mtext.substr(0, n);
            std::string secondPart = mtext.substr(n);

            std::cout << "First " << n << " characters: " << firstPart << std::endl;
            std::cout << "Remaining characters: " << secondPart << std::endl;
        } else {
            std::cout << "Invalid value of 'n'." << std::endl;
        }



        cout << mtext;

    }


    return 0;
}