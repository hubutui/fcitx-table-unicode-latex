#!/bin/sh
# 由 unicode-math-table.tex 生成 \mathcal 命令对应的字母的码表
# 一般来说 \mathscr 和 \mathcal 的结果是一样的，这里干脆给两份，\mscr 和 \mcal
# 分别对应输出文件 mscr.html 和 mcal.html，可以根据需要来选择
#
sed '/mscr/!d' unicode-math-table.tex > mscr.html
cut -f 1 -d"}" mscr.html > usv.tmp
cut -f 2 -d'"' usv.tmp > tmpfile
mv tmpfile usv.tmp
sed -i 's/^/\&#x/' usv.tmp
sed -i 's/$/;<br>/' usv.tmp

cut -f3 -d"{" mscr.html > value.tmp
sed -i 's/}//' value.tmp

paste -d" " value.tmp usv.tmp > mscr.html
sed 's/mscr/mcal/' mscr.html > mcal.html

# 最后的清理工作
rm -f *.tmp

