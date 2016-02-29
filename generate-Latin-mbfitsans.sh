#!/bin/sh
# 生成粗斜体的无衬线大写拉丁字母
# 输出文件为 Latin-mbfitsans.html
#
sed -e '/mbfitsans[A-Z][ \t]/!d' -e '/mathalpha/!d' unicode-math-table.tex > Latin-mbfitsans.html
cut -f 1 -d"}" Latin-mbfitsans.html > usv.tmp
cut -f 2 -d'"' usv.tmp > tmpfile
mv tmpfile usv.tmp
sed -i 's/^/\&#x/' usv.tmp
sed -i 's/$/;<br>/' usv.tmp

cut -f3 -d"{" Latin-mbfitsans.html > value.tmp
sed -i 's/}//' value.tmp

paste -d" " value.tmp usv.tmp > Latin-mbfitsans.html

# 最后的清理工作
rm -f *.tmp


