#!/bin/sh
# 从 unicode-math-table.tex 生成 \mathbb 命令输出的黑板粗体字母对应的码表，
# 其中也包含阿拉伯数字和一些其他符号．
# 此外还有几个是斜体，因为数量较少，就不分开写了．
# 其中，黑板粗体数字这里是用 \mbbone 这样子的码，也可以考虑改成 \mbb1 这样子的
# 但是后者会影响数字选词，不过更加方便输入．
# 所以还是提供了两个文件 mbb-with-arabic-number.html 和 mbb-with-eng-number.html
#
sed '/Bbb/!d' unicode-math-table.tex > mbb.html
cut -f 1 -d"}" mbb.html > usv.tmp
cut -f 2 -d'"' usv.tmp > tmpfile
mv tmpfile usv.tmp
sed -i 's/^/\&#x/' usv.tmp
sed -i 's/$/;<br>/' usv.tmp

cut -f3 -d"{" mbb.html > value.tmp
sed -i 's/}//' value.tmp

paste -d" " value.tmp usv.tmp > mbb.html
sed -i 's/Bbb/mbb/' mbb.html

mv mbb.html mbb-with-eng-number.html
cp mbb-with-eng-number.html mbb-with-arabic-number.html
sed -i 's/zero/0/' mbb-with-arabic-number.html
sed -i 's/one/1/' mbb-with-arabic-number.html
sed -i 's/two/2/' mbb-with-arabic-number.html
sed -i 's/three/3/' mbb-with-arabic-number.html
sed -i 's/four/4/' mbb-with-arabic-number.html
sed -i 's/five/5/' mbb-with-arabic-number.html
sed -i 's/six/6/' mbb-with-arabic-number.html
sed -i 's/seven/7/' mbb-with-arabic-number.html
sed -i 's/eight/8/' mbb-with-arabic-number.html
sed -i 's/nine/9/' mbb-with-arabic-number.html

# 最后的清理工作
rm -f *.tmp

