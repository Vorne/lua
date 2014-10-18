####################################################################################################
#
# Make lua library
#
####################################################################################################

PROJECT_DIR = .
BUILD_DIR ?= ../build-internal
export BUILD_DIR

SOURCE_DIR = $(PROJECT_DIR)/src
INCLUDE_DIR = $(PROJECT_DIR)/src

# Include base makefile after setting directories
#
-include $(BUILD_DIR)/Makefile.base.mk

######################################################################################
### Local information

PROJECT_BASE_NAME = lua

include $(BUILD_DIR)/Makefile.library.mk
