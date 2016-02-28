#!/bin/sh
# 生成粗斜体的小写拉丁字母
# 输出文件为 latin-mbfit.html
#
sed '/mbfit[a-z][ \t]/!d' unicode-math-table.tex > latin-mbfit.html
cut -f 1 -d"}" latin-mbfit.html > usv.tmp
cut -f 2 -d'"' usv.tmp > tmpfile
mv tmpfile usv.tmp
sed -i 's/^/\&#x/' usv.tmp
sed -i 's/$/;<br>/' usv.tmp

cut -f3 -d"{" latin-mbfit.html > value.tmp
sed -i 's/}//' value.tmp

paste -d" " value.tmp usv.tmp > latin-mbfit.html
 
# 最后的清理工作
rm -f *.tmp

