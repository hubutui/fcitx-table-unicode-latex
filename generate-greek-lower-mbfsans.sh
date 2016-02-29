#!/bin/sh
# 生成粗体的无衬线小写希腊字母
# 输出文件为 greek-lower-mbfsans.html
#
sed -e '/mbfsans[a-z][a-z]/!d' -e '/mathalpha/!d' unicode-math-table.tex > greek-lower-mbfsans.html
cut -f 1 -d"}" greek-lower-mbfsans.html > usv.tmp
cut -f 2 -d'"' usv.tmp > tmpfile
mv tmpfile usv.tmp
sed -i 's/^/\&#x/' usv.tmp
sed -i 's/$/;<br>/' usv.tmp

cut -f3 -d"{" greek-lower-mbfsans.html > value.tmp
sed -i 's/}//' value.tmp

paste -d" " value.tmp usv.tmp > greek-lower-mbfsans.html

# 删除错误匹配的大写希腊字母
sed -i '/mbfsansvar[A-Z]/d' greek-lower-mbfsans.html

# 最后的清理工作
rm -f *.tmp

