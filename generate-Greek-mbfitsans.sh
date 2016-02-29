#!/bin/sh
# 生成粗斜体的无衬线大写希腊字母
# 输出文件为 Greek-mbfitsans.html
#
sed -e '/mbfitsans[A-Z][a-z]\|mbfitsansvar[A-Z][a-z]/!d' -e '/mathalpha/!d' unicode-math-table.tex > Greek-mbfitsans.html
cut -f 1 -d"}" Greek-mbfitsans.html > usv.tmp
cut -f 2 -d'"' usv.tmp > tmpfile
mv tmpfile usv.tmp
sed -i 's/^/\&#x/' usv.tmp
sed -i 's/$/;<br>/' usv.tmp

cut -f3 -d"{" Greek-mbfitsans.html > value.tmp
sed -i 's/}//' value.tmp

paste -d" " value.tmp usv.tmp > Greek-mbfitsans.html

# 最后的清理工作
rm -f *.tmp


