# Copyright 1994-2017 The MathWorks, Inc.
#
# File    : raccel_unix.tmf   
#
# Abstract:
#	Template makefile for building a UNIX-based "rapid acceleration"
#       executable from the generated C code.
#
# 	This makefile attempts to conform to the guidelines specified in the
# 	IEEE Std 1003.2-1992 (POSIX) standard. It is designed to be used
#       with GNU Make which is located in matlabroot/rtw/bin.
#
# 	Note that this template is automatically customized by the build
#       procedure to create "<model>.mk"
#
#       The following defines can be used to modify the behavior of the
#	build:
#	  OPT_OPTS       - Optimization options. Default is -O.
#	  CPP_OPTS       - C++ compiler options.
#	  OPTS           - User specific compile options.
#	  USER_SRCS      - Additional user sources, such as files needed by
#			   S-functions.
#	  USER_INCLUDES  - Additional include paths
#			   (i.e. USER_INCLUDES="-Iwhere-ever -Iwhere-ever2")
#
#       To enable debugging:
#         set DEBUG_BUILD = 1 below, which will trigger OPTS=-g and
#          LDFLAGS += -g (may vary with compiler version, see compiler doc)
#
#       This template makefile is designed to be used with a system target
#       file that contains 'rtwgensettings.BuildDirSuffix' see raccel.tlc

#------------------------ Macros read by make_rtw ------------------------------
#
# The following macros are read by the build procedure:
#
#  MAKECMD         - This is the command used to invoke the make utility
#  HOST            - What platform this template makefile is targeted for
#                    (i.e. PC or UNIX)
#  BUILD           - Invoke make from the build procedure (yes/no)?
#  SYS_TARGET_FILE - Name of system target file.

MAKECMD         = /Applications/MATLAB_R2018a.app/bin/maci64/gmake
HOST            = UNIX
BUILD           = yes
SYS_TARGET_FILE = raccel.tlc
BUILD_SUCCESS	= *** Created
COMPILER_TOOL_CHAIN = unix

# Opt in to simplified format by specifying compatible Toolchain
TOOLCHAIN_NAME = ["Clang v3.1 | gmake (64-bit Mac)", \
             "GNU gcc/g++ v4.4.x | gmake (64-bit Linux)"]

#---------------------- Tokens expanded by make_rtw ----------------------------
#
# The following tokens, when wrapped with "|>" and "<|" are expanded by the
# build procedure.
#
#  MODEL_NAME          - Name of the Simulink block diagram
#  MODEL_MODULES       - Any additional generated source modules
#  MAKEFILE_NAME       - Name of makefile created from template makefile <model>.mk
#  MATLAB_ROOT         - Path to where MATLAB is installed.
#  S_FUNCTIONS         - List of S-functions.
#  S_FUNCTIONS_LIB     - List of S-functions libraries to link.
#  COMPUTER            - Computer type. See the MATLAB computer command.
#  BUILDARGS           - Options passed in at the command line.
#  TGT_FCN_LIB         - Target Funtion library to use


MODEL                  = ModelNL1
MODULES                = rt_logging.c ModelNL1.c ModelNL1_capi.c ModelNL1_data.c ModelNL1_tgtconn.c rtGetInf.c rtGetNaN.c rt_nonfinite.c rt_logging_mmi.c rtw_modelmap_utils.c raccel_main_new.c raccel_sup.c raccel_mat.c simulink_solver_api.c raccel_utils.c common_utils.c ext_svr.c updown.c ext_work.c rtiostream_interface.c rtiostream_tcpip.c
MAKEFILE               = ModelNL1.mk
MATLAB_ROOT            = /Applications/MATLAB_R2018a.app
ALT_MATLAB_ROOT        = /Applications/MATLAB_R2018a.app
MATLAB_ROOTQ           = \"/Applications/MATLAB_R2018a.app\"
MASTER_ANCHOR_DIR      = 
START_DIR              = /Users/leonardopedroso/Desktop/CEE/Lab
S_FUNCTIONS            = rtiostream_utils.c
S_FUNCTIONS_LIB        = $(MATLAB_ROOT)/bin/maci64/libmwcoder_target_services.dylib $(MATLAB_ROOT)/bin/maci64/libmwcoder_ParamTuningTgtAppSvc.dylib
COMPUTER               = MACI64
BUILDARGS              =  RSIM_SOLVER_SELECTION=2 PCMATLABROOT="/Applications/MATLAB_R2018a.app" EXTMODE_STATIC_ALLOC=0 EXTMODE_STATIC_ALLOC_SIZE=1000000 EXTMODE_TRANSPORT=0 TMW_EXTMODE_TESTING=0 COMBINE_OUTPUT_UPDATE_FCNS=0 INCLUDE_MDL_TERMINATE_FCN=1 MULTI_INSTANCE_CODE=0 ISPROTECTINGMODEL=NOTPROTECTING OPTS="-DSLMSG_ALLOW_SYSTEM_ALLOC -DTGTCONN -DEXT_MODE -DON_TARGET_WAIT_FOR_START=0"
RSIM_PARAMETER_LOADING = 1
ENABLE_SLEXEC_SSBRIDGE = 1


SOLVER              = 
SOLVER_TYPE         = VariableStep
NUMST               = 2
TID01EQ             = 0
NCSTATES            = 10
MULTITASKING        = 0
TGT_FCN_LIB         = None

MODELREFS           = 
SHARED_SRC          = 
SHARED_SRC_DIR      = 
SHARED_BIN_DIR      = 
SHARED_LIB          = 
OPTIMIZATION_FLAGS  = -O0 -DNDEBUG
ADDITIONAL_LDFLAGS  = 
DEFINES_CUSTOM      = 

RACCEL_PARALLEL_EXECUTION = 0
RACCEL_PARALLEL_EXECUTION_NUM_THREADS = 2
RACCEL_NUM_PARALLEL_NODES = 0
RACCEL_PARALLEL_SIMULATOR_TYPE = 0

MODEL_HAS_DYNAMICALLY_LOADED_SFCNS = 0

# To enable debugging:
# set DEBUG_BUILD = 1
DEBUG_BUILD             = 0


#--------------------------- Model and reference models -----------------------
MODELLIB                  = ModelNL1lib.a
MODELREF_LINK_LIBS        = 
MODELREF_INC_PATH         = 
RELATIVE_PATH_TO_ANCHOR   = ../../..
# NONE: standalone, SIM: modelref sim, RTW: modelref coder target
MODELREF_TARGET_TYPE       = NONE

GLOBAL_TIMING_ENGINE       = 0

#-- In the case when directory name contains space ---
ifneq ($(MATLAB_ROOT),$(ALT_MATLAB_ROOT))
MATLAB_ROOT := $(ALT_MATLAB_ROOT)
endif

#--------------------------- Solver ---------------------------------------------
RSIM_WITH_SL_SOLVER = 1

#--------------------------- Tool Specifications -------------------------------

include $(MATLAB_ROOT)/rtw/c/tools/unixtools.mk

#------------------------------Parameter Tuning---------------------------------
PARAM_CC_OPTS = -DRSIM_PARAMETER_LOADING

#------------------------------ Include Path -----------------------------------

MATLAB_INCLUDES = \
	-I$(MATLAB_ROOT)/simulink/include \
	-I$(MATLAB_ROOT)/extern/include \
	-I$(MATLAB_ROOT)/rtw/c/src \
	-I$(MATLAB_ROOT)/rtw/c/src/rapid \
	-I$(MATLAB_ROOT)/rtw/c/raccel \
	-I$(MATLAB_ROOT)/rtw/c/src/ext_mode/common

# Additional includes

ADD_INCLUDES = \
	-I$(START_DIR) \
	-I$(START_DIR)/slprj/raccel/ModelNL1 \
	-I$(MATLAB_ROOT)/rtw/c/src/rtiostream/rtiostreamtcpip \
	-I$(MATLAB_ROOT)/toolbox/coder/rtiostream/src/utils \



SHARED_INCLUDES =
ifneq ($(SHARED_SRC_DIR),)
SHARED_INCLUDES = -I$(SHARED_SRC_DIR)
endif

INCLUDES = -I. -I$(RELATIVE_PATH_TO_ANCHOR)  $(MATLAB_INCLUDES) $(ADD_INCLUDES) $(USER_INCLUDES) \
	$(INSTRUMENT_INCLUDES) 	$(MODELREF_INC_PATH) $(SHARED_INCLUDES)

#-------------------------------- C Flags --------------------------------------

# Optimization Options
ifndef OPT_OPTS
OPT_OPTS = $(DEFAULT_OPT_OPTS)
endif

# General User Options
ifeq ($(DEBUG_BUILD),0)
DBG_FLAG =
else
#   Set OPTS=-g and any additional flags for debugging
DBG_FLAG = -g
LDFLAGS += -g
endif

# Compiler options, etc:
ifneq ($(OPTIMIZATION_FLAGS),)
CC_OPTS = $(OPTS)  $(PARAM_CC_OPTS) $(OPTIMIZATION_FLAGS)
else
CC_OPTS = $(OPT_OPTS) $(OPTS)  $(PARAM_CC_OPTS)
endif

CPP_REQ_DEFINES = -DMODEL=$(MODEL) -DHAVESTDIO -DUNIX

CPP_REQ_DEFINES += -DNRT \
                   -DRSIM_WITH_SL_SOLVER

ifneq ($(ENABLE_SLEXEC_SSBRIDGE), 0)
   CPP_REQ_DEFINES += -DENABLE_SLEXEC_SSBRIDGE=$(ENABLE_SLEXEC_SSBRIDGE)
endif

CPP_REQ_DEFINES += -DMODEL_HAS_DYNAMICALLY_LOADED_SFCNS=$(MODEL_HAS_DYNAMICALLY_LOADED_SFCNS)

ifeq ($(RACCEL_PARALLEL_EXECUTION), 1)
   CPP_REQ_DEFINES += -DRACCEL_ENABLE_PARALLEL_EXECUTION \
		      -DRACCEL_PARALLEL_EXECUTION_NUM_THREADS=$(RACCEL_PARALLEL_EXECUTION_NUM_THREADS) \
		      -DRACCEL_NUM_PARALLEL_NODES=$(RACCEL_NUM_PARALLEL_NODES) \
		      -DRACCEL_PARALLEL_SIMULATOR_TYPE=$(RACCEL_PARALLEL_SIMULATOR_TYPE)
endif

ifeq ($(MULTITASKING),1)
    CPP_REQ_DEFINES += -DRSIM_WITH_SOLVER_MULTITASKING \
                       -DTID01EQ=$(TID01EQ) \
	               -DNUMST=$(NUMST)
endif

CFLAGS = $(ANSI_OPTS) $(DBG_FLAG) $(CC_OPTS) $(DEFINES_CUSTOM) $(CPP_REQ_DEFINES) $(INCLUDES)
CPPFLAGS = $(CPP_ANSI_OPTS) $(DBG_FLAG) $(CPP_OPTS) $(CC_OPTS) $(DEFINES_CUSTOM) $(CPP_REQ_DEFINES) $(INCLUDES)

# g1593309
ifneq (,$(findstring MAC,$(COMPUTER)))
    GCC_WALL_FLAG += -Wno-invalid-source-encoding
endif

#----------------------------- Source Files ------------------------------------
USER_SRCS =
SRC_DEP =
ifeq ($(MODELREF_TARGET_TYPE), NONE)
    PRODUCT            = $(MODEL)
    BIN_SETTING        = $(LD) $(LDFLAGS) -o $(PRODUCT)
    BUILD_PRODUCT_TYPE = "executable"
    REQ_SRCS = $(MODULES)

else
   # Model reference coder target
   PRODUCT            = $(MODELLIB)
   BUILD_PRODUCT_TYPE = "library"
   REQ_SRCS = $(MODULES)
endif

USER_OBJS       = $(addsuffix .o, $(basename $(USER_SRCS)))
LOCAL_USER_OBJS = $(notdir $(USER_OBJS))

SRCS = $(REQ_SRCS) $(S_FUNCTIONS)

OBJS      = $(addsuffix .o, $(basename $(SRCS))) $(USER_OBJS)
LINK_OBJS = $(addsuffix .o, $(basename $(SRCS))) $(LOCAL_USER_OBJS)

SHARED_SRC := $(wildcard $(SHARED_SRC))
SHARED_OBJS = $(addsuffix .o, $(basename $(SHARED_SRC)))

#--------------------------- Link flags & libraries ----------------------------

SYSLIBS =  -lm -ldl

LIBS =
 
LIBS += $(S_FUNCTIONS_LIB) $(INSTRUMENT_LIBS)

BINDIR = $(MATLAB_ROOT)/bin/$(ARCH)
MATLIBS=

ifneq (,$(findstring GLNX,$(COMPUTER)))
  MATLIBS = -Wl,-rpath,$(BINDIR) -Wl,-rpath,$(MATLAB_ROOT)/sys/os/$(ARCH) -L$(BINDIR) -L$(MATLAB_ROOT)/sys/os/$(ARCH)
  ifneq ($(ENABLE_SLEXEC_SSBRIDGE), 0)
    MATLIBS += -Wl,-lmwslexec_simbridge
  else
    MATLIBS += -Wl,-lmwsl_solver_rtw
  endif
  ifeq ($(RACCEL_PARALLEL_EXECUTION), 1)
    MATLIBS += -Wl,-lmwslexec_parallel
  endif

  MATLIBS += -Wl,-lmwsl_fileio
  MATLIBS += -Wl,-lmwsl_services
  MATLIBS += -Wl,-lmwsigstream,-lmwslio_core,-lmwslio_clients -lmwslexec_simlog
  MATLIBS += -Wl,-lmat,-lmx,-lmex,-lut,-lmwmathutil
  MATLIBS += -L$(MATLAB_ROOT)/bin/$(ARCH) -lmwipp -lpthread

    ifeq ($(MODEL_HAS_DYNAMICALLY_LOADED_SFCNS), 1)
      MATLIBS += -Wl,-lmwsl_sfcn_loader
    endif
endif

ifneq (,$(findstring MAC,$(COMPUTER)))
 LD = $(CPP)
 LDFLAGS += $(ADDITIONAL_LDFLAGS)
 MATLIBS = -Wl,-rpath,$(BINDIR) -Wl,-rpath,@executable_path -Wl,-rpath,@executable_path/$(RELATIVE_PATH_TO_ANCHOR) -L$(BINDIR) -L$(MATLAB_ROOT)/sys/os/$(ARCH)
  ifneq ($(ENABLE_SLEXEC_SSBRIDGE), 0)
    MATLIBS += -lmwslexec_simbridge
  else 
  MATLIBS += -lmwsl_solver_rtw 
  endif
  ifeq ($(RACCEL_PARALLEL_EXECUTION), 1)
    MATLIBS += -lmwslexec_parallel
  endif
  MATLIBS += -lmwsl_fileio
  MATLIBS += -lmwsl_services
  MATLIBS += -lmwsigstream -lmwslio_core -lmwslio_clients -lmwslexec_simlog
  MATLIBS += -lmat -lmx -lmex -lut -lmwmathutil
  MATLIBS += -L$(MATLAB_ROOT)/bin/$(ARCH) -lmwipp -lpthread

  ifeq ($(MODEL_HAS_DYNAMICALLY_LOADED_SFCNS), 1)
    MATLIBS += -Wl,-lmwsl_sfcn_loader
  endif
endif

ifeq ($(MATLIBS),)
   err:
	@echo
	@echo "### ERROR: Platform $(COMPUTER) is not supported"
	@echo
endif

# Put this after the above error check so that this only appears in the Makefile
# once so TMF expansion works correctly.  If this were above the error check,
# the error check would be meaningless.
MATLIBS += -lmwsl_log_load_blocks
MATLIBS += -lfixedpoint
MATLIBS += -lmwsl_AsyncioQueue
MATLIBS += -lmwsl_simtarget_instrumentation
MATLIBS += -lmwsdi_raccel


#--------------------------------- Rules ---------------------------------------

ifeq ($(MODELREF_TARGET_TYPE),NONE)
$(PRODUCT) : $(OBJS)  $(SHARED_LIB) $(LIBS)  $(MODELREF_LINK_LIBS)
	$(BIN_SETTING) $(LINK_OBJS) $(MODELREF_LINK_LIBS) $(SHARED_LIB) \
		$(LIBS) $(MATLIBS) $(ADDITIONAL_LDFLAGS) $(SYSLIBS)
else
$(PRODUCT) : $(OBJS) $(SHARED_LIB)
	@rm -f $@
	$(AR) ruvs $@ $(LINK_OBJS)
endif
	@echo "$(BUILD_SUCCESS) $(BUILD_PRODUCT_TYPE): $@"

#-------------------------- Standard rules for building modules --------------

ifneq ($(SHARED_SRC_DIR),)
$(SHARED_BIN_DIR)/%.o : $(SHARED_SRC_DIR)/%.c
	cd $(SHARED_BIN_DIR); $(CC) -c $(CFLAGS) $(GCC_WALL_FLAG_MAX) $(notdir $?)

$(SHARED_BIN_DIR)/%.o : $(SHARED_SRC_DIR)/%.cpp
	cd $(SHARED_BIN_DIR); $(CPP) -c $(CPPFLAGS) $(GCC_WALL_FLAG_MAX) $(notdir $?)
endif

%.o : %.c
	$(CC) -c -o $(@F) $(CFLAGS) $(GCC_WALL_FLAG) "$<"

%.o : %.cpp
	$(CPP) -c $(CPPFLAGS)$(GCC_WALL_FLAG)  "$<"

%.o : $(RELATIVE_PATH_TO_ANCHOR)/%.c
	$(CC) -c -o $(@F) $(CFLAGS) $(GCC_WALL_FLAG) "$<"

%.o : $(RELATIVE_PATH_TO_ANCHOR)/%.cpp
	$(CPP) -c $(CPPFLAGS) $(GCC_WALL_FLAG) "$<"

%.o : $(MATLAB_ROOT)/rtw/c/raccel/%.c
	$(CC) -c $(CFLAGS) $(GCC_WALL_FLAG_MAX) "$<"

%.o : $(MATLAB_ROOT)/rtw/c/src/%.c
	$(CC) -c $(CFLAGS) $(GCC_WALL_FLAG_MAX) "$<"

%.o : $(MATLAB_ROOT)/rtw/c/src/rapid/%.c
	$(CC) -c $(CFLAGS) $(GCC_WALL_FLAG_MAX) "$<"

simulink_solver_api.o : $(MATLAB_ROOT)/simulink/include/simulink_solver_api.c
	$(CC) -c $(CFLAGS) $(GCC_WALL_FLAG_MAX) "$<"

%.o : $(MATLAB_ROOT)/rtw/c/src/%.c
	$(CC) -c $(CFLAGS) $(GCC_WALL_FLAG_MAX) "$<"

%.o : $(MATLAB_ROOT)/simulink/src/%.c
	$(CC) -c $(CFLAGS) $(GCC_WALL_FLAG_MAX) "$<"

%.o : $(MATLAB_ROOT)/rtw/c/src/ext_mode/common/%.c
	$(CC) -c $(CFLAGS) $(GCC_WALL_FLAG_MAX) "$<"

%.o : $(MATLAB_ROOT)/rtw/c/src/rtiostream/rtiostreamtcpip/%.c
	$(CC) -c $(CFLAGS) $(GCC_WALL_FLAG_MAX) "$<"

%.o : $(MATLAB_ROOT)/toolbox/coder/rtiostream/src/utils/%.c
	$(CC) -c $(CFLAGS) $(GCC_WALL_FLAG_MAX) "$<"




%.o : $(MATLAB_ROOT)/rtw/c/src/%.cpp
	$(CPP) -c $(CPPFLAGS) "$<"
%.o : $(MATLAB_ROOT)/simulink/src/%.cpp
	$(CPP) -c $(CPPFLAGS) "$<"
%.o : $(MATLAB_ROOT)/rtw/c/src/ext_mode/common/%.cpp
	$(CPP) -c $(CPPFLAGS) "$<"
%.o : $(MATLAB_ROOT)/rtw/c/src/rtiostream/rtiostreamtcpip/%.cpp
	$(CPP) -c $(CPPFLAGS) "$<"
%.o : $(MATLAB_ROOT)/toolbox/coder/rtiostream/src/utils/%.cpp
	$(CPP) -c $(CPPFLAGS) "$<"


%.o : $(MATLAB_ROOT)/simulink/src/%.c
	$(CC) -c $(CFLAGS) $(GCC_WALL_FLAG_MAX) "$<"

%.o : $(MATLAB_ROOT)/simulink/src/%.cpp
	@$(GCC_TEST_CMD) "$<" $(GCC_TEST_OUT)
	$(CPP) -c $(CPPFLAGS) "$<"

# Libraries:





#----------------------------- Dependencies ------------------------------------

$(OBJS) : $(MAKEFILE) rtw_proj.tmw


$(SHARED_LIB) : $(SHARED_OBJS)
	$(AR) ruvs $@ $(SHARED_OBJS)

