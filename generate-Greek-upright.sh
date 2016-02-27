#!/bin/sh
# 由 unicode-math-table.tex 生成直立的大写希腊字母对应的码表
#
sed -e '/mathalpha/!d' -e '/greek/!d' -e '/capital/!d' unicode-math-table.tex > Greek-upright.html
cut -f 1 -d"}" Greek-upright.html > usv.tmp
cut -f 2 -d'"' usv.tmp > tmpfile
mv tmpfile usv.tmp
sed -i 's/^/\&#x/' usv.tmp
sed -i 's/$/;<br>/' usv.tmp

cut -f3 -d"{" Greek-upright.html > value.tmp
sed -i 's/}//' value.tmp
sed -i 's/up//' value.tmp
paste -d" " value.tmp usv.tmp > Greek-upright.html

# 最后的清理工作
rm -f *.tmp
