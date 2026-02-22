# Use all dependencies from vcpkg instead of FetchContent
find_package(expected-lite CONFIG REQUIRED)
find_package(variant-lite CONFIG REQUIRED)
find_package(optional-lite CONFIG REQUIRED)
find_package(string-view-lite CONFIG REQUIRED)
find_package(fmt CONFIG REQUIRED)
find_package(RapidJSON CONFIG REQUIRED)
find_package(nlohmann_json CONFIG REQUIRED)

# Create interface target for RapidJSON to match expected target name
add_library(RapidJson INTERFACE)
target_link_libraries(RapidJson INTERFACE rapidjson)

install (TARGETS RapidJson
    EXPORT InstallTargets
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}/static
)
