#!/bin/sh
# 由 unicode-math-table.tex 生成 \mathcal 命令对应的直立的字母的码表
# 一般来说 \mathscr 和 \mathcal 的结果是一样的，这里干脆给两份，\mscr 和 \mcal
# 分别对应输出文件 mscr-upright.html 和 mcal-upright.html，可以根据需要来选择
#
sed '/mscr/!d' unicode-math-table.tex > mscr-upright.html
cut -f 1 -d"}" mscr-upright.html > usv.tmp
cut -f 2 -d'"' usv.tmp > tmpfile
mv tmpfile usv.tmp
sed -i 's/^/\&#x/' usv.tmp
sed -i 's/$/;<br>/' usv.tmp

cut -f3 -d"{" mscr-upright.html > value.tmp
sed -i 's/}//' value.tmp

paste -d" " value.tmp usv.tmp > mscr-upright.html
sed 's/mscr/mcal/' mscr-upright.html > mcal-upright.html

# 最后的清理工作
rm -f *.tmp

