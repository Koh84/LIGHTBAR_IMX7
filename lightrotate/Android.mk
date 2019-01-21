LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_SRC_FILES := lightrotate.c 

LOCAL_SHARED_LIBRARIES := liblog
LOCAL_STATIC_LIBRARIES := libz
LOCAL_CFLAGS := -Werror

LOCAL_MODULE := lightrotate

include $(BUILD_EXECUTABLE)

