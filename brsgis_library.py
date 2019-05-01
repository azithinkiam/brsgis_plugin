from __future__ import print_function
# -------------------------------------------------------------
#    brsgis_library - BRSGIS operation functions
#
#    begin                : 17 January 2018
#    copyright            : (c) 2018 by AViTAS Concepts, LLC.
#    email                : tim.schmaltz@gmail.com
#
#   BRSGIS is proprietary software. You may not copy, sell,
#   redistribute and/or modify it without the express
#   written authorization of both AViTAS Concepts, LLC and
#   Boothbay Regional Surveyors, LLC.
# -------------------------------------------------------------

from future import standard_library

standard_library.install_aliases()


def brsgis_status_message(qgis, message):
    qgis.mainWindow().statusBar().showMessage(message)


def brsgis_completion_message(qgis, message):
    brsgis_status_message(qgis, message)
    qgis.messageBar().pushMessage(message, 0, 3)
