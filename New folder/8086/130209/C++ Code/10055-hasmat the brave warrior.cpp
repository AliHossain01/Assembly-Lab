#include<iostream>
using namespace std;
int main()
{
    long long int n, r ,s;
    while(cin>>n>>r)
    {
        if(n>=r)
        {
             s=n-r;
             cout<<s<<"\n";
        }
        else
        {
             s=r-n;
             cout<<s<<"\n";
        }

    }
}

