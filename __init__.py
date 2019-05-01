# -*- coding: utf-8 -*-
# -------------------------------------------------------------
#    __init__ - BRSGIS init file
#    begin                : 17 January 2018
#    copyright            : (c) 2018 by AViTAS Concepts, LLC.
#    email                : tim.schmaltz@gmail.com
#
#   BRSGIS is proprietary software. You may not copy, sell,
#   redistribute or modify it without the express written
#   authorization of both Boothbay Regional Surveyors, LLC.
#   and AViTAS Concepts, LLC.
# -------------------------------------------------------------

from __future__ import absolute_import


def classFactory(iface):
    from .brsgis_menu import brsgis_menu
    return brsgis_menu(iface)
