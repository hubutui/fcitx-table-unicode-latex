#!/bin/sh
# 由 unicode-math-table.tex 生成斜体大写拉丁字母对应的码表
#
sed -n '/mit[A-Z] /p' unicode-math-table.tex > Latin-mit.html
cut -f 1 -d"}" Latin-mit.html > usv.tmp
cut -f 2 -d'"' usv.tmp > tmpfile
mv tmpfile usv.tmp
sed -i 's/^/\&#x/' usv.tmp
sed -i 's/$/;<br>/' usv.tmp

cut -f3 -d"{" Latin-mit.html > value.tmp
sed -i 's/}//' value.tmp

paste -d" " value.tmp usv.tmp > Latin-mit.html

# 最后的清理工作
rm -f *.tmp
