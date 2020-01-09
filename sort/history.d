module sort.history;

import std.algorithm;
import std.range;
import std.array;

T[] purge(T)(T[] array,size_t[] purgelist)if(__traits(isArithmetic,T)){
    assert(purgelist.filter!(x=>array.length>x).equal(purgelist));
    return iota(array.length).filter!((x){
            foreach(l;purgelist){
            if(x==l)return false;
            }return true;}).map!(index=>array[index]).array;
}

//Stalin Sort
//Purge elements that are not positioned correctly.
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

//Malenkov Sort
//He can only return first element because the term in his office was only 8 days.
T[] malenkov(T)(T[] array)if(__traits(isArithmetic,T)){
    return array.length==0?array:array[0..1];
}

//Mao Sort
//Dodge the subject by lining up many.
T[] mao(T)(T[] array)if(__traits(isArithmetic,T)){
    import std.random;
    auto rnd=unpredictableSeed.Random;
    return array.map!(x=>x.repeat(uniform(1,6,rnd))).join.array;
}

void main(){
    import std.stdio;
    auto array=[0,1,2,4,3,5,6,5,3,7,8,4];
    array.stalin.writeln;
    array.malenkov.writeln;
    array.mao.writeln;
}
