#!/bin/sh
# 生成一些成对使用的符号的左半边，比如左括号之类的符号对应的码表
# 显然，有一些符号也是可以直接从键盘输入的，但是为了省事，我就不一一将其剔除了
# 输出文件为 mathopen.html
sed '/mathopen/!d' unicode-math-table.tex > mathopen.html
cut -f 1 -d"}" mathopen.html > usv.tmp
cut -f 2 -d'"' usv.tmp > tmpfile
mv tmpfile usv.tmp
sed -i 's/^/\&#x/' usv.tmp
sed -i 's/$/;<br>/' usv.tmp

cut -f3 -d"{" mathopen.html > value.tmp
sed -i 's/}//' value.tmp

paste -d" " value.tmp usv.tmp > mathopen.html

# 最后的清理工作
rm -f *.tmp

