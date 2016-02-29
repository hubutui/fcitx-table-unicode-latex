#!/bin/sh
# 生成粗斜体的无衬线小写希腊字母
# 输出文件为 greek-lower-mbfitsans.html
#
sed -e '/mbfitsans[a-z][a-z]/!d' -e '/mathalpha/!d' unicode-math-table.tex > greek-lower-mbfitsans.html
cut -f 1 -d"}" greek-lower-mbfitsans.html > usv.tmp
cut -f 2 -d'"' usv.tmp > tmpfile
mv tmpfile usv.tmp
sed -i 's/^/\&#x/' usv.tmp
sed -i 's/$/;<br>/' usv.tmp

cut -f3 -d"{" greek-lower-mbfitsans.html > value.tmp
sed -i 's/}//' value.tmp

paste -d" " value.tmp usv.tmp > greek-lower-mbfitsans.html

# 删除错误匹配到的大写希腊字母
sed -i '/mbfitsansvar[A-Z]/d' greek-lower-mbfitsans.html

# 最后的清理工作
rm -f *.tmp


