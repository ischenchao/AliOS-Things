NAME := board_bk7231

JTAG := jlink

$(NAME)_MBINS_TYPE := kernel
$(NAME)_VERSION    := 0.0.1
$(NAME)_SUMMARY    := configuration for board bk7231

MODULE               := BK7231
HOST_ARCH            := ARM968E-S
HOST_MCU_FAMILY      := bk7231
SUPPORT_MBINS        := no

$(NAME)_SOURCES := board.c

GLOBAL_INCLUDES += .
GLOBAL_DEFINES  += STDIO_UART=1

CONFIG_SYSINFO_PRODUCT_MODEL := ALI_AOS_BK7231
CONFIG_SYSINFO_DEVICE_NAME   := BK7231


GLOBAL_CFLAGS += -DSYSINFO_PRODUCT_MODEL=\"$(CONFIG_SYSINFO_PRODUCT_MODEL)\"
GLOBAL_CFLAGS += -DSYSINFO_DEVICE_NAME=\"$(CONFIG_SYSINFO_DEVICE_NAME)\"
#GLOBAL_CFLAGS += -DSYSINFO_APP_VERSION=\"$(CONFIG_SYSINFO_APP_VERSION)\"

GLOBAL_LDS_INCLUDES += $(SOURCE_ROOT)/board/bk7231devkitc/bk7231devkitc.ld.S

# Extra build target in aos_standard_targets.mk, include bootloader, and copy output file to eclipse debug file (copy_output_for_eclipse)
EXTRA_TARGET_MAKEFILES +=  $(MAKEFILES_PATH)/aos_standard_targets.mk
EXTRA_TARGET_MAKEFILES +=  $(SOURCE_ROOT)/platform/mcu/$(HOST_MCU_FAMILY)/gen_crc_bin.mk