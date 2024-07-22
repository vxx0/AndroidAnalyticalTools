

-- package_name
-- package_name is string. current package name. 

-- taskid
-- taskid is integer. current task id.

-- dbgview(text);
-- set_prop(string, string);
-- string = get_prop(string);
-- set_path_keep(string);
-- set_path_redirect(string, string);
-- set_path_errno(string, integer);
-- string, integer = get_path_redirect(string);
-- cp_mtime(string, string);
-- set_utime(string, number);

function config_javacore()
--[[
	set_prop("hookIActivityManager", "false");
    set_prop("hookIActivityManager", "false");
    set_prop("hookINotificationManager", "true");
    set_prop("hookITelephony", "false");
    set_prop("hookIPhoneSubInfo", "false");
    set_prop("hookISms", "false");
    set_prop("hookIMms", "false");
    set_prop("hookIAccountManager", "false");
    set_prop("hookIUserManager", "false");
    set_prop("hookIRestrictionsManager", "false");
    set_prop("hookIVibratorService", "false");
    set_prop("hookIWindowManager", "false");
    set_prop("hookIDisplayManager", "false");
    set_prop("hookIAppOpsService", "false");
    set_prop("hookIContentService", "false");
    set_prop("hookIDevicePolicyManager", "false");
    set_prop("hookIAudioService", "false");
    set_prop("hookIWifiScanner", "false");
    set_prop("hookIContextHubService", "false");
    set_prop("hookITelephonyRegistry", "false");
    set_prop("hookILocationManager", "false");
    set_prop("hookIPackageManager", "true");
    set_prop("hookIClipboard", "false");
    set_prop("hookIInputMethodManager", "false");
    set_prop("hookIMountService", "false");
    set_prop("hookISessionManager", "false");
    set_prop("hookIWifiManager", "false");
    set_prop("hookIBluetoothManager", "false");
    set_prop("hookIDropBoxManager", "false");
    set_prop("hookIPersistentDataBlockService", "false");
    set_prop("hookIBackupManager", "false");
    set_prop("hookIPowerManager", "false");
    set_prop("hookIAlarmManager", "false");
    set_prop("hookISearchManager", "false");
    set_prop("hookIJobScheduler", "false");
    set_prop("hookIAppWidgetService", "false");
    set_prop("hookIGraphicsStats", "false");
    set_prop("hookINetworkManagementService", "false");
    set_prop("hookISub", "false");
    set_prop("hookIConnectivityManager", "false");
    set_prop("BroadcastReceiverHook", "false");
    set_prop("hookIMediaRouterService", "false");

    set_prop("PreSet_getprop", "false");
    set_prop("Config", "true");
    set_prop("Redirect_InstallPackages", "true");
    set_prop("Redirect_Environment", "true");
    set_prop("Redirect_SystemProperties", "false");
    set_prop("Redirect_System_getProperty", "false");
    set_prop("Redirect_Build", "false");
    set_prop("Redirect_WifiInfo", "false");
    set_prop("Redirect_UserAgent", "false");
    set_prop("Redirect_Setting", "false");
    set_prop("Redirect_PhoneInfo", "false");
    set_prop("Redirect_DisplayInfo", "false");
    set_prop("Redirect_CheckRoot", "false");
    set_prop("Redirect_Bluetooth", "false");
    set_prop("Redirect_MemoryInfo", "false");
    set_prop("Redirect_InputMethodInfo", "false");
    set_prop("Redirect_LocationInfo", "false");
    set_prop("Redirect_Battery", "false");
    set_prop("Redirect_Tasks", "false");
    set_prop("Redirect_Media", "false");
    set_prop("Redirect_telephony_cp", "false");
    set_prop("Undef", "false");
    ]]
end


function hide_package_list()
	return "com.cyjh.mobileanjian|com.nanhnjnimhmpme.doanj|com.proxy.socks5";
end

function base_path()
	return "/sdcard/Android/data/" .. package_name .. "/storage/";
end

function source_path()
	return "/sdcard/Android/data/" .. package_name .. "/storage/" .. taskid .. "/app/" .. package_name .. "/";
end

function base_apk()
	return source_path() .. "base.apk";
end

function task_path()
	return "/sdcard/Android/data/" .. package_name .. "/storage/" .. taskid .. "/";
end

function conf_json_path()
	return "/sdcard/Android/data/" .. package_name .. "/storage/" .. taskid .. "/ext/conf.json";
end

function app_path()
	return "/sdcard/Android/data/" .. package_name .. "/storage/" .. taskid .. "/app/";
end




function data_path()
	return "/sdcard/Android/data/" .. package_name .. "/storage/" .. taskid .. "/data/";
end

function sdcard_path()
	return "/sdcard/Android/data/" .. package_name .. "/storage/" .. taskid .. "/sdcard/";
end

function ext_path()
	return "/sdcard/Android/data/" .. package_name .. "/storage/" .. taskid .. "/ext/";
end

function applib_path()
	return "/data/data/" .. package_name .. "/lib/";
end

function app_data_path_1()
	return "/data/data/" .. package_name .. "/";
end
function app_data_path_2()
	return "/data/user/0/" .. package_name .. "/";
end

--

function disable_art()
	set_path_redirect("/system/bin/dex2oat", ext_path() .. "dex2oat");
end

function exist( path )
	local f = io.open(path, "rb");
    if f then
        f:close();
    end
    return f ~= nil; 
end

function mkdir( path )
    if exist(path) ~= true then
        os.execute("mkdir " .. path);
    end
end

function check_path_exist( path )
    if exist(path) ~= true then
        error("check: " .. path);
    end
end


function check_task()
    check_path_exist(base_path());
    check_path_exist(base_apk());
    check_path_exist(conf_json_path());

    mkdir(app_path());
    mkdir(app_path() .. package_name .. "/");
	mkdir(data_path());
    mkdir(data_path() .. package_name .. "/");
    mkdir(sdcard_path());
end


function pre_io_redirect()
	set_path_keep(base_path());
    set_path_keep(applib_path());

    set_path_redirect(app_data_path_1(), data_path());
    set_path_redirect(app_data_path_2(), data_path());
    set_path_redirect("/sdcard/", sdcard_path());
    set_path_redirect("/system/lib64/", "/system/lib/");

    set_path_redirect("/system/build.prop", ext_path() .. "build.prop");
    set_path_redirect("/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_max_freq", ext_path() .. "cpuinfo_max_freq");
    set_path_redirect("/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_min_freq", ext_path() .. "cpuinfo_min_freq");
    set_path_redirect("/sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq", ext_path() .. "scaling_cur_freq");
    set_path_redirect("/proc/net/if_inet6", ext_path() .. "if_inet6");
    set_path_redirect("/sys/class/net/wlan0/address", ext_path() .. "address");
    set_path_redirect("/proc/version", ext_path() .. "version");

    local boot_id = ext_path() .. "boot_id";
    if exist(boot_id) then
        set_path_redirect("/proc/sys/kernel/random/boot_id", boot_id);
    end

    local meminfo = ext_path() .. "meminfo";
    if exist(meminfo) then
        set_path_redirect("/proc/meminfo", meminfo);
    end

    local stat = ext_path() .. "stat";
    if exist(stat) then
        set_path_redirect("/proc/stat", stat);
    end
    
    local cpuinfo = ext_path() .. "cpuinfo";
    if exist(cpuinfo) then
        set_path_redirect("/proc/cpuinfo", cpuinfo);
    end   

    set_path_redirect("/system/bin/netcfg", ext_path() .. "netcfg");
    set_path_redirect("/system/bin/cat", ext_path() .. "cat");
    set_path_redirect("/system/bin/getprop", ext_path() .. "getprop");
    set_path_redirect("/system/bin/none", ext_path() .. "none");
    set_path_redirect("/system/bin/which", ext_path() .. "none");
    set_path_redirect("/system/bin/type", ext_path() .. "type");
    set_path_redirect("/system/bin/uname", ext_path() .. "uname");

    local function non_existing_file()
	    return "/sbin/non_existing_file";
    end

    set_path_redirect("/sys/class/power_supply/ac/online", non_existing_file());
    set_path_redirect("/sys/class/power_supply/usb/online", non_existing_file());
    set_path_redirect("/sys/class/power_supply/battery/status", non_existing_file());
    set_path_redirect("/sys/class/power_supply/battery/health", non_existing_file());
    set_path_redirect("/sys/class/power_supply/battery/present", non_existing_file());
    set_path_redirect("/sys/class/power_supply/battery/capacity", non_existing_file());
    set_path_redirect("/sys/class/power_supply/battery/batt_vol", non_existing_file());
    set_path_redirect("/sys/class/power_supply/battery/batt_temp", non_existing_file());
    set_path_redirect("/sys/class/power_supply/battery/technology", non_existing_file());

    set_path_redirect("/sys/block/mmcblk0/device/cid", non_existing_file());
    set_path_redirect("/sys/block/mmcblk0/device/name", non_existing_file());
    set_path_redirect("/sys/block/mmcblk0/device/type", non_existing_file());
    set_path_redirect("/sys/block/mmcblk1/device/cid", non_existing_file());
    set_path_redirect("/sys/block/mmcblk1/device/name", non_existing_file());
    set_path_redirect("/sys/block/mmcblk1/device/type", non_existing_file());

    set_path_redirect("/proc/net/arp", non_existing_file());
    set_path_redirect("/sys/class/net/tun0", non_existing_file());

    --local uptime = ext_path() .. "uptime";
    --local buf = string.format("%d.%d %d.%d", boot_time, randInt(99), idle_time, randInt(99));
    --file_write(uptime, buf);
    --set_path_redirect("/proc/uptime", uptime);

    local firstInstallTime = ext_path() .. "firstInstallTime";
    if exist(firstInstallTime) ~= true then
        cp_mtime(base_apk(), firstInstallTime);
    end

end


dbgview("package_name: " .. package_name);
check_task();
pre_io_redirect();


config_javacore();
--error("xxxx");
