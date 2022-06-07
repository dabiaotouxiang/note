```
import os
import json
dirs = os.listdir("/Volumes/ssd-447G/46393906")

dirs.remove(".DS_Store")
print(len(dirs))
print(dirs)
for dir_path in dirs:
    # print("/Volumes/ssd-447G/46393906/" + dir_path)
    entry_path = "/Volumes/ssd-447G/46393906/" + dir_path + "/entry.json"
    with open(entry_path, "r") as f:
        video_name = json.loads(f.read())["page_data"]["part"] + ".mp4"
    m4s_audio_path = "/Volumes/ssd-447G/46393906/" + dir_path + "/80/audio.m4s"
    m4s_video_path = "/Volumes/ssd-447G/46393906/" + dir_path + "/80/video.m4s"
    mp4_video_path = "/Volumes/ssd-447G/高达0079/" + video_name
    mp4_video_path = mp4_video_path.replace(" ", "\ ")
    if os.path.exists(mp4_video_path):
        pass
    else:
        print("ffmpeg -i " + m4s_audio_path + " -i " + m4s_video_path + " -codec copy " + mp4_video_path)
        os.system("ffmpeg -i " + m4s_audio_path + " -i " + m4s_video_path + " -codec copy " + mp4_video_path)
```