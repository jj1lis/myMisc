import std;

size_t deepest;

Tuple!(dstring,"country",dstring,"reading")[] dic;
auto reading(size_t i){assert(i<dic.length);return dic[i].reading;}
size_t[][dchar] index;
string logfile="log/shiritori.log";
string progfile="log/progress.log";

void main(string[] args){
    dic=args[1].readText.splitLines.map!((line){
                auto l=line.split(",").to!(dstring[]);
                return tuple!(dstring,"country",dstring,"reading")(l[0],l[1]);}).array;

    dic.length.iota.each!(i=>index[dic[i].reading[0]]~=i);

    if(logfile.exists)
        logfile.remove;
    if(progfile.exists)
        progfile.remove;


    size_t[] longest;
    foreach(first;0..dic.length){
        append(progfile,format("%s start: %s\n\n",dic[first].country,Clock.currTime.toISOExtString));
        auto list=dfs(first,[]);
        append(progfile,format("%(%s -> %)",list.map!(i=>dic[i].country)));
        writefln("%(%s:%)",list.map!(i=>dic[i].country));
        append(progfile,format("%s end: %s\n\n",dic[first].country,Clock.currTime.toISOExtString));
        if(longest.length<list.length)
            longest=list;
    }

    writefln("longest: %(%s:%)\nlength:%s",longest.map!(i=>dic[i].country),longest.length);
}

size_t[] dfs(size_t word,const size_t[] used){//depth first search
    size_t[] longest;
    if(deepest<used.length){
        deepest=used.length;
        append(logfile,format("\ndepth updated:%s\n%(%s->%)\n",deepest,used.map!(i=>dic[i].country)));
    }
    if(reading(word)[$-1] in index){
        auto cands=index[reading(word)[$-1]].filter!(c=>c.unused(used~word));
        if(!cands.empty){
            foreach(cand;cands){
                auto tmp=dfs(cand,used~word);
                if(longest.length<tmp.length)
                    longest=tmp;
            }
        }
    }

    return word~longest;
}

auto unused(size_t word,const size_t[] used){
    return used.find(word).empty;
}
