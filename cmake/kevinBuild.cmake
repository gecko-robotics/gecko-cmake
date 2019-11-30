# find_package(PkgConfig)

# message(STATUS "hello")

# Threads ---------------------------------------------------------
find_package(Threads REQUIRED)
if(Threads_FOUND)
    message(STATUS ">> C++ threads ${Threads_VERSION} found")
    if(CMAKE_USE_PTHREADS_INIT)
        message(STATUS " -> Using pthreads")
    endif()
else()
    message(WARNING "*** Could not find Threads ***")
endif()
