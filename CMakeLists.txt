cmake_minimum_required(VERSION 3.10)
project(kevin VERSION 0.1.0 LANGUAGES CXX)

# have a common find dependency command
include("cmake/kevinBuild.cmake")

add_library(${PROJECT_NAME} SHARED src/kevin.cpp)
target_include_directories(${PROJECT_NAME}
    PUBLIC
        ${CMAKE_SOURCE_DIR}/include
        ${PROJECT_BINARY_DIR}/include
    #     $<INSTALL_INTERFACE:"${CMAKE_INSTALL_PREFIX}/include">
    # PRIVATE
    #     $<BUILD_INTERFACE:"${PROJECT_BINARY_DIR}/include>"
    #     $<BUILD_INTERFACE:"${CMAKE_CURRENT_SOURCE_DIR}/include>"
        # $<INSTALL_INTERFACE:"${CMAKE_INSTALL_PREFIX}/include">
)

add_subdirectory(examples)

# use cmake to create a version header file
configure_file (
    "${PROJECT_SOURCE_DIR}/include/kevin/version.h.in"
    "${PROJECT_BINARY_DIR}/include/kevin/version.h"
)

install(
    TARGETS ${PROJECT_NAME}
    # EXPORT ${PROJECT_NAME}-targets
    LIBRARY DESTINATION ${CMAKE_INSTALL_PREFIX}/lib
    ARCHIVE DESTINATION ${CMAKE_INSTALL_PREFIX}/lib
    RUNTIME DESTINATION ${CMAKE_INSTALL_PREFIX}/bin
    # INCLUDES DESTINATION ${CMAKE_INSTALL_PREFIX}/include
)

install(DIRECTORY ${CMAKE_SOURCE_DIR}/include ${PROJECT_BINARY_DIR}/include
  DESTINATION ${CMAKE_INSTALL_PREFIX}
  FILES_MATCHING PATTERN "*.h*"
  PATTERN "*.in" EXCLUDE
)

include(CMakePackageConfigHelpers)
write_basic_package_version_file(
    ${PROJECT_NAME}ConfigVersion.cmake
    VERSION ${PACKAGE_VERSION}
    COMPATIBILITY AnyNewerVersion
)
configure_file(
    cmake/${PROJECT_NAME}Config.cmake.in
    ${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}Config.cmake
    @ONLY
)
install(
    FILES
        "${CMAKE_SOURCE_DIR}/cmake/${PROJECT_NAME}Build.cmake"
        "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}Config.cmake"
        "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}ConfigVersion.cmake"
    DESTINATION ${CMAKE_INSTALL_PREFIX}/lib/cmake/${PROJECT_NAME}
)

# EXPORT and TARGETS ===================================================
# install(
#     EXPORT ${PROJECT_NAME}-targets
#     FILE ${PROJECT_NAME}Targets.cmake
#     NAMESPACE ${PROJECT_NAME}::
#     DESTINATION ${CMAKE_INSTALL_PREFIX}/lib/cmake/${PROJECT_NAME}
#     # DESTINATION ${PROJECT_BINARY_DIR}
# )
#
# export(
#     TARGETS ${PROJECT_NAME}
#     NAMESPACE ${PROJECT_NAME}::
#     FILE "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}Targets.cmake"
#     # DESTINATION ${CMAKE_INSTALL_PREFIX}/lib/cmake/${PROJECT_NAME}
# )
#
# export(PACKAGE ${PROJECT_NAME})
