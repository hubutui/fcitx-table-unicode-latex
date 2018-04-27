本项目提供了一个 LaTeX 码表，可以使用简化的 LaTeX 命令输出各种数学符号，并在 HTML 文件中用 xml 实体写出，保证 USV 的准确性．这些数学符号主要都是从 unicode-math 宏包的 unicode-math-table.tex 来的，一开始为了方便在 LaTeX 源文件中直接使用 Unicode 字符来编辑数学公式，提高源文件的可读性．当然，因为输入法的输出结果是 Unicode 字符，所以用于其他地方的输入也是可以的．需要注意的是你可能需要使用字符比较完整的字体才能正确显示所有的字符．

# 使用方法
直接运行脚本 `generate-html.sh` 会生成一个 `unicode-math.html` 文件，用浏览器打开即可得到对应的码表．更详细的内容请参考 `fcitx-table` 目录下的 `README.md`．
