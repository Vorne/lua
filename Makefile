####################################################################################################
#
# Make lua library
#
####################################################################################################

BUILD_DIR ?= ../build-internal
PROJECT_DIR = .
export BUILD_DIR

SOURCE_DIR = $(PROJ_DIR)/src
INCLUDE_DIR = $(PROJ_DIR)/src

# Include base makefile after setting directories
#
-include $(BUILD_DIR)/Makefile.base.mk


# Only use implicit rules created in this file.
#
.SUFFIXES:

# We begin by specifying the default make target:  this target will be made if make
# is run without any parameters.
#
.DEFAULT_GOAL := all


test:
	$(MAKE) -f Makefile.test test

testclean:
	$(MAKE) -f Makefile.test clean

######################################################################################
### Local information

# Turn on exceptions
#
PROJECTFLAGS += --exceptions
PROJECTFLAGS += -DUSING_EXCEPTIONS=1
LDPROJECTFLAGS += --exceptions

ifeq "$(USING_OPTIMIZATION)" "1"
PROJECTFLAGS += -O2 -Otime
else
PROJECTFLAGS += -O0
AUTOMATED_TESTING ?= 1
endif

PROJECT_BASE_NAME = lua


include $(BUILD_DIR)/Makefile.library.mk
