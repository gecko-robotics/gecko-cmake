cmake_minimum_required(VERSION 3.10)
project(kevin VERSION 0.1.0 LANGUAGES CXX)

find_package(kevin REQUIRED
    PATHS /tmp/lib/cmake
    NO_DEFAULT_PATH
)
if(kevin_FOUND)
    message(STATUS ">> kevin ${kevin_VERSION} found")
else()
    message(WARNING "*** Could not find kevin ***")
endif()

add_executable(main main.cpp)
target_link_libraries(main
    PUBLIC ${kevin_LIBRARIES}
)
target_include_directories(main
    PUBLIC ${kevin_INCLUDE_DIRS}
)
