#include <iostream>
#include <string>
#include <re2/re2.h>
#include <vector>
#include <cassert>
#include <chrono>
#include <list>
#include <math.h>
#include <fstream>
#include <cctype>
#include <sstream>

using namespace std;

string escape(string your_string){
    // s is our escaped output string
    std::string s = "";
    // loop through all characters
    for(char c : your_string)
    {
        // check if a given character is printable
        // the cast is necessary to avoid undefined behaviour
        if(isprint((unsigned char)c))
            s += c;
        else
        {
            std::stringstream stream;
            // if the character is not printable
            // we'll convert it to a hex string using a stringstream
            // note that since char is signed we have to cast it to unsigned first
            stream << std::hex << (unsigned int)(unsigned char)(c);
            std::string code = stream.str();
            s += std::string("\\x")+(code.size()<2?"0":"")+code;
            // alternatively for URL encodings:
            //s += std::string("%")+(code.size()<2?"0":"")+code;
        }
    }
    return s;
}
int main(int argc, char** argv){
    if (argc < 3 ){
        cout << "arguments: regex string [num of repeats]" << std::endl;
        return 2;
    }
   
    
    int     num_of_repeats = (argc >= 4 ? atoi(argv[3]): 1000000);
    int     matchResult;
    int     expectedResult; 
    string   regex  (argv[1]);
    ifstream myFile (argv[2], ios::in | ios::binary);
    //1)string line;
    //while(std::getline(myFile, line))
    //{
    //    std::cout << "line:" << escape(line) << std::endl;
    //    // TODO: assign item_name based on line (or if the entire line is 
    //    // the item name, replace line with item_name in the code above)
    //}
    //0)string  str(argv[2]);
    //2)std::string str( (std::istreambuf_iterator<char>(myFile) ),
    //                 (std::istreambuf_iterator<char>()    ) );
    string  str;
    std::getline(myFile, str);
    
	RE2 obj(regex);
	assert(obj.ok());	
    
    for(int i=0; i<num_of_repeats; i++){
	
        
        
		matchResult = RE2::PartialMatch(str, obj);
		if(i==0)
			expectedResult = matchResult;
		assert(expectedResult == matchResult);
        cout << matchResult << std::endl;
        

    }

    exit(!matchResult);
}