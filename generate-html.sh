#!/bin/sh
# 删掉注释行，即 % 开始的行
sed '/^%/d' unicode-math-table.tex > tmpfile
# 删除空行
sed -i '/^$/d' tmpfile
# 取出 Unicode
cut -f 1 -d"}" tmpfile > tmpfile.usv
cut -f 2 -d'"' tmpfile.usv > usv
sed -i 's/^/\&#x/' usv
sed -i 's/$/;<br>/' usv
# 取出 TeX Macro
cut -f3 -d"{" tmpfile > value
sed -i 's/}//' value
# 合并
paste -d" " value usv > unicode-math.html
# 省略 mup 前缀，默认的直立字母应该直接输入对应的 TeX Macro 就好了
# 例如输入 alpha 而不是 mupalpha 来获得希腊字母 α
sed -i 's/mup//' unicode-math.html

# 清理临时文件
rm -vf tmpfile tmpfile.usv tmpfile.value usv value

