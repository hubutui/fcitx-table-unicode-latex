#!/bin/sh
# 这个脚本将其他所有脚本生成的 .html 文件合并到一起
# 其中 mcal 会和 mscr 分开，number 也会分开
# 最后，根据需要合并 index-mcal.html，index-mscr.html
# 以及 index-number-arabic.html，index-number-eng.html 到 index.html 即可
#
cat greek-upright.html > index.html
cat Greek-upright.html >> index.html
cat greek-mbf.html >> index.html
cat Greek-mbf.html >> index.html
cat greek-mbfit.html >> index.html
cat Greek-mbfit.html >> index.html
cat greek-mit.html >> index.html
cat Greek-mit.html >> index.html
cat latin-mbf.html >> index.html
cat Latin-mbf.html >> index.html
cat latin-mbfit.html >> index.html
cat Latin-mbfit.html >> index.html
cat latin-mit.html >> index.html
cat Latin-mit.html >> index.html
cat latin-mtt.html >> index.html
cat Latin-mtt.html >> index.html
cat mathbin.html >> index.html
cat mathclose.html >> index.html
cat mathfence.html >> index.html
cat mathopen.html >> index.html
cat mathop.html >> index.html
cat mathord.html >> index.html
cat mathrel.html >> index.html
cat mfrak-mbf.html >> index.html
cat mfrak-upright.html >> index.html
cat misc.html >> index.html
cat subscripts-and-superscripts.html >> index.html

cat mcal-upright.html > index-mcal.html
cat mcal-mbf.html >> index-mcal.html

cat mscr-upright.html > index-mscr.html
cat mscr-mbf.html >> index-mscr.html

cat number-arabic-mbb.html > index-number-arabic.html
cat number-arabic-mbf.html >> index-number-arabic.html
cat number-arabic-mtt.html >> index-number-arabic.html

cat number-eng-mbb.html > index-number-eng.html
cat number-eng-mbf.html >> index-number-eng.html
cat number-eng-mtt.html >> index-number-eng.html

