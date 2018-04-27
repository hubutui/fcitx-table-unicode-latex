# How to use
Just copy `latex-unicode.conf` and  `latex-unicode.mb` to `/usr/share/fcitx/data/table` (system-wide), or `~/.config/fcitx/table` (user specific).

For Arch Linux user, use `/usr/share/fcitx/table` instead, for system-wide setting.

# Something more that worths mentioning
To create your own code table, modify `latex-unicode.txt` according to your need, and create a code table binary file by:
```shell
txt2mb latex-unicode.txt latex-unicode.mb
```
Visit this [wiki](https://fcitx-im.org/wiki/How_to_make_your_own_table-based_input_method)(English) or [here](http://fcitx.github.io/handbook/sect1-code-table.html)(中文) for more details.
