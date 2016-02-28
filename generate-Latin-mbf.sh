#!/bin/sh
# 从 unicode-math-table.tex 生成粗体的大写拉丁字母，也就是 \mathbf 命令的结果
# 输出文件为 Latin-mbf.html
#
sed '/mbf[A-Z] /!d' unicode-math-table.tex > Latin-mbf.html
cut -f 1 -d"}" Latin-mbf.html > usv.tmp
cut -f 2 -d'"' usv.tmp > tmpfile
mv tmpfile usv.tmp
sed -i 's/^/\&#x/' usv.tmp
sed -i 's/$/;<br>/' usv.tmp

cut -f3 -d"{" Latin-mbf.html > value.tmp
sed -i 's/}//' value.tmp

paste -d" " value.tmp usv.tmp > Latin-mbf.html

# 最后的清理工作
rm -f *.tmp

