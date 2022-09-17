## android10.0.0_r34
1. 手机 Pixel2
2. 添加抓包证书 位置在 system/ca-certificates/files。添加了mitm的证书
3. 修改adb root为user系统也有的。
```
1. 修改 system/core/adb/daemon/restart_service.cpp
void restart_root_service(unique_fd fd) {
    if (getuid() == 0) {
        WriteFdExactly(fd.get(), "adbd is already running as root\n");
        return;
    }
    if (!__android_log_is_debuggable()) {
        WriteFdExactly(fd.get(), "adbd cannot run as root in production builds\n");
        return;
    }

    LOG(INFO) << "adbd restarting as root";
    android::base::SetProperty("service.adb.root", "1");
    WriteFdExactly(fd.get(), "restarting adbd as root\n");
}
改为
void restart_root_service(unique_fd fd) {
    if (getuid() == 0) {
        WriteFdExactly(fd.get(), "adbd is already running as root\n");
        return;
    }
    // if (!__android_log_is_debuggable()) {
    //     WriteFdExactly(fd.get(), "adbd cannot run as root in production builds\n");
    //     return;
    // }

    LOG(INFO) << "adbd restarting as root";
    android::base::SetProperty("service.adb.root", "1");
    WriteFdExactly(fd.get(), "restarting adbd as root\n");
}

2. 修改 system/core/adb/sockets.cpp
asocket* create_local_service_socket(std::string_view name, atransport* transport) {
#if !ADB_HOST
    if (asocket* s = daemon_service_to_socket(name); s) {
        return s;
    }
#endif
    unique_fd fd = service_to_fd(name, transport);
    if (fd < 0) {
        return nullptr;
    }

    int fd_value = fd.get();
    asocket* s = create_local_socket(std::move(fd));
    LOG(VERBOSE) << "LS(" << s->id << "): bound to '" << name << "' via " << fd_value;

#if !ADB_HOST
    if ((name.starts_with("root:") && getuid() != 0 && __android_log_is_debuggable()) ||
        (name.starts_with("unroot:") && getuid() == 0) || name.starts_with("usb:") ||
        name.starts_with("tcpip:")) {
        D("LS(%d): enabling exit_on_close", s->id);
        s->exit_on_close = 1;
    }
#endif

    return s;
}
改为
asocket* create_local_service_socket(std::string_view name, atransport* transport) {
#if !ADB_HOST
    if (asocket* s = daemon_service_to_socket(name); s) {
        return s;
    }
#endif
    unique_fd fd = service_to_fd(name, transport);
    if (fd < 0) {
        return nullptr;
    }

    int fd_value = fd.get();
    asocket* s = create_local_socket(std::move(fd));
    LOG(VERBOSE) << "LS(" << s->id << "): bound to '" << name << "' via " << fd_value;

#if !ADB_HOST
    // if ((name.starts_with("root:") && getuid() != 0 && __android_log_is_debuggable()) ||
    if ((name.starts_with("root:") && getuid() != 0 ) ||
        (name.starts_with("unroot:") && getuid() == 0) || name.starts_with("usb:") ||
        name.starts_with("tcpip:")) {
        D("LS(%d): enabling exit_on_close", s->id);
        s->exit_on_close = 1;
    }
#endif

    return s;
}

3. 修改 system/core/adb/daemon/main.cpp
static bool should_drop_privileges() {
    // "adb root" not allowed, always drop privileges.
    if (!ALLOW_ADBD_ROOT && !is_device_unlocked()) return true;

    // The properties that affect `adb root` and `adb unroot` are ro.secure and
    // ro.debuggable. In this context the names don't make the expected behavior
    // particularly obvious.
    //
    // ro.debuggable:
    //   Allowed to become root, but not necessarily the default. Set to 1 on
    //   eng and userdebug builds.
    //
    // ro.secure:
    //   Drop privileges by default. Set to 1 on userdebug and user builds.
    bool ro_secure = android::base::GetBoolProperty("ro.secure", true);
    bool ro_debuggable = __android_log_is_debuggable();

    // Drop privileges if ro.secure is set...
    bool drop = ro_secure;

    // ... except "adb root" lets you keep privileges in a debuggable build.
    std::string prop = android::base::GetProperty("service.adb.root", "");
    bool adb_root = (prop == "1");
    bool adb_unroot = (prop == "0");
    if (ro_debuggable && adb_root) {
        drop = false;
    }
    // ... and "adb unroot" lets you explicitly drop privileges.
    if (adb_unroot) {
        drop = true;
    }

    return drop;
}
改为
static bool should_drop_privileges() {
    // // "adb root" not allowed, always drop privileges.
    // if (!ALLOW_ADBD_ROOT && !is_device_unlocked()) return true;

    // // The properties that affect `adb root` and `adb unroot` are ro.secure and
    // // ro.debuggable. In this context the names don't make the expected behavior
    // // particularly obvious.
    // //
    // // ro.debuggable:
    // //   Allowed to become root, but not necessarily the default. Set to 1 on
    // //   eng and userdebug builds.
    // //
    // // ro.secure:
    // //   Drop privileges by default. Set to 1 on userdebug and user builds.
    // bool ro_secure = android::base::GetBoolProperty("ro.secure", true);
    // bool ro_debuggable = __android_log_is_debuggable();

    // // Drop privileges if ro.secure is set...
    // bool drop = ro_secure;

    // // ... except "adb root" lets you keep privileges in a debuggable build.
    // std::string prop = android::base::GetProperty("service.adb.root", "");
    // bool adb_root = (prop == "1");
    // bool adb_unroot = (prop == "0");
    // if (ro_debuggable && adb_root) {
    //     drop = false;
    // }
    // // ... and "adb unroot" lets you explicitly drop privileges.
    // if (adb_unroot) {
    //     drop = true;
    // }

    // return drop;

    bool drop = true;

    // ... except "adb root" lets you keep privileges in a debuggable build.
    std::string prop = android::base::GetProperty("service.adb.root", "0");
    bool adb_root = (prop == "1");
    bool adb_unroot = (prop == "0");
    if (adb_root) {
        drop = false;
    }
    // ... and "adb unroot" lets you explicitly drop privileges.
    if (adb_unroot) {
        drop = true;
    }

    return drop;
}

4. 修改 adbd.te 位置为 system/sepolicy/private/adbd.te system/sepolicy/prebuilts/api/29.0/private/adbd.te

userdebug_or_eng(`
  allow adbd self:process setcurrent;
  allow adbd su:process dyntransition;
')
neverallow adbd { domain userdebug_or_eng(`-su') recovery_only(`-shell') }:process dyntransition;

改为
# userdebug_or_eng(`
allow adbd self:process setcurrent;
allow adbd su:process dyntransition;
# ')
# neverallow adbd { domain userdebug_or_eng(`-su') recovery_only(`-shell') }:process dyntransition;
neverallow adbd { domain -su recovery_only(`-shell') }:process dyntransition;

5. 修改su.te 位置为 system/sepolicy/prebuilts/api/29.0/private/su.te system/sepolicy/private/su.te
在最后一行添加
permissive su;

6. 修改selinux的编译自检 system/sepolicy/Android.mk
$(built_sepolicy_neverallows)
	@mkdir -p $(dir $@)
	$(hide) $< -m -M true -G -c $(POLICYVERS) $(PRIVATE_NEVERALLOW_ARG) $(PRIVATE_CIL_FILES) -o $@.tmp -f /dev/null
	$(hide) $(HOST_OUT_EXECUTABLES)/sepolicy-analyze $@.tmp permissive > $@.permissivedomains
	$(hide) if [ "$(TARGET_BUILD_VARIANT)" = "user" -a -s $@.permissivedomains ]; then \
		echo "==========" 1>&2; \
		echo "ERROR: permissive domains not allowed in user builds" 1>&2; \
		echo "List of invalid domains:" 1>&2; \
		cat $@.permissivedomains 1>&2; \
		exit 1; \
		fi
	$(hide) mv $@.tmp $@

$(LOCAL_BUILT_MODULE): $(sepolicy.recovery.conf) $(HOST_OUT_EXECUTABLES)/checkpolicy \
                       $(HOST_OUT_EXECUTABLES)/sepolicy-analyze
	@mkdir -p $(dir $@)
	$(hide) $(CHECKPOLICY_ASAN_OPTIONS) $(HOST_OUT_EXECUTABLES)/checkpolicy -M -c \
		$(POLICYVERS) -o $@.tmp $<
	$(hide) $(HOST_OUT_EXECUTABLES)/sepolicy-analyze $@.tmp permissive > $@.permissivedomains
	$(hide) if [ "$(TARGET_BUILD_VARIANT)" = "user" -a -s $@.permissivedomains ]; then \
		echo "==========" 1>&2; \
		echo "ERROR: permissive domains not allowed in user builds" 1>&2; \
		echo "List of invalid domains:" 1>&2; \
		cat $@.permissivedomains 1>&2; \
		exit 1; \
		fi
	$(hide) mv $@.tmp $@

改为
$(built_sepolicy_neverallows)
	@mkdir -p $(dir $@)
	$(hide) $< -m -M true -G -c $(POLICYVERS) $(PRIVATE_NEVERALLOW_ARG) $(PRIVATE_CIL_FILES) -o $@.tmp -f /dev/null
	$(hide) $(HOST_OUT_EXECUTABLES)/sepolicy-analyze $@.tmp permissive > $@.permissivedomains
	$(hide) if [ "$(TARGET_BUILD_VARIANT)" = "user" -a -s $@.permissivedomains ]; then \
		echo "==========" 1>&2; \
		echo "ERROR: permissive domains not allowed in user builds" 1>&2; \
		echo "List of invalid domains:" 1>&2; \
		cat $@.permissivedomains 1>&2; \
		fi
	$(hide) mv $@.tmp $@
$(LOCAL_BUILT_MODULE): $(sepolicy.recovery.conf) $(HOST_OUT_EXECUTABLES)/checkpolicy \
                       $(HOST_OUT_EXECUTABLES)/sepolicy-analyze
	@mkdir -p $(dir $@)
	$(hide) $(CHECKPOLICY_ASAN_OPTIONS) $(HOST_OUT_EXECUTABLES)/checkpolicy -M -c \
		$(POLICYVERS) -o $@.tmp $<
	$(hide) $(HOST_OUT_EXECUTABLES)/sepolicy-analyze $@.tmp permissive > $@.permissivedomains
	$(hide) if [ "$(TARGET_BUILD_VARIANT)" = "user" -a -s $@.permissivedomains ]; then \
		echo "==========" 1>&2; \
		echo "ERROR: permissive domains not allowed in user builds" 1>&2; \
		echo "List of invalid domains:" 1>&2; \
		cat $@.permissivedomains 1>&2; \
		fi
	$(hide) mv $@.tmp $@
7. 设置adb开启就为root build/make/core/main.mk
ifeq (true,$(strip $(enable_target_debugging)))
  # Target is more debuggable and adbd is on by default
  ADDITIONAL_DEFAULT_PROPERTIES += ro.debuggable=1
  # Enable Dalvik lock contention logging.
  ADDITIONAL_BUILD_PROPERTIES += dalvik.vm.lockprof.threshold=500
else # !enable_target_debugging
  # Target is less debuggable and adbd is off by default
  ADDITIONAL_DEFAULT_PROPERTIES += ro.debuggable=0
endif # !enable_target_debugging

改为
ifeq (true,$(strip $(enable_target_debugging)))
  # Target is more debuggable and adbd is on by default
  ADDITIONAL_DEFAULT_PROPERTIES += ro.debuggable=1
  # Enable Dalvik lock contention logging.
  ADDITIONAL_BUILD_PROPERTIES += dalvik.vm.lockprof.threshold=500
else # !enable_target_debugging
  # Target is less debuggable and adbd is off by default
  ADDITIONAL_DEFAULT_PROPERTIES += ro.debuggable=0
  ADDITIONAL_DEFAULT_PROPERTIES += service.adb.root=1
endif # !enable_target_debugging
```
4. 设置prop中的ro为可以set的模式  system/core/init/property_service.cpp
```
        // ro.* properties are actually "write-once".
        if (StartsWith(name, "ro.")) {
            *error = "Read-only property was already set";
            return PROP_ERROR_READ_ONLY_PROPERTY;
        }
        改为
        // ro.* properties are actually "write-once".
        // if (StartsWith(name, "ro.")) {
        //     *error = "Read-only property was already set";
        //     return PROP_ERROR_READ_ONLY_PROPERTY;
        // }
```
5. getInstalledPackages 过滤magisk frameworks/base/core/java/android/app/ApplicationPackageManager.java
```
    /** @hide */
    @Override
    @SuppressWarnings("unchecked")
    public List<PackageInfo> getInstalledPackagesAsUser(int flags, int userId) {
        try {
            ParceledListSlice<PackageInfo> parceledList =
                    mPM.getInstalledPackages(updateFlagsForPackage(flags, userId), userId);
            if (parceledList == null) {
                return Collections.emptyList();
            }
            return parceledList.getList();
        } catch (RemoteException e) {
            throw e.rethrowFromSystemServer();
        }
    }
    改为
    /** @hide */
    @Override
    @SuppressWarnings("unchecked")
    public List<PackageInfo> getInstalledPackagesAsUser(int flags, int userId) {
        try {
            ParceledListSlice<PackageInfo> parceledList =
                    mPM.getInstalledPackages(updateFlagsForPackage(flags, userId), userId);
            if (parceledList == null) {
                return Collections.emptyList();
            }
            // return parceledList.getList();
            List<PackageInfo> packageInfoList = parceledList.getList();
            Integer j = null;
            for (int i = 0; i < packageInfoList.size() ; i++){
                if (packageInfoList.get(i).packageName.equals("com.topjohnwu.magisk")){
                    j = 1;
                }
            }
            if (j != null){
                packageInfoList.remove(j.intValue());
            }
            return packageInfoList;
        } catch (RemoteException e) {
            throw e.rethrowFromSystemServer();
        }
    }
```
6. 设置默认打开adb，并信任所有设备
```
主动打开adb debug  frameworks/base/services/core/java/com/android/server/adb/AdbService.java
    /**
     * Called in response to {@code SystemService.PHASE_ACTIVITY_MANAGER_READY} from {@code
     * SystemServer}.
     */
    public void systemReady() {
        if (DEBUG) Slog.d(TAG, "systemReady");

        // make sure the ADB_ENABLED setting value matches the current state
        try {
            Settings.Global.putInt(mContentResolver,
                    Settings.Global.ADB_ENABLED, mAdbEnabled ? 1 : 0);
        } catch (SecurityException e) {
            // If UserManager.DISALLOW_DEBUGGING_FEATURES is on, that this setting can't be changed.
            Slog.d(TAG, "ADB_ENABLED is restricted.");
        }
    }
    改为
    /**
     * Called in response to {@code SystemService.PHASE_ACTIVITY_MANAGER_READY} from {@code
     * SystemServer}.
     */
    public void systemReady() {
        if (DEBUG) Slog.d(TAG, "systemReady");

        // make sure the ADB_ENABLED setting value matches the current state
        try {
            // Settings.Global.putInt(mContentResolver,
            //         Settings.Global.ADB_ENABLED, mAdbEnabled ? 1 : 0);
            Settings.Global.putInt(mContentResolver,
                    Settings.Global.ADB_ENABLED, 1);
        } catch (SecurityException e) {
            // If UserManager.DISALLOW_DEBUGGING_FEATURES is on, that this setting can't be changed.
            Slog.d(TAG, "ADB_ENABLED is restricted.");
        }
    }
信任所有adb
frameworks/base/services/core/java/com/android/server/adb/AdbDebuggingManager.java
        /**
         * Returns whether the specified key should be authroized to connect without user
         * interaction. This requires that the user previously connected this device and selected
         * the option to 'Always allow', and the time since the last connection is within the
         * allowed window.
         */
        public boolean isKeyAuthorized(String key) {
            // A system key is always authorized to connect.
            if (mSystemKeys.contains(key)) {
                return true;
            }
            long lastConnectionTime = getLastConnectionTime(key);
            if (lastConnectionTime == NO_PREVIOUS_CONNECTION) {
                return false;
            }
            long allowedConnectionTime = getAllowedConnectionTime();
            // if the allowed connection time is 0 then revert to the previous behavior of always
            // allowing previously granted adb grants.
            if (allowedConnectionTime == 0 || (System.currentTimeMillis() < (lastConnectionTime
                    + allowedConnectionTime))) {
                return true;
            } else {
                return false;
            }
        }
        改为
        /**
         * Returns whether the specified key should be authroized to connect without user
         * interaction. This requires that the user previously connected this device and selected
         * the option to 'Always allow', and the time since the last connection is within the
         * allowed window.
         */
        public boolean isKeyAuthorized(String key) {
            return true;
            // // A system key is always authorized to connect.
            // if (mSystemKeys.contains(key)) {
            //     return true;
            // }
            // long lastConnectionTime = getLastConnectionTime(key);
            // if (lastConnectionTime == NO_PREVIOUS_CONNECTION) {
            //     return false;
            // }
            // long allowedConnectionTime = getAllowedConnectionTime();
            // // if the allowed connection time is 0 then revert to the previous behavior of always
            // // allowing previously granted adb grants.
            // if (allowedConnectionTime == 0 || (System.currentTimeMillis() < (lastConnectionTime
            //         + allowedConnectionTime))) {
            //     return true;
            // } else {
            //     return false;
            // }
        }
直接同意adb frameworks/base/packages/SystemUI/src/com/android/systemui/usb/UsbDebuggingActivity.java
    @Override
    public void onClick(DialogInterface dialog, int which) {
        boolean allow = (which == AlertDialog.BUTTON_POSITIVE);
        boolean alwaysAllow = allow && mAlwaysAllow.isChecked();
        try {
            IBinder b = ServiceManager.getService(ADB_SERVICE);
            IAdbManager service = IAdbManager.Stub.asInterface(b);
            if (allow) {
                service.allowDebugging(alwaysAllow, mKey);
            } else {
                service.denyDebugging();
            }
        } catch (Exception e) {
            Log.e(TAG, "Unable to notify Usb service", e);
        }
        finish();
    }
    改为
    @Override
    public void onClick(DialogInterface dialog, int which) {
        boolean allow = (which == AlertDialog.BUTTON_POSITIVE);
        boolean alwaysAllow = allow && mAlwaysAllow.isChecked();
        try {
            IBinder b = ServiceManager.getService(ADB_SERVICE);
            IAdbManager service = IAdbManager.Stub.asInterface(b);
            service.allowDebugging(alwaysAllow, mKey);
            // if (allow) {
            //     service.allowDebugging(alwaysAllow, mKey);
            // } else {
            //     service.denyDebugging();
            // }
        } catch (Exception e) {
            Log.e(TAG, "Unable to notify Usb service", e);
        }
        finish();
    }
```
7. 设置默认语言为中文
```
build/target/product/full_base.mk

# Put en_US first in the list, so make it default.
PRODUCT_LOCALES := en_US

改为

# Put en_US first in the list, so make it default.
# PRODUCT_LOCALES := en_US
PRODUCT_LOCALES := zh_CN
```
8. 设置默认时区
```
build/tools/buildinfo.sh
最后添加
echo "persist.sys.timezone=Asia/Shanghai"
```
9. wifi的检测设置为国内的
```
packages/modules/NetworkStack/res/values/config.xml
    <!-- HTTP URL for network validation, to use for detecting captive portals. -->
    <string name="default_captive_portal_http_url" translatable="false">http://connectivitycheck.gstatic.com/generate_204</string>

    <!-- HTTPS URL for network validation, to use for confirming internet connectivity. -->
    <string name="default_captive_portal_https_url" translatable="false">https://www.google.com/generate_204</string>
    改为
    <!-- HTTP URL for network validation, to use for detecting captive portals. -->
    <!-- <string name="default_captive_portal_http_url" translatable="false">http://connectivitycheck.gstatic.com/generate_204</string> -->
    <string name="default_captive_portal_http_url" translatable="false">http://www.gstatic.com/generate_204</string>

    <!-- HTTPS URL for network validation, to use for confirming internet connectivity. -->
    <!-- <string name="default_captive_portal_https_url" translatable="false">https://www.google.com/generate_204</string> -->
    <string name="default_captive_portal_https_url" translatable="false">https://www.google.cn/generate_204</string>
```
10. 打印intent frameworks/base/core/java/android/app/Activity.java
```
import android.os.Looper;
后面添加
import android.os.Parcel;

import java.lang.annotation.RetentionPolicy;
后面添加
import java.lang.reflect.Method;

    private boolean mHasCurrentPermissionsRequest;
    后面添加
        private boolean mHasCurrentPermissionsRequest;

    /**
     * 用于建立十六进制字符的输出的小写字符数组
     */
    private static final char[] DIGITS_LOWER = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f'};
    /**
     * 用于建立十六进制字符的输出的大写字符数组
     */
    private static final char[] DIGITS_UPPER = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'};

    private static String encodeHexStr(byte[] data, boolean toLowerCase) {
        return new String(encodeHex(data, toLowerCase ? DIGITS_LOWER : DIGITS_UPPER));
    }

    /**
     * 将字节数组转换为十六进制字符数组
     *
     * @param data     byte[]
     * @param toDigits 用于控制输出的char[]
     * @return 十六进制char[]
     */
    private static char[] encodeHex(byte[] data, char[] toDigits) {
        final int len = data.length;
        final char[] out = new char[len << 1];//len*2
        // two characters from the hex value.
        for (int i = 0, j = 0; i < len; i++) {
            out[j++] = toDigits[(0xF0 & data[i]) >>> 4];// 高位
            out[j++] = toDigits[0x0F & data[i]];// 低位
        }
        return out;
    }

    /**
     * 打印intent
     */
    void printIntent(Intent intent){
        if(intent == null){
            return;
        }
        //如果禁用则不打印
        if(SystemProperties.getBoolean("pri.activity.print",true) == false){
            return;
        }
        //Log.i("stchook", "intent- intent:"+intent+",extras:"+intent.getExtras()+",action:"+intent.getAction()+",type:"+intent.getType());
        //Log.i("stchook", "uri-URI_INTENT_SCHEME:"+getIntent().toUri(Intent.URI_INTENT_SCHEME));
        //Log.i("stchook", "uri-URI_ANDROID_APP_SCHEME:"+getIntent().toUri(Intent.URI_ANDROID_APP_SCHEME));
        Log.i("stchook", "uri-URI_ALLOW_UNSAFE:"+intent.toUri(Intent.URI_ALLOW_UNSAFE));
        Log.i("stchook", "intent- intent:"+intent+",extras:"+getIntent().getExtras()+",action:"+getIntent().getAction()+",type:"+getIntent().getType());
        //如果开启data则打印base64
        if(SystemProperties.getBoolean("pri.activity.print_data",false)){
            Parcel parcel= Parcel.obtain();
            getIntent().writeToParcel(parcel,0);
            Log.i("stchook", "intent- intent:" + encodeHexStr(parcel.marshall(), true) );
            return;
        }
    }

    /**
     * hook webview
     */
    void hookwebview() {
        final String[] webviewList = {
            "android.webkit.WebView", // android webview
            "com.tencent.smtt.sdk.WebView",  // tencent x5
            "com.uc.webview.export.WebView", // UC
        };
        ClassLoader classLoader = this.getClassLoader();

        for (final String className : webviewList) {
            try {
                Log.i("stchook", "start find");
                Class txWebViewCls = classLoader.loadClass(className);
                // Log.i("stchook", "start find method");
                Method m = txWebViewCls.getDeclaredMethod("setWebContentsDebuggingEnabled",
                    boolean.class);
                // Log.i("stchook", "start call");
                m.invoke(null, true);
            
            } catch (Throwable e) {
                Log.d("stchook", "hook failed" + e.getMessage());
            }
        }

        try {
            Log.i("stchook", "start find WebCoreProxy");
            Class clz = classLoader.loadClass("com.tencent.tbs.tbsshell.WebCoreProxy");
            Method m = clz.getDeclaredMethod("Lb/j/b/a/c/d/a/c/a/g$c;", Boolean.class);
            m.invoke(null, Boolean.valueOf(true));
        } catch (Throwable e) {
            Log.d("stchook", "WebCoreProxy hook failed" + e.getMessage());
        }
        
        Log.i("stchook", "over hook");
    }

    public void startActivityForResult(@RequiresPermission Intent intent, int requestCode,
            @Nullable Bundle options) {
    后面添加
    public void startActivityForResult(@RequiresPermission Intent intent, int requestCode,
            @Nullable Bundle options) {
        printIntent(intent);

    public void startActivityForResultAsUser(Intent intent, int requestCode,
            @Nullable Bundle options, UserHandle user) {
    后面添加
    public void startActivityForResultAsUser(Intent intent, int requestCode,
            @Nullable Bundle options, UserHandle user) {
        printIntent(intent);
```
