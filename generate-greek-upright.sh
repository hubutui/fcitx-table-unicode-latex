#!/bin/sh
# 由 unicode-math-table.tex 生成直立的小写希腊字母对应的码表
#
sed -e '/mathalpha/!d' -e '/up[a-z][a-z]/!d' unicode-math-table.tex > greek-upright.html
sed -i  -e '/mbf/d' -e '/mfrak/d' -e '/mit/d' greek-upright.html
sed -i '/var[A-Z]/d' greek-upright.html
sed -i '/Upsilon/d' greek-upright.html
cut -f 1 -d"}" greek-upright.html > usv.tmp
cut -f 2 -d'"' usv.tmp > tmpfile
mv tmpfile usv.tmp
sed -i 's/^/\&#x/' usv.tmp
sed -i 's/$/;<br>/' usv.tmp

cut -f3 -d"{" greek-upright.html > value.tmp
sed -i 's/}//' value.tmp
sed -i 's/up//' value.tmp
paste -d" " value.tmp usv.tmp > greek-upright.html

# 最后的清理工作
rm -f *.tmp
