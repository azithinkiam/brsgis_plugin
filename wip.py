from __future__ import absolute_import
from __future__ import print_function

import csv
import os.path
import sys
from builtins import range
from functools import partial

from PyQt5.QtCore import QVariant, Qt, QRectF
from PyQt5.QtGui import QIcon, QGuiApplication
from PyQt5.QtWidgets import QPushButton, QAction, QMessageBox, QDialog

# from qgis.core import *
from qgis.core import *

import processing
import pyperclip

sys.path.append(os.path.dirname(os.path.abspath(__file__)) + "/forms")

from .forms.brsgis_label_form import *

def getRelatedWork(self, feature, cfg):
    # try:
    if cfg == 0:
        layer = self.iface.activeLayer()
        selFeature = layer.selectedFeatures()[0]
        # for feature in layer.getFeatures():
        # layer.selectByIds([feature.id()])
        # self.vl = QgsProject.instance().mapLayersByName('brs_jobs')[0]
        # self.iface.setActiveLayer(self.vl)

        aNo = 0
        pNo = 0
        jNo = 0
        QgsMessageLog.logMessage('FIRST PASS: ' + str(selFeature.name()), 'BRS_GIS', level=Qgis.Info)

        # QgsProject.instance().legendLayersAdded.connect(showFeatureCount)

        # path = os.path.join("Z:\\", "BRS", year, jobNo)
        # jipath = os.path.join(path, "Job_Info")
        #
        # if not os.path.exists(path):
        #     os.makedirs(path)
        # if not os.path.exists(jipath):
        #     os.makedirs(jipath)
        #
        # from openpyxl import load_workbook
        # wb = load_workbook('z:/0 - settings/gis/qgis/plugins/brsgis_plugin/BRS_templates.xlsx')
        #
        # for s in range(len(wb.sheetnames)):
        #     if wb.sheetnames[s] == 'maptable':
        #         break
        #
        # wb.active = s
        # sheets = wb.sheetnames
        # ws = wb.active
        # aNo = 0
        # clientName = attribs["client_name"]
        # addr = attribs["locus_addr"]
        # town = attribs["town"]
        # map_bk_lot = attribs["map_bk_lot"]
        # map_bk_lotO = attribs["map_bk_lot"]
        # mbl = map_bk_lot.split('-')
        # mbLen = len(mbl)
        #
        # if mbLen == 1:
        #     map_bk_lot = map_bk_lot
        # elif mbLen == 2:
        #     map_bk_lot = 'Map ' + mbl[0].lstrip('0') + ', Lot ' + mbl[1].lstrip('0')
        # elif mbLen == 3:
        #     map_bk_lot = 'Map ' + mbl[0].lstrip('0') + ', Lot ' + mbl[1].lstrip('0') + '-' + mbl[2].lstrip('0')
        #
        # jobType = attribs["job_type"]
        # revNo = attribs["rev_no"]
        # county = attribs["county"]
        # state = attribs["state"]
        # perimeter = attribs["sPerimeter"]
        # area = attribs["area"]
        # planbook_page = attribs["planbook_page"]
        # referrerJ = attribs['job_no']
        # zipCode = attribs['zipcode']
        #
        # if str(zipCode) == 'NULL':
        #     zipCode = ''
        # else:
        #     zipCode = zipCode
        #
        # lat_lon = attribs['lat_lon']

        layerJobs = QgsProject.instance().mapLayersByName('brs_jobs')[0]
        layerPlans = QgsProject.instance().mapLayersByName('la_plans')[0]
        layerRelated = QgsProject.instance().mapLayersByName('relatedwork')[0]

        try:
            QgsMessageLog.logMessage('Getting previous PLANS...', 'BRS_GIS', level=Qgis.Info)
            processing.runAndLoadResults("qgis:intersection",
                                         {'INPUT': QgsProcessingFeatureSourceDefinition(
                                             'brs_jobs_ff168cff_1c0e_47e8_b18c_cb8b59c8d07b', True),
                                             'INPUT_FIELDS': ['job_no', 'map_bk_lot'],
                                             'OUTPUT': 'memory:tmp_related',
                                             'OVERLAY': 'dbname=\'BRS_GIS_PRD\' host=localhost port=5432 sslmode=disable key=\'gid\' srid=0 '
                                                        'type=MultiPolygon table="public"."la_plans_final" (geom) sql=',
                                             'OVERLAY_FIELDS': ['plan_no', 'job', 'old_plan']
                                         }, feedback=self.fb)

            self.addLayerDB(layerRelated)
            layerTmpRelated = QgsProject.instance().mapLayersByName('Intersection')[0]
            layerTmpRelated.selectAll()
            self.iface.actionCopyFeatures().trigger()
            self.vl = QgsProject.instance().mapLayersByName('relatedwork')[0]
            self.iface.setActiveLayer(self.vl)
            self.iface.actionToggleEditing().trigger()
            self.iface.actionIdentify().trigger()
            self.iface.actionPasteFeatures().trigger()
            self.iface.activeLayer().commitChanges()
            self.iface.setActiveLayer(layerRelated)
            QgsProject.instance().removeMapLayer(layerTmpRelated.id())
            self.iface.mapCanvas().refresh()
            # QgsMessageLog.logMessage('relJobs: ' + relJobs, 'BRS_GIS', level=Qgis.Info)

        except Exception as e:
            QgsMessageLog.logMessage('NO JOBS FOUND.', 'BRS_GIS', level=Qgis.Info)
            relJobs = ''
            pass
        #
        # try:
        #     relW = self.getRelatedPlansJobs(layerPlans, jobNo, cfg)
        #     QgsMessageLog.logMessage('relW: ' + str(relW), 'BRS_GIS', level=Qgis.Info)
        #     relW = relW.replace(', ', ',')
        #     relWork = relW.split(",")
        #     relWork.sort(reverse=True)
        #     sRelWork = (', '.join(relWork))
        #     # s(*names, sep=", ")
        #     QgsMessageLog.logMessage('FOUND RELATED: ' + sRelWork, 'BRS_GIS', level=Qgis.Info)
        #
        # except Exception as e:
        #     exc_type, exc_obj, exc_tb = sys.exc_info()
        #     fname = os.path.split(exc_tb.tb_frame.f_code.co_filename)[1]
        #     QgsMessageLog.logMessage(str(exc_type) + ' ' + str(fname) + ' ' + str(
        #         exc_tb.tb_lineno) + ' ' + str(
        #         e), 'BRS_GIS', level=Qgis.Info)
        #     pass
    # # Save the file
    # mtfile = str(jipath) + "\\" + jobNo + "_MapTable_" + datetime.datetime.today().strftime(
    #     '%Y.%m.%d') + ".xlsx"
    # QgsMessageLog.logMessage('Saving file: ' + mtfile + '...', 'BRS_GIS', level=Qgis.Info)
    # try:
    #     wb.save(mtfile)

    # except Exception as e:
    #     exc_type, exc_obj, exc_tb = sys.exc_info()
    #     fname = os.path.split(exc_tb.tb_frame.f_code.co_filename)[1]
    #     QMessageBox.critical(self.iface.mainWindow(), "File Open",
    #                          "Please ensure that you do not have today's mapTable open in Excel\nand attempt to "
    #                          "generate the output again.\n\n"
    #                          "Details: " + str(exc_type) + ' ' + str(fname) + ' ' + str(exc_tb.tb_lineno) + ' ' + str(e))
    #     return
    else:
        pass
        # QgsMessageLog.logMessage('ABUTTER PASS STARTED.', 'BRS_GIS', level=Qgis.Info)
        # self.vl = QgsProject.instance().mapLayersByName('brs_jobs')[0]
        # self.iface.setActiveLayer(self.vl)
        # layer = self.iface.activeLayer()
        # attribs = layer.selectedFeatures()[0]
        # jobNo = attribs["job_no"]
        #
        # # self.vl = QgsProject.instance().mapLayersByName('abutters')[0]
        # # self.iface.setActiveLayer(self.vl)
        # layer = self.iface.activeLayer()
        # referrerJ = jobNo
        # exp = QgsExpression(u'"referrerJ" = \'%s\'' % (referrerJ))
        # request = QgsFeatureRequest(exp)
        # request.setSubsetOfAttributes(['referrerJ'], layer.fields())
        # request.setFlags(QgsFeatureRequest.NoGeometry)
        #
        # for feature in layer.getFeatures(request):
        #     sFC = str(layer.featureCount())
        #     # QgsMessageLog.logMessage('ABUTTER COUNT: ' + sFC, 'BRS_GIS', level=Qgis.Info)
        #     layer.selectByIds([feature.id()])
        #     attribs = layer.selectedFeatures()[0]
        #     aNo = 0
        #     pNo = 0
        #     jNo = 0
        #     jobNo = attribs["referrerj"]
        #     # jobNo = ''
        #     mbl = attribs["map_bk_lot"]
        #     QgsMessageLog.logMessage('PARCEL : ' + mbl, 'BRS_GIS', level=Qgis.Info)
        #     # QgsProject.instance().legendLayersAdded.connect(showFeatureCount)
        #
        #     # path = os.path.join("Z:\\", "BRS", year, jobNo)
        #     # jipath = os.path.join(path, "Job_Info")
        #     #
        #     # if not os.path.exists(path):
        #     #     os.makedirs(path)
        #     # if not os.path.exists(jipath):
        #     #     os.makedirs(jipath)
        #     #
        #     # from openpyxl import load_workbook
        #     # wb = load_workbook('z:/0 - settings/gis/qgis/plugins/brsgis_plugin/BRS_templates.xlsx')
        #     #
        #     # for s in range(len(wb.sheetnames)):
        #     #     if wb.sheetnames[s] == 'maptable':
        #     #         break
        #     #
        #     # wb.active = s
        #     # sheets = wb.sheetnames
        #     # ws = wb.active
        #     # aNo = 0
        #     # clientName = attribs["client_name"]
        #     # addr = attribs["locus_addr"]
        #     # town = attribs["town"]
        #     # map_bk_lot = attribs["map_bk_lot"]
        #     # map_bk_lotO = attribs["map_bk_lot"]
        #     # mbl = map_bk_lot.split('-')
        #     # mbLen = len(mbl)
        #     #
        #     # if mbLen == 1:
        #     #     map_bk_lot = map_bk_lot
        #     # elif mbLen == 2:
        #     #     map_bk_lot = 'Map ' + mbl[0].lstrip('0') + ', Lot ' + mbl[1].lstrip('0')
        #     # elif mbLen == 3:
        #     #     map_bk_lot = 'Map ' + mbl[0].lstrip('0') + ', Lot ' + mbl[1].lstrip('0') + '-' + mbl[2].lstrip('0')
        #     #
        #     # jobType = attribs["job_type"]
        #     # revNo = attribs["rev_no"]
        #     # county = attribs["county"]
        #     # state = attribs["state"]
        #     # perimeter = attribs["sPerimeter"]
        #     # area = attribs["area"]
        #     # planbook_page = attribs["planbook_page"]
        #     # referrerJ = attribs['job_no']
        #     # zipCode = attribs['zipcode']
        #     #
        #     # if str(zipCode) == 'NULL':
        #     #     zipCode = ''
        #     # else:
        #     #     zipCode = zipCode
        #     #
        #     # lat_lon = attribs['lat_lon']
        #
        #     layerJobs = QgsProject.instance().mapLayersByName('brs_jobs')[0]
        #     layerPlans = QgsProject.instance().mapLayersByName('la_plans')[0]
        #     layerRelated = QgsProject.instance().mapLayersByName('relatedwork')[0]
        #
        #
        #
        #     if relJobs == '':
        #         pass
        #     else:
        #         QgsMessageLog.logMessage('relJobs: ' + relJobs, 'BRS_GIS', level=Qgis.Info)
        #
        #     # try:
        #     relW = self.getRelatedPlansJobs(layerPlans, cfg)
        #     relW = relW.replace(', ', ',')
        #     relWork = relW.split(",")
        #     relWork.sort(reverse=True)
        #     sRelWork = (', '.join(relWork))
        #     # s(*names, sep=", ")
        #     QgsMessageLog.logMessage('ABUTTER RELATED: ' + sRelWork, 'BRS_GIS', level=Qgis.Info)
        #     # except Exception as e:
        #     #     exc_type, exc_obj, exc_tb = sys.exc_info()
        #     #     fname = os.path.split(exc_tb.tb_frame.f_code.co_filename)[1]
        #     #     QgsMessageLog.logMessage(str(exc_type) + ' ' + str(fname) + ' ' + str(
        #     #         exc_tb.tb_lineno) + ' ' + str(
        #     #         e), 'BRS_GIS', level=Qgis.Info)
        #     #     QgsMessageLog.logMessage('NO PLANS FOUND FOR ' + mbl, 'BRS_GIS', level=Qgis.Info)
        #     #     pass
        #
        #     # except Exception as e:
        #     #     exc_type, exc_obj, exc_tb = sys.exc_info()
        #     #     fname = os.path.split(exc_tb.tb_frame.f_code.co_filename)[1]
        #     #     QMessageBox.critical(self.iface.mainWindow(), "No Selection",
        #     #                          "Please ensure that you have a parcel selected\nand attempt to "
        #     #                          "generate the output again.\n\n"
        #     #                          "Details: " + str(exc_type) + ' ' + str(fname) + ' ' + str(
        #     #                              exc_tb.tb_lineno) + ' ' + str(
        #     #                              e))
        #     #     return
        #
        #     # self.vl = QgsProject.instance().mapLayersByName('brs_jobs')[0]
        #     # self.iface.setActiveLayer(self.vl)
        #     # try:
        #     #     attribs = self.iface.activeLayer().selectedFeatures()[0]
        #     #
        #     # except Exception as e:
        #     #     exc_type, exc_obj, exc_tb = sys.exc_info()
        #     #     fname = os.path.split(exc_tb.tb_frame.f_code.co_filename)[1]
        #     #     QMessageBox.critical(self.iface.mainWindow(), "No Selection",
        #     #                          "Please ensure that you have a parcel selected\nand attempt to "
        #     #                          "generate the output again.\n\n"
        #     #                          "Details: " + str(exc_type) + ' ' + str(fname) + ' ' + str(
        #     #                              exc_tb.tb_lineno) + ' ' + str(
        #     #                              e))
        #     #     return


def getRelatedPlansJobs(self, layer, cfg):
    pNo = 0
    jNo = 0

    rLayer = layer
    self.fb = QgsProcessingFeedback()
    self.context = QgsProcessingContext

    # sInput = QgsProcessingFeatureSourceDefinition('brs_jobs_ff168cff_1c0e_47e8_b18c_cb8b59c8d07b', True)
    # sInputFields = ['job_no', 'map_bk_lot']
    # sOutput = "\'postgis:dbname=\'BRS_GIS_PRD\' host=localhost port=5432 table=\"public\".\"relatedwork\" (the_geom) sql=\'"
    # sOverlay = "\"\'dbname=\'BRS_GIS_PRD\' host=localhost port=5432 sslmode=disable key=\'gid\' srid=0 \'type=MultiPolygon table=\"public\".\"la_plans_final\" (geom) sql=\'"
    # sOverlayFields = ['plan_no', 'job', 'old_plan']

    if cfg == 1:
        # QgsMessageLog.logMessage('cfg:' + str(cfg), 'BRS_GIS', level=Qgis.Info)
        # QgsMessageLog.logMessage('aNo:' + str(aNo), 'BRS_GIS', level=Qgis.Info)
        # QgsMessageLog.logMessage('rLayer:' + str(rLayer.name()), 'BRS_GIS', level=Qgis.Info)

        self.vl = QgsProject.instance().mapLayersByName('abutters')[0]
        self.iface.setActiveLayer(self.vl)

        try:
            attribs = self.iface.activeLayer().selectedFeatures()[0]
        except Exception as e:
            exc_type, exc_obj, exc_tb = sys.exc_info()
            fname = os.path.split(exc_tb.tb_frame.f_code.co_filename)[1]
            QMessageBox.critical(self.iface.mainWindow(), "No Selection",
                                 "Please ensure that you have a parcel selected\nand attempt to "
                                 "generate the output again.\n\n"
                                 "Details: " + str(exc_type) + ' ' + str(fname) + ' ' + str(
                                     exc_tb.tb_lineno) + ' ' + str(
                                     e))
            return

        if rLayer == 'la_plans':
            QgsMessageLog.logMessage('Getting ABUTTER PLANS...', 'BRS_GIS', level=Qgis.Info)
            processing.runAndLoadResults("qgis:intersection",
                                         {'INPUT': QgsProcessingFeatureSourceDefinition(
                                             'abutters_a7752f9f_2bd3_4bbd_b554_a095bde80b82', True),
                                          'INPUT_FIELDS': ['referrerJ', 'map_bk_lot'],
                                          'OUTPUT': 'memory:tmp_related',
                                          'OVERLAY': 'dbname=\'BRS_GIS_PRD\' host=localhost port=5432 sslmode=disable key=\'gid\' srid=0 '
                                                     'type=MultiPolygon table="public"."la_plans_final" (geom) sql=',
                                          'OVERLAY_FIELDS': ['plan_no', 'job', 'old_plan']
                                          }, feedback=self.fb)

        elif rLayer.name() == 'brs_jobs':
            QgsMessageLog.logMessage('Getting ABUTTER JOBS...', 'BRS_GIS', level=Qgis.Info)
            processing.runAndLoadResults("qgis:intersection",
                                         {'INPUT': QgsProcessingFeatureSourceDefinition(
                                             'abutters_a7752f9f_2bd3_4bbd_b554_a095bde80b82', True),
                                          'INPUT_FIELDS': ['referrerJ', 'map_bk_lot'],
                                          'OUTPUT': 'memory:tmp_related',
                                          'OVERLAY': QgsProcessingFeatureSourceDefinition(
                                              'brs_jobs_ff168cff_1c0e_47e8_b18c_cb8b59c8d07b'),
                                          'OVERLAY_FIELDS': ['plan_no', 'job', 'old_plan']
                                          }, feedback=self.fb)

    else:
        if rLayer.name() == 'la_plans':
            QgsMessageLog.logMessage('Getting previous PLANS...', 'BRS_GIS', level=Qgis.Info)
            processing.runAndLoadResults("qgis:intersection",
                                         {'INPUT': QgsProcessingFeatureSourceDefinition(
                                             'brs_jobs_ff168cff_1c0e_47e8_b18c_cb8b59c8d07b', True),
                                             'INPUT_FIELDS': ['job_no', 'map_bk_lot'],
                                             'OUTPUT': 'memory:tmp_related',
                                             'OVERLAY': 'dbname=\'BRS_GIS_PRD\' host=localhost port=5432 sslmode=disable key=\'gid\' srid=0 '
                                                        'type=MultiPolygon table="public"."la_plans_final" (geom) sql=',
                                             'OVERLAY_FIELDS': ['plan_no', 'job', 'old_plan']
                                         }, feedback=self.fb)

        elif rLayer.name() == 'brs_jobs':
            QgsMessageLog.logMessage('Getting previous JOBS...', 'BRS_GIS', level=Qgis.Info)
            processing.runAndLoadResults("qgis:intersection",
                                         {'INPUT': QgsProcessingFeatureSourceDefinition(
                                             'brs_jobs_ff168cff_1c0e_47e8_b18c_cb8b59c8d07b', True),
                                             'INPUT_FIELDS': ['job_no', 'map_bk_lot'],
                                             'OUTPUT': 'memory:tmp_related',
                                             'OVERLAY': QgsProcessingFeatureSourceDefinition(
                                                 'brs_jobs_ff168cff_1c0e_47e8_b18c_cb8b59c8d07b'),
                                             'OVERLAY_FIELDS': ['plan_no', 'job', 'old_plan']
                                         }, feedback=self.fb)

    layerRelated = QgsProject.instance().mapLayersByName('relatedwork')[0]
    self.addLayerDB(layerRelated)

    layerTmpRelated = QgsProject.instance().mapLayersByName('Intersection')[0]
    layerTmpRelated.selectAll()

    self.iface.actionCopyFeatures().trigger()
    self.vl = QgsProject.instance().mapLayersByName('relatedwork')[0]
    self.iface.setActiveLayer(self.vl)
    self.iface.actionToggleEditing().trigger()
    self.iface.actionIdentify().trigger()
    self.iface.actionPasteFeatures().trigger()
    self.iface.activeLayer().commitChanges()
    self.iface.setActiveLayer(layerRelated)
    # QgsProject.instance().removeMapLayer(layerTmpRelated.id())
    self.iface.mapCanvas().refresh()
    plans = []
    ppval = ''
    pval = ''
    pFinal = ''

    # for l in layerRelated.getFeatures():
    #     plan_no = l["plan_no"]
    #     job_no = l["job_no"]
    #     QgsMessageLog.logMessage('j: ' + jobNo + ' | ' + plan_no, 'BRS_GIS', level=Qgis.Info)
    #     if plan_no == jobNo:
    #         self.iface.actionToggleEditing().trigger()
    #         layerRelated.deleteFeature(l.id())
    #         self.iface.activeLayer().commitChanges()
    #         # QgsProject.instance().removeMapLayer(layerRelated.id())
    #         layerRelated = QgsProject.instance().mapLayersByName('relatedwork')[0]
    #         # self.addLayerDB(layerRelated)
    #         self.iface.mapCanvas().refresh()
    #     else:
    #         # add to plan string/job string
    #         oldPlanNo = l['old_plan']
    #         pval = str(oldPlanNo)
    #
    #         if str(ppval) == str(pval):
    #             pval = ''
    #         else:
    #             pass
    #
    #         plen = len(plans)
    #
    #         # QgsMessageLog.logMessage('length of array: ' + str(plen), 'BRS_GIS', level=Qgis.Info)
    #         plans.append(pval)
    #
    #         pNo += 1
    #         ppval = pval
    #         # QgsMessageLog.logMessage('plans: ' + str(plans), 'BRS_GIS', level=Qgis.Info)

    # lyr =  QgsProject.instance().mapLayersByName('brs_jobs')[0]
    # self.iface.setActiveLayer(lyr)
    # j = self.iface.activeLayer().selectedFeatures()[0]

    if len(plans) > 1:
        plans.sort(reverse=True)
        pFinal = str(plans)
        pFinal = pFinal.strip('[')
        pFinal = pFinal.strip(']')
        pFinal = pFinal.replace('\'', '')
        # # start editing, change field value
        # self.iface.actionToggleEditing().trigger()
        # layerData = lyr.dataProvider()
        # idx3 = layerData.fieldNameIndex('old_plan_no')
        # lyr.changeAttributeValue(j.id(), idx3, str(pFinal))
        # lyr.updateFields()
        # self.iface.activeLayer().commitChanges()
        plans = []

    else:
        pass

    return pFinal

# QgsProject.instance().legendLayersAdded.connect(showFeatureCount)

# path = os.path.join("Z:\\", "BRS", year, jobNo)
# jipath = os.path.join(path, "Job_Info")
#
# if not os.path.exists(path):
#     os.makedirs(path)
# if not os.path.exists(jipath):
#     os.makedirs(jipath)
#
# from openpyxl import load_workbook
# wb = load_workbook('z:/0 - settings/gis/qgis/plugins/brsgis_plugin/BRS_templates.xlsx')
#
# for s in range(len(wb.sheetnames)):
#     if wb.sheetnames[s] == 'maptable':
#         break
#
# wb.active = s
# sheets = wb.sheetnames
# ws = wb.active
# aNo = 0
# clientName = attribs["client_name"]
# addr = attribs["locus_addr"]
# town = attribs["town"]
# map_bk_lot = attribs["map_bk_lot"]
# map_bk_lotO = attribs["map_bk_lot"]
# mbl = map_bk_lot.split('-')
# mbLen = len(mbl)
#
# if mbLen == 1:
#     map_bk_lot = map_bk_lot
# elif mbLen == 2:
#     map_bk_lot = 'Map ' + mbl[0].lstrip('0') + ', Lot ' + mbl[1].lstrip('0')
# elif mbLen == 3:
#     map_bk_lot = 'Map ' + mbl[0].lstrip('0') + ', Lot ' + mbl[1].lstrip('0') + '-' + mbl[2].lstrip('0')
#
# jobType = attribs["job_type"]
# revNo = attribs["rev_no"]
# county = attribs["county"]
# state = attribs["state"]
# perimeter = attribs["sPerimeter"]
# area = attribs["area"]
# planbook_page = attribs["planbook_page"]
# referrerJ = attribs['job_no']
# zipCode = attribs['zipcode']
#
# if str(zipCode) == 'NULL':
#     zipCode = ''
# else:
#     zipCode = zipCode
#
# lat_lon = attribs['lat_lon']


    # def getRelatedWork(self, cfg):
    #
    #         #try:
    #     if cfg == 0:
    #
    #         #for feature in layer.getFeatures():
    #         # layer.selectByIds([feature.id()])
    #         self.vl = QgsProject.instance().mapLayersByName('brs_jobs')[0]
    #         self.iface.setActiveLayer(self.vl)
    #         layer = self.iface.activeLayer()
    #         attribs = layer.selectedFeatures()[0]
    #         aNo = 0
    #         pNo = 0
    #         jNo = 0
    #         jobNo = attribs["job_no"]
    #         QgsMessageLog.logMessage('FIRST PASS: ' + jobNo, 'BRS_GIS', level=Qgis.Info)
    #
    #         # QgsProject.instance().legendLayersAdded.connect(showFeatureCount)
    #
    #         # path = os.path.join("Z:\\", "BRS", year, jobNo)
    #         # jipath = os.path.join(path, "Job_Info")
    #         #
    #         # if not os.path.exists(path):
    #         #     os.makedirs(path)
    #         # if not os.path.exists(jipath):
    #         #     os.makedirs(jipath)
    #         #
    #         # from openpyxl import load_workbook
    #         # wb = load_workbook('z:/0 - settings/gis/qgis/plugins/brsgis_plugin/BRS_templates.xlsx')
    #         #
    #         # for s in range(len(wb.sheetnames)):
    #         #     if wb.sheetnames[s] == 'maptable':
    #         #         break
    #         #
    #         # wb.active = s
    #         # sheets = wb.sheetnames
    #         # ws = wb.active
    #         # aNo = 0
    #         # clientName = attribs["client_name"]
    #         # addr = attribs["locus_addr"]
    #         # town = attribs["town"]
    #         # map_bk_lot = attribs["map_bk_lot"]
    #         # map_bk_lotO = attribs["map_bk_lot"]
    #         # mbl = map_bk_lot.split('-')
    #         # mbLen = len(mbl)
    #         #
    #         # if mbLen == 1:
    #         #     map_bk_lot = map_bk_lot
    #         # elif mbLen == 2:
    #         #     map_bk_lot = 'Map ' + mbl[0].lstrip('0') + ', Lot ' + mbl[1].lstrip('0')
    #         # elif mbLen == 3:
    #         #     map_bk_lot = 'Map ' + mbl[0].lstrip('0') + ', Lot ' + mbl[1].lstrip('0') + '-' + mbl[2].lstrip('0')
    #         #
    #         # jobType = attribs["job_type"]
    #         # revNo = attribs["rev_no"]
    #         # county = attribs["county"]
    #         # state = attribs["state"]
    #         # perimeter = attribs["sPerimeter"]
    #         # area = attribs["area"]
    #         # planbook_page = attribs["planbook_page"]
    #         # referrerJ = attribs['job_no']
    #         # zipCode = attribs['zipcode']
    #         #
    #         # if str(zipCode) == 'NULL':
    #         #     zipCode = ''
    #         # else:
    #         #     zipCode = zipCode
    #         #
    #         # lat_lon = attribs['lat_lon']
    #
    #         layerJobs = QgsProject.instance().mapLayersByName('brs_jobs')[0]
    #         layerPlans = QgsProject.instance().mapLayersByName('la_plans')[0]
    #         layerRelated = QgsProject.instance().mapLayersByName('relatedwork')[0]
    #
    #         try:
    #             relJobs = self.getRelatedPlansJobs(layerJobs, jobNo, cfg)
    #
    #         except Exception as e:
    #             QgsMessageLog.logMessage('NO JOBS FOUND.', 'BRS_GIS', level=Qgis.Info)
    #             relJobs = ''
    #             pass
    #
    #         try:
    #             relW = self.getRelatedPlansJobs(layerPlans, jobNo, cfg)
    #             QgsMessageLog.logMessage('relW: ' + str(relW), 'BRS_GIS', level=Qgis.Info)
    #             relW = relW.replace(', ', ',')
    #             relWork = relW.split(",")
    #             relWork.sort(reverse=True)
    #             sRelWork = (', '.join(relWork))
    #             # s(*names, sep=", ")
    #             QgsMessageLog.logMessage('FOUND RELATED: ' + sRelWork, 'BRS_GIS', level=Qgis.Info)
    #
    #         except Exception as e:
    #             exc_type, exc_obj, exc_tb = sys.exc_info()
    #             fname = os.path.split(exc_tb.tb_frame.f_code.co_filename)[1]
    #             QgsMessageLog.logMessage(str(exc_type) + ' ' + str(fname) + ' ' + str(
    #                                      exc_tb.tb_lineno) + ' ' + str(
    #                                      e), 'BRS_GIS', level=Qgis.Info)
    #             pass
    #     # # Save the file
    #     # mtfile = str(jipath) + "\\" + jobNo + "_MapTable_" + datetime.datetime.today().strftime(
    #     #     '%Y.%m.%d') + ".xlsx"
    #     # QgsMessageLog.logMessage('Saving file: ' + mtfile + '...', 'BRS_GIS', level=Qgis.Info)
    #     # try:
    #     #     wb.save(mtfile)
    #
    #     # except Exception as e:
    #     #     exc_type, exc_obj, exc_tb = sys.exc_info()
    #     #     fname = os.path.split(exc_tb.tb_frame.f_code.co_filename)[1]
    #     #     QMessageBox.critical(self.iface.mainWindow(), "File Open",
    #     #                          "Please ensure that you do not have today's mapTable open in Excel\nand attempt to "
    #     #                          "generate the output again.\n\n"
    #     #                          "Details: " + str(exc_type) + ' ' + str(fname) + ' ' + str(exc_tb.tb_lineno) + ' ' + str(e))
    #     #     return
    #     else:
    #         QgsMessageLog.logMessage('ABUTTER PASS STARTED.', 'BRS_GIS', level=Qgis.Info)
    #         self.vl = QgsProject.instance().mapLayersByName('brs_jobs')[0]
    #         self.iface.setActiveLayer(self.vl)
    #         layer = self.iface.activeLayer()
    #         attribs = layer.selectedFeatures()[0]
    #         jobNo = attribs["job_no"]
    #
    #         self.vl = QgsProject.instance().mapLayersByName('abutters')[0]
    #         self.iface.setActiveLayer(self.vl)
    #         layer = self.iface.activeLayer()
    #         referrerJ = jobNo
    #         exp = QgsExpression(u'"referrerJ" = \'%s\'' % (referrerJ))
    #         request = QgsFeatureRequest(exp)
    #         request.setSubsetOfAttributes(['referrerJ'], layer.fields())
    #         request.setFlags(QgsFeatureRequest.NoGeometry)
    #
    #
    #         for feature in layer.getFeatures(request):
    #             sFC = str(layer.featureCount())
    #             #QgsMessageLog.logMessage('ABUTTER COUNT: ' + sFC, 'BRS_GIS', level=Qgis.Info)
    #             layer.selectByIds([feature.id()])
    #             attribs = layer.selectedFeatures()[0]
    #             aNo = 0
    #             pNo = 0
    #             jNo = 0
    #             jobNo = attribs["referrerj"]
    #             #jobNo = ''
    #             mbl = attribs["map_bk_lot"]
    #             QgsMessageLog.logMessage('ABUTTER : ' + mbl, 'BRS_GIS', level=Qgis.Info)
    #             # QgsProject.instance().legendLayersAdded.connect(showFeatureCount)
    #
    #             # path = os.path.join("Z:\\", "BRS", year, jobNo)
    #             # jipath = os.path.join(path, "Job_Info")
    #             #
    #             # if not os.path.exists(path):
    #             #     os.makedirs(path)
    #             # if not os.path.exists(jipath):
    #             #     os.makedirs(jipath)
    #             #
    #             # from openpyxl import load_workbook
    #             # wb = load_workbook('z:/0 - settings/gis/qgis/plugins/brsgis_plugin/BRS_templates.xlsx')
    #             #
    #             # for s in range(len(wb.sheetnames)):
    #             #     if wb.sheetnames[s] == 'maptable':
    #             #         break
    #             #
    #             # wb.active = s
    #             # sheets = wb.sheetnames
    #             # ws = wb.active
    #             # aNo = 0
    #             # clientName = attribs["client_name"]
    #             # addr = attribs["locus_addr"]
    #             # town = attribs["town"]
    #             # map_bk_lot = attribs["map_bk_lot"]
    #             # map_bk_lotO = attribs["map_bk_lot"]
    #             # mbl = map_bk_lot.split('-')
    #             # mbLen = len(mbl)
    #             #
    #             # if mbLen == 1:
    #             #     map_bk_lot = map_bk_lot
    #             # elif mbLen == 2:
    #             #     map_bk_lot = 'Map ' + mbl[0].lstrip('0') + ', Lot ' + mbl[1].lstrip('0')
    #             # elif mbLen == 3:
    #             #     map_bk_lot = 'Map ' + mbl[0].lstrip('0') + ', Lot ' + mbl[1].lstrip('0') + '-' + mbl[2].lstrip('0')
    #             #
    #             # jobType = attribs["job_type"]
    #             # revNo = attribs["rev_no"]
    #             # county = attribs["county"]
    #             # state = attribs["state"]
    #             # perimeter = attribs["sPerimeter"]
    #             # area = attribs["area"]
    #             # planbook_page = attribs["planbook_page"]
    #             # referrerJ = attribs['job_no']
    #             # zipCode = attribs['zipcode']
    #             #
    #             # if str(zipCode) == 'NULL':
    #             #     zipCode = ''
    #             # else:
    #             #     zipCode = zipCode
    #             #
    #             # lat_lon = attribs['lat_lon']
    #
    #             layerJobs = QgsProject.instance().mapLayersByName('brs_jobs')[0]
    #             layerPlans = QgsProject.instance().mapLayersByName('la_plans')[0]
    #             layerRelated = QgsProject.instance().mapLayersByName('relatedwork')[0]
    #
    #             try:
    #                 cfg = 1
    #                 relJobs = self.getRelatedPlansJobs(layerJobs, cfg)
    #                 #QgsMessageLog.logMessage('relJobs: ' + relJobs, 'BRS_GIS', level=Qgis.Info)
    #             except Exception as e:
    #                 exc_type, exc_obj, exc_tb = sys.exc_info()
    #
    #                 fname = os.path.split(exc_tb.tb_frame.f_code.co_filename)[1]
    #                 QgsMessageLog.logMessage(str(exc_type) + ' ' + str(fname) + ' ' + str(
    #                     exc_tb.tb_lineno) + ' ' + str(
    #                     e), 'BRS_GIS', level=Qgis.Info)
    #                 pass
    #
    #             if relJobs == '':
    #                 pass
    #             else:
    #                 QgsMessageLog.logMessage('relJobs: ' + relJobs, 'BRS_GIS', level=Qgis.Info)
    #
    #             #try:
    #             relW = self.getRelatedPlansJobs(layerPlans, cfg)
    #             relW = relW.replace(', ', ',')
    #             relWork = relW.split(",")
    #             relWork.sort(reverse=True)
    #             sRelWork = (', '.join(relWork))
    #             # s(*names, sep=", ")
    #             QgsMessageLog.logMessage('ABUTTER RELATED: ' + sRelWork, 'BRS_GIS', level=Qgis.Info)
    #             # except Exception as e:
    #             #     exc_type, exc_obj, exc_tb = sys.exc_info()
    #             #     fname = os.path.split(exc_tb.tb_frame.f_code.co_filename)[1]
    #             #     QgsMessageLog.logMessage(str(exc_type) + ' ' + str(fname) + ' ' + str(
    #             #         exc_tb.tb_lineno) + ' ' + str(
    #             #         e), 'BRS_GIS', level=Qgis.Info)
    #             #     QgsMessageLog.logMessage('NO PLANS FOUND FOR ' + mbl, 'BRS_GIS', level=Qgis.Info)
    #             #     pass
    #
    #             # except Exception as e:
    #             #     exc_type, exc_obj, exc_tb = sys.exc_info()
    #             #     fname = os.path.split(exc_tb.tb_frame.f_code.co_filename)[1]
    #             #     QMessageBox.critical(self.iface.mainWindow(), "No Selection",
    #             #                          "Please ensure that you have a parcel selected\nand attempt to "
    #             #                          "generate the output again.\n\n"
    #             #                          "Details: " + str(exc_type) + ' ' + str(fname) + ' ' + str(
    #             #                              exc_tb.tb_lineno) + ' ' + str(
    #             #                              e))
    #             #     return
    #
    #             # self.vl = QgsProject.instance().mapLayersByName('brs_jobs')[0]
    #             # self.iface.setActiveLayer(self.vl)
    #             # try:
    #             #     attribs = self.iface.activeLayer().selectedFeatures()[0]
    #             #
    #             # except Exception as e:
    #             #     exc_type, exc_obj, exc_tb = sys.exc_info()
    #             #     fname = os.path.split(exc_tb.tb_frame.f_code.co_filename)[1]
    #             #     QMessageBox.critical(self.iface.mainWindow(), "No Selection",
    #             #                          "Please ensure that you have a parcel selected\nand attempt to "
    #             #                          "generate the output again.\n\n"
    #             #                          "Details: " + str(exc_type) + ' ' + str(fname) + ' ' + str(
    #             #                              exc_tb.tb_lineno) + ' ' + str(
    #             #                              e))
    #             #     return
    #
    # def getRelatedPlansJobs(self, layer, cfg):
    #
    #     pNo = 0
    #     jNo = 0
    #
    #     rLayer = layer
    #     self.fb = QgsProcessingFeedback()
    #     self.context = QgsProcessingContext
    #
    #     # sInput = QgsProcessingFeatureSourceDefinition('brs_jobs_ff168cff_1c0e_47e8_b18c_cb8b59c8d07b', True)
    #     # sInputFields = ['job_no', 'map_bk_lot']
    #     # sOutput = "\'postgis:dbname=\'BRS_GIS_PRD\' host=localhost port=5432 table=\"public\".\"relatedwork\" (the_geom) sql=\'"
    #     # sOverlay = "\"\'dbname=\'BRS_GIS_PRD\' host=localhost port=5432 sslmode=disable key=\'gid\' srid=0 \'type=MultiPolygon table=\"public\".\"la_plans_final\" (geom) sql=\'"
    #     # sOverlayFields = ['plan_no', 'job', 'old_plan']
    #
    #     if cfg == 1:
    #         #QgsMessageLog.logMessage('cfg:' + str(cfg), 'BRS_GIS', level=Qgis.Info)
    #         #QgsMessageLog.logMessage('aNo:' + str(aNo), 'BRS_GIS', level=Qgis.Info)
    #         #QgsMessageLog.logMessage('rLayer:' + str(rLayer.name()), 'BRS_GIS', level=Qgis.Info)
    #
    #         self.vl = QgsProject.instance().mapLayersByName('abutters')[0]
    #         self.iface.setActiveLayer(self.vl)
    #
    #         try:
    #             attribs = self.iface.activeLayer().selectedFeatures()[0]
    #         except Exception as e:
    #             exc_type, exc_obj, exc_tb = sys.exc_info()
    #             fname = os.path.split(exc_tb.tb_frame.f_code.co_filename)[1]
    #             QMessageBox.critical(self.iface.mainWindow(), "No Selection",
    #                                  "Please ensure that you have a parcel selected\nand attempt to "
    #                                  "generate the output again.\n\n"
    #                                  "Details: " + str(exc_type) + ' ' + str(fname) + ' ' + str(
    #                                      exc_tb.tb_lineno) + ' ' + str(
    #                                      e))
    #             return
    #
    #         if rLayer == 'la_plans':
    #             QgsMessageLog.logMessage('Getting ABUTTER PLANS...', 'BRS_GIS', level=Qgis.Info)
    #             processing.runAndLoadResults("qgis:intersection",
    #                                {'INPUT': QgsProcessingFeatureSourceDefinition('abutters_a7752f9f_2bd3_4bbd_b554_a095bde80b82', True),
    #                                 'INPUT_FIELDS': ['referrerJ','map_bk_lot'],
    #                                 'OUTPUT': 'memory:tmp_related',
    #                                 'OVERLAY': 'dbname=\'BRS_GIS_PRD\' host=localhost port=5432 sslmode=disable key=\'gid\' srid=0 '
    #                                            'type=MultiPolygon table="public"."la_plans_final" (geom) sql=',
    #                                 'OVERLAY_FIELDS': ['plan_no', 'job', 'old_plan']
    #                     }, feedback=self.fb)
    #
    #         elif rLayer.name() == 'brs_jobs':
    #             QgsMessageLog.logMessage('Getting ABUTTER JOBS...', 'BRS_GIS', level=Qgis.Info)
    #             processing.runAndLoadResults("qgis:intersection",
    #                                {'INPUT':QgsProcessingFeatureSourceDefinition('abutters_a7752f9f_2bd3_4bbd_b554_a095bde80b82', True),
    #                                 'INPUT_FIELDS': ['referrerJ','map_bk_lot'],
    #                                 'OUTPUT': 'memory:tmp_related',
    #                                 'OVERLAY': QgsProcessingFeatureSourceDefinition(
    #                                     'brs_jobs_ff168cff_1c0e_47e8_b18c_cb8b59c8d07b'),
    #                                 'OVERLAY_FIELDS': ['plan_no', 'job', 'old_plan']
    #                     }, feedback=self.fb)
    #
    #     else:
    #         if rLayer.name() == 'la_plans':
    #             QgsMessageLog.logMessage('Getting previous PLANS...', 'BRS_GIS', level=Qgis.Info)
    #             processing.runAndLoadResults("qgis:intersection",
    #                                          {'INPUT': QgsProcessingFeatureSourceDefinition(
    #                                              'brs_jobs_ff168cff_1c0e_47e8_b18c_cb8b59c8d07b', True),
    #                                           'INPUT_FIELDS': ['job_no', 'map_bk_lot'],
    #                                           'OUTPUT': 'memory:tmp_related',
    #                                           'OVERLAY': 'dbname=\'BRS_GIS_PRD\' host=localhost port=5432 sslmode=disable key=\'gid\' srid=0 '
    #                                                      'type=MultiPolygon table="public"."la_plans_final" (geom) sql=',
    #                                           'OVERLAY_FIELDS': ['plan_no', 'job', 'old_plan']
    #                                           }, feedback=self.fb)
    #
    #         elif rLayer.name() == 'brs_jobs':
    #             QgsMessageLog.logMessage('Getting previous JOBS...', 'BRS_GIS', level=Qgis.Info)
    #             processing.runAndLoadResults("qgis:intersection",
    #                                          {'INPUT': QgsProcessingFeatureSourceDefinition(
    #                                              'brs_jobs_ff168cff_1c0e_47e8_b18c_cb8b59c8d07b', True),
    #                                           'INPUT_FIELDS': ['job_no', 'map_bk_lot'],
    #                                           'OUTPUT': 'memory:tmp_related',
    #                                           'OVERLAY': QgsProcessingFeatureSourceDefinition(
    #                                               'brs_jobs_ff168cff_1c0e_47e8_b18c_cb8b59c8d07b'),
    #                                           'OVERLAY_FIELDS': ['plan_no', 'job', 'old_plan']
    #                                           }, feedback=self.fb)
    #
    #     layerRelated = QgsProject.instance().mapLayersByName('relatedwork')[0]
    #     self.addLayerDB(layerRelated)
    #
    #     layerTmpRelated = QgsProject.instance().mapLayersByName('Intersection')[0]
    #     layerTmpRelated.selectAll()
    #
    #     self.iface.actionCopyFeatures().trigger()
    #     self.vl = QgsProject.instance().mapLayersByName('relatedwork')[0]
    #     self.iface.setActiveLayer(self.vl)
    #     self.iface.actionToggleEditing().trigger()
    #     self.iface.actionIdentify().trigger()
    #     self.iface.actionPasteFeatures().trigger()
    #     self.iface.activeLayer().commitChanges()
    #     self.iface.setActiveLayer(layerRelated)
    #     #QgsProject.instance().removeMapLayer(layerTmpRelated.id())
    #     self.iface.mapCanvas().refresh()
    #     plans = []
    #     ppval = ''
    #     pval = ''
    #     pFinal = ''
    #
    #     # for l in layerRelated.getFeatures():
    #     #     plan_no = l["plan_no"]
    #     #     job_no = l["job_no"]
    #     #     QgsMessageLog.logMessage('j: ' + jobNo + ' | ' + plan_no, 'BRS_GIS', level=Qgis.Info)
    #     #     if plan_no == jobNo:
    #     #         self.iface.actionToggleEditing().trigger()
    #     #         layerRelated.deleteFeature(l.id())
    #     #         self.iface.activeLayer().commitChanges()
    #     #         # QgsProject.instance().removeMapLayer(layerRelated.id())
    #     #         layerRelated = QgsProject.instance().mapLayersByName('relatedwork')[0]
    #     #         # self.addLayerDB(layerRelated)
    #     #         self.iface.mapCanvas().refresh()
    #     #     else:
    #     #         # add to plan string/job string
    #     #         oldPlanNo = l['old_plan']
    #     #         pval = str(oldPlanNo)
    #     #
    #     #         if str(ppval) == str(pval):
    #     #             pval = ''
    #     #         else:
    #     #             pass
    #     #
    #     #         plen = len(plans)
    #     #
    #     #         # QgsMessageLog.logMessage('length of array: ' + str(plen), 'BRS_GIS', level=Qgis.Info)
    #     #         plans.append(pval)
    #     #
    #     #         pNo += 1
    #     #         ppval = pval
    #     #         # QgsMessageLog.logMessage('plans: ' + str(plans), 'BRS_GIS', level=Qgis.Info)
    #
    #     # lyr =  QgsProject.instance().mapLayersByName('brs_jobs')[0]
    #     # self.iface.setActiveLayer(lyr)
    #     # j = self.iface.activeLayer().selectedFeatures()[0]
    #
    #     if len(plans) > 1:
    #         plans.sort(reverse=True)
    #         pFinal = str(plans)
    #         pFinal = pFinal.strip('[')
    #         pFinal = pFinal.strip(']')
    #         pFinal = pFinal.replace('\'', '')
    #         # # start editing, change field value
    #         # self.iface.actionToggleEditing().trigger()
    #         # layerData = lyr.dataProvider()
    #         # idx3 = layerData.fieldNameIndex('old_plan_no')
    #         # lyr.changeAttributeValue(j.id(), idx3, str(pFinal))
    #         # lyr.updateFields()
    #         # self.iface.activeLayer().commitChanges()
    #         plans = []
    #
    #     else:
    #         pass
    #
    #     return pFinal
    # # def getRelatedPlansJobs(self, layer, jobNo, cfg):
    # #
    # #     pNo = 0
    # #     jNo = 0
    # #
    # #     rLayer = layer
    # #     self.fb = QgsProcessingFeedback()
    # #     self.context = QgsProcessingContext
    # #
    # #     # sInput = QgsProcessingFeatureSourceDefinition('brs_jobs_ff168cff_1c0e_47e8_b18c_cb8b59c8d07b', True)
    # #     # sInputFields = ['job_no', 'map_bk_lot']
    # #     # sOutput = "\'postgis:dbname=\'BRS_GIS_PRD\' host=localhost port=5432 table=\"public\".\"relatedwork\" (the_geom) sql=\'"
    # #     # sOverlay = "\"\'dbname=\'BRS_GIS_PRD\' host=localhost port=5432 sslmode=disable key=\'gid\' srid=0 \'type=MultiPolygon table=\"public\".\"la_plans_final\" (geom) sql=\'"
    # #     # sOverlayFields = ['plan_no', 'job', 'old_plan']
    # #
    # #     if cfg == 1:
    # #         QgsMessageLog.logMessage('cfg:' + str(cfg), 'BRS_GIS', level=Qgis.Info)
    # #         #QgsMessageLog.logMessage('aNo:' + str(aNo), 'BRS_GIS', level=Qgis.Info)
    # #         #QgsMessageLog.logMessage('rLayer:' + str(rLayer.name()), 'BRS_GIS', level=Qgis.Info)
    # #
    # #         self.vl = QgsProject.instance().mapLayersByName('abutters')[0]
    # #         self.iface.setActiveLayer(self.vl)
    # #
    # #         try:
    # #             attribs = self.iface.activeLayer().selectedFeatures()[0]
    # #         except Exception as e:
    # #             exc_type, exc_obj, exc_tb = sys.exc_info()
    # #             fname = os.path.split(exc_tb.tb_frame.f_code.co_filename)[1]
    # #             QMessageBox.critical(self.iface.mainWindow(), "No Selection",
    # #                                  "Please ensure that you have a parcel selected\nand attempt to "
    # #                                  "generate the output again.\n\n"
    # #                                  "Details: " + str(exc_type) + ' ' + str(fname) + ' ' + str(
    # #                                      exc_tb.tb_lineno) + ' ' + str(
    # #                                      e))
    # #             return
    # #
    # #         if rLayer == 'la_plans':
    # #             QgsMessageLog.logMessage('Getting ABUTTER PLANS...', 'BRS_GIS', level=Qgis.Info)
    # #             processing.runAndLoadResults("qgis:intersection",
    # #                                {'INPUT': QgsProcessingFeatureSourceDefinition('abutters_a7752f9f_2bd3_4bbd_b554_a095bde80b82', True),
    # #                                 'INPUT_FIELDS': ['referrerJ','map_bk_lot'],
    # #                                 'OUTPUT': 'memory:tmp_related',
    # #                                 'OVERLAY': 'dbname=\'BRS_GIS_PRD\' host=localhost port=5432 sslmode=disable key=\'gid\' srid=0 '
    # #                                            'type=MultiPolygon table="public"."la_plans_final" (geom) sql=',
    # #                                 'OVERLAY_FIELDS': ['plan_no', 'job', 'old_plan']
    # #                     }, feedback=self.fb)
    # #
    # #         elif rLayer.name() == 'brs_jobs':
    # #             QgsMessageLog.logMessage('Getting ABUTTER JOBS...', 'BRS_GIS', level=Qgis.Info)
    # #             processing.runAndLoadResults("qgis:intersection",
    # #                                {'INPUT':QgsProcessingFeatureSourceDefinition('abutters_a7752f9f_2bd3_4bbd_b554_a095bde80b82', True),
    # #                                 'INPUT_FIELDS': ['referrerJ','map_bk_lot'],
    # #                                 'OUTPUT': 'memory:tmp_related',
    # #                                 'OVERLAY': QgsProcessingFeatureSourceDefinition(
    # #                                     'brs_jobs_ff168cff_1c0e_47e8_b18c_cb8b59c8d07b'),
    # #                                 'OVERLAY_FIELDS': ['plan_no', 'job', 'old_plan']
    # #                     }, feedback=self.fb)
    # #
    # #     else:
    # #         if rLayer.name() == 'la_plans':
    # #             QgsMessageLog.logMessage('Getting previous PLANS...', 'BRS_GIS', level=Qgis.Info)
    # #             processing.runAndLoadResults("qgis:intersection",
    # #                                          {'INPUT': QgsProcessingFeatureSourceDefinition(
    # #                                              'brs_jobs_ff168cff_1c0e_47e8_b18c_cb8b59c8d07b', True),
    # #                                           'INPUT_FIELDS': ['job_no', 'map_bk_lot'],
    # #                                           'OUTPUT': 'memory:tmp_related',
    # #                                           'OVERLAY': 'dbname=\'BRS_GIS_PRD\' host=localhost port=5432 sslmode=disable key=\'gid\' srid=0 '
    # #                                                      'type=MultiPolygon table="public"."la_plans_final" (geom) sql=',
    # #                                           'OVERLAY_FIELDS': ['plan_no', 'job', 'old_plan']
    # #                                           }, feedback=self.fb)
    # #
    # #         elif rLayer.name() == 'brs_jobs':
    # #             QgsMessageLog.logMessage('Getting previous JOBS...', 'BRS_GIS', level=Qgis.Info)
    # #             processing.runAndLoadResults("qgis:intersection",
    # #                                          {'INPUT': QgsProcessingFeatureSourceDefinition(
    # #                                              'brs_jobs_ff168cff_1c0e_47e8_b18c_cb8b59c8d07b', True),
    # #                                           'INPUT_FIELDS': ['job_no', 'map_bk_lot'],
    # #                                           'OUTPUT': 'memory:tmp_related',
    # #                                           'OVERLAY': QgsProcessingFeatureSourceDefinition(
    # #                                               'brs_jobs_ff168cff_1c0e_47e8_b18c_cb8b59c8d07b'),
    # #                                           'OVERLAY_FIELDS': ['plan_no', 'job', 'old_plan']
    # #                                           }, feedback=self.fb)
    # #
    # #     layerRelated = QgsProject.instance().mapLayersByName('relatedwork')[0]
    # #     self.addLayerDB(layerRelated)
    # #
    # #     layerTmpRelated = QgsProject.instance().mapLayersByName('Intersection')[0]
    # #     layerTmpRelated.selectAll()
    # #
    # #     self.iface.actionCopyFeatures().trigger()
    # #     self.vl = QgsProject.instance().mapLayersByName('relatedwork')[0]
    # #     self.iface.setActiveLayer(self.vl)
    # #     self.iface.actionToggleEditing().trigger()
    # #     self.iface.actionIdentify().trigger()
    # #     self.iface.actionPasteFeatures().trigger()
    # #     self.iface.activeLayer().commitChanges()
    # #     self.iface.setActiveLayer(layerRelated)
    # #     QgsProject.instance().removeMapLayer(layerTmpRelated.id())
    # #     self.iface.mapCanvas().refresh()
    # #     plans = []
    # #     ppval = ''
    # #     pval = ''
    # #
    # #     for l in layerRelated.getFeatures():
    # #         plan_no = l["plan_no"]
    # #         job_no = l["job_no"]
    # #         QgsMessageLog.logMessage('j: ' + jobNo + ' | ' + plan_no, 'BRS_GIS', level=Qgis.Info)
    # #         if plan_no == jobNo:
    # #             self.iface.actionToggleEditing().trigger()
    # #             layerRelated.deleteFeature(l.id())
    # #             self.iface.activeLayer().commitChanges()
    # #             # QgsProject.instance().removeMapLayer(layerRelated.id())
    # #             layerRelated = QgsProject.instance().mapLayersByName('relatedwork')[0]
    # #             # self.addLayerDB(layerRelated)
    # #             self.iface.mapCanvas().refresh()
    # #         else:
    # #             # add to plan string/job string
    # #             oldPlanNo = l['old_plan']
    # #             pval = str(oldPlanNo)
    # #
    # #             if str(ppval) == str(pval):
    # #                 pval = ''
    # #             else:
    # #                 pass
    # #
    # #             plen = len(plans)
    # #
    # #             # QgsMessageLog.logMessage('length of array: ' + str(plen), 'BRS_GIS', level=Qgis.Info)
    # #             plans.append(pval)
    # #
    # #             pNo += 1
    # #             ppval = pval
    # #             # QgsMessageLog.logMessage('plans: ' + str(plans), 'BRS_GIS', level=Qgis.Info)
    # #
    # #     # lyr =  QgsProject.instance().mapLayersByName('brs_jobs')[0]
    # #     # self.iface.setActiveLayer(lyr)
    # #     # j = self.iface.activeLayer().selectedFeatures()[0]
    # #
    # #     if len(plans) > 1:
    # #         plans.sort(reverse=True)
    # #         pFinal = str(plans)
    # #         pFinal = pFinal.strip('[')
    # #         pFinal = pFinal.strip(']')
    # #         pFinal = pFinal.replace('\'', '')
    # #         # # start editing, change field value
    # #         # self.iface.actionToggleEditing().trigger()
    # #         # layerData = lyr.dataProvider()
    # #         # idx3 = layerData.fieldNameIndex('old_plan_no')
    # #         # lyr.changeAttributeValue(j.id(), idx3, str(pFinal))
    # #         # lyr.updateFields()
    # #         # self.iface.activeLayer().commitChanges()
    # #         plans = []
    # #
    # #     else:
    # #         pass
    # #
    # #     return pFinal
