#!/bin/bash

while read line
do
    echo $line,$(echo $line|kakasi -i utf-8 -o utf-8 -JH -KH) >> $2
done < $1

sed -ie "s/\r//g" $2
sed -ie "s/が/か/g" $2
sed -ie "s/ぎ/き/g" $2
sed -ie "s/ぐ/く/g" $2
sed -ie "s/げ/け/g" $2
sed -ie "s/ご/こ/g" $2
sed -ie "s/ざ/さ/g" $2
sed -ie "s/じ/し/g" $2
sed -ie "s/ず/す/g" $2
sed -ie "s/ぜ/せ/g" $2
sed -ie "s/ぞ/そ/g" $2
sed -ie "s/だ/た/g" $2
sed -ie "s/ぢ/ち/g" $2
sed -ie "s/づ/つ/g" $2
sed -ie "s/で/て/g" $2
sed -ie "s/ど/と/g" $2
sed -ie "s/ば/は/g" $2
sed -ie "s/び/ひ/g" $2
sed -ie "s/ぶ/ふ/g" $2
sed -ie "s/べ/へ/g" $2
sed -ie "s/ぼ/ほ/g" $2
sed -ie "s/ぱ/は/g" $2
sed -ie "s/ぴ/ひ/g" $2
sed -ie "s/ぷ/ふ/g" $2
sed -ie "s/ぺ/へ/g" $2
sed -ie "s/ぽ/ほ/g" $2
sed -ie "s/ぁ/あ/g" $2
sed -ie "s/ぃ/い/g" $2
sed -ie "s/ぅ/う/g" $2
sed -ie "s/ぇ/え/g" $2
sed -ie "s/ぉ/お/g" $2
sed -ie "s/っ/っ/g" $2
sed -ie "s/ゃ/や/g" $2
sed -ie "s/ゅ/ゆ/g" $2
sed -ie "s/ょ/よ/g" $2
