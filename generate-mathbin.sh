#!/bin/sh
# 生成二元运算符对应的码表
# 输出文件为 mathbin.html
#
sed '/mathbin/!d' unicode-math-table.tex > mathbin.html
cut -f 1 -d"}" mathbin.html > usv.tmp
cut -f 2 -d'"' usv.tmp > tmpfile
mv tmpfile usv.tmp
sed -i 's/^/\&#x/' usv.tmp
sed -i 's/$/;<br>/' usv.tmp

cut -f3 -d"{" mathbin.html > value.tmp
sed -i 's/}//' value.tmp

paste -d" " value.tmp usv.tmp > mathbin.html

# 最后的清理工作
rm -f *.tmp

