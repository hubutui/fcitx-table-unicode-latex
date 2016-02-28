#!/bin/sh
# 生成竖线定界符对应的码表，其实只有三个符号，单竖线，双竖线以及三竖线的
# 而且单竖线其实可以直接用键盘输入吧，不过也许非美式键盘可能没有呢？
# 为了省事，我就保留了．
# 输出文件为 mathfence.html
#
sed '/mathfence/!d' unicode-math-table.tex > mathfence.html
cut -f 1 -d"}" mathfence.html > usv.tmp
cut -f 2 -d'"' usv.tmp > tmpfile
mv tmpfile usv.tmp
sed -i 's/^/\&#x/' usv.tmp
sed -i 's/$/;<br>/' usv.tmp

cut -f3 -d"{" mathfence.html > value.tmp
sed -i 's/}//' value.tmp

paste -d" " value.tmp usv.tmp > mathfence.html

# 最后的清理工作
rm -f *.tmp

