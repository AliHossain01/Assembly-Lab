#include<iostream>
using namespace std;
int main()
{
    int a,b,c,d,f=1;
    cin>>d;
    while(d--)
    {
        cin>>a>>b>>c;
        if(a<=20 && b<=20 && c<=20)
            cout<<"Case "<<f++<<": good\n";
        else
            cout<<"Case "<<f++<<": bad\n";
    }
}
