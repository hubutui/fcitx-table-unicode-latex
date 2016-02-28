#!/bin/sh
# 生成粗斜体的小写希腊字母对应的码表
# 输出文件为 greek-mbfit.html
sed '/mbfit[a-z][a-z]/!d' unicode-math-table.tex > greek-mbfit.html
sed -i '/mbfitsans/d' greek-mbfit.html
sed -i '/mbfitvar[A-Z]/d' greek-mbfit.html
cut -f 1 -d"}" greek-mbfit.html > usv.tmp
cut -f 2 -d'"' usv.tmp > tmpfile
mv tmpfile usv.tmp
sed -i 's/^/\&#x/' usv.tmp
sed -i 's/$/;<br>/' usv.tmp

cut -f3 -d"{" greek-mbfit.html > value.tmp
sed -i 's/}//' value.tmp

paste -d" " value.tmp usv.tmp > greek-mbfit.html

# 最后的清理工作
rm -f *.tmp

