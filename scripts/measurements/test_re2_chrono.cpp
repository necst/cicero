#include <iostream>
#include <string>
#include <re2/re2.h>
#include <vector>
#include <cassert>
#include <chrono>
#include <list>
#include <math.h>
#include <iomanip>
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
    std::list<chrono::duration <double, nano>> lexe;
	std::list<chrono::duration <double, nano>> lcomp;

    for(int i=0; i<num_of_repeats; i++){
		auto start = std::chrono::steady_clock::now();
    	RE2 obj(regex);
		auto end = std::chrono::steady_clock::now();

    	assert(obj.ok());	

        chrono::duration <double, nano> elapsed = std::chrono::duration_cast<std::chrono::nanoseconds>(end - start);
        lcomp.push_back(elapsed);

        start = std::chrono::steady_clock::now();
		matchResult = RE2::PartialMatch(str, obj);
        end = std::chrono::steady_clock::now();

		if(i==0)
			expectedResult = matchResult;
		assert(expectedResult == matchResult);
        
        
    	elapsed = std::chrono::duration_cast<std::chrono::nanoseconds>(end - start);
        lexe.push_back(elapsed);

    }

    float sum = 0;
    for ( chrono::duration <double, nano> e : lexe) 
        sum += e.count();
    float avg = sum/num_of_repeats;
	sum = 0;
	for ( chrono::duration <double, nano> e : lexe) 
        sum += pow(e.count()-avg, 2) ;	
	float std_dev = sqrt(sum/num_of_repeats);

    cout << "Execution "<< lexe.size() <<" iterations: avg time taken " << std::setprecision(2) << std::fixed << avg  << " std deviation "<< std_dev << endl;

	sum = 0;
    for ( chrono::duration <double, nano> e : lcomp) 
        sum += e.count();
    avg = sum/num_of_repeats;
	sum = 0;
	for ( chrono::duration <double, nano> e : lcomp) 
        sum += pow(e.count()-avg, 2) ;	
	std_dev = sqrt(sum/num_of_repeats);

    cout <<"Compilation "<< lcomp.size() <<" iterations: avg time taken " << std::setprecision(2) << std::fixed << avg  << " std deviation "<< std_dev << endl;

    exit(!matchResult);
}