# include <iostream>
using namespace std;

void rotate(int arr[], int n)
{
 int x = arr[n - 1], i;
 for (i = n - 1; i > 0; i--)
 arr[i] = arr[i - 1];
 arr[0] = x;
}

int main()
{
 int n,k;
    cin>>n;
    int arr[n];
 for (int i = 0; i < n; i++)
  cin>>arr[i];

    cin>>k; 
  while(k>0){
 rotate(arr, n);
    k--;
  }#include <stdio.h>

int main()
{
    int N,safe,ind;
    scanf("%d",&N);
    int arr[N];
    for(ind=0;ind<N;ind++)
    {
        scanf("%d",&arr[ind]);
    }
    int rot;
    scanf("%d",&rot);
    while(rot--)
    {
        safe=arr[0];
        for(ind=0;ind<N-1;ind++)
        {
            arr[ind]=arr[ind+1];
        }
        arr[N-1]=safe;
    }
    for(ind=0;ind<N;printf("%d ",arr[ind++]));
    return 0;
}
 for (int i = 0; i < n; i++)
  cout << arr[i] << ' ';

 return 0;
}