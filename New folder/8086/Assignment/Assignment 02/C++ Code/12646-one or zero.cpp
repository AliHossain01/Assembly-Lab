#include<iostream>
using namespace std;
int main()
{
    int A,B,C;
    while(cin>>A>>B>>C)
    {
        if(A==B && B==C)
            cout<<"*\n";
        else if(A==B)
            cout<<"C\n";
        else if(B==C)
            cout<<"A\n";
        else if(C==A)
            cout<<"B\n";
    }
}
