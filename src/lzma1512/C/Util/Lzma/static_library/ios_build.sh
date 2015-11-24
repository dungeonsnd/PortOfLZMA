#!/bin/sh

set -xe

CURRENTPATH=`pwd`

DEVELOPER=`xcode-select -print-path`
DEST="${CURRENTPATH}/lib-ios"
mkdir -p "${DEST}"
export DEST

ARCHS="armv7 armv7s arm64 i386 x86_64"
LIBS="liblzma_util.a"
export LIBS

set +e # don't bail out of bash script if ccache doesn't exist
CCACHE=`which ccache`
if [ $? == "0" ]; then
    echo "Building with ccache: $CCACHE"
    CCACHE="${CCACHE} "
else
    echo "Building without ccache"
    CCACHE=""
fi
set -e # back to regular "bail out on error" mode



for arch in $ARCHS; do
    case $arch in
    arm*)

        IOSV="-miphoneos-version-min=7.0"
        if [ $arch == "arm64" ]
        then
            IOSV="-miphoneos-version-min=7.0"
        fi

        echo "Building for iOS $arch ****************"
        SDKROOT="$(xcrun --sdk iphoneos --show-sdk-path)"
#        CC="$(xcrun --sdk iphoneos -f clang)"
        CC="${CCACHE}`which gcc`"
        CXX="$(xcrun --sdk iphoneos -f clang++)"
        CPP="$(xcrun -sdk iphonesimulator -f clang++)"
        CFLAGS="-isysroot $SDKROOT -arch $arch $IOSV -isystem $SDKROOT/usr/include -fembed-bitcode"
        CXXFLAGS=$CFLAGS
        CPPFLAGS=$CFLAGS
        export CC CXX CFLAGS CXXFLAGS CPPFLAGS SDKROOT

        make -f ios_makefile.gcc
        ;;
    *)
        IOSV="-mios-simulator-version-min=7.0"
        echo "Building for iOS $arch*****************"

        SDKROOT=`xcodebuild -version -sdk iphonesimulator Path`
#        CC="$(xcrun -sdk iphoneos -f clang)"
        CC="${CCACHE}`which gcc`"
        CXX="$(xcrun -sdk iphonesimulator -f clang++)"
        CPP="$(xcrun -sdk iphonesimulator -f clang++)"
        CFLAGS="-isysroot $SDKROOT -arch $arch $IOSV -isystem $SDKROOT/usr/include -fembed-bitcode"
        CXXFLAGS=$CFLAGS
        CPPFLAGS=$CFLAGS
        export CC CXX CFLAGS CXXFLAGS CPPFLAGS

        make -f ios_makefile.gcc
        ;;
    esac

    for i in $LIBS; do
        mv $DEST/$i $DEST/$i.$arch
    done
done

for i in $LIBS; do
    input=""
    for arch in $ARCHS; do
        input="$input $DEST/$i.$arch"
    done
    lipo -create -output $DEST/$i $input
done





