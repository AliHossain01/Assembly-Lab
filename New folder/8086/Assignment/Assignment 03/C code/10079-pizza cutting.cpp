#include<iostream>
using namespace std;
int main()
{
    long long int n,i,r;
    while(cin>>n)
    {
        if(n>=0)
        {
            r=1;
            for(i=0;i<=n;i++)
            {
                r=r+i;
            }
            cout<<r<<"\n";
        }
        else
            break;
    }
}
