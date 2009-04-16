
##################################################
#ask user to specify build type (linux only)
IF(NOT CMAKE_BUILD_TYPE)
  SET(CMAKE_BUILD_TYPE "Release" CACHE STRING 
	"Choose the type of build, recommanded options are: Debug or Release")
ENDIF(NOT CMAKE_BUILD_TYPE)
# hide variable to WINDOWS users (CMAKE_BUILD_TYPE is not used on win)
IF (MSVC)
  MARK_AS_ADVANCED(CMAKE_BUILD_TYPE)
ENDIF(MSVC)
#################################################


SET (STATLIB "${CMAKE_BINARY_DIR}/static_libs")
IF (EXISTS ${STATLIB})
    MESSAGE(STATUS "static_libs directory present: ${STATLIB}")
    LINK_DIRECTORIES(${STATLIB})
    ADD_DEFINITIONS(-static-libgcc)
    SET(CMAKE_CXX_LINK_EXECUTABLE "${CMAKE_CXX_LINK_EXECUTABLE} -static-libgcc")
    FILE(GLOB statlibs ${STATLIB}/*.a)
    LINK_LIBRARIES(${statlibs})
ENDIF (EXISTS ${STATLIB})


SET(COMPILE_NEW_YARPVIEW TRUE CACHE BOOL "Do you want to compile the new yarpview?")
#MARK_AS_ADVANCED(COMPILE_NEW_YARPVIEW)

# compile device library by default - safe, since individual devices
# are added on request
SET(CREATE_DEVICE_LIBRARY TRUE CACHE BOOL "Do you want to compile the device library")

# not done any more
SET(CREATE_DEVICE_LIBRARY_BUILTINS FALSE)

SET(CREATE_DEVICE_LIBRARY_MODULES FALSE CACHE BOOL "Newer method for compiling devices")

IF (CREATE_DEVICE_LIBRARY_MODULES)
  SET(MERGE_DEVICE_LIBRARY_MODULES TRUE CACHE BOOL "Merge devices with YARP libraries")
ENDIF (CREATE_DEVICE_LIBRARY_MODULES)

SET(CREATE_GUIS FALSE CACHE BOOL "Do you want to compile GUIs")
SET(CREATE_LIB_MATH FALSE CACHE BOOL "Create lib libYARP_math (experimental)?")

SET(CREATE_SHARED_LIBRARY FALSE CACHE BOOL "Compile shared libraries rather than linking statically")
IF (WIN32)
	MARK_AS_ADVANCED(CREATE_SHARED_LIBRARY)
ENDIF (WIN32)

# Flag for device testing and documentation - not really for end-user,
# but instead the library developers
SET(CREATE_BUILTIN_DEVICE_TESTS FALSE CACHE BOOL "Do you want to create tests for builtin devices")
MARK_AS_ADVANCED(CREATE_BUILTIN_DEVICE_TESTS CREATE_DEVICE_LIBRARY)

SET(USE_STL_STRING FALSE CACHE BOOL "Do you want the yarp String class to be std::string?")
MARK_AS_ADVANCED(USE_STL_STRING)
