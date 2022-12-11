#include <stdio.h>

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