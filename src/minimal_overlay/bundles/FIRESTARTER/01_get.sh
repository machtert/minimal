#!/bin/sh

set -e

. ../../common.sh

# Read the common configuration properties.
DOWNLOAD_URL=`read_property FIRESTARTER_URL`
USE_LOCAL_SOURCE=`read_property USE_LOCAL_SOURCE`

# Grab everything after the last '/' character.
ARCHIVE_FILE=${DOWNLOAD_URL##*/}

if [ "$USE_LOCAL_SOURCE" = "true" -a ! -f $MAIN_SRC_DIR/source/overlay/$ARCHIVE_FILE ] ; then
  echo "Source bundle $MAIN_SRC_DIR/source/overlay/$ARCHIVE_FILE is missing and will be downloaded."
  USE_LOCAL_SOURCE="false"
fi

cd $MAIN_SRC_DIR/source/overlay

if [ ! "$USE_LOCAL_SOURCE" = "true" ] ; then
  echo "Downloading FIRESTARTER source files from $DOWNLOAD_URL"
  wget $DOWNLOAD_URL
else
  echo "Using local FIRESTARTER source bundle $MAIN_SRC_DIR/source/overlay/$ARCHIVE_FILE"
fi

# Delete folder with previously extracted FIRESTARTER.
echo "Removing FIRESTARTER work area. This may take a while."
rm -rf $WORK_DIR/overlay/$BUNDLE_NAME
mkdir $WORK_DIR/overlay/$BUNDLE_NAME

# Extract FIRESTARTER to folder 'work/overlay/FIRESTARTER'.
# Full path will be something like 'work/overlay/FIRESTARTER/FIRERSTARTER-1.7.2'.
tar -xvf $ARCHIVE_FILE -C $WORK_DIR/overlay/$BUNDLE_NAME

cd $SRC_DIR
