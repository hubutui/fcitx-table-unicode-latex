#!/bin/sh
# 生成粗斜体的小写希腊字母对应的码表
# 输出文件为 greek-lower-mbfit.html
sed '/mbfit[a-z][a-z]/!d' unicode-math-table.tex > greek-lower-mbfit.html
cut -f 1 -d"}" greek-lower-mbfit.html > usv.tmp
cut -f 2 -d'"' usv.tmp > tmpfile
mv tmpfile usv.tmp
sed -i 's/^/\&#x/' usv.tmp
sed -i 's/$/;<br>/' usv.tmp

cut -f3 -d"{" greek-lower-mbfit.html > value.tmp
sed -i 's/}//' value.tmp

paste -d" " value.tmp usv.tmp > greek-lower-mbfit.html

# 删除错误匹配的大写希腊字母
sed -i '/mbfitvar[A-Z]/d' greek-lower-mbfit.html
# 删除错误匹配的 mbfitsans
sed -i '/mbfitsans/d' greek-lower-mbfit.html

# 最后的清理工作
rm -f *.tmp

