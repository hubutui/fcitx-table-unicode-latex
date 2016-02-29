#!/bin/sh
# 生成直立的无衬线小写拉丁字母
# 输出文件为 latin-lower-msans-upright.html
#
sed -e '/msans[a-z][ \t]/!d' -e '/mathalpha/!d' unicode-math-table.tex > latin-lower-msans-upright.html
cut -f 1 -d"}" latin-lower-msans-upright.html > usv.tmp
cut -f 2 -d'"' usv.tmp > tmpfile
mv tmpfile usv.tmp
sed -i 's/^/\&#x/' usv.tmp
sed -i 's/$/;<br>/' usv.tmp

cut -f3 -d"{" latin-lower-msans-upright.html > value.tmp
sed -i 's/}//' value.tmp

paste -d" " value.tmp usv.tmp > latin-lower-msans-upright.html

# 最后的清理工作
rm -f *.tmp


