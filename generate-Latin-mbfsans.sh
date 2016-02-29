#!/bin/sh
# 生成粗体的无衬线大写拉丁字母
# 输出文件为 Latin-mbfsans.html
#
sed -e '/mbfsans[a-z][ \t]/!d' -e '/mathalpha/!d' unicode-math-table.tex > Latin-mbfsans.html
cut -f 1 -d"}" Latin-mbfsans.html > usv.tmp
cut -f 2 -d'"' usv.tmp > tmpfile
mv tmpfile usv.tmp
sed -i 's/^/\&#x/' usv.tmp
sed -i 's/$/;<br>/' usv.tmp

cut -f3 -d"{" Latin-mbfsans.html > value.tmp
sed -i 's/}//' value.tmp

paste -d" " value.tmp usv.tmp > Latin-mbfsans.html

# 最后的清理工作
rm -f *.tmp


