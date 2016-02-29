#!/bin/sh
# 生成粗体的无衬线小写拉丁字母
# 输出文件为 latin-mbfsans.html
#
sed -e '/mbfsans[a-z][ \t]/!d' -e '/mathalpha/!d' unicode-math-table.tex > latin-mbfsans.html
cut -f 1 -d"}" latin-mbfsans.html > usv.tmp
cut -f 2 -d'"' usv.tmp > tmpfile
mv tmpfile usv.tmp
sed -i 's/^/\&#x/' usv.tmp
sed -i 's/$/;<br>/' usv.tmp

cut -f3 -d"{" latin-mbfsans.html > value.tmp
sed -i 's/}//' value.tmp

paste -d" " value.tmp usv.tmp > latin-mbfsans.html

# 最后的清理工作
rm -f *.tmp


