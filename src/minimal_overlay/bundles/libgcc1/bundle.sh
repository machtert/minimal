#!/bin/bash

set -e

. ../../common.sh

LOCATION=""

if [ -e /lib/x86_64-linux-gnu/libgcc_s.so.1 ]
then
	echo "Found /lib/x86_64-linux-gnu/libgcc_s.so.1"
	LOCATION="/lib/x86_64-linux-gnu/libgcc_s.so.1"
elif [ -e /usr/lib64/libgcc_s.so.1 ] 
then
	echo "/usr/lib64/libgcc_s.so.1"
	LOCATION="/usr/lib64/libgcc_s.so.1"
elif [ -e /lib64/libgcc_s.so.1 ] 
then
	echo "/lib64/libgcc_s.so.1"
	LOCATION="/lib64/libgcc_s.so.1"
else
	echo "Cannot continue - libgcc_s.so.1 is missing. Please install libgcc1 first."
	exit 1
fi

mkdir -p "$WORK_DIR/overlay/$BUNDLE_NAME"
cd $WORK_DIR/overlay/$BUNDLE_NAME

echo "Removing old 'libgcc1' artifacts. This may take a while."
rm -rf $DEST_DIR

mkdir -p $DEST_DIR/lib
cp $LOCATION $DEST_DIR/lib/

echo "Reducing '$BUNDLE_NAME' size."
set +e
strip -g $DEST_DIR/lib/*
set -e

# With '--remove-destination' all possibly existing soft links in
# '$OVERLAY_ROOTFS' will be overwritten correctly.
cp -r --remove-destination $DEST_DIR/* \
  $OVERLAY_ROOTFS

echo "Bundle '$BUNDLE_NAME' has been installed."

cd $SRC_DIR
