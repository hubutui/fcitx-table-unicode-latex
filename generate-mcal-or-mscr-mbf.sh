#!/bin/sh
# 生成粗体的 \mathcal 或者说 \mathscr
# 输出文件为 mcal-mbf.html 和 mscr-mbf.html
# 分别对应 \mbfcal 和 \mbfscr 这样的编码
#
sed '/mbfscr/!d' unicode-math-table.tex > mscr-mbf.html
cut -f 1 -d"}" mscr-mbf.html > usv.tmp
cut -f 2 -d'"' usv.tmp > tmpfile
mv tmpfile usv.tmp
sed -i 's/^/\&#x/' usv.tmp
sed -i 's/$/;<br>/' usv.tmp

cut -f3 -d"{" mscr-mbf.html > value.tmp
sed -i 's/}//' value.tmp

paste -d" " value.tmp usv.tmp > mscr-mbf.html

sed 's/mbfscr/mbfcal/' mscr-mbf.html > mcal-mbf.html

# 最后的清理工作
rm -f *.tmp

