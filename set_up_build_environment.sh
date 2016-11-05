#!/usr/bin/env bash
#Set up build environment for Dragino v2. Only need to run once on first compile. 

OPENWRT_PATH=openwrt

while getopts 'p:v:sh' OPTION
do
	case $OPTION in
	p)	OPENWRT_PATH="$OPTARG"
		;;
	h|?)	printf "Set Up build environment for MS14, HE \n\n"
		printf "Usage: %s [-p <openwrt_source_path>]\n" $(basename $0) >&2
		printf "	-p: set up build path, default path = dragino\n"
		printf "\n"
		exit 1
		;;
	esac
done

shift $(($OPTIND - 1))

REPO_PATH=$(pwd)


sudo apt-get install npm

echo " "
echo "*** Update the feeds (See ./feeds-update.log)"
sleep 2
$OPENWRT_PATH/scripts/feeds update
sleep 2
echo " "

echo " "
echo "replace some packages with local source"
echo " "
#rm -rf $OPENWRT_PATH/feeds/oldpackages/utils/avrdude
#rm -rf $OPENWRT_PATH/feeds/packages/utils/rng-tools
#rm -rf $OPENWRT_PATH/feeds/packages/net/mosquitto
#cp -r replacement-pkgs/avrdude $OPENWRT_PATH/feeds/oldpackages/utils/
#cp -r replacement-pkgs/rng-tools $OPENWRT_PATH/feeds/packages/utils/
#cp -r replacement-pkgs/mosquitto $OPENWRT_PATH/feeds/packages/net/

echo "*** Install OpenWrt packages"
sleep 10
$OPENWRT_PATH/scripts/feeds install -a
echo " "


echo " "
echo "*** Install OpenWrt CC 15.05 patches"
cp cc_1505_patch/903-ar933x_uart_baud_max_step_fix.patch $OPENWRT_PATH/target/linux/ar71xx/patches-3.18/
#cp bb_1407_patch/730-MIPS-ath79-add-dragino-siod-support.patch $OPENWRT_PATH/target/linux/ar71xx/patches-3.18/
echo " "

#Remove tmp directory
#rm -rf $OPENWRT_PATH/tmp/


echo "*** Change to build directory"
cd $OPENWRT_PATH
echo " "

echo "*** Run make defconfig to set up initial .config file (see ./defconfig.log)"
make defconfig > ./defconfig.log

# Backup the .config file
cp .config .config.orig
echo " "

echo "End of script"
