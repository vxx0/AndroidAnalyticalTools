# decompile and modify APK

apktool.jar d d:\app\build\outputs\apk\release\app-release-unsigned.apk <br>
apktool.jar b d:\app\build\outputs\apk\release\app-release-unsigned -o test.apk <br>

# AndroidAnalyticalTools
The tool is completely free. If you'd like to use it, please direct message me. <br>
I will use com.google.vol as an example for detailed explanation. <br>

1. Place the following files in the /data/local/tmp directory: <br>
  `agent.5` <br>
  `env.lua` (For example, [env.lua](https://github.com/vxx0/AndroidAnalyticalTools/blob/main/env.lua)) <br>
  `task.conf` (For example, [task.conf](https://github.com/vxx0/AndroidAnalyticalTools/blob/main/task.conf)) <br>
  `${package_name}.task.conf` (For example, [com.google.vol.task.conf](https://github.com/vxx0/AndroidAnalyticalTools/blob/main/com.google.vol.task.conf))<br>

2. Make sure your phone has an sdcard. <br>
  base dir is '/sdcard/Android/data/${package_name}/storage'

3. Directories to be created by users and files to be placed. <br>
    - /sdcard/Android/data/com.google.vol/storage
      - 1
        - app
          - com.google.vol
            - base.apk 
        - data
        - sdcard
        - ext
          - conf.json
      - 2
        - app
        - data
        - sdcard
        - ext
          - conf.json
          - ...
    - /data/local/tmp
      - agent.5
      - task.conf
      - com.google.vol.task.conf

4. To switch the isolation environment. <br>
   first stop and disable the app to ensure it is not running. <br>
   Modify the a.conf to execute the new isolation directory, and finally, enable and run the app. <br>
   For example, (The following commands need to be adapted by you to ensure they are correct.) <br>
   adb shell am force-stop com.google.vol <br>
   adb shell pm disable-user --user 0 com.google.vol <br>
   modify com.google.vol.task.conf <br>
   adb shell pm enable com.google.vol <br>
   adb shell am start -n com.google.vol/your.activity.name <br>
# 
__The output logs used for analysis are received using logcat__. <br>
If anyone has any suggestions for improvement, please leave me a message. <br>
Thank you very much, and I wish you a happy day every day. <br>
