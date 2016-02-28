#!/bin/sh
# 这里包含一些没有匹配到的杂项符号
# 输出文件为 misc.html
#
sed '/[\]matheth[ \t]/!d' unicode-math-table.tex > misc.html
sed '/[\]hslash[ \t]/!d' unicode-math-table.tex >> misc.html
sed '/[\]Im[ \t]/!d' unicode-math-table.tex >> misc.html
sed '/[\]ell[ \t]/!d' unicode-math-table.tex >> misc.html
sed '/[\]wp[ \t]/!d' unicode-math-table.tex >> misc.html
sed '/[\]Re[ \t]/!d' unicode-math-table.tex >> misc.html
sed '/[\]turnediota[ \t]/!d' unicode-math-table.tex >> misc.html
sed '/[\]Angstrom[ \t]/!d' unicode-math-table.tex >> misc.html
sed '/[\]aleph[ \t]/!d' unicode-math-table.tex >> misc.html
sed '/[\]beth[ \t]/!d' unicode-math-table.tex >> misc.html
sed '/[\]gimel[ \t]/!d' unicode-math-table.tex >> misc.html
sed '/[\]daleth[ \t]/!d' unicode-math-table.tex >> misc.html
sed '/[\]partial[ \t]/!d' unicode-math-table.tex >> misc.html
sed '/[\]nabla[ \t]/!d' unicode-math-table.tex >> misc.html
sed '/[\]imath[ \t]/!d' unicode-math-table.tex >> misc.html
sed '/[\]jmath[ \t]/!d' unicode-math-table.tex >> misc.html

cut -f 1 -d"}" misc.html > usv.tmp
cut -f 2 -d'"' usv.tmp > tmpfile
mv tmpfile usv.tmp
sed -i 's/^/\&#x/' usv.tmp
sed -i 's/$/;<br>/' usv.tmp

cut -f3 -d"{" misc.html > value.tmp
sed -i 's/}//' value.tmp

paste -d" " value.tmp usv.tmp > misc.html


# 最后的清理工作
rm -f *.tmp

