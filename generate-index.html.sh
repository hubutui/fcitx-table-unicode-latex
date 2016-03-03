#!/bin/sh
# 这个脚本将其他所有脚本生成的 .html 文件合并到一起
# 其中 mcal 会和 mscr 分开，number 也会分开
# 考虑到数学公式中的无衬线字体比较少用到，于是也分一个 index-sans.html
# 该文件只包含无衬线的字母，不含数字．
#
cat greek-lower-upright.html > index.html
cat greek-upper-upright.html >> index.html
cat greek-lower-mbf.html >> index.html
cat greek-upper-mbf.html >> index.html
cat greek-lower-mbfit.html >> index.html
cat greek-upper-mbfit.html >> index.html
cat greek-lower-mit.html >> index.html
cat greek-upper-mit.html >> index.html
cat latin-lower-mbf.html >> index.html
cat latin-upper-mbf.html >> index.html
cat latin-lower-mbfit.html >> index.html
cat latin-upper-mbfit.html >> index.html
cat latin-lower-mit.html >> index.html
cat latin-upper-mit.html >> index.html
cat latin-lower-mtt.html >> index.html
cat latin-upper-mtt.html >> index.html
cat mathbin.html >> index.html
cat mathclose.html >> index.html
cat mathfence.html >> index.html
cat mathopen.html >> index.html
cat mathop.html >> index.html
cat mathord.html >> index.html
cat mathrel.html >> index.html
cat mfrak-mbf.html >> index.html
cat mfrak-upright.html >> index.html
cat alpha-mbb.html >> index.html
cat misc.html >> index.html
cat subscripts-and-superscripts.html >> index.html
cat fractions.html >> index.html

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

cat greek-lower-mbfitsans.html > index-sans.html
cat greek-lower-mbfsans.html >> index-sans.html
cat greek-upper-mbfitsans.html >> index-sans.html
cat greek-upper-mbfsans.html >> index-sans.html
cat latin-lower-mbfitsans.html >> index-sans.html
cat latin-lower-mbfsans.html >> index-sans.html
cat latin-lower-msans-upright.html >> index-sans.html
cat latin-upper-mbfitsans.html >> index-sans.html
cat latin-upper-mbfsans.html >> index-sans.html
cat latin-upper-msans-upright.html >> index-sans.html

