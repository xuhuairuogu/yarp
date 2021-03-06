# Copyright: (C) 2009 RobotCub Consortium
# Authors: Giorgio Metta, Lorenzo Natale
# CopyPolicy: Released under the terms of the LGPLv2.1 or later, see LGPL.TXT

yarp_prepare_plugin(pumacalibrator
                    CATEGORY device
                    TYPE yarp::dev::PumaCalibrator
                    INCLUDE PumaCalibrator.h
                    DEPENDS "CREATE_DEVICE_LIBRARY_MODULES;YARP_COMPILE_UNMAINTAINED"
                    ADVANCED)

if(NOT SKIP_pumacalibrator)
  set(CMAKE_INCLUDE_CURRENT_DIR ON)
  yarp_add_plugin(pumacalibrator PumaCalibrator.cpp
                                 PumaCalibrator.h)
  yarp_install(TARGETS pumacalibrator
               EXPORT YARP
               COMPONENT runtime
               LIBRARY DESTINATION ${YARP_DYNAMIC_PLUGINS_INSTALL_DIR}
               ARCHIVE DESTINATION ${YARP_STATIC_PLUGINS_INSTALL_DIR})
  yarp_install(FILES pumacalibrator.ini
               COMPONENT runtime
               DESTINATION ${YARP_PLUGIN_MANIFESTS_INSTALL_DIR})

  set_property(TARGET pumacalibrator PROPERTY FOLDER "Unsupported")
endif(NOT SKIP_pumacalibrator)
