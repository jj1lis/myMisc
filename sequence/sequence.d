import std;

R delegate(Args) Z(R, Args...)(R delegate(R delegate(Args), Args) f){
    return (Args args) => f(Z(f), args);
}

auto sequence(G)(G Domain, ulong N)if(isInputRange!G){
    return Z((ElementType!G[][] delegate(G, ulong) rec, G domain, ulong n) =>
            n > 1 ? rec(domain, n - 1).map!(prev => domain.map!(e => prev ~ e).array).joiner.array : domain.map!(d => [d]).array)(Domain, N);
}

void main(){
    auto domain = [0,1,2,3];
    auto repeat_num = 2;
    sequence(domain, repeat_num).writeln;
}
