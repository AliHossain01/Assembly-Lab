#include<iostream>
using namespace std;
int main()
{
    for(int i=1;i<=250000;i++)
    {
        long long int N,n;
        cin>>N;
        if(N==0)
            break;
        else if(N<=100)
            cout<<"f91("<<N<<") = "<<"91"<<"\n";
        else if(N>=101)
        {
            n=N-10;
            cout<<"f91("<<N<<") = "<<n<<"\n";
        }
    }
}
