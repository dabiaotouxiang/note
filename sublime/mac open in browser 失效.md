1. 打开console
2. 右键，open in browser，可以看到track
```
Traceback (most recent call last):
  File "/Applications/Sublime Text.app/Contents/MacOS/sublime_plugin.py", line 1088, in run_
    return self.run(edit)
  File "/Applications/Sublime Text.app/Contents/MacOS/Packages/Default.sublime-package/open_in_browser.py", line 9, in run
  File "./python3.3/webbrowser.py", line 70, in open_new_tab
  File "./python3.3/webbrowser.py", line 62, in open
  File "./python3.3/webbrowser.py", line 635, in open
UnicodeEncodeError: 'ascii' codec can't encode characters in position 63-64: ordinal not in range(128)
```
3. 可以看到是ascii的问题，默认用python进行打开。应该是路径带中文的问题。
4. 网上搜了一下是自带插件的问题，可以安装 view in browser