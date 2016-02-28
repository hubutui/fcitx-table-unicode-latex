#!/bin/sh
# 生成粗斜体的大写拉丁字母
# 输出文件为 Latin-mbfit.html
#
sed '/mbfit[A-Z][ \t]/!d' unicode-math-table.tex > Latin-mbfit.html
cut -f 1 -d"}" Latin-mbfit.html > usv.tmp
cut -f 2 -d'"' usv.tmp > tmpfile
mv tmpfile usv.tmp
sed -i 's/^/\&#x/' usv.tmp
sed -i 's/$/;<br>/' usv.tmp

cut -f3 -d"{" Latin-mbfit.html > value.tmp
sed -i 's/}//' value.tmp

paste -d" " value.tmp usv.tmp > Latin-mbfit.html
 
# 最后的清理工作
rm -f *.tmp

