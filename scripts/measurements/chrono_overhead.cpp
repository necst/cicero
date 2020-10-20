#include <chrono>
#include <iostream>
#include <list>
#include <unistd.h>

using namespace std;

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
	cout <<"average chrono overhead: "<< avg << std::endl;
	double res  =(double)std::chrono::high_resolution_clock::period::num /  std::chrono::high_resolution_clock::period::den; 
	//cout  << "resolution: " << double(1.0/sysconf(3)) << std::endl;
}
