#资源目录，放置ipa包
ASSETS_PATH="${SRCROOT}/APP"
# temp目录，放置解压的app
TEMP_PATH="${SRCROOT}/Temp"
# 目标ipa包路径
TARGET_IPA_PATH="${ASSETS_PATH}/*.ipa"
# 清空Temp文件夹
rm -rf "${SRCROOT}/Temp"
mkdir -p "${SRCROOT}/Temp"

# 解压缩
unzip -oqq "$TARGET_IPA_PATH" -d "$TEMP_PATH"

# 解压缩的app的路径
TEMP_APP_PATH=$(set -- "$TEMP_PATH/Payload/"*.app;echo "$1")

# 拷贝APP
TARGET_APP_PATH="$BUILT_PRODUCTS_DIR/$TARGET_NAME.app"

echo "TEMP_PATH:$TEMP_APP_PATH"
echo "TARGET_APP_PATH:$TARGET_APP_PATH"

cp -rf "$TEMP_APP_PATH/" "$TARGET_APP_PATH"

# 删除不相关的文件
rm -rf "$TARGET_APP_PATH/Plugins"
rm -rf "$TARGET_APP_PATH/Watch"

# 修改infoplist，通过PlistBuddy
/usr/libexec/PlistBuddy -c "Set :CFBundleIdentifier ${PRODUCT_BUNDLE_IDENTIFIER}" "$TARGET_APP_PATH/Info.plist"

# 签名三方的framework
TARGET_FRAMEWORKS_PATH="$TARGET_APP_PATH/Frameworks"

for FRAMEWORK in "$TARGET_FRAMEWORKS_PATH/"*
do 
/usr/bin/codesign --force --sign "$EXPANDED_CODE_SIGN_IDENTITY" "$FRAMEWORK"
done

