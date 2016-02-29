#!/bin/sh
# 生成粗斜体的无衬线大写拉丁字母
# 输出文件为 latin-upper-mbfitsans.html
#
sed -e '/mbfitsans[A-Z][ \t]/!d' -e '/mathalpha/!d' unicode-math-table.tex > latin-upper-mbfitsans.html
cut -f 1 -d"}" latin-upper-mbfitsans.html > usv.tmp
cut -f 2 -d'"' usv.tmp > tmpfile
mv tmpfile usv.tmp
sed -i 's/^/\&#x/' usv.tmp
sed -i 's/$/;<br>/' usv.tmp

cut -f3 -d"{" latin-upper-mbfitsans.html > value.tmp
sed -i 's/}//' value.tmp

paste -d" " value.tmp usv.tmp > latin-upper-mbfitsans.html

# 最后的清理工作
rm -f *.tmp


