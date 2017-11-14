#include<iostream>
using namespace std;
int main()
{
    long long int n,m,s;
    while(cin>>n>>m)
    {
        if(n<0 && m<0)
            break;
        if(n>=m)
            s=n-m;
        if(m>n)
            s=m-n;
        if(s>50)
            cout<<100-s<<"\n";
        if(s<=50)
            cout<<s<<"\n";
    }
}
