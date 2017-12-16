

IoT Mesh & Yun Build for Dragino Devices -- Base on Chaos Calmer 15.05 
===============
This repository is a generic OpenWrt version from Dragino devices such as:
[MS14](http://www.dragino.com/products/mother-board.html), [HE](http://www.dragino.com/products/linux-module/item/87-he.html), [LG01](http://www.dragino.com/products/lora/item/117-lg01-p.html),[OLG01](http://www.dragino.com/products/lora/item/118-olg01.html) and [Yun Shield](http://www.dragino.com/products/yunshield.html).

User manual of this version for IoT Build [IoT Mesh Online Manual](http://wiki.dragino.com/index.php?title=IoT_Mesh_Firmware_User_Manual).

User manual of this version for Yun Build [Yun Build Online Manual](http://wiki.dragino.com/index.php?title=Getting_Start_with_Arduino_Yun)

How to compile the image?
===============
``` bash
git clone https://github.com/dragino/openwrt-cc-15.05.git openwrt-cc-15.05
cd openwrt-cc-15.05
./set_up_build_environment.sh
#build default IoT App on openwrt directory
./build_image.sh -a IoT

#build default Yun App on openwrt directory
./build_image.sh -a yun
```

After complination, the images can be found on **openwrt-cc-15.05/image** folder. The folder includes:
- dragino-xxx--vxxxx-kernel.bin  kernel files, for upgrade in u-boot
- dragino-xxx--vxxxx-rootfs-squashfs.bin    rootfs file, for upgrade in u-boot
- dragino-xxx--vxxxx-squashfs-sysupgrade.bin   sysupgrade file, used for web-ui upgrade
- md5sum  md5sum for above files


More build option can be viewed by running:
``` bash
./build_image.sh -h
```

How to debug if build fails?
===============
``` bash
./build_image.sh -a yun -s
```
Above commands will enable verbose and build in single thread to get a view of the error during build. 


How to customized a build?
===============
As a example, if user want to customize a build named mybuild. mybuild include different packages and default files from the default build. User can do as below:
To customize the packages 
``` bash
cd barrier_breaker
# run make menuconfig to select the packages and save
make menuconfig
#Copy the new config to TOP dir and rename it to .config.mybuild
cp .config .config.mybuild
```
To customize default files
``` bash
#create default files in TOP dir
mkdir files-mybuild
#put files into this directory. 
#for example, if user want the final build has a default config file /etc/config/network. user can 
#put /etc/config/network into the files-mybuild directory (include directory /etc and /etc/config)
```

Then run the customzied build by running:
``` bash
./build_image.sh -a mybuild
```
The build process will auto overwrite the default files or pacakges with the customized one. User can customize only default files or pacakges. The build will use the default from IoT build if not specify. 

Have Fun!

Dragino Technology
