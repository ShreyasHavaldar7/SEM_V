#include <bits/stdc++.h> 
using namespace std;

float func(float x)
{   float f = log(x-1) + 3*cos(x-2) + 0.95;
    return f;
}
float derivative(float x) 
{   
    float d = 1/(x-1) - 3 * sin(x-2) ;
    return d;
}
float newton(float x)
{   
    float term, temp;
    int i = 0;
    ofstream myfile;
    myfile.open("data.txt");
    cout<<"inside";
    term = func(x)/derivative(x);
    while(abs(term) >= 0.000001) //term is also the error
    {
        term = func(x)/derivative(x); 
        myfile<<i<<"\t"<<x<<"\t"<<abs(x-4.378)<<"\n";//4.378 is the root
        x = x - term;
        i++;
    }  
    cout<<"Root is"<<x;
}  
int main()
{
    cout<<"inside";
    int x0 = 3.5;
    newton(x0);
}