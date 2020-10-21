#include <chrono>
#include <iostream>
#include <list>
#include <unistd.h>

using namespace std;
//https://solarianprogrammer.com/2012/10/14/cpp-11-timing-code-performance/
//https://www.embedded.com/tutorial-techniques-for-measuring-execution-time-and-real-time-performance-part-1/
//https://docs.python.org/3/library/timeit.html
//This script must be executed on the machine before measuring the execution time 
//with measure.py. It's duty it's to state what are the available chrono clock
//and help with picking up the most appropriate one.
//The program outputs the accuracy of each clock and whether or not the clock
//is steady, i.e. if it can be adjusted during execution resulting in 
//negative delta time or underestimation/overestimation.
int main(int argc, char** argv){
	int num_of_repeats = 100;
	std::list<chrono::duration <double, nano>> l;
    
    for(int i=0; i<num_of_repeats; i++){
		auto start = std::chrono::high_resolution_clock::now();
		auto end = std::chrono::high_resolution_clock::now();
		chrono::duration <double, nano> elapsed = std::chrono::duration_cast<std::chrono::nanoseconds>(end - start);
		l.push_back(elapsed);
	}
	float sum = 0;
    for ( chrono::duration <double, nano> e : l) 
        sum += e.count();
    float avg = sum/num_of_repeats;
	cout << "average chrono overhead: "<< avg << std::endl;
	double res  =(double)std::chrono::high_resolution_clock::period::num /  std::chrono::high_resolution_clock::period::den; 
	
	cout << "system_clock" << endl;
	cout << chrono::system_clock::period::num << endl;
	cout << chrono::system_clock::period::den << endl;
	cout << "steady = " << boolalpha << chrono::system_clock::is_steady << endl << endl;	
	cout << "high_resolution_clock" << endl;
	cout << chrono::high_resolution_clock::period::num << endl;
	cout << chrono::high_resolution_clock::period::den << endl;
	cout << "steady = " << boolalpha << chrono::high_resolution_clock::is_steady << endl << endl;	
	cout << "steady_clock" << endl;
	cout << chrono::steady_clock::period::num << endl;
	cout << chrono::steady_clock::period::den << endl;
	cout << "steady = " << boolalpha << chrono::steady_clock::is_steady << endl << endl;	
	return 0;
}
