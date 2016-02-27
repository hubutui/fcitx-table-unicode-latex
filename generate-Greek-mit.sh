#!/bin/sh
# 由 unicode-math-table.tex 生成斜体的大写希腊字母对应的码表
#
sed -e '/mathalpha/!d' -e '/italic/!d' -e '/capital/!d' -e '/mit/!d' unicode-math-table.tex > Greek-mit.html
sed -i '/mit[A-Z] /d' Greek-mit.html
sed -i '/mbf/d' Greek-mit.html
sed -i '/mitsans/d' Greek-mit.html
cut -f 1 -d"}" Greek-mit.html > usv.tmp
cut -f 2 -d'"' usv.tmp > tmpfile
mv tmpfile usv.tmp
sed -i 's/^/\&#x/' usv.tmp
sed -i 's/$/;<br>/' usv.tmp

cut -f3 -d"{" Greek-mit.html > value.tmp
sed -i 's/}//' value.tmp

paste -d" " value.tmp usv.tmp > Greek-mit.html

# 最后的清理工作
rm -f *.tmp

