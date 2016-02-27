#!/bin/sh
# 由 unicode-math-table.tex 生成斜体的小写希腊字母对应的码表
#
sed -e '/mathalpha/!d' -e '/italic/!d' -e '/small/!d' -e '/mit/!d' unicode-math-table.tex > greek-mit.html
sed -i '/mit[a-z] /d' greek-mit.html
sed -i '/mbf/d' greek-mit.html
sed -i '/mitsans/d' greek-mit.html
cut -f 1 -d"}" greek-mit.html > usv.tmp
cut -f 2 -d'"' usv.tmp > tmpfile
mv tmpfile usv.tmp
sed -i 's/^/\&#x/' usv.tmp
sed -i 's/$/;<br>/' usv.tmp

cut -f3 -d"{" greek-mit.html > value.tmp
sed -i 's/}//' value.tmp

paste -d" " value.tmp usv.tmp > greek-mit.html

# 最后的清理工作
rm -f *.tmp

