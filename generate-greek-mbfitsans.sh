#!/bin/sh
# 生成粗斜体的无衬线小写希腊字母
# 输出文件为 greek-mbfitsans.html
#
sed -e '/mbfitsans[a-z][a-z]/!d' -e '/mathalpha/!d' unicode-math-table.tex > greek-mbfitsans.html
cut -f 1 -d"}" greek-mbfitsans.html > usv.tmp
cut -f 2 -d'"' usv.tmp > tmpfile
mv tmpfile usv.tmp
sed -i 's/^/\&#x/' usv.tmp
sed -i 's/$/;<br>/' usv.tmp

cut -f3 -d"{" greek-mbfitsans.html > value.tmp
sed -i 's/}//' value.tmp

paste -d" " value.tmp usv.tmp > greek-mbfitsans.html

# 删除重复的内容
sed -i '/mbfitsansvar[A-Z]/d' greek-mbfitsans.html

# 最后的清理工作
rm -f *.tmp


