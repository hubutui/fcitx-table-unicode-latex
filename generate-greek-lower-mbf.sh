#!/bin/sh
# 从 unicode-math-table.tex 生成粗体的小写希腊字母对应的码表
# 输出文件为 greek-lower-mbf.html
#
sed -e '/mathalpha/!d' -e '/mbf[a-z][a-z]/!d' unicode-math-table.tex > greek-lower-mbf.html
cut -f 1 -d"}" greek-lower-mbf.html > usv.tmp
cut -f 2 -d'"' usv.tmp > tmpfile
mv tmpfile usv.tmp
sed -i 's/^/\&#x/' usv.tmp
sed -i 's/$/;<br>/' usv.tmp

cut -f3 -d"{" greek-lower-mbf.html > value.tmp
sed -i 's/}//' value.tmp

paste -d" " value.tmp usv.tmp > greek-lower-mbf.html

# 删错错误匹配的其他内容
sed -i '/mbfit\|mbffrak\|mbfscr\|mbfsans\|mbfvar[A-Z]/d' greek-lower-mbf.html

# 最后的清理工作
rm -f *.tmp

