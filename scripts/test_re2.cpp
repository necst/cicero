#include <iostream>
#include <string>
#include <re2/re2.h>
#include <vector>

using namespace std;

int main(int argc, char** argv){
    int matchResult;
    if (argc < 3 ){
        cout << "arguments: regex string [num of repeats]" << std::endl;
        return 2;
    }
    
    int    num_of_repeats = (argc >= 4 ? atoi(argv[3]): 1000000);
    string regex(argv[1]);
    string str(argv[2]);

    RE2 obj(regex);
    for(int i=0; i<num_of_repeats; i++){
        matchResult = RE2::PartialMatch(str, obj);
    }

    exit(!matchResult);
}