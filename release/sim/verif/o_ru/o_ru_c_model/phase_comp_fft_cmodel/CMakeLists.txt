cmake_minimum_required (VERSION 3.13)
project (software_model)

# set by user as a hint
set (MPIR_INC_PATH "" CACHE PATH "MPIR include path (hint)")
set (MPIR_LIB_PATH "" CACHE PATH "MPIR library path (hint)")
set (MPFR_INC_PATH "" CACHE PATH "MPFR include path (hint)")
set (MPFR_LIB_PATH "" CACHE PATH "MPFR library path (hint)")

include_directories(".")
add_compile_options("$<$<CONFIG:DEBUG>:-DCSL_DEBUG>")
if (WRITE_STM_FILES)
    add_definitions(-DWRITE_STM_FILES)
endif()
if (MSVC)
else()
    set(CMAKE_POSITION_INDEPENDENT_CODE ON)
endif()

option(USE_MPIR "Include and link against the MPIR library for models that require arbitrary precision" OFF)
option(USE_MPFR "Include and link against the MPFR library for models that require arbitrary precision floating point" OFF)
option(WRITE_STM_FILES "Generate stimulus files at write node boundaries" ON)

include("CMakeFiles.txt")

add_library(common_lib STATIC ${cmodel_common_SRC})
#add_executable(atb_app ${cmodel_atb_SRC})
add_library(fp_phase_comp_fft SHARED ${cmodel_atb_SRC})

target_link_libraries(fp_phase_comp_fft PUBLIC common_lib)
if (MSVC)
    set_property(TARGET atb_app PROPERTY VS_DEBUGGER_WORKING_DIRECTORY "${CMAKE_SOURCE_DIR}")
endif()


if(USE_MPIR)
    find_path(MPIR_INC
        NAMES mpir.h
        HINTS ${MPIR_INC_PATH} "$ENV{DSPBA_ROOTDIR}/backend/include" "$ENV{DSPBA_ROOTDIR}/Libraries/software"
    )
    find_library(MPIR_LIB
        NAMES mpir dspba_mpir
        HINTS ${MPIR_LIB_PATH} "$ENV{DSPBA_ROOTDIR}/backend/lib/windows64" "$ENV{DSPBA_ROOTDIR}/backend/linux64" "$ENV{DSPBA_ROOTDIR}/backend/lib/linux64"
    )
    find_file(MPIR_DLL
        NAMES mpir.dll dspba_mpir.dll libdspba_mpir.so libmpir.so
        PATHS ${MPIR_LIB_PATH} "$ENV{DSPBA_ROOTDIR}/backend/windows64" "$ENV{DSPBA_ROOTDIR}/backend/linux64"
        NO_DEFAULT_PATH
    )

    if(USE_MPIR)
        target_compile_definitions(atb_app PUBLIC CSL_USE_MPIR)
        target_include_directories(atb_app PUBLIC ${MPIR_INC})
        target_link_libraries(atb_app PUBLIC ${MPIR_LIB})
        target_compile_definitions(common_lib PUBLIC CSL_USE_MPIR)
        target_include_directories(common_lib PUBLIC ${MPIR_INC})
        target_link_libraries(common_lib PUBLIC ${MPIR_LIB})
    endif()

    add_custom_command(TARGET atb_app POST_BUILD
        COMMAND ${CMAKE_COMMAND} -E copy_if_different
        "${MPIR_DLL}"
        $<TARGET_FILE_DIR:atb_app>)

endif()

if(USE_MPFR)
    find_path(MPFR_INC
        NAMES mpfr.h
        HINTS ${MPFR_INC_PATH} "$ENV{DSPBA_ROOTDIR}/backend/include" "$ENV{DSPBA_ROOTDIR}/Libraries/software"
    )
    find_library(MPFR_LIB
        NAMES mpfr dspba_mpfr
        HINTS ${MPFR_LIB_PATH} "$ENV{DSPBA_ROOTDIR}/backend/lib/windows64" "$ENV{DSPBA_ROOTDIR}/backend/linux64" "$ENV{DSPBA_ROOTDIR}/backend/lib/linux64"
    )
    find_file(MPFR_DLL
        NAMES mpfr.dll dspba_mpfr.dll libdspba_mpfr.so libmpfr.so
        PATHS ${MPFR_LIB_PATH} "$ENV{DSPBA_ROOTDIR}/backend/windows64" "$ENV{DSPBA_ROOTDIR}/backend/linux64"
        NO_DEFAULT_PATH
    )

    if(USE_MPFR)
        target_compile_definitions(atb_app PUBLIC CSL_USE_MPFR)
        target_include_directories(atb_app PUBLIC ${MPFR_INC})
        target_link_libraries(atb_app PUBLIC ${MPFR_LIB})
        target_compile_definitions(common_lib PUBLIC CSL_USE_MPFR)
        target_include_directories(common_lib PUBLIC ${MPFR_INC})
        target_link_libraries(common_lib PUBLIC ${MPFR_LIB})
    endif()

    add_custom_command(TARGET atb_app POST_BUILD
        COMMAND ${CMAKE_COMMAND} -E copy_if_different
        "${MPFR_DLL}"
        $<TARGET_FILE_DIR:atb_app>)

endif()

#install(TARGETS atb_app common_lib DESTINATION bin)
