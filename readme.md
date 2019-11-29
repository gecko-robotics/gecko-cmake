# CMake Testing

Just playing with CMake ... doesn't do anything useful. I am just trying to
understand CMake better.

## Run

```console
rm -fr * && cmake -DCMAKE_INSTALL_PREFIX=/tmp .. && make
```

## Setup

```
Library
+-- CMakeLists.txt
+-- standalone
|   +-- CMakeLists.txt
|   +-- main.cpp
+-- cmake
|   +-- *-build.cmake
|   +-- *Config.cmake.in
+-- examples
|   +-- CMakeLists.txt
|   +-- test.cpp
+-- include
|   +-- library
|       +-- header.h
|       +-- version.h.in
+-- src
    +-- source.cpp
```

- `*-build.cmake`: Common dependency finding code
- `*Config.cmake.in`: Template CMake for once library is installed
- `version.h.in`: Template to create a header file with the project version in it
- `standalone`: A test of the installed cmake package
