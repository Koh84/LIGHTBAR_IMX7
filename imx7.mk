$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/generic.mk)
$(call inherit-product, $(TOPDIR)frameworks/base/data/sounds/AllAudio.mk)
# overrides
PRODUCT_BRAND := Android
PRODUCT_MANUFACTURER := freescale

# Android infrastructures
PRODUCT_PACKAGES += \
	LiveWallpapers				\
	mysimptest \
	naruto_test	\
	lightbar				\
	lightrotate				\
	LiveWallpapersPicker			\
	MagicSmokeWallpapers			\
	FSLOta					\
	ethernet                                \
	libpxp                            \
	FSLProfileApp				\
	FSLProfileService			\
	VisualizationWallpapers			\
	CubeLiveWallpapers			\
	PinyinIME				\
	libjni_pinyinime        		\
	libRS					\
	librs_jni				\
	chat					\
	ip-up-vpn				\
	wpa_supplicant				\
	wpa_supplicant				\
	wpa_supplicant.conf			\
	libion \
	vndk-sp

PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.vndk.version=26.1.0 \

# Debug utils
PRODUCT_PACKAGES += \
	taskset					\
	sqlite3

# Wifi AP mode
PRODUCT_PACKAGES += \
	hostapd 				\
	hostapd_cli

#audio related lib
PRODUCT_PACKAGES += \
	audio.primary.imx7			\
	tinyplay				\
	audio.a2dp.default			\
	audio.usb.default			\
	tinycap					\
	tinymix					\
	libsrec_jni				\
	libtinyalsa 				\
	libaudioutils

# imx7 Hardware HAL libs.
PRODUCT_PACKAGES += \
	gralloc.imx7				\
	overlay.imx7				\
	hwcomposer.imx7				\
	lights.imx7				\
	camera.imx7				\
	power.imx7				\
	audio.r_submix.default			\
	libbt-vendor				\
	conrfidsyshw.default	\
	libbt-vendor-broadcom			\
	magd                                    \
	fsl_sensor_fusion

# RFID Service / damon
PRODUCT_PACKAGES += \
	rfidmanagerd \
	rfidmanagerd.conf

# Memtrack HAL
PRODUCT_PACKAGES += \
	memtrack.imx7 \
	android.hardware.memtrack@1.0-impl \
	android.hardware.memtrack@1.0-service

PRODUCT_PACKAGES += \
	libedid

# camera related libs
PRODUCT_PACKAGES += \
       camera.device@1.0-impl          \
	camera.device@3.2-impl          \
	android.hardware.camera.provider@2.4-impl \
	android.hardware.camera.provider@2.4-service

# drm related lib
PRODUCT_PACKAGES += \
	drmserver                   		\
	libdrmframework_jni         		\
	libdrmframework             		\
	libdrmpassthruplugin        		\
	libfwdlockengine

# gpu debug tool
PRODUCT_PACKAGES += \
	gmem_info

# Omx related libs, please align to device/fsl/proprietary/omx/fsl-omx.mk
omx_libs := \
	core_register					\
	component_register				\
	contentpipe_register				\
	fslomx.cfg					\
	media_profiles_V1_0.xml				\
	media_codecs.xml				\
    media_codecs_performance.xml  \
	ComponentRegistry.txt				\
	lib_omx_player_arm11_elinux			 \
	lib_omx_client_arm11_elinux			\
	lib_omx_core_mgr_v2_arm11_elinux		\
	lib_omx_core_v2_arm11_elinux			\
	lib_omx_osal_v2_arm11_elinux			\
	lib_omx_common_v2_arm11_elinux			\
	lib_omx_utils_v2_arm11_elinux			\
	lib_omx_res_mgr_v2_arm11_elinux			\
	lib_omx_clock_v2_arm11_elinux			\
	lib_omx_local_file_pipe_v2_arm11_elinux		\
	lib_omx_shared_fd_pipe_arm11_elinux		\
	lib_omx_async_write_pipe_arm11_elinux		\
	lib_omx_https_pipe_arm11_elinux			\
	lib_omx_fsl_parser_v2_arm11_elinux		\
	lib_omx_wav_parser_v2_arm11_elinux		\
	lib_omx_mp3_parser_v2_arm11_elinux		\
	lib_omx_aac_parser_v2_arm11_elinux		\
	lib_omx_flac_parser_v2_arm11_elinux		\
	lib_omx_pcm_dec_v2_arm11_elinux			\
	lib_omx_mp3_dec_v2_arm11_elinux			\
	lib_omx_aac_dec_v2_arm11_elinux			\
	lib_omx_amr_dec_v2_arm11_elinux			\
	lib_omx_vorbis_dec_v2_arm11_elinux		\
	lib_omx_flac_dec_v2_arm11_elinux		\
	lib_omx_audio_processor_v2_arm11_elinux		\
	lib_omx_sorenson_dec_v2_arm11_elinux		\
	lib_omx_android_audio_render_arm11_elinux	\
	lib_omx_audio_fake_render_arm11_elinux		\
	lib_omx_ipulib_render_arm11_elinux		\
	lib_omx_tunneled_decoder_arm11_elinux           \
	lib_avi_parser_arm11_elinux.3.0			\
	lib_divx_drm_arm11_elinux			\
	lib_mp4_parser_arm11_elinux.3.0			\
	lib_mkv_parser_arm11_elinux.3.0			\
	lib_flv_parser_arm11_elinux.3.0			\
	lib_id3_parser_arm11_elinux			\
	lib_wav_parser_arm11_elinux			\
	lib_mp3_parser_v2_arm11_elinux			\
	lib_aac_parser_arm11_elinux			\
	lib_flac_parser_arm11_elinux			\
	lib_mp3_dec_v2_arm12_elinux			\
	lib_aac_dec_v2_arm12_elinux			\
	lib_flac_dec_v2_arm11_elinux			\
	lib_nb_amr_dec_v2_arm9_elinux			\
	lib_oggvorbis_dec_v2_arm11_elinux		\
	lib_peq_v2_arm11_elinux				\
	lib_mpg2_parser_arm11_elinux.3.0		\
	libstagefrighthw				\
	libxec						\
	lib_omx_vpu_v2_arm11_elinux			\
	lib_omx_vpu_dec_v2_arm11_elinux			\
	lib_vpu_wrapper					\
	lib_ogg_parser_arm11_elinux.3.0		\
	libfslxec					\
	lib_omx_overlay_render_arm11_elinux             \
	lib_omx_fsl_muxer_v2_arm11_elinux \
	lib_omx_mp3_enc_v2_arm11_elinux \
	lib_omx_amr_enc_v2_arm11_elinux \
	lib_omx_android_audio_source_arm11_elinux \
	lib_omx_camera_source_arm11_elinux \
	lib_mp4_muxer_arm11_elinux \
	lib_mp3_enc_v2_arm12_elinux \
	lib_nb_amr_enc_v2_arm11_elinux \
	lib_omx_vpu_enc_v2_arm11_elinux \
	lib_ffmpeg_arm11_elinux	\
	lib_omx_https_pipe_v2_arm11_elinux \
	lib_omx_https_pipe_v3_arm11_elinux \
	lib_omx_udps_pipe_arm11_elinux \
	lib_omx_rtps_pipe_arm11_elinux \
	lib_omx_streaming_parser_arm11_elinux \
	lib_omx_surface_render_arm11_elinux \
	lib_omx_surface_source_arm11_elinux \
	libfsl_jpeg_enc_arm11_elinux \
	lib_wb_amr_enc_arm11_elinux \
	lib_wb_amr_dec_arm9_elinux \
	lib_omx_aac_enc_v2_arm11_elinux \
	lib_amr_parser_arm11_elinux.3.0 \
	lib_aac_parser_arm11_elinux.3.0 \
	lib_aacd_wrap_arm12_elinux_android \
	lib_mp3d_wrap_arm12_elinux_android \
	lib_vorbisd_wrap_arm11_elinux_android \
	lib_mp3_parser_arm11_elinux.3.0 \
	lib_flac_parser_arm11_elinux.3.0 \
	lib_wav_parser_arm11_elinux.3.0 \
	lib_omx_ac3toiec937_arm11_elinux \
        lib_omx_ec3_dec_v2_arm11_elinux \
	lib_omx_libav_video_dec_arm11_elinux \
	libavcodec \
	libavutil \
        libswresample \
	lib_omx_libav_audio_dec_arm11_elinux \
    lib_omx_soft_hevc_dec_arm11_elinux \
    lib_ape_parser_arm11_elinux.3.0 \



# Omx excluded libs
omx_excluded_libs :=					\
	lib_asf_parser_arm11_elinux.3.0			\
	lib_wma10_dec_v2_arm12_elinux		\
	lib_WMV789_dec_v2_arm11_elinux		\
	lib_aacplus_dec_v2_arm11_elinux			\
	lib_ac3_dec_v2_arm11_elinux			\
	\
	lib_omx_wma_dec_v2_arm11_elinux			\
	lib_omx_wmv_dec_v2_arm11_elinux			\
	lib_omx_ac3_dec_v2_arm11_elinux			\
	lib_wma10d_wrap_arm12_elinux_android \
	lib_aacplusd_wrap_arm12_elinux_android \
	lib_ac3d_wrap_arm11_elinux_android \
        lib_ddpd_wrap_arm12_elinux_android \
        lib_ddplus_dec_v2_arm12_elinux \
        lib_realad_wrap_arm11_elinux_android \
        lib_realaudio_dec_v2_arm11_elinux \
        lib_rm_parser_arm11_elinux.3.0 \
        lib_omx_ra_dec_v2_arm11_elinux \



PRODUCT_PACKAGES += $(omx_libs) $(omx_excluded_libs)

PRODUCT_PACKAGES += libubi ubinize ubiformat ubiattach ubidetach ubiupdatevol ubimkvol ubinfo mkfs_ubifs 

# FUSE based emulated sdcard daemon
PRODUCT_PACKAGES += sdcard

# e2fsprogs libs
PRODUCT_PACKAGES += \
	mke2fs		\
	libext2_blkid	\
	libext2_com_err	\
	libext2_e2p	\
	libext2_profile	\
	libext2_uuid	\
	libext2fs

# ntfs-3g binary
PRODUCT_PACKAGES += \
	ntfs-3g		\
	ntfsfix 	

# for CtsVerifier
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

PRODUCT_AAPT_CONFIG := normal mdpi

PRODUCT_PACKAGES += \
    charger_res_images \
    charger

PRODUCT_PACKAGES += \
    libGLES_android

PRODUCT_PACKAGES += \
    fsck.f2fs mkfs.f2fs

PRODUCT_PACKAGES += \
    slideshow \
    verity_warning_images

# display libs
PRODUCT_PACKAGES += \
    libdrm_android \
    libfsldisplay

PRODUCT_COPY_FILES +=	\
	device/fsl/common/input/Dell_Dell_USB_Keyboard.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/Dell_Dell_USB_Keyboard.kl \
	device/fsl/common/input/Dell_Dell_USB_Keyboard.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/Dell_Dell_USB_Keyboard.idc \
	device/fsl/common/input/Dell_Dell_USB_Entry_Keyboard.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/Dell_Dell_USB_Entry_Keyboard.idc \
	device/fsl/common/input/eGalax_Touch_Screen.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/eGalax_Touch_Screen.idc \
	device/fsl/common/input/eGalax_Touch_Screen.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/HannStar_P1003_Touchscreen.idc \
	device/fsl/common/input/eGalax_Touch_Screen.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/Novatek_NT11003_Touch_Screen.idc \
	device/fsl/common/input/eGalax_Touch_Screen.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/ADS7846_Touchscreen.idc \
	system/core/rootdir/init.rc:root/init.rc \
	device/fsl/imx7/etc/init.usb.rc:root/init.freescale.usb.rc \
	device/fsl/imx7/etc/ota.conf:$(TARGET_COPY_OUT_VENDOR)/etc/ota.conf \
	device/fsl/imx7/init.recovery.freescale.rc:root/init.recovery.freescale.rc \
    $(FSL_PROPRIETARY_PATH)/fsl-proprietary/media-profile/media_codecs_google_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_audio.xml \
    $(FSL_PROPRIETARY_PATH)/fsl-proprietary/media-profile/media_codecs_google_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video.xml \
    $(FSL_PROPRIETARY_PATH)/fsl-proprietary/media-profile/media_codecs_google_telephony.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_telephony.xml \

PRODUCT_COPY_FILES += \
	$(IMX_FIRMWARE_PATH)/imx-firmware/brcm/ZP_BCM4339/BCM4335C0.ZP.hcd:vendor/firmware/bcm/Type_ZP.hcd	\
	$(IMX_FIRMWARE_PATH)/imx-firmware/brcm/ZP_BCM4339/fw_bcmdhd.bin:vendor/firmware/bcm/fw_bcmdhd.bin	\
	$(IMX_FIRMWARE_PATH)/imx-firmware/brcm/ZP_BCM4339/fw_bcmdhd.bin:vendor/firmware/bcm/fw_bcmdhd_apsta.bin	\
	$(IMX_FIRMWARE_PATH)/imx-firmware/brcm/1BW_BCM43340/BCM43341B0.1BW.hcd:vendor/firmware/bcm/1BW_BCM43340/BCM43341B0.1BW.hcd 	\
	$(IMX_FIRMWARE_PATH)/imx-firmware/brcm/1BW_BCM43340/fw_bcmdhd.bin:vendor/firmware/bcm/1BW_BCM43340/fw_bcmdhd.bin 	\
	$(IMX_FIRMWARE_PATH)/imx-firmware/brcm/1DX_BCM4343W/BCM43430A1.1DX.hcd:vendor/firmware/bcm/1DX_BCM4343W/BCM43430A1.1DX.hcd 	\
	$(IMX_FIRMWARE_PATH)/imx-firmware/brcm/1DX_BCM4343W/fw_bcmdhd.bin:vendor/firmware/bcm/1DX_BCM4343W/fw_bcmdhd.bin 	\
	$(IMX_FIRMWARE_PATH)/imx-firmware/brcm/1DX_BCM4343W/fw_bcmdhd.bin:vendor/firmware/bcm/1DX_BCM4343W/fw_bcmdhd_apsta.bin 	\
	$(IMX_FIRMWARE_PATH)/imx-firmware/brcm/SN8000_BCM43362/fw_bcmdhd.bin:vendor/firmware/bcm/SN8000_BCM43362/fw_bcmdhd.bin 	\
	$(IMX_FIRMWARE_PATH)/imx-firmware/brcm/SN8000_BCM43362/fw_bcmdhd.bin:vendor/firmware/bcm/SN8000_BCM43362/fw_bcmdhd_apsta.bin 	\

# include the rpmsg kernel driver
PRODUCT_COPY_FILES += \
	device/fsl/evk_7ulp/imx_rpmsg_tty.ko:system/modules/imx_rpmsg_tty.ko

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# for property
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	persist.sys.usb.config=mtp

# enlarge media max memory size to 3G.
PRODUCT_PROPERTY_OVERRIDES += \
        ro.media.maxmem=3221225472

#this makes imx7 wifionly devices
PRODUCT_PROPERTY_OVERRIDES += \
        ro.radio.noril=yes

# Freescale multimedia parser related prop setting
# Define fsl avi/aac/asf/mkv/flv/flac format support
PRODUCT_PROPERTY_OVERRIDES += \
    ro.FSL_AVI_PARSER=1 \
    ro.FSL_AAC_PARSER=1 \
    ro.FSL_FLV_PARSER=1 \
    ro.FSL_MKV_PARSER=1 \
    ro.FSL_FLAC_PARSER=1 \
    ro.FSL_MPG2_PARSER=1 \

PRODUCT_DEFAULT_DEV_CERTIFICATE := \
        device/fsl/common/security/testkey

# In userdebug, add minidebug info the the boot image and the system server to support
# diagnosing native crashes.
ifneq (,$(filter userdebug, $(TARGET_BUILD_VARIANT)))
    # Boot image.
    PRODUCT_DEX_PREOPT_BOOT_FLAGS += --generate-mini-debug-info
    # System server and some of its services.
    # Note: we cannot use PRODUCT_SYSTEM_SERVER_JARS, as it has not been expanded at this point.
    $(call add-product-dex-preopt-module-config,services,--generate-mini-debug-info)
    $(call add-product-dex-preopt-module-config,wifi-service,--generate-mini-debug-info)
endif

# include a google recommand heap config file.
include frameworks/native/build/tablet-7in-hdpi-1024-dalvik-heap.mk

-include device/google/gapps/gapps.mk
-include $(FSL_RESTRICTED_CODEC_PATH)/fsl-restricted-codec/fsl_real_dec/fsl_real_dec.mk
-include $(FSL_RESTRICTED_CODEC_PATH)/fsl-restricted-codec/fsl_ms_codec/fsl_ms_codec.mk


## navigation bar at the bottom for eng builds only or via
## set/getproperty and reboot.
user_variant := $(filter eng,$(TARGET_BUILD_VARIANT))

ifeq ($(user_variant),eng)
  PRODUCT_PROPERTY_OVERRIDES += persist.navigationbar=1
else
  # disable bottom navigatoin bar
  PRODUCT_PROPERTY_OVERRIDES += persist.navigationbar=0
endif
