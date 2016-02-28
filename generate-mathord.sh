#!/bin/sh
# 生成常用数学符号对应的码表，这里包含了大量的数学符号
# 输出文件为 mathord.html
#
sed '/mathord/!d' unicode-math-table.tex > mathord.html
# 删掉与其他脚本生成结果重复的内容
sed -i '/digit/d' mathord.html
cut -f 1 -d"}" mathord.html > usv.tmp
cut -f 2 -d'"' usv.tmp > tmpfile
mv tmpfile usv.tmp
sed -i 's/^/\&#x/' usv.tmp
sed -i 's/$/;<br>/' usv.tmp

cut -f3 -d"{" mathord.html > value.tmp
sed -i 's/}//' value.tmp

paste -d" " value.tmp usv.tmp > mathord.html

# 最后的清理工作
rm -f *.tmp

