#include<iostream>
using namespace std;
int main()
{
    long long int n,s,v=1,r;
    float m;
    while(cin>>n)
    {
        if(n<0)
            break;
        s=0;
        m=n;
        for( ; ; )
        {
            if(m<=1)
            {
                cout<<"Case "<<v++<<": "<<s<<"\n";
                break;
            }
            m=m/2;
            s=s+1;
        }
    }
}
