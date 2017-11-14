#include<iostream>
using namespace std;
int main()
{
    for(int i=1;i<=10;i++)
    {
        int n,a;
        cin>>n;
        if(n==0)
        {
            break;
        }
        else
        {
            a=n/2;
            cout<<a<<"\n";
        }
    }
}
