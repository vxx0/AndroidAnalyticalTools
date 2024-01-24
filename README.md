# AndroidAnalyticalTools

1. decompile and modify APK.
apktool.jar
apktool.jar d d:\app\build\outputs\apk\release\app-release-unsigned.apk
apktool.jar b d:\app\build\outputs\apk\release\app-release-unsigned -o test.apk

# AndroidAnalyticalTools
The tool is completely free. If you'd like to use it, please direct message me.
I will use com.google.vol as an example for detailed explanation. 

1. Place the following files in the /data/local/tmp directory:
  agent.5
  agent.conf
  task.conf
  ${package_name}.task.conf

2. Make sure your phone has an sdcard.
3. Create an isolated directory at /sdcard/Android/data/storage,
   with the directory name being a number representing the task ID.
   The choice of the task ID is configured in ${package_name}.task.conf.
   For example, if the content of ${package_name}.task.conf is 1,
   the analysis tool will use an isolated directory named 1.
4. Create the following subdirectories under the directory named 1:
  app
  data
  ext
  sdcard
5. The app directory corresponds to the /data/app directory in the Android system; it is its redirection.
  Inside this directory, create a subdirectory named after the package name of the APK you are analyzing.
  for example, com.google.vol.
  Rename the APK you are analyzing to base.apk and place it in the directory named after the package name.
6. The data directory corresponds to the /data/data directory in the Android system; it is its redirection.
7. The sdcard directory corresponds to the /sdcard directory in the Android system; it is its redirection.
8. The ext directory is the location where analysis tool configuration files are stored.
   You need to place the conf.json file in this directory.
   The conf.json file contains some information about the phone that you want the app under analysis to access.
   For the specific format, please send me a private message.
   The analysis tool will generate an firstInstallTime file in this directory,
   recording the first run time of the app under analysis in this isolated environment,
   and a uptime file recording the last run time of the app in this isolated environment.

# 
If anyone has any suggestions for improvement, please leave me a message. 
Thank you very much, and I wish you a happy day every day.
