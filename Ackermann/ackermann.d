import std;

// Ack(m,n) >= 0 in all integer m,n.
ulong[ulong][ulong] dp;
size_t called;

void main(string[] args){
    auto m=args[1].to!ulong;
    auto n=args[2].to!ulong;
    auto ans=Ack(m,n);
    writefln("Ack(%s,%s) = %s : func called %s times.",m,n,ans,called);
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
