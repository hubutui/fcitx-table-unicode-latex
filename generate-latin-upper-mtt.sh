#!/bin/sh
# 从 unicode-math-table.tex 生成等宽的大写拉丁字母，也就是 \mathtt 命令的结果
# 输出文件为 latin-upper-mtt.html
#
sed '/mtt[A-Z] /!d' unicode-math-table.tex > latin-upper-mtt.html
cut -f 1 -d"}" latin-upper-mtt.html > usv.tmp
cut -f 2 -d'"' usv.tmp > tmpfile
mv tmpfile usv.tmp
sed -i 's/^/\&#x/' usv.tmp
sed -i 's/$/;<br>/' usv.tmp

cut -f3 -d"{" latin-upper-mtt.html > value.tmp
sed -i 's/}//' value.tmp

paste -d" " value.tmp usv.tmp > latin-upper-mtt.html

# 最后的清理工作
rm -f *.tmp


