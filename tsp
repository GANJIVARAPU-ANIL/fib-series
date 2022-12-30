#include <stdio.h>
int graph[4][4],cost=0,visited[4];
void input_graph()
{
    int i,j;
    for(i=0;i<4;i++)
    {
        for(j=0;j<4;j++)
        {
            scanf("%d",&graph[i][j]);
        }
         visited[i]=0;
    }
    
}
int least(int city)
{
    int min=999,i,p=999;
    for(i=0;i<4;i++)
    {
        if(graph[city][i]!=0&&visited[i]==0)
        {
            if(graph[city][i]<min)
            {
                min=graph[city][i];
                p=i;
            }
        }
    }
    if(min!=999)
    {
        cost+=min;                                            
    }
    return p;
}
void mincost(int city)
{
    visited[city]=1;
    printf("%d-->",city+1);
    int ncity=least(city);
    if(ncity==999)
    {
        ncity=0;
        
        printf("%d ",ncity+1);
        cost=cost+graph[ncity][city];
        return ;
    }
    mincost(ncity);
}
int main()
{
    input_graph();
    mincost(0);
    printf(" cost =%d",cost);
    return 0;
}


