import std;

void main(){
    auto range = [1, 2];
    (isOutputRange!(typeof(range),int)).writeln;
    writefln("%s range: %s", typeof(range).stringof, range);
    range.writeln;
    typeof(range.put(3)).stringof.writeln;
    writefln("%s range: %s", typeof(range).stringof, range);
}
