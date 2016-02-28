#!/bin/sh
# 生成粗体的阿拉伯数字对应的码表
# 输出文件为 number-eng-mbf.html 和 number-arabic-mbf.html
# 如文件名所示，一个使用 \mbfone 一个使用 \mbf1 这样的命令
#
sed -e '/mbf/!d' -e '/digit/!d' unicode-math-table.tex > number-mbf.html
sed -i '/mbfsans/d' number-mbf.html
cut -f 1 -d"}" number-mbf.html > usv.tmp
cut -f 2 -d'"' usv.tmp > tmpfile
mv tmpfile usv.tmp
sed -i 's/^/\&#x/' usv.tmp
sed -i 's/$/;<br>/' usv.tmp

cut -f3 -d"{" number-mbf.html > value.tmp
sed -i 's/}//' value.tmp

paste -d" " value.tmp usv.tmp > number-mbf.html

mv number-mbf.html number-eng-mbf.html
cp number-eng-mbf.html number-arabic-mbf.html
sed -i 's/zero/0   /' number-arabic-mbf.html
sed -i 's/one/1  /' number-arabic-mbf.html
sed -i 's/two/2  /' number-arabic-mbf.html
sed -i 's/three/3    /' number-arabic-mbf.html
sed -i 's/four/4   /' number-arabic-mbf.html
sed -i 's/five/5   /' number-arabic-mbf.html
sed -i 's/six/6  /' number-arabic-mbf.html
sed -i 's/seven/7    /' number-arabic-mbf.html
sed -i 's/eight/8    /' number-arabic-mbf.html
sed -i 's/nine/9   /' number-arabic-mbf.html

# 最后的清理工作
rm -f *.tmp

