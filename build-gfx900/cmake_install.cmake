# Install script for directory: /home/limonene/ROCm-project/ollama-src

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/opt/rocm/llvm/bin/llvm-objdump")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/limonene/ROCm-project/ollama-src/build-gfx900/ml/backend/ggml/ggml/src/cmake_install.cmake")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "CPU" OR NOT CMAKE_INSTALL_COMPONENT)
  foreach(file
      "$ENV{DESTDIR}/usr/local/lib/ollama/libggml-base.so.0.0.0"
      "$ENV{DESTDIR}/usr/local/lib/ollama/libggml-base.so.0"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      file(RPATH_CHECK
           FILE "${file}"
           RPATH "")
    endif()
  endforeach()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/lib/ollama/libggml-base.so.0.0.0;/usr/local/lib/ollama/libggml-base.so.0")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/lib/ollama" TYPE SHARED_LIBRARY FILES
    "/home/limonene/ROCm-project/ollama-src/build-gfx900/lib/ollama/libggml-base.so.0.0.0"
    "/home/limonene/ROCm-project/ollama-src/build-gfx900/lib/ollama/libggml-base.so.0"
    )
  foreach(file
      "$ENV{DESTDIR}/usr/local/lib/ollama/libggml-base.so.0.0.0"
      "$ENV{DESTDIR}/usr/local/lib/ollama/libggml-base.so.0"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      if(CMAKE_INSTALL_DO_STRIP)
        execute_process(COMMAND "/opt/rocm/llvm/bin/llvm-strip" "${file}")
      endif()
    endif()
  endforeach()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "CPU" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/lib/ollama/libggml-base.so")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/lib/ollama" TYPE SHARED_LIBRARY FILES "/home/limonene/ROCm-project/ollama-src/build-gfx900/lib/ollama/libggml-base.so")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "CPU" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}/usr/local/lib/ollama/libggml-cpu-alderlake.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/local/lib/ollama/libggml-cpu-alderlake.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}/usr/local/lib/ollama/libggml-cpu-alderlake.so"
         RPATH "")
  endif()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/lib/ollama/libggml-cpu-alderlake.so")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/lib/ollama" TYPE MODULE FILES "/home/limonene/ROCm-project/ollama-src/build-gfx900/lib/ollama/libggml-cpu-alderlake.so")
  if(EXISTS "$ENV{DESTDIR}/usr/local/lib/ollama/libggml-cpu-alderlake.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/local/lib/ollama/libggml-cpu-alderlake.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}/usr/local/lib/ollama/libggml-cpu-alderlake.so"
         OLD_RPATH "/home/limonene/ROCm-project/ollama-src/build-gfx900/lib/ollama:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/opt/rocm/llvm/bin/llvm-strip" "$ENV{DESTDIR}/usr/local/lib/ollama/libggml-cpu-alderlake.so")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "CPU" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}/usr/local/lib/ollama/libggml-cpu-haswell.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/local/lib/ollama/libggml-cpu-haswell.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}/usr/local/lib/ollama/libggml-cpu-haswell.so"
         RPATH "")
  endif()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/lib/ollama/libggml-cpu-haswell.so")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/lib/ollama" TYPE MODULE FILES "/home/limonene/ROCm-project/ollama-src/build-gfx900/lib/ollama/libggml-cpu-haswell.so")
  if(EXISTS "$ENV{DESTDIR}/usr/local/lib/ollama/libggml-cpu-haswell.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/local/lib/ollama/libggml-cpu-haswell.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}/usr/local/lib/ollama/libggml-cpu-haswell.so"
         OLD_RPATH "/home/limonene/ROCm-project/ollama-src/build-gfx900/lib/ollama:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/opt/rocm/llvm/bin/llvm-strip" "$ENV{DESTDIR}/usr/local/lib/ollama/libggml-cpu-haswell.so")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "CPU" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}/usr/local/lib/ollama/libggml-cpu-icelake.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/local/lib/ollama/libggml-cpu-icelake.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}/usr/local/lib/ollama/libggml-cpu-icelake.so"
         RPATH "")
  endif()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/lib/ollama/libggml-cpu-icelake.so")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/lib/ollama" TYPE MODULE FILES "/home/limonene/ROCm-project/ollama-src/build-gfx900/lib/ollama/libggml-cpu-icelake.so")
  if(EXISTS "$ENV{DESTDIR}/usr/local/lib/ollama/libggml-cpu-icelake.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/local/lib/ollama/libggml-cpu-icelake.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}/usr/local/lib/ollama/libggml-cpu-icelake.so"
         OLD_RPATH "/home/limonene/ROCm-project/ollama-src/build-gfx900/lib/ollama:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/opt/rocm/llvm/bin/llvm-strip" "$ENV{DESTDIR}/usr/local/lib/ollama/libggml-cpu-icelake.so")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "CPU" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}/usr/local/lib/ollama/libggml-cpu-sandybridge.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/local/lib/ollama/libggml-cpu-sandybridge.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}/usr/local/lib/ollama/libggml-cpu-sandybridge.so"
         RPATH "")
  endif()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/lib/ollama/libggml-cpu-sandybridge.so")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/lib/ollama" TYPE MODULE FILES "/home/limonene/ROCm-project/ollama-src/build-gfx900/lib/ollama/libggml-cpu-sandybridge.so")
  if(EXISTS "$ENV{DESTDIR}/usr/local/lib/ollama/libggml-cpu-sandybridge.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/local/lib/ollama/libggml-cpu-sandybridge.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}/usr/local/lib/ollama/libggml-cpu-sandybridge.so"
         OLD_RPATH "/home/limonene/ROCm-project/ollama-src/build-gfx900/lib/ollama:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/opt/rocm/llvm/bin/llvm-strip" "$ENV{DESTDIR}/usr/local/lib/ollama/libggml-cpu-sandybridge.so")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "CPU" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}/usr/local/lib/ollama/libggml-cpu-skylakex.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/local/lib/ollama/libggml-cpu-skylakex.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}/usr/local/lib/ollama/libggml-cpu-skylakex.so"
         RPATH "")
  endif()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/lib/ollama/libggml-cpu-skylakex.so")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/lib/ollama" TYPE MODULE FILES "/home/limonene/ROCm-project/ollama-src/build-gfx900/lib/ollama/libggml-cpu-skylakex.so")
  if(EXISTS "$ENV{DESTDIR}/usr/local/lib/ollama/libggml-cpu-skylakex.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/local/lib/ollama/libggml-cpu-skylakex.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}/usr/local/lib/ollama/libggml-cpu-skylakex.so"
         OLD_RPATH "/home/limonene/ROCm-project/ollama-src/build-gfx900/lib/ollama:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/opt/rocm/llvm/bin/llvm-strip" "$ENV{DESTDIR}/usr/local/lib/ollama/libggml-cpu-skylakex.so")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "CPU" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}/usr/local/lib/ollama/libggml-cpu-sse42.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/local/lib/ollama/libggml-cpu-sse42.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}/usr/local/lib/ollama/libggml-cpu-sse42.so"
         RPATH "")
  endif()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/lib/ollama/libggml-cpu-sse42.so")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/lib/ollama" TYPE MODULE FILES "/home/limonene/ROCm-project/ollama-src/build-gfx900/lib/ollama/libggml-cpu-sse42.so")
  if(EXISTS "$ENV{DESTDIR}/usr/local/lib/ollama/libggml-cpu-sse42.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/local/lib/ollama/libggml-cpu-sse42.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}/usr/local/lib/ollama/libggml-cpu-sse42.so"
         OLD_RPATH "/home/limonene/ROCm-project/ollama-src/build-gfx900/lib/ollama:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/opt/rocm/llvm/bin/llvm-strip" "$ENV{DESTDIR}/usr/local/lib/ollama/libggml-cpu-sse42.so")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "CPU" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}/usr/local/lib/ollama/libggml-cpu-x64.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/local/lib/ollama/libggml-cpu-x64.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}/usr/local/lib/ollama/libggml-cpu-x64.so"
         RPATH "")
  endif()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/lib/ollama/libggml-cpu-x64.so")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/lib/ollama" TYPE MODULE FILES "/home/limonene/ROCm-project/ollama-src/build-gfx900/lib/ollama/libggml-cpu-x64.so")
  if(EXISTS "$ENV{DESTDIR}/usr/local/lib/ollama/libggml-cpu-x64.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/local/lib/ollama/libggml-cpu-x64.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}/usr/local/lib/ollama/libggml-cpu-x64.so"
         OLD_RPATH "/home/limonene/ROCm-project/ollama-src/build-gfx900/lib/ollama:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/opt/rocm/llvm/bin/llvm-strip" "$ENV{DESTDIR}/usr/local/lib/ollama/libggml-cpu-x64.so")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "CPU" OR NOT CMAKE_INSTALL_COMPONENT)
  file(GET_RUNTIME_DEPENDENCIES
    RESOLVED_DEPENDENCIES_VAR _CMAKE_DEPS
    LIBRARIES
      "/home/limonene/ROCm-project/ollama-src/build-gfx900/lib/ollama/libggml-base.so"
    MODULES
      "/home/limonene/ROCm-project/ollama-src/build-gfx900/lib/ollama/libggml-cpu-alderlake.so"
      "/home/limonene/ROCm-project/ollama-src/build-gfx900/lib/ollama/libggml-cpu-haswell.so"
      "/home/limonene/ROCm-project/ollama-src/build-gfx900/lib/ollama/libggml-cpu-icelake.so"
      "/home/limonene/ROCm-project/ollama-src/build-gfx900/lib/ollama/libggml-cpu-sandybridge.so"
      "/home/limonene/ROCm-project/ollama-src/build-gfx900/lib/ollama/libggml-cpu-skylakex.so"
      "/home/limonene/ROCm-project/ollama-src/build-gfx900/lib/ollama/libggml-cpu-sse42.so"
      "/home/limonene/ROCm-project/ollama-src/build-gfx900/lib/ollama/libggml-cpu-x64.so"
    PRE_EXCLUDE_REGEXES
      ".*"
    POST_EXCLUDE_FILES_STRICT
      "/home/limonene/ROCm-project/ollama-src/build-gfx900/lib/ollama/libggml-base.so"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "CPU" OR NOT CMAKE_INSTALL_COMPONENT)
  foreach(_CMAKE_TMP_dep IN LISTS _CMAKE_DEPS)
    foreach(_cmake_abs_file IN LISTS _CMAKE_TMP_dep)
      get_filename_component(_cmake_abs_file_name "${_cmake_abs_file}" NAME)
      list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES "/usr/local/lib/ollama/${_cmake_abs_file_name}")
    endforeach()
    unset(_cmake_abs_file_name)
    unset(_cmake_abs_file)
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "/usr/local/lib/ollama" TYPE SHARED_LIBRARY FILES ${_CMAKE_TMP_dep}
      FOLLOW_SYMLINK_CHAIN)
  endforeach()
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/limonene/ROCm-project/ollama-src/build-gfx900/ml/backend/ggml/ggml/src/ggml-hip/cmake_install.cmake")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "HIP" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}/usr/local/lib/ollama/libggml-hip.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/local/lib/ollama/libggml-hip.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}/usr/local/lib/ollama/libggml-hip.so"
         RPATH "")
  endif()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/lib/ollama/libggml-hip.so")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/lib/ollama" TYPE MODULE FILES "/home/limonene/ROCm-project/ollama-src/build-gfx900/lib/ollama/libggml-hip.so")
  if(EXISTS "$ENV{DESTDIR}/usr/local/lib/ollama/libggml-hip.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/local/lib/ollama/libggml-hip.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}/usr/local/lib/ollama/libggml-hip.so"
         OLD_RPATH "/home/limonene/ROCm-project/ollama-src/build-gfx900/lib/ollama:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/opt/rocm/llvm/bin/llvm-strip" "$ENV{DESTDIR}/usr/local/lib/ollama/libggml-hip.so")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "HIP" OR NOT CMAKE_INSTALL_COMPONENT)
  file(GET_RUNTIME_DEPENDENCIES
    RESOLVED_DEPENDENCIES_VAR _CMAKE_DEPS
    MODULES
      "/home/limonene/ROCm-project/ollama-src/build-gfx900/lib/ollama/libggml-hip.so"
    DIRECTORIES
      "/opt/rocm/bin"
      "/opt/rocm/lib"
    PRE_INCLUDE_REGEXES
      "hipblas"
      "rocblas"
      "amdhip64"
      "rocsolver"
      "amd_comgr"
      "hsa-runtime64"
      "rocsparse"
      "tinfo"
      "rocprofiler-register"
      "roctx64"
      "rocroller"
      "drm"
      "drm_amdgpu"
      "numa"
      "elf"
    PRE_EXCLUDE_REGEXES
      ".*"
    POST_EXCLUDE_REGEXES
      "system32"
    POST_EXCLUDE_FILES_STRICT
      "/home/limonene/ROCm-project/ollama-src/build-gfx900/lib/ollama/libggml-base.so"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "HIP" OR NOT CMAKE_INSTALL_COMPONENT)
  foreach(_CMAKE_TMP_dep IN LISTS _CMAKE_DEPS)
    foreach(_cmake_abs_file IN LISTS _CMAKE_TMP_dep)
      get_filename_component(_cmake_abs_file_name "${_cmake_abs_file}" NAME)
      list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES "/usr/local/lib/ollama/${_cmake_abs_file_name}")
    endforeach()
    unset(_cmake_abs_file_name)
    unset(_cmake_abs_file)
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "/usr/local/lib/ollama" TYPE SHARED_LIBRARY FILES ${_CMAKE_TMP_dep}
      FOLLOW_SYMLINK_CHAIN)
  endforeach()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "HIP" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/lib/ollama//rocblas")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/lib/ollama/" TYPE DIRECTORY FILES "/opt/rocm/lib/rocblas")
endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/home/limonene/ROCm-project/ollama-src/build-gfx900/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
