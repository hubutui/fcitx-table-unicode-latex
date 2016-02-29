#!/bin/sh
# 生成粗斜体的无衬线小写拉丁字母
# 输出文件为 latin-mbfitsans.html
#
sed -e '/mbfitsans[a-z][ \t]/!d' -e '/mathalpha/!d' unicode-math-table.tex > latin-mbfitsans.html
cut -f 1 -d"}" latin-mbfitsans.html > usv.tmp
cut -f 2 -d'"' usv.tmp > tmpfile
mv tmpfile usv.tmp
sed -i 's/^/\&#x/' usv.tmp
sed -i 's/$/;<br>/' usv.tmp

cut -f3 -d"{" latin-mbfitsans.html > value.tmp
sed -i 's/}//' value.tmp

paste -d" " value.tmp usv.tmp > latin-mbfitsans.html

# 最后的清理工作
rm -f *.tmp


