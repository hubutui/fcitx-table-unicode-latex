#!/bin/sh
# 由 unicode-math-table.tex 生成斜体的小写希腊字母对应的码表
#
sed -e '/mit[a-z][a-z]/!d' -e '/mathalpha/!d' unicode-math-table.tex > greek-lower-mit.html
cut -f 1 -d"}" greek-lower-mit.html > usv.tmp
cut -f 2 -d'"' usv.tmp > tmpfile
mv tmpfile usv.tmp
sed -i 's/^/\&#x/' usv.tmp
sed -i 's/$/;<br>/' usv.tmp

cut -f3 -d"{" greek-lower-mit.html > value.tmp
sed -i 's/}//' value.tmp

paste -d" " value.tmp usv.tmp > greek-lower-mit.html

# 删除错误匹配的内容
sed -i '/mitsans\|mitvar[A-Z]/d' greek-lower-mit.html

# 最后的清理工作
rm -f *.tmp

