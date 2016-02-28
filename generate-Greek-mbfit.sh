#!/bin/sh
# 生成粗斜体的大写希腊字母对应的码表
# 输出文件为 Greek-mbfit.html
sed '/mbfit[A-Z][a-z]\|mbfitvar[A-Z]/!d' unicode-math-table.tex > Greek-mbfit.html
cut -f 1 -d"}" Greek-mbfit.html > usv.tmp
cut -f 2 -d'"' usv.tmp > tmpfile
mv tmpfile usv.tmp
sed -i 's/^/\&#x/' usv.tmp
sed -i 's/$/;<br>/' usv.tmp

cut -f3 -d"{" Greek-mbfit.html > value.tmp
sed -i 's/}//' value.tmp

paste -d" " value.tmp usv.tmp > Greek-mbfit.html

# 最后的清理工作
rm -f *.tmp

