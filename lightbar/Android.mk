LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_SRC_FILES := lightbar.c 

LOCAL_SHARED_LIBRARIES := liblog
LOCAL_STATIC_LIBRARIES := libz
LOCAL_CFLAGS := -Werror

LOCAL_MODULE := lightbar

include $(BUILD_EXECUTABLE)

