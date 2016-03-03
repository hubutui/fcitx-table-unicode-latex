#!/bin/sh
# 由 unicode-math-table.tex 生成直立的小写希腊字母对应的码表
# 输出文件为 greek-lower-upright.html
#
sed -e '/mathalpha/!d' -e '/[\]up[a-z][a-z]/!d' unicode-math-table.tex > greek-lower-upright.html
cut -f 1 -d"}" greek-lower-upright.html > usv.tmp
cut -f 2 -d'"' usv.tmp > tmpfile
mv tmpfile usv.tmp
sed -i 's/^/\&#x/' usv.tmp
sed -i 's/$/;<br>/' usv.tmp

cut -f3 -d"{" greek-lower-upright.html > value.tmp
sed -i 's/}//' value.tmp
sed -i 's/up//' value.tmp
paste -d" " value.tmp usv.tmp > greek-lower-upright.html

# 删除错误匹配的大写字母
sed -i '/var[A-Z][a-z]/d' greek-lower-upright.html

# 最后的清理工作
rm -f *.tmp
