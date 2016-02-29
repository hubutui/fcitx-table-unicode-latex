#!/bin/sh
# 从 unicode-math-table.tex 生成粗体的大写希腊字母对应的码表
# 输出文件为 greek-upper-mbf.html
#
sed -e '/mathalpha/!d' -e '/mbf[A-Z][a-z]\|mbfvar[A-Z]/!d' unicode-math-table.tex > greek-upper-mbf.html
cut -f 1 -d"}" greek-upper-mbf.html > usv.tmp
cut -f 2 -d'"' usv.tmp > tmpfile
mv tmpfile usv.tmp
sed -i 's/^/\&#x/' usv.tmp
sed -i 's/$/;<br>/' usv.tmp

cut -f3 -d"{" greek-upper-mbf.html > value.tmp
sed -i 's/}//' value.tmp

paste -d" " value.tmp usv.tmp > greek-upper-mbf.html

# 最后的清理工作
rm -f *.tmp

