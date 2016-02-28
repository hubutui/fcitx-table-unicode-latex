#!/bin/sh
# 生成等宽的数字对应码表
# 输出为 number-eng-mtt.html 和 number-arabic-mtt.html
# 区别在于前者用 \mttone 后者用 \mtt1
#
sed -e '/mtt/!d' -e '/digit/!d' unicode-math-table.tex > number-mtt.html
cut -f 1 -d"}" number-mtt.html > usv.tmp
cut -f 2 -d'"' usv.tmp > tmpfile
mv tmpfile usv.tmp
sed -i 's/^/\&#x/' usv.tmp
sed -i 's/$/;<br>/' usv.tmp

cut -f3 -d"{" number-mtt.html > value.tmp
sed -i 's/}//' value.tmp

paste -d" " value.tmp usv.tmp > number-mtt.html
sed -i 's/Bbb/mtt/' number-mtt.html

mv number-mtt.html number-eng-mtt.html
cp number-eng-mtt.html number-arabic-mtt.html
sed -i 's/zero/0   /' number-arabic-mtt.html
sed -i 's/one/1  /' number-arabic-mtt.html
sed -i 's/two/2  /' number-arabic-mtt.html
sed -i 's/three/3    /' number-arabic-mtt.html
sed -i 's/four/4   /' number-arabic-mtt.html
sed -i 's/five/5   /' number-arabic-mtt.html
sed -i 's/six/6  /' number-arabic-mtt.html
sed -i 's/seven/7    /' number-arabic-mtt.html
sed -i 's/eight/8    /' number-arabic-mtt.html
sed -i 's/nine/9   /' number-arabic-mtt.html

# 最后的清理工作
rm -f *.tmp


