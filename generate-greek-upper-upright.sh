#!/bin/sh
# 由 unicode-math-table.tex 生成直立的大写希腊字母对应的码表
# 输出文件为 greek-upper-upright.html
#
sed -e '/mathalpha/!d' -e '/[\]mup[A-Z][a-z]\|[\]mupvar[A-Z]/!d' unicode-math-table.tex > greek-upper-upright.html
cut -f 1 -d"}" greek-upper-upright.html > usv.tmp
cut -f 2 -d'"' usv.tmp > tmpfile
mv tmpfile usv.tmp
sed -i 's/^/\&#x/' usv.tmp
sed -i 's/$/;<br>/' usv.tmp

cut -f3 -d"{" greek-upper-upright.html > value.tmp
sed -i 's/}//' value.tmp
sed -i 's/mup//' value.tmp
paste -d" " value.tmp usv.tmp > greek-upper-upright.html

# 最后的清理工作
rm -f *.tmp
