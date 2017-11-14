#include<iostream>
using namespace std;
int main()
{
    int a,b,c;
    cin>>c;
    for(int i=1;i<=c;i++)
    {
        cin>>a>>b;
        if(a>b)
            cout<<">"<<"\n";
        else if(a<b)
            cout<<"<"<<"\n";
        else if(a==b)
            cout<<"="<<"\n";

    }
}
