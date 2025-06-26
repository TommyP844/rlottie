
project "rlottie"
    kind "StaticLib"
    language "C++"
    cppdialect "C++17"
    staticruntime "off"
    location ""
    architecture "x64"

    includedirs {
        "inc",
        "src",
        "src/vector",
        "src/vector/freetype",
        "src/lottie",
        "src/binding",
        "src/common",
        "src/svg",
        "external",
        "vs2019",
    }

    defines {
        "PATH_MAX=260",
        "RLOTTIE_STATIC"
    }

    files {
        "src/**.h",
        "src/**.cpp",
        "inc/**.h"
    }

    removefiles {
        "src/wasm/rlottiewasm.cpp"
    }

    filter "system:windows"
        systemversion "latest"

    filter "configurations:Debug"
        defines { "DEBUG" }
        symbols "On"

    filter "configurations:Release"
        defines { "NDEBUG" }
        optimize "On"