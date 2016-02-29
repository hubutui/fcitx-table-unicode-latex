#!/bin/sh
# 从 unicode-math-table.tex 生成粗体的小写拉丁字母，也就是 \mathbf 命令的结果
# 输出文件为 latin-lower-mbf.html
#
sed '/mbf[a-z] /!d' unicode-math-table.tex > latin-lower-mbf.html
cut -f 1 -d"}" latin-lower-mbf.html > usv.tmp
cut -f 2 -d'"' usv.tmp > tmpfile
mv tmpfile usv.tmp
sed -i 's/^/\&#x/' usv.tmp
sed -i 's/$/;<br>/' usv.tmp

cut -f3 -d"{" latin-lower-mbf.html > value.tmp
sed -i 's/}//' value.tmp

paste -d" " value.tmp usv.tmp > latin-lower-mbf.html

# 最后的清理工作
rm -f *.tmp

