import std;
void main(){
    foo([0,1,2]);
    foo(["Hoge","Fuga","na^"]);
    auto array=[0,1,2,3,4,5];
    (array[0..2]~array[1..$]).writeln;
    array[0..1].writeln;
}

void foo(T)(T[] arg){
    __traits(isArithmetic,T).writeln;
}
