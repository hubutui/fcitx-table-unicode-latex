#!/bin/sh
# 生成关系符号对应的码表
# 输出文件为 mathrel.html
#
sed '/mathrel/!d' unicode-math-table.tex > mathrel.html
cut -f 1 -d"}" mathrel.html > usv.tmp
cut -f 2 -d'"' usv.tmp > tmpfile
mv tmpfile usv.tmp
sed -i 's/^/\&#x/' usv.tmp
sed -i 's/$/;<br>/' usv.tmp

cut -f3 -d"{" mathrel.html > value.tmp
sed -i 's/}//' value.tmp

paste -d" " value.tmp usv.tmp > mathrel.html

# 最后的清理工作
rm -f *.tmp

