#!/bin/sh
# 生成一些所谓 big operators，比如求和符号等等
# 输出文件为 mathop.html
#
sed '/mathop\}/!d' unicode-math-table.tex > mathop.html
cut -f 1 -d"}" mathop.html > usv.tmp
cut -f 2 -d'"' usv.tmp > tmpfile
mv tmpfile usv.tmp
sed -i 's/^/\&#x/' usv.tmp
sed -i 's/$/;<br>/' usv.tmp

cut -f3 -d"{" mathop.html > value.tmp
sed -i 's/}//' value.tmp

paste -d" " value.tmp usv.tmp > mathop.html

# 最后的清理工作
rm -f *.tmp

