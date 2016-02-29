#!/bin/sh
# 由 unicode-math-table.tex 生成斜体的大写希腊字母对应的码表
# 输出文件为 greek-upper-mit.html
#
sed -e '/mathalpha/!d' -e '/mit[A-Z][a-z]\|mitvar[A-Z]/!d' unicode-math-table.tex > greek-upper-mit.html
cut -f 1 -d"}" greek-upper-mit.html > usv.tmp
cut -f 2 -d'"' usv.tmp > tmpfile
mv tmpfile usv.tmp
sed -i 's/^/\&#x/' usv.tmp
sed -i 's/$/;<br>/' usv.tmp

cut -f3 -d"{" greek-upper-mit.html > value.tmp
sed -i 's/}//' value.tmp

paste -d" " value.tmp usv.tmp > greek-upper-mit.html

# 最后的清理工作
rm -f *.tmp

