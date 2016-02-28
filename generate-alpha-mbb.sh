#!/bin/sh
# 从 unicode-math-table.tex 生成 \mathbb 命令输出的黑板粗体字母对应的码表，
# 输出文件为 alpha-mbb.html
#
sed -e '/[\]Bbb/!d' -e '/mathalpha/!d' unicode-math-table.tex > alpha-mbb.html
sed -i '/digit/d' alpha-mbb.html
cut -f 1 -d"}" alpha-mbb.html > usv.tmp
cut -f 2 -d'"' usv.tmp > tmpfile
mv tmpfile usv.tmp
sed -i 's/^/\&#x/' usv.tmp
sed -i 's/$/;<br>/' usv.tmp

cut -f3 -d"{" alpha-mbb.html > value.tmp
sed -i 's/}//' value.tmp

paste -d" " value.tmp usv.tmp > alpha-mbb.html
sed -i 's/Bbb/mbb/' alpha-mbb.html

# 最后的清理工作
rm -f *.tmp

