#!/bin/bash

# اسم أيقونة الشعار عالية الدقة للنسخة الطرفية
SOURCE_ICON="gt-usdr-cli-icon.png"
APPDIR="GT-USDR-CLI.AppDir"
ICON_SIZES=(16 32 64 128 256 512)

echo "🎨 توليد الأيقونات للنسخة الطرفية..."

# إنشاء مجلد الأيقونات الأساسي
mkdir -p "$APPDIR/usr/share/icons/hicolor"

for size in "${ICON_SIZES[@]}"; do
    TARGET_DIR="$APPDIR/usr/share/icons/hicolor/${size}x${size}/apps"
    mkdir -p "$TARGET_DIR"
    if command -v magick &> /dev/null; then
        magick "$SOURCE_ICON" -resize ${size}x${size} "$TARGET_DIR/gt-usdr-cli-icon.png"
        echo "✅ تم إنشاء: $TARGET_DIR/gt-usdr-cli-icon.png"
    else
        echo "❌ ImageMagick غير مثبت. يرجى تثبيته أولاً."
        exit 1
    fi
done

# إنشاء رابط رمزي للأيقونة الأساسية (256x256)
mkdir -p "$APPDIR"
ln -sf "usr/share/icons/hicolor/256x256/apps/gt-usdr-cli-icon.png" "$APPDIR/gt-usdr-cli-icon.png"

echo "🎉 تم توليد جميع الأيقونات للنسخة الطرفية بنجاح."
