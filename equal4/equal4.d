void main(){
    import std.stdio;
    bool flag,last;
    for(int i=int.min;;i++){
        flag=(((i+1)*2)+6)/2-i==4;
        if(flag!=last)writefln("%s:%s\n%s:%s",i-1,last,i,flag);
        last=flag;
        if(i==int.max)break;
    }
}
