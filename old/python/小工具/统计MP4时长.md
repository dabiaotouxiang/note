1. 下载ffprobe，官网下载
2. 编写python脚本
```
"""
统计视频时长，多级的目录的需要修改代码
用到的ffprobe
"""
import os
import subprocess
# from moviepy.editor import VideoFileClip
dir_path = "/Users/xxxxxxxxx/Documents/xxxxxxxxx/"
filenames = os.listdir(dir_path)
time = 0
n = 0
for filename in filenames:
    if os.path.isdir(dir_path + filename):
        in_filenames = os.listdir(dir_path + filename + "/")
        tmp_time = 0
        for in_filename in in_filenames:
            if os.path.isdir(dir_path + filename + "/" + in_filename):
                in_in_filenames = os.listdir(dir_path + filename + "/" + in_filename + "/")
                for in_in_filename in in_in_filenames:
                    if in_in_filename.endswith(".mp4"):
                        file_path = dir_path + filename + "/" + in_filename + "/" + in_in_filename
                        result = subprocess.run(["/Users/ztshimac001/Documents/tools/ffprobe", "-v", "error", "-show_entries", "format=duration", "-of", "default=noprint_wrappers=1:nokey=1", file_path], stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
                        try:
                            tmp_time = tmp_time + float(result.stdout)
                        except Exception as e:
                            print(e)
                            pass
                        # clip = VideoFileClip(file_path)
                        # try:
                        #     tmp_time = tmp_time + float(clip.duration)
                        # except:
                        #     pass
            elif in_filename.endswith(".mp4"):
                file_path = dir_path + filename + "/" + in_filename
                result = subprocess.run(["/Users/ztshimac001/Documents/tools/ffprobe", "-v", "error", "-show_entries", "format=duration", "-of", "default=noprint_wrappers=1:nokey=1", file_path], stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
                try:
                    tmp_time = tmp_time + float(result.stdout)
                except Exception as e:
                    print(e)
                    pass
        print(filename, str(tmp_time/3600))
        time = time + tmp_time
print(time/3600)
```