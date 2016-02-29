#!/bin/sh
# 生成粗体的 \mathfrak 字母对应的码表
# 输出文件为 mfrak-mbf.html
#
sed '/mbffrak/!d' unicode-math-table.tex > mfrak-mbf.html
cut -f 1 -d"}" mfrak-mbf.html > usv.tmp
cut -f 2 -d'"' usv.tmp > tmpfile
mv tmpfile usv.tmp
sed -i 's/^/\&#x/' usv.tmp
sed -i 's/$/;<br>/' usv.tmp

cut -f3 -d"{" mfrak-mbf.html > value.tmp
sed -i 's/}//' value.tmp

paste -d" " value.tmp usv.tmp > mfrak-mbf.html

# 最后的清理工作
rm -f *.tmp

