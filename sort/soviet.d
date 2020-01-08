module sort.soviet;

T[] purge(T)(T[] array,size_t[] purgelist)if(__traits(isArithmetic,T)){
    import std.algorithm,std.range,std.array;
    return iota(array.length).filter!((x){
            foreach(l;purgelist){
            if(x==l)return false;
            }return true;}).map!(index=>array[index]).array;
}

T[] stalin(T)(T[] array)if(__traits(isArithmetic,T)){
    if(array.length==0||array.length==1){
        return array;
    }
    size_t[] list;
    T biggest=array[0];
    foreach(i;1..array.length){
        if(biggest<=array[i]){
            biggest=array[i];
        }else{
            list~=i;
        }
    }
    return array.purge(list);
}

void main(){
    import std;
    int[] array=[0,1,2,3,2,1,5];
    array.stalin.writeln;
    array=[];
    array.stalin.writeln;
}
