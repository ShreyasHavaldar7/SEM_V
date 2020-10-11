// CS18BTECH11042

#include <bits/stdc++.h> 
using namespace std; 

double f(double x) {
    return ((log(x-1) + 3*(cos(x-2)) + 0.95));
}

double fd(double x) {
    return ((1/(x-1)) - 3*((sin(x-2))));
}

void newton(double x) 
{ 
    ofstream file;
    file.open("data.txt"); int i=0;
    double h = f(x) / fd(x); 
    while (abs(h) >=  1e-6) 
    { 
        file << i << "\t" << x << "\t" << abs(x-4.37812)<< "\n";   
        i++;        
        h = f(x)/fd(x); 
        x = x - h;

    }
    file << i << "\t" << x << "\t" << abs(x-4.37812)<< "\n";   // Convergence value
    cout<<"ROOT = "<<x<<"\n";
    file.close();

}
int main() {

    double x0 = 3.5;
    newton(x0);

    return 0;
} 