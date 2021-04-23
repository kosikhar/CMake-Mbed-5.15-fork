CMAKE_MINIMUM_REQUIRED(VERSION 3.9)

set(CMAKE_ASM_COMPILER "arm-none-eabi-gcc")
set(CMAKE_C_COMPILER "arm-none-eabi-gcc")
set(CMAKE_CXX_COMPILER "arm-none-eabi-g++")
set(ELF2BIN "arm-none-eabi-objcopy")

add_definitions(-include $ENV{CMAKE_MAIN_PROJECT_DIR}/mbed_config.h)

# uncomment below to have a verbose build process
#SET(CMAKE_VERBOSE_MAKEFILE ON)

set(CMAKE_STATIC_LIBRARY_PREFIX "")
set(CMAKE_STATIC_LIBRARY_SUFFIX "")
set(CMAKE_FIND_LIBRARY_PREFIXES ${CMAKE_STATIC_LIBRARY_PREFIX})
set(CMAKE_FIND_LIBRARY_SUFFIXES ${CMAKE_STATIC_LIBRARY_SUFFIX})

# if the environment does not specify build type, set to Debug
IF(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE "Debug"
            CACHE STRING "Choose the type of build, options are: Debug Release RelWithDebInfo MinSizeRel."
            FORCE)
ENDIF()

SET(CMAKE_SYSTEM_NAME Generic)
#SET(CMAKE_SYSTEM_PROCESSOR arm)
SET(CMAKE_CROSSCOMPILING TRUE)
# force compiler settings
SET(CMAKE_C_COMPILER_WORKS TRUE)
SET(CMAKE_CXX_COMPILER_WORKS TRUE)

#Add Definitions
add_definitions(
        -DARM_MATH_CM4
        -DSTM32L432xx
        -DTARGET_CORTEX
        -DTARGET_CORTEX_M
        -DTARGET_FAMILY_STM32
        -DTARGET_LIKE_CORTEX_M4
        -DTARGET_M4
        -DTARGET_NAME=NUCLEO_L432KC
        -DTARGET_NUCLEO_L432KC
        -DTARGET_RELEASE
        -DTARGET_RTOS_M4_M7
        -DTARGET_STM
        -DTARGET_STM32L4
        -DTARGET_STM32L432KC
        -DTARGET_STM32L432xC
        -DTOOLCHAIN_GCC
        -DTOOLCHAIN_GCC_ARM
        -D__CORTEX_M4
        -D__FPU_PRESENT=1
)

string (REPLACE ";" " " LIBRARIES_TO_LINK_STR "${LIBRARIES_TO_LINK}")

SET(LD_SYS_LIBS "-Wl,--start-group -lstdc++ -lsupc++ -lm -lc -lgcc -lnosys ${LIBRARIES_TO_LINK_STR} -Wl,--end-group")
SET(CMAKE_C_FLAGS "-std=gnu11 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fmessage-length=0 -fno-exceptions -ffunction-sections -fdata-sections -funsigned-char -MMD -fomit-frame-pointer -Os -g -DMBED_TRAP_ERRORS_ENABLED=${TRAP_ERRORS} -mcpu=cortex-m4 -mthumb -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -DMBED_ROM_START=0x8000000 -DMBED_ROM_SIZE=0x40000 -DMBED_RAM_START=0x20000000 -DMBED_RAM_SIZE=0xc000 -DMBED_RAM1_START=0x10000000 -DMBED_RAM1_SIZE=0x4000")
SET(CMAKE_CXX_FLAGS "-std=gnu++14 -fno-rtti -Wvla -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fmessage-length=0 -fno-exceptions -ffunction-sections -fdata-sections -funsigned-char -MMD -fomit-frame-pointer -Os -g -DMBED_TRAP_ERRORS_ENABLED=${TRAP_ERRORS} -mcpu=cortex-m4 -mthumb -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -DMBED_ROM_START=0x8000000 -DMBED_ROM_SIZE=0x40000 -DMBED_RAM_START=0x20000000 -DMBED_RAM_SIZE=0xc000 -DMBED_RAM1_START=0x10000000 -DMBED_RAM1_SIZE=0x4000")
SET(CMAKE_ASM_FLAGS "-x assembler-with-cpp -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fmessage-length=0 -fno-exceptions -ffunction-sections -fdata-sections -funsigned-char -MMD -fomit-frame-pointer -Os -g -DMBED_TRAP_ERRORS_ENABLED=${TRAP_ERRORS} -mcpu=cortex-m4 -mthumb -mfpu=fpv4-sp-d16 -mfloat-abi=softfp")
SET(CMAKE_CXX_LINK_FLAGS "-Wl,--gc-sections -Wl,--wrap,main -Wl,--wrap,__malloc_r -Wl,--wrap,__free_r -Wl,--wrap,__realloc_r -Wl,--wrap,__memalign_r -Wl,--wrap,__calloc_r -Wl,--wrap,exit -Wl,--wrap,atexit -Wl,-n -mcpu=cortex-m4 -mthumb -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fmessage-length=0 -fno-exceptions -ffunction-sections -fdata-sections -funsigned-char -MMD -fomit-frame-pointer -Os -g -DMBED_TRAP_ERRORS_ENABLED=${TRAP_ERRORS} -mcpu=cortex-m4 -mthumb -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -DMBED_ROM_START=0x8000000 -DMBED_ROM_SIZE=0x40000 -DMBED_RAM_START=0x20000000 -DMBED_RAM_SIZE=0xc000 -DMBED_RAM1_START=0x10000000 -DMBED_RAM1_SIZE=0x4000 -DMBED_BOOT_STACK_SIZE=1024 ")
SET(CMAKE_CXX_LINK_FLAGS "${CMAKE_CXX_LINK_FLAGS} ${LD_SYS_LIBS} -Wl,--print-memory-usage -T ${CMAKE_BINARY_DIR}/${PROJECT_TITLE}_pp.link_script.ld")
SET(ENV{PROJECT_LINKER_SCRIPT_FILE} $ENV{MBED_DIR}/targets/TARGET_STM/TARGET_STM32L4/TARGET_STM32L432xC/device/TOOLCHAIN_GCC_ARM/STM32L432XX.ld  )


message("*** LOADED STM32L432.cmake ***\n")
message("LD_SYS_LIBS: " ${LD_SYS_LIBS})
message("CMAKE_C_FLAGS: " ${CMAKE_C_FLAGS})
message("CMAKE_ASM_FLAGS: " ${CMAKE_ASM_FLAGS})
message("CMAKE_CXX_FLAGS: " ${CMAKE_CXX_FLAGS})
message("CMAKE_CXX_LINK_FLAGS: " ${CMAKE_CXX_LINK_FLAGS})
message("")