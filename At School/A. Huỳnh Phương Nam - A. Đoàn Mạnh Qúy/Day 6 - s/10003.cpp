#include <stdio.h>
#include <string.h>
int dp[55][55];
int n,l,a[55];
int min(int a,int b){
    if ( a < b ){
         return a;
    }else{
         return b; 
    }
}
int solve1(int l,int r){        
     if ( l == r || r - l == 1 ){
         return 0;
     }else if ( r-l == 2 ){
         return a[r]-a[l];  
     }else{
           int Min = 1000000007;
           for(int i = l + 1 ; i <= r - 1  ; ++i){
                   Min = min(Min,(a[r]-a[l])+solve(l,i)+solve(i,r));
           }
           return Min;
     }
}
int solve(int l,int r){        
     if ( dp[l][r] != -1 ){
          return dp[l][r];
     }
     if ( l == r || r - l == 1 ){
          dp[l][r] = 0;
          return dp[l][r];
     }else if ( r-l == 2 ){
         dp[l][r] = a[r]-a[l]  
         return dp[l][r];  
     }else{
           int Min = 1000000007;
           for(int i = l + 1 ; i <= r - 1  ; ++i){
                   Min = min(Min,(a[r]-a[l])+solve(l,i)+solve(i,r));
           }
           dp[l][r] = Min;
           return dp[l][r];
     }
     
}
int main(){
    while (scanf("%d",&l)&&l!=0){
          scanf("%d",&n);
          for(int i = 1 ; i <= n ; ++i){
                  scanf("%d",&a[i]);
          }
          a[0] = 0 ; a[n+1] = l;
          memset(dp,-1,sizeof(dp));
          printf("The minimum cutting is %d.\n",solve(0,n+1));
    }
    return 0;
}
