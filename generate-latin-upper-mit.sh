#!/bin/sh
# 由 unicode-math-table.tex 生成斜体小写拉丁字母对应的码表
# 输出文件为 latin-lower-mit.html
# 结果只有 25 个字母，少了 h，我也不知道为什么．
#
sed -n '/mit[a-z][ \t]/p' unicode-math-table.tex > latin-lower-mit.html
cut -f 1 -d"}" latin-lower-mit.html > usv.tmp
cut -f 2 -d'"' usv.tmp > tmpfile
mv tmpfile usv.tmp
sed -i 's/^/\&#x/' usv.tmp
sed -i 's/$/;<br>/' usv.tmp

cut -f3 -d"{" latin-lower-mit.html > value.tmp
sed -i 's/}//' value.tmp

paste -d" " value.tmp usv.tmp > latin-lower-mit.html

# 最后的清理工作
rm -f *.tmp
