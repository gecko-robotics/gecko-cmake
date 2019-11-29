add_executable(main test.cpp)
target_link_libraries(main
    PUBLIC ${PROJECT_NAME}
)
# target_include_directories(main
#     PUBLIC ${PROJECT_NAME}
# )
