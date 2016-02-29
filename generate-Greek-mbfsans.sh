#!/bin/sh
# 生成粗体的无衬线大写希腊字母
# 输出文件为 Greek-mbfsans.html
#
sed -e '/mbfsans[A-Z][a-z]\|mbfsansvar[A-Z][a-z]/!d' -e '/mathalpha/!d' unicode-math-table.tex > Greek-mbfsans.html
cut -f 1 -d"}" Greek-mbfsans.html > usv.tmp
cut -f 2 -d'"' usv.tmp > tmpfile
mv tmpfile usv.tmp
sed -i 's/^/\&#x/' usv.tmp
sed -i 's/$/;<br>/' usv.tmp

cut -f3 -d"{" Greek-mbfsans.html > value.tmp
sed -i 's/}//' value.tmp

paste -d" " value.tmp usv.tmp > Greek-mbfsans.html

# 最后的清理工作
rm -f *.tmp

