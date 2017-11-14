#include<iostream>
using namespace std;
int main()
{
    int N;
    while(cin>>N)
    {
        int a,b;
        a=N/2;
        b=N+a;
        if(N>=1 && N<=200)
        {
            cout<<b<<"\n";
        }
     }
}
