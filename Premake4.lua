
solution 'libmpq'
    location 'build'
    configurations { 'Debug', 'Release' }
    language 'C'
    defines { 'WIN32', '_WIN32', '_WINDOWS' }
    flags { 'StaticRuntime' }

    configuration 'vs*'
        defines { '_CRT_SECURE_NO_WARNINGS' }

    configuration 'Debug'
        flags { 'Symbols' }
        defines { '_DEBUG' }
        targetsuffix '_d'

    configuration 'Release'
        flags { 'Optimize' }
        defines { 'NDEBUG' }

project 'libmpq'
    kind 'StaticLib'

    targetdir 'lib'

    includedirs {
        'zlib',
        'bzip2',
    }

    excludes {
        'zlib/compress.c',
        'bzip2/huffman.c',
    }

    files {
        'zlib/*.h',
        'zlib/*.c',
        'bzip2/*.h',
        'bzip2/*.c',
        'libmpq/*.h',
        'libmpq/*.c',
    }

