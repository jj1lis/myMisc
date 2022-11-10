import std;

auto formatSet(string[] states){
    return format("$\\qty{%(%s, %)}$", states.map!(i => format("q_{%s}", i)));
}
auto transit(string[] states, string[][int][string] dfa, int input){
    return states.map!(q => dfa[q][input]).join.sort.uniq.array;
}

auto additional(string[] states, string init, string accepting){
    return format("%s%s", states == [init] ? "$*$ " : "", states.canFind(accepting) ? "$\\to$ " : "");
}

auto beginTable(string title){
    writefln("\\begin{table}[%s]", "H");
    writeln("\\centering");
    writefln("\\caption{%s}", title);
    writefln("\\begin{tabular}{%s} \\hline", "rrr");
    writeln("$P$ & $\\delta'(P, 0)$ & $\\delta'(P, 1)$ \\\\ \\hline");
}

auto endTable(){
    writeln("\\hline");
    writeln("\\end{tabular}");
    writeln("\\end{table}");
}

void main(){
    string[][int][string] dfa;
    dfa["s"][0] = ["s", "0"];
    dfa["s"][1] = ["s"];
    dfa["0"][0] = ["1", "f"];
    dfa["0"][1] = ["1"];
    dfa["1"][0] = ["2"];
    dfa["1"][1] = ["2"];
    dfa["2"][0] = ["3"];
    dfa["2"][1] = ["3"];
    dfa["3"][0] = ["0"];
    dfa["3"][1] = ["0"];
    dfa["f"][0] = ["f"];
    dfa["f"][1] = ["f"];

    string[] states = ["s", "0", "1", "2", "3", "f"];
    string[] choiced;
    beginTable("DFA $D$ の状態遷移表");
    for(int i = 1; i < 64; i++){
        if(i == 32){
            endTable;
            beginTable("DFA $D$ の状態遷移表（続き）");
        }
        choiced = [];
        for(int j = 0; j < 6; j++)
            if((i >> j & 1) == 1)
                choiced ~= states[j];

        writefln("%s%s & %s & %s \\\\", choiced.additional("s", "f"), choiced.formatSet, choiced.transit(dfa, 0).formatSet, choiced.transit(dfa, 1).formatSet);
    }
    endTable;
}
