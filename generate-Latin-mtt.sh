#!/bin/sh
# 从 unicode-math-table.tex 生成等宽的大写拉丁字母，也就是 \mathtt 命令的结果
# 输出文件为 Latin-mtt.html
#
sed '/mtt[A-Z] /!d' unicode-math-table.tex > Latin-mtt.html
cut -f 1 -d"}" Latin-mtt.html > usv.tmp
cut -f 2 -d'"' usv.tmp > tmpfile
mv tmpfile usv.tmp
sed -i 's/^/\&#x/' usv.tmp
sed -i 's/$/;<br>/' usv.tmp

cut -f3 -d"{" Latin-mtt.html > value.tmp
sed -i 's/}//' value.tmp

paste -d" " value.tmp usv.tmp > Latin-mtt.html

# 最后的清理工作
rm -f *.tmp


