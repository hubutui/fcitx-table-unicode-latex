#!/bin/sh
# 生成无衬线的数字对应的码表
# 输出文件为 number-eng-msans.html 和 number-arabic-msans.html
# 前者使用 \msansone 这样的编码，后者使用 \msans1 这样的编码
#
sed -e '/msans/!d' -e '/digit/!d' unicode-math-table.tex > number-msans.html
cut -f 1 -d"}" number-msans.html > usv.tmp
cut -f 2 -d'"' usv.tmp > tmpfile
mv tmpfile usv.tmp
sed -i 's/^/\&#x/' usv.tmp
sed -i 's/$/;<br>/' usv.tmp

cut -f3 -d"{" number-msans.html > value.tmp
sed -i 's/}//' value.tmp

paste -d" " value.tmp usv.tmp > number-msans.html

mv number-msans.html number-eng-msans.html
cp number-eng-msans.html number-arabic-msans.html
sed -i 's/zero/0   /' number-arabic-msans.html
sed -i 's/one/1  /' number-arabic-msans.html
sed -i 's/two/2  /' number-arabic-msans.html
sed -i 's/three/3    /' number-arabic-msans.html
sed -i 's/four/4   /' number-arabic-msans.html
sed -i 's/five/5   /' number-arabic-msans.html
sed -i 's/six/6  /' number-arabic-msans.html
sed -i 's/seven/7    /' number-arabic-msans.html
sed -i 's/eight/8    /' number-arabic-msans.html
sed -i 's/nine/9   /' number-arabic-msans.html

# 最后的清理工作
rm -f *.tmp


