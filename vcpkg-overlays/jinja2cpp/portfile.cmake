vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO dexter4life/Jinja2Cpp
    REF 2053cfabfafaeab65aff0bc083a83b105a939202
    SHA512 0b89080674ff316406777865a41440e101167543c439e29b7b56febe42f373dfa4f83e9011e735d911ed02527998cec94aa02ccafcb26a453dc4142dcae7ea30
    HEAD_REF master
    PATCHES
    fix-fetchcontent-install-paths.patch
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
    -DJINJA2CPP_BUILD_TESTS=OFF
    -DJINJA2CPP_DEPS_MODE=external-boost
    -DJINJA2CPP_WITH_JSON_BINDINGS=boost
    -DJINJA2CPP_USE_REGEX=boost
    -DJINJA2CPP_INSTALL=ON
    -DJINJA2CPP_STRICT_WARNINGS=OFF
    -DFETCHCONTENT_FULLY_DISCONNECTED=OFF
    -DFMT_INSTALL=OFF
    -DRAPIDJSON_BUILD_DOC=OFF
    -DRAPIDJSON_BUILD_EXAMPLES=OFF
    -DRAPIDJSON_BUILD_TESTS=OFF
)

vcpkg_cmake_install()

# Remove bundled deps that conflict with vcpkg packages
file(REMOVE_RECURSE
    "${CURRENT_PACKAGES_DIR}/include/fmt"
    "${CURRENT_PACKAGES_DIR}/include/rapidjson"
    "${CURRENT_PACKAGES_DIR}/include/nonstd"
    "${CURRENT_PACKAGES_DIR}/lib/libfmt.a"
    "${CURRENT_PACKAGES_DIR}/lib/cmake/fmt"
    "${CURRENT_PACKAGES_DIR}/lib/cmake/RapidJSON"
    "${CURRENT_PACKAGES_DIR}/lib/cmake/expected-lite"
    "${CURRENT_PACKAGES_DIR}/lib/cmake/optional-lite"
    "${CURRENT_PACKAGES_DIR}/lib/cmake/string-view-lite"
    "${CURRENT_PACKAGES_DIR}/lib/cmake/variant-lite"
    "${CURRENT_PACKAGES_DIR}/lib/pkgconfig/fmt.pc"
    "${CURRENT_PACKAGES_DIR}/lib/pkgconfig/RapidJSON.pc"
    "${CURRENT_PACKAGES_DIR}/debug/include"
    "${CURRENT_PACKAGES_DIR}/debug/lib/libfmtd.a"
    "${CURRENT_PACKAGES_DIR}/debug/lib/cmake"
    "${CURRENT_PACKAGES_DIR}/debug/lib/pkgconfig/fmt.pc"
    "${CURRENT_PACKAGES_DIR}/debug/lib/pkgconfig/RapidJSON.pc"
    "${CURRENT_PACKAGES_DIR}/debug/share"
    "${CURRENT_PACKAGES_DIR}/share/doc"
    "${CURRENT_PACKAGES_DIR}/share/pkgconfig"
)

vcpkg_cmake_config_fixup(CONFIG_PATH lib/jinja2cpp)

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")