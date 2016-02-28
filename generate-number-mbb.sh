#!/bin/sh
# 生成黑板粗体的数字对应的码表
# 输出文件为 number-eng-mbb.html 和 number-arabic-mbb.html
# 区别在于前者使用 \mbbone 这样的编码，而后者使用 \math1 这样的编码
#
sed -e '/[\]Bbb/!d' -e '/digit/!d' unicode-math-table.tex > number-mbb.html
cut -f 1 -d"}" number-mbb.html > usv.tmp
cut -f 2 -d'"' usv.tmp > tmpfile
mv tmpfile usv.tmp
sed -i 's/^/\&#x/' usv.tmp
sed -i 's/$/;<br>/' usv.tmp

cut -f3 -d"{" number-mbb.html > value.tmp
sed -i 's/}//' value.tmp

paste -d" " value.tmp usv.tmp > number-mbb.html
sed -i 's/Bbb/mbb/' number-mbb.html

mv number-mbb.html number-eng-mbb.html
cp number-eng-mbb.html number-arabic-mbb.html
sed -i 's/zero/0/' number-arabic-mbb.html
sed -i 's/one/1/' number-arabic-mbb.html
sed -i 's/two/2/' number-arabic-mbb.html
sed -i 's/three/3/' number-arabic-mbb.html
sed -i 's/four/4/' number-arabic-mbb.html
sed -i 's/five/5/' number-arabic-mbb.html
sed -i 's/six/6/' number-arabic-mbb.html
sed -i 's/seven/7/' number-arabic-mbb.html
sed -i 's/eight/8/' number-arabic-mbb.html
sed -i 's/nine/9/' number-arabic-mbb.html

# 最后的清理工作
rm -f *.tmp

