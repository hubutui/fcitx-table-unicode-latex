#!/bin/sh
# 生成粗体的无衬线的数字对应的码表
# 输出文件为 number-eng-mbfsans.html 和 number-arabic-mbfsans.html
# 前者使用 \mbfsansone 这样的编码，后者使用 \mbfsans1 这样的编码
#
sed -e '/mbfsans/!d' -e '/digit/!d' unicode-math-table.tex > number-mbfsans.html
cut -f 1 -d"}" number-mbfsans.html > usv.tmp
cut -f 2 -d'"' usv.tmp > tmpfile
mv tmpfile usv.tmp
sed -i 's/^/\&#x/' usv.tmp
sed -i 's/$/;<br>/' usv.tmp

cut -f3 -d"{" number-mbfsans.html > value.tmp
sed -i 's/}//' value.tmp

paste -d" " value.tmp usv.tmp > number-mbfsans.html
sed -i 's/Bbb/mbfsans/' number-mbfsans.html

mv number-mbfsans.html number-eng-mbfsans.html
cp number-eng-mbfsans.html number-arabic-mbfsans.html
sed -i 's/zero/0   /' number-arabic-mbfsans.html
sed -i 's/one/1  /' number-arabic-mbfsans.html
sed -i 's/two/2  /' number-arabic-mbfsans.html
sed -i 's/three/3    /' number-arabic-mbfsans.html
sed -i 's/four/4   /' number-arabic-mbfsans.html
sed -i 's/five/5   /' number-arabic-mbfsans.html
sed -i 's/six/6  /' number-arabic-mbfsans.html
sed -i 's/seven/7    /' number-arabic-mbfsans.html
sed -i 's/eight/8    /' number-arabic-mbfsans.html
sed -i 's/nine/9   /' number-arabic-mbfsans.html

# 最后的清理工作
rm -f *.tmp


