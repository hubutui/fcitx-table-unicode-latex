#!/bin/sh
# 生成粗体的无衬线大写希腊字母
# 输出文件为 greek-upper-mbfsans.html
#
sed -e '/mbfsans[A-Z][a-z]\|mbfsansvar[A-Z][a-z]/!d' -e '/mathalpha/!d' unicode-math-table.tex > greek-upper-mbfsans.html
cut -f 1 -d"}" greek-upper-mbfsans.html > usv.tmp
cut -f 2 -d'"' usv.tmp > tmpfile
mv tmpfile usv.tmp
sed -i 's/^/\&#x/' usv.tmp
sed -i 's/$/;<br>/' usv.tmp

cut -f3 -d"{" greek-upper-mbfsans.html > value.tmp
sed -i 's/}//' value.tmp

paste -d" " value.tmp usv.tmp > greek-upper-mbfsans.html

# 最后的清理工作
rm -f *.tmp

