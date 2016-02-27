#!/bin/sh
# 由 unicode-math-table.tex 生成 \mathfrak 命令对应的字母的码表
# 此处的输出结果是直立的字母，后边还有斜体，粗体，粗斜体
# 可根据需要添加．输出文件为 mfrak-upright.html
#
sed '/mfrak/!d' unicode-math-table.tex > mfrak-upright.html
cut -f 1 -d"}" mfrak-upright.html > usv.tmp
cut -f 2 -d'"' usv.tmp > tmpfile
mv tmpfile usv.tmp
sed -i 's/^/\&#x/' usv.tmp
sed -i 's/$/;<br>/' usv.tmp

cut -f3 -d"{" mfrak-upright.html > value.tmp
sed -i 's/}//' value.tmp

paste -d" " value.tmp usv.tmp > mfrak-upright.html

# 最后的清理工作
rm -f *.tmp

