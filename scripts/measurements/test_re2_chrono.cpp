#include <iostream>
#include <string>
#include <re2/re2.h>
#include <vector>
#include <cassert>
#include <chrono>
#include <list>
#include <math.h>
#include <iomanip>
using namespace std;

int main(int argc, char** argv){
    if (argc < 3 ){
        cout << "arguments: regex string [num of repeats]" << std::endl;
        return 2;
    }
   
    
    int     num_of_repeats = (argc >= 4 ? atoi(argv[3]): 1000000);
    int     matchResult;
    int     expectedResult; 
    string  regex(argv[1]);
    string  str(argv[2]);

    std::list<chrono::duration <double, nano>> lexe;
	std::list<chrono::duration <double, nano>> lcomp;
    int batch_num = 50;
    for(int i=0; i<int(num_of_repeats/batch_num); i++){
		auto start = std::chrono::high_resolution_clock::now();
    	RE2 obj(regex);
		auto end = std::chrono::high_resolution_clock::now();

    	assert(obj.ok());	

        chrono::duration <double, nano> elapsed = std::chrono::duration_cast<std::chrono::nanoseconds>(end - start);
        lcomp.push_back(elapsed);

        start = std::chrono::high_resolution_clock::now();
        
        for (int j=0; j<batch_num; j++){
            matchResult = RE2::PartialMatch(str, obj);
            if(i==0)
                expectedResult = matchResult;
            assert(expectedResult == matchResult);
        }
        
        end = std::chrono::high_resolution_clock::now();
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