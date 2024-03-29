# apktool.jar

1. decompile and modify APK. <br>
apktool.jar d d:\app\build\outputs\apk\release\app-release-unsigned.apk <br>
apktool.jar b d:\app\build\outputs\apk\release\app-release-unsigned -o test.apk <br>

# AndroidAnalyticalTools
The tool is completely free. If you'd like to use it, please direct message me. <br>
I will use com.google.vol as an example for detailed explanation. <br>

1. Place the following files in the /data/local/tmp directory: <br>
  `agent.5` <br>
  `agent.conf` <br>
  `task.conf` (For example, [task.conf](https://github.com/vxx0/AndroidAnalyticalTools/blob/main/task.conf)) <br>
  `${package_name}.task.conf` (For example, [com.google.vol.task.conf](https://github.com/vxx0/AndroidAnalyticalTools/blob/main/com.google.vol.task.conf))<br>

2. Make sure your phone has an sdcard. <br>
3. Create an isolated directory at /sdcard/Android/data/storage, <br>
   with the directory name being a number representing the task ID. <br>
   The choice of the task ID is configured in `${package_name}.task.conf`. <br>
   For example, if the content of `${package_name}.task.conf` is 1, <br>
   the analysis tool will use an isolated directory named 1. <br>
4. Create the following subdirectories under the directory named 1: <br>
  `app` <br>
  `data` <br>
  `ext` <br>
  `sdcard` <br>
5. The `app` directory corresponds to the /data/app directory in the Android system; it is its redirection. <br>
  Inside this directory, create a subdirectory named after the package name of the APK you are analyzing. <br>
  for example, com.google.vol. <br>
  Rename the APK you are analyzing to `base.apk` and place it in the directory named after the package name. <br>
6. The `data` directory corresponds to the /data/data directory in the Android system; it is its redirection. <br>
7. The `sdcard` directory corresponds to the /sdcard directory in the Android system; it is its redirection. <br>
8. The `ext` directory is the location where analysis tool configuration files are stored. <br>
   You need to place the `conf.json` file in this directory. <br>
   The `conf.json` file contains some information about the phone that you want the app under analysis to access. <br>
   For the specific format, please send me a private message. <br>
   The analysis tool will generate an `firstInstallTime` file in this directory, <br>
   recording the first run time of the app under analysis in this isolated environment, <br>
   and a `uptime` file recording the last run time of the app in this isolated environment. <br>

9. Directories to be created by users and files to be placed. <br>
    - /sdcard/Android/data/storage
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
          - com.google.vol
            - base.apk
        - data
        - sdcard
        - ext
          - conf.json
    - /data/local/tmp
      - agent.5
      - agent.conf
      - task.conf
      - com.google.vol.task.conf
9. To switch the isolation environment. <br>
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
