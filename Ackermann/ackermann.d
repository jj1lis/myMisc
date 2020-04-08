import std;

// Ack(m,n) >= 0 in all integer m,n.
ulong[ulong][ulong] dp;
size_t called;

void main(){
    auto ans=Ack(3,3);
    writefln("Ack(3,3) = %s : func called %s times.",ans,called);
}

auto Ack(ulong m, ulong n){
    called++;
    if(m in dp && n in dp[m]){
        return dp[m][n];
    }else{
        if(m == 0)
            return dp[m][n]=n+1;
        else if(n==0)
            return dp[m][n]=Ack(m-1,1);
        else
            return dp[m][n]=Ack(m-1,Ack(m,n-1));
    }
}
