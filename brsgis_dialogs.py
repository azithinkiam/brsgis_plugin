from __future__ import absolute_import
from __future__ import print_function

import csv
import os.path
import sys
from builtins import range
from functools import partial
import threading

from PyQt5.QtCore import QVariant, Qt, QRectF
from PyQt5.QtGui import QIcon, QGuiApplication
from PyQt5.QtWidgets import QPushButton, QAction, QMessageBox, QDialog

from qgis.core import *

import processing
import pyperclip

sys.path.append(os.path.dirname(os.path.abspath(__file__)) + "/forms")

from .forms.brsgis_label_form import *

class FuncThread(threading.Thread):
    def __init__(self, target, *args):
        self._target = target
        self._args = args
        threading.Thread.__init__(self)

    def run(self):
        self._target(*self._args)

class brsgis_newJob(object):
    newJob = 0
    selComp = 0
    multiFeat = 0
    count = 0

    def __init__(self, iface):
        # save reference to the QGIS interface
        self.iface = iface

    def initGui(self):

        self.action = QAction("Create New Job", self.iface.mainWindow())
        self.action.triggered.connect(self.run)
        self.action.trigger()
        self.iface.mapCanvas().selectionChanged.connect(self.select_changed)

    def run(self):
        self.vl = QgsProject.instance().mapLayersByName('parcels')[0]
        self.iface.setActiveLayer(self.vl)

        reply = QMessageBox.question(self.iface.mainWindow(), 'New Job',
                                     'Click OK and select the correct parcel for the new job.',
                                     QMessageBox.Ok, QMessageBox.Cancel)
        if reply == QMessageBox.Ok:
            if self.selComp == 1:
                return
            else:
                self.newJob = 1
                if self.count == 0:
                    for a in self.iface.attributesToolBar().actions():
                        if a.objectName() == 'mActionDeselectAll':
                            a.trigger()
                            QgsMessageLog.logMessage('FIRST RUN: Previously selected parcel(s) have been cleared.',
                                                     'BRS_GIS', level=Qgis.Info)
                            QgsMessageLog.logMessage('Job creation starting...', 'BRS_GIS', level=Qgis.Info)
                            self.iface.actionSelect().trigger()
                            self.count = self.count + 1
                else:
                    self.iface.actionSelect().trigger()

        else:
            QgsMessageLog.logMessage('DEBUG: Job creation cancelled.', 'BRS_GIS', level=Qgis.Info)

    def select_changed(self):

        if self.newJob == 0:
            return
        else:
            try:
                parcel = self.iface.activeLayer().selectedFeatures()[0]

                map_bk_lot = parcel["map_bk_lot"]
                origMBL = parcel["map_bk_lot"]

                mbl = map_bk_lot.split('-')
                mbLen = len(mbl)
                # need to troubleshoot this...shouldn't be throwing an exception.
                try:
                    if mbLen == 1:
                        map_bk_lot = map_bk_lot
                    elif mbLen == 2:
                        map_bk_lot = 'Map ' + mbl[0].lstrip('0') + ', Lot ' + mbl[1].lstrip('0')
                    elif mbLen == 3:
                        map_bk_lot = 'Map ' + mbl[0].lstrip('0') + ', Lot ' + mbl[1].lstrip('0') + '-' + mbl[2].lstrip('0')
                except Exception as e:
                    map_bk_lot = map_bk_lot

                msg = QMessageBox()
                msg.setWindowTitle('New Job')
                msg.setText(map_bk_lot + ' has been selected. Continue?')
                create = msg.addButton('Create Job', QMessageBox.AcceptRole)
                add = msg.addButton(' Select Additional Parcel(s) ', QMessageBox.AcceptRole)
                cancel = msg.addButton('Cancel', QMessageBox.RejectRole)
                msg.setDefaultButton(create)
                QGuiApplication.setOverrideCursor(Qt.ArrowCursor)
                msg.exec_()
                msg.deleteLater()
                QGuiApplication.restoreOverrideCursor()
                if msg.clickedButton() is create:
                    if self.multiFeat == 0:
                        QgsMessageLog.logMessage('Job creation will begin for: ' + map_bk_lot,
                                                 'BRS_GIS', level=Qgis.Info)
                        self.iface.actionCopyFeatures().trigger()
                        self.newJob = 0
                        self.vl = QgsProject.instance().mapLayersByName('brs_jobs')[0]
                        self.iface.setActiveLayer(self.vl)

                        self.iface.actionIdentify().trigger()
                        QgsMessageLog.logMessage('Launching form...', 'BRS_GIS', level=Qgis.Info)
                        self.iface.actionToggleEditing().trigger()
                        self.iface.actionPasteFeatures().trigger()
                        self.iface.activeLayer().commitChanges()

                        self.iface.actionToggleEditing().trigger()
                        self.vl = QgsProject.instance().mapLayersByName('brs_contacts')[0]
                        self.iface.setActiveLayer(self.vl)
                        self.iface.actionToggleEditing().trigger()

                        #  ------------- EDITING BEGINS -------------
                        self.active_edit()
                        #  ------------- EDITING ENDS -------------

                        jobNo = self.vl.selectedFeatures()[0]
                        lat_lon = jobNo['lat_lon']
                        dd = float(lat_lon.split(',')[0])
                        dd2 = float(lat_lon.split(',')[1])

                        d = int(float(dd))
                        m = int(float((dd - d)) * 60)
                        s = (dd - d - m / 60) * 3600.00
                        z = round(s, 2)

                        if d >= 0:
                            lat = (str(abs(d)) + '°' + str(abs(m)) + "'" + str(abs(z)) + '"' + 'N')
                        else:
                            lat = (str(abs(d)) + '°' + str(abs(m)) + "'" + str(abs(z)) + '"' + 'S')

                        d = int(float(dd2))
                        m = int(float((dd2 - d)) * 60)
                        s = (dd2 - d - m / 60) * 3600.00
                        z = round(s, 2)

                        if d >= 0:
                            lon = (str(abs(d)) + '°' + str(abs(m)) + "'" + str(abs(z)) + '"' + 'E')
                        else:
                            lon = (str(abs(d)) + '°' + str(abs(m)) + "'" + str(abs(z)) + '"' + 'W')

                        lat_lon = str(lat) + '    ' + str(lon)
                        lyr = QgsProject.instance().mapLayersByName('brs_jobs')[0]
                        # start editing, change field value
                        self.iface.actionToggleEditing().trigger()
                        layerData = lyr.dataProvider()
                        idx3 = layerData.fieldNameIndex('lat_lon')
                        lyr.changeAttributeValue(jobNo.id(), idx3, lat_lon)
                        lyr.updateFields()
                        self.iface.activeLayer().commitChanges()

                        # # -------------- BEGIN PLAN GRAB --------------
                        # layer4 = QgsProject.instance().mapLayersByName('la_plans')[0]
                        # exp = QgsExpression(u'"map_bk_lot" = \'%s\'' % (origMBL))
                        #
                        # request = QgsFeatureRequest(exp)
                        # request.setSubsetOfAttributes(['map_bk_lot, plan_no'], layer4.fields())
                        # request.setFlags(QgsFeatureRequest.NoGeometry)
                        # plans = []
                        # plans2 = []
                        # ppval = ''
                        # pval = ''
                        # pNo = 0
                        #
                        # for p in layer4.getFeatures(request):
                        #     # do something with the feature
                        #     planNo = p['size_no'] + '-' + str(p['file_no']).lstrip('0')
                        #     job = p['job']
                        #     if str(job) == 'NULL':
                        #         job = ' '
                        #     # name = str(p['name'])
                        #
                        #     pval = str(planNo) + '(' + str(job) + ') '
                        #
                        #     if str(ppval) == str(pval):
                        #         pval = ''
                        #     else:
                        #         pass
                        #
                        #     plen = len(plans)
                        #
                        #     # QgsMessageLog.logMessage('length of array: ' + str(plen), 'BRS_GIS', level=Qgis.Info)
                        #
                        #     if plen < 5:
                        #         plans.append(pval)
                        #     else:
                        #         plans2.append(pval)
                        #
                        #     pNo += 1
                        #     ppval = pval
                        #
                        # # QgsMessageLog.logMessage(str(plans) + ' will now reset.', 'BRS_GIS', level=Qgis.Info)
                        #
                        # if len(plans) > 1:
                        #     plans.sort()
                        #     pFinal = str(plans)
                        #     pFinal = pFinal.strip('[')
                        #     pFinal = pFinal.strip(']')
                        #     pFinal = pFinal.replace('\'', '')
                        #     pFinal = pFinal.replace(',', ' ')
                        #     # start editing, change field value
                        #     self.iface.actionToggleEditing().trigger()
                        #     layerData = lyr.dataProvider()
                        #     idx3 = layerData.fieldNameIndex('old_plan_no')
                        #     lyr.changeAttributeValue(jobNo.id(), idx3, str(pFinal))
                        #     lyr.updateFields()
                        #     self.iface.activeLayer().commitChanges()
                        #
                        # else:
                        #     pass
                        # -------------- END PLAN GRAB --------------
                        jobNum = jobNo["job_no"]
                        QgsMessageLog.logMessage('JobNo:' + jobNum + ' has been created and saved.',
                                                 'BRS_GIS', level=Qgis.Info)

                        self.vl = QgsProject.instance().mapLayersByName('brs_contacts')[0]
                        self.iface.setActiveLayer(self.vl)
                        self.iface.activeLayer().commitChanges()
                        lyr = QgsProject.instance().mapLayersByName('brs_jobs')[0]
                        self.iface.setActiveLayer(lyr)

                    else:
                        QgsMessageLog.logMessage('Job creation will begin for multiple parcels:', 'BRS_GIS', level=Qgis.Info)
                        self.iface.actionCopyFeatures().trigger()
                        self.newJob = 0
                        self.vl = QgsProject.instance().mapLayersByName('brs_jobs')[0]
                        self.iface.setActiveLayer(self.vl)

                        self.iface.actionIdentify().trigger()
                        self.iface.actionToggleEditing().trigger()
                        self.iface.actionPasteFeatures().trigger()
                        self.iface.mainWindow().findChild(QAction, 'mActionMergeFeatures').trigger()
                        # end merge features, launch form
                        self.iface.activeLayer().commitChanges()
                        layer = self.iface.activeLayer()
                        prov = layer.dataProvider()

                        idx = prov.fieldNameIndex('sid')

                        sid = layer.maximumValue(idx)
                        it = layer.getFeatures(QgsFeatureRequest().setFilterExpression(u'"sid" = {0}'.format(sid)))
                        # QgsMessageLog.logMessage('sid: ' + str(sid) + ' it: ' + str(it), 'BRS_GIS', level=Qgis.Info)
                        for feature in it:
                            f = feature.id()
                            layer.select(f)

                        QgsMessageLog.logMessage('Launching form for merged feature...', 'BRS_GIS', level=Qgis.Info)
                        self.iface.activeLayer().commitChanges()
                        self.iface.actionToggleEditing().trigger()
                        self.vl = QgsProject.instance().mapLayersByName('brs_contacts')[0]
                        self.iface.setActiveLayer(self.vl)
                        self.iface.actionToggleEditing().trigger()

                        #  ------------- EDITING BEGINS -------------
                        self.active_edit()
                        #  ------------- EDITING ENDS -------------

                        self.vl = QgsProject.instance().mapLayersByName('brs_jobs')[0]

                        jobNo = self.vl.selectedFeatures()[0]
                        lat_lon = jobNo['lat_lon']
                        dd = float(lat_lon.split(',')[0])
                        dd2 = float(lat_lon.split(',')[1])

                        d = int(float(dd))
                        m = int(float((dd - d)) * 60)
                        s = (dd - d - m / 60) * 3600.00
                        z = round(s, 2)

                        if d >= 0:
                            lat = (str(abs(d)) + '°' + str(abs(m)) + "'" + str(abs(z)) + '"' + 'N')
                        else:
                            lat = (str(abs(d)) + '°' + str(abs(m)) + "'" + str(abs(z)) + '"' + 'S')

                        d = int(float(dd2))
                        m = int(float((dd2 - d)) * 60)
                        s = (dd2 - d - m / 60) * 3600.00
                        z = round(s, 2)

                        if d >= 0:
                            lon = (str(abs(d)) + '°' + str(abs(m)) + "'" + str(abs(z)) + '"' + 'E')
                        else:
                            lon = (str(abs(d)) + '°' + str(abs(m)) + "'" + str(abs(z)) + '"' + 'W')

                        lat_lon = str(lat) + '    ' + str(lon)
                        lyr = QgsProject.instance().mapLayersByName('brs_jobs')[0]
                        # start editing, change field value
                        self.iface.actionToggleEditing().trigger()
                        layerData = lyr.dataProvider()
                        idx3 = layerData.fieldNameIndex('lat_lon')
                        lyr.changeAttributeValue(jobNo.id(), idx3, lat_lon)
                        lyr.updateFields()
                        # end field update, save layer
                        self.iface.activeLayer().commitChanges()

                        self.iface.setActiveLayer(self.vl)

                        layer = self.iface.activeLayer()
                        prov = layer.dataProvider()

                        idx = prov.fieldNameIndex('sid')

                        sid = layer.maximumValue(idx)
                        it = layer.getFeatures(QgsFeatureRequest().setFilterExpression(u'"sid" = {0}'.format(sid)))

                        for feature in it:
                            f = feature.id()
                            layer.select(f)

                        jobNo = self.vl.selectedFeatures()[0]
                        jobNo["job_no"]
                        QgsMessageLog.logMessage('JobNo:' + jobNo["job_no"] + ' has been created and saved.',
                                                 'BRS_GIS', level=Qgis.Info)
                        self.vl = QgsProject.instance().mapLayersByName('brs_contacts')[0]
                        self.iface.setActiveLayer(self.vl)
                        self.iface.activeLayer().commitChanges()
                        lyr = QgsProject.instance().mapLayersByName('brs_jobs')[0]
                        self.iface.setActiveLayer(lyr)


                elif msg.clickedButton() is add:
                    self.multiFeat = 1
                    # QgsMessageLog.logMessage('ADD: ' + str(self.multiFeat), 'BRS_GIS', level=Qgis.Info)
                elif msg.clickedButton() is cancel:
                    self.iface.mapCanvas().selectionChanged.disconnect(self.select_changed)
                    # QGuiApplication.restoreOverrideCursor()
                    return

            except Exception as e:
                exc_type, exc_obj, exc_tb = sys.exc_info()
                fname = os.path.split(exc_tb.tb_frame.f_code.co_filename)[1]
                QMessageBox.critical(self.iface.mainWindow(), "EXCEPTION",
                                     "Details: " + str(exc_type) + ' ' + str(fname) + ' ' + str(
                                         exc_tb.tb_lineno) + ' ' + str(e))
                # QGuiApplication.setOverrideCursor(Qt.ArrowCursor)
                #  QGuiApplication.restoreOverrideCursor()
                return

    def active_edit(self):

        try:

            self.vl = QgsProject.instance().mapLayersByName('brs_jobs')[0]
            self.iface.setActiveLayer(self.vl)
            f = self.vl.selectedFeatures()[0]
            #change to brs_jobs form
            form_config = self.iface.activeLayer().editFormConfig()
            form_config.setUiForm('z:/0 - settings/gis/qgis/plugins/brsgis_plugin/ui/brs_jobs.ui')
            form_config.setInitFilePath('z:/0 - settings/gis/qgis/plugins/brsgis_plugin/brs_jobs_init.py')
            self.iface.activeLayer().setEditFormConfig(form_config)

            QGuiApplication.setOverrideCursor(Qt.ArrowCursor)
            self.iface.openFeatureForm(self.iface.activeLayer(), f, False, True)
            QGuiApplication.restoreOverrideCursor()

            #  ------------- ABUTTERS BEGINS -------------
            self.abutters_dialog = brsgis_abutters(self.iface)
            self.abutters_dialog.run()
            #  ------------- ABUTTERS ENDS -------------

            # QGuiApplication.setOverrideCursor(Qt.ArrowCursor)
            # QGuiApplication.restoreOverrideCursor()
            QgsMessageLog.logMessage('Saving changes...', 'BRS_GIS', level=Qgis.Info)

        except Exception as e:
            exc_type, exc_obj, exc_tb = sys.exc_info()
            fname = os.path.split(exc_tb.tb_frame.f_code.co_filename)[1]
            QMessageBox.critical(self.iface.mainWindow(), "EXCEPTION",
                                 "Details: " + str(exc_type) + ' ' + str(fname) + ' ' + str(
                                     exc_tb.tb_lineno) + ' ' + str(e))
            return

        self.vl = QgsProject.instance().mapLayersByName('brs_jobs')[0]
        self.iface.setActiveLayer(self.vl)
        self.iface.activeLayer().commitChanges()

class brsgis_editJob(object):

    newJob = 0
    selComp = 0
    multiFeat = 0
    count = 0

    def __init__(self, iface):
        # save reference to the QGIS interface
        self.iface = iface

    def initGui(self):

        self.action = QAction("Create New Job", self.iface.mainWindow())
        self.action.triggered.connect(self.run)
        self.action.trigger()
        self.iface.mapCanvas().selectionChanged.connect(self.select_changed)

    def run(self):
        self.vl = QgsProject.instance().mapLayersByName('brs_jobs')[0]
        self.iface.setActiveLayer(self.vl)

        reply = QMessageBox.question(self.iface.mainWindow(), 'Edit Job',
                                     'Click OK and select the correct parcel for the job you wish to edit.',
                                     QMessageBox.Ok, QMessageBox.Cancel)
        if reply == QMessageBox.Ok:
            if self.selComp == 1:
                return
            else:
                self.newJob = 1
                if self.count == 0:
                    for a in self.iface.attributesToolBar().actions():
                        if a.objectName() == 'mActionDeselectAll':
                            a.trigger()
                            QgsMessageLog.logMessage('FIRST RUN: Previously selected parcel(s) have been cleared.',
                                                     'BRS_GIS', level=Qgis.Info)
                            QgsMessageLog.logMessage('Job editing starting...', 'BRS_GIS', level=Qgis.Info)
                            self.iface.actionSelect().trigger()
                            self.count = self.count + 1
                else:
                    self.iface.actionSelect().trigger()
        else:
            QgsMessageLog.logMessage('DEBUG: Job editing cancelled.', 'BRS_GIS', level=Qgis.Info)

    def select_changed(self):

        try:
            parcel = self.iface.activeLayer().selectedFeatures()[0]
            jobNo = parcel["job_no"]

            msg = QMessageBox()
            msg.setWindowTitle('Edit Job')
            msg.setText('JobNo: ' + jobNo + ' has been selected. Continue?')
            edit = msg.addButton('Edit Job', QMessageBox.AcceptRole)
            cancel = msg.addButton('Cancel', QMessageBox.RejectRole)
            msg.setDefaultButton(edit)
            QGuiApplication.setOverrideCursor(Qt.ArrowCursor)
            msg.exec_()
            msg.deleteLater()
            QGuiApplication.restoreOverrideCursor()
            if msg.clickedButton() is edit:
                if self.multiFeat == 0:
                    QgsMessageLog.logMessage('Job editing will begin for: ' + jobNo,
                                             'BRS_GIS', level=Qgis.Info)
                    QgsMessageLog.logMessage('Launching form...', 'BRS_GIS', level=Qgis.Info)
                    self.iface.actionToggleEditing().trigger()
                    self.vl = QgsProject.instance().mapLayersByName('brs_contacts')[0]
                    self.iface.setActiveLayer(self.vl)
                    self.iface.actionToggleEditing().trigger()
                    self.active_edit()
                    QgsMessageLog.logMessage('JobNo:' + parcel["job_no"] + ' has been modified and saved.',
                                             'BRS_GIS', level=Qgis.Info)

                    self.vl = QgsProject.instance().mapLayersByName('brs_contacts')[0]
                    self.iface.setActiveLayer(self.vl)
                    self.iface.activeLayer().commitChanges()
                    lyr = QgsProject.instance().mapLayersByName('brs_jobs')[0]
                    self.iface.setActiveLayer(lyr)
                    self.iface.mapCanvas().selectionChanged.disconnect(self.select_changed)
                    self.iface.actionIdentify().trigger()

                elif msg.clickedButton() is cancel:
                    self.iface.mapCanvas().selectionChanged.disconnect(self.select_changed)
                    QgsMessageLog.logMessage('DEBUG: Job editing cancelled.', 'BRS_GIS', level=Qgis.Info)
                    return
                else:
                    QgsMessageLog.logMessage('DEBUG: Job editing cancelled.', 'BRS_GIS', level=Qgis.Info)
            else:
                return

        except Exception as e:
            QgsMessageLog.logMessage('EXCEPTION: ' + str(e), 'BRS_GIS', level=Qgis.Info)


    def active_edit(self):

        try:
            self.vl = QgsProject.instance().mapLayersByName('brs_jobs')[0]
            self.iface.setActiveLayer(self.vl)
            f = self.vl.selectedFeatures()[0]
            #change to brs_jobs form
            form_config = self.iface.activeLayer().editFormConfig()
            form_config.setUiForm('z:/0 - settings/gis/qgis/plugins/brsgis_plugin/ui/brs_jobs.ui')
            form_config.setInitFilePath('z:/0 - settings/gis/qgis/plugins/brsgis_plugin/brs_jobs_init.py')
            self.iface.activeLayer().setEditFormConfig(form_config)
            QGuiApplication.setOverrideCursor(Qt.ArrowCursor)
            self.iface.openFeatureForm(self.iface.activeLayer(), f, False, True)
            QGuiApplication.restoreOverrideCursor()
            QgsMessageLog.logMessage('Saving changes...', 'BRS_GIS', level=Qgis.Info)

        except Exception as e:
            exc_type, exc_obj, exc_tb = sys.exc_info()
            fname = os.path.split(exc_tb.tb_frame.f_code.co_filename)[1]
            QMessageBox.critical(self.iface.mainWindow(), "EXCEPTION",
                                 "Details: " + str(exc_type) + ' ' + str(fname) + ' ' + str(
                                     exc_tb.tb_lineno) + ' ' + str(e))
            return

        self.vl = QgsProject.instance().mapLayersByName('brs_jobs')[0]
        self.iface.setActiveLayer(self.vl)
        self.iface.activeLayer().commitChanges()

class brsgis_printFolderLabel(object):
    def __init__(self, iface):
        # save reference to the QGIS interface
        self.iface = iface

    def __call__(self):
        self.action = QAction("PFL", self.iface.mainWindow())
        self.action.triggered.connect(self.run)
        self.action.trigger()

    def initGui(self):

        icon = QIcon(os.path.dirname(__file__) + "/icons/brsgis_voronoi.png")

        self.action = QAction(icon, "PFL", self.iface.mainWindow())
        self.action.triggered.connect(self.run)
        self.action.trigger()
        self.iface.removeToolBarIcon(self.action)

    def run(self):
        import datetime
        year = datetime.datetime.today().strftime('%Y')
        self.vl = QgsProject.instance().mapLayersByName('brs_jobs')[0]
        self.iface.setActiveLayer(self.vl)
        attribs = self.iface.activeLayer().selectedFeatures()[0]
        clientLast = attribs["folder_name"]
        clientFirst = attribs["folder_name"]
        folderName = attribs["folder_type"]

        try:
            sPos = int(clientLast.find(" "))
            clientLast = clientLast[:sPos]
            clientFirst = clientFirst[sPos:]

        except Exception as e:
            exc_type, exc_obj, exc_tb = sys.exc_info()
            fname = os.path.split(exc_tb.tb_frame.f_code.co_filename)[1]
            QMessageBox.critical(self.iface.mainWindow(), "EXCEPTION",
                                 "Details: " + str(exc_type) + ' ' + str(fname) + ' ' + str(
                                     exc_tb.tb_lineno) + ' ' + str(e))
            return

        addr = attribs["locus_addr"]
        town = attribs["town"]
        map_bk_lot = attribs["map_bk_lot"]
        mbl = map_bk_lot.split('-')
        mbLen = len(mbl)

        if mbLen == 1:
            map_bk_lot = map_bk_lot
        elif mbLen == 2:
            map_bk_lot = 'Map ' + mbl[0].lstrip('0') + ', Lot ' + mbl[1].lstrip('0')
        elif mbLen == 3:
            map_bk_lot = 'Map ' + mbl[0].lstrip('0') + ', Lot ' + mbl[1].lstrip('0') + '-' + mbl[2].lstrip('0')

        jobType = attribs["job_type"]
        jobNo = attribs["job_no"]
        date_due = attribs["date_due"]

        path = os.path.join("Z:\\", "BRS", year, jobNo)  # need to programattically grab year
        jipath = os.path.join(path, "Job_Info")

        dwgpath = os.path.join(path, "dwg")
        frcpath = os.path.join(path, "frClient")
        gispath = os.path.join(path, "GIS")
        ppath = os.path.join(path, "prints")
        supath = os.path.join(path, "survey")

        QgsMessageLog.logMessage('Checking output folder: ' + path + '...', 'BRS_GIS', level=Qgis.Info)
        if not os.path.exists(path):
            os.makedirs(path)
        QgsMessageLog.logMessage('Checking output folder: ' + jipath + '...', 'BRS_GIS', level=Qgis.Info)
        if not os.path.exists(jipath):
            os.makedirs(jipath)
            os.makedirs(dwgpath)
            os.makedirs(gispath)
            os.makedirs(frcpath)
            os.makedirs(ppath)
            os.makedirs(supath)

        from openpyxl import load_workbook
        wb = load_workbook('z:/0 - settings/gis/qgis/plugins/brsgis_plugin/BRS_templates.xlsx')

        # grab the correct worksheet
        for s in range(len(wb.sheetnames)):
            if wb.sheetnames[s] == 'face':
                break
        wb.active = s

        # remove unused templates
        sheets = wb.sheetnames
        for s in sheets:

            if s != 'face':
                sheet_name = wb.get_sheet_by_name(s)
                wb.remove_sheet(sheet_name)
        ws = wb.active
        try:
            # QgsMessageLog.logMessage('Date Due: ' + date_due + '...', 'BRS_GIS', level=Qgis.Info)
            ws['A1'] = clientLast.upper()
            ws['A2'] = clientFirst
            ws['A3'] = '(' + folderName +')'
            ws['A6'] = addr  # 'Castle Rock Farm Road' - where to get this?
            ws['A7'] = town.upper()
            ws['A10'] = map_bk_lot  # 'Map R7, Lot 58'
            ws['A12'] = jobType
            ws['A15'] = jobNo
            #QgsMessageLog.logMessage('Date Due: ' + str(date_due) + '...', 'BRS_GIS', level=Qgis.Info)
            if str(date_due) == '1900-01-01':
                ws['A20'] = ''
            else:
                ws['A20'] = date_due
        except Exception as e:
            exc_type, exc_obj, exc_tb = sys.exc_info()
            fname = os.path.split(exc_tb.tb_frame.f_code.co_filename)[1]
            QMessageBox.critical(self.iface.mainWindow(), "EXCEPTION",
                                 "Details: " + str(exc_type) + ' ' + str(fname) + ' ' + str(
                                     exc_tb.tb_lineno) + ' ' + str(e))
            return
        # Save the file
        facefile = str(jipath) + "\\" + jobNo + "_FolderFaceLabel_" + datetime.datetime.today().strftime(
            '%Y.%m.%d') + ".xlsx"
        QgsMessageLog.logMessage('Saving file: ' + facefile + '...', 'BRS_GIS', level=Qgis.Info)
        wb.save(facefile)

class brsgis_printYellowSheet(object):
    def __init__(self, iface):
        # save reference to the QGIS interface
        self.iface = iface

    def initGui(self):

        self.action = QAction("PYS", self.iface.mainWindow())
        self.action.triggered.connect(self.run)
        self.action.trigger()

    def run(self):
        import datetime
        year = datetime.datetime.today().strftime('%Y')
        self.vl = QgsProject.instance().mapLayersByName('brs_jobs')[0]
        self.iface.setActiveLayer(self.vl)
        attribs = self.iface.activeLayer().selectedFeatures()[0]

        date_requested = attribs["date_requested"]
        date_due = attribs["date_due"]
        jobNo = attribs["job_no"]
        revNo = attribs["rev_no"]
        clientName = attribs["client_name"]
        mail_addr = attribs["contact_addr"]
        locus_addr = attribs["locus_addr"]
        phone_mobile = attribs["phone_mobile"]
        phone_home = attribs["phone_home"]
        phone_work = attribs["phone_work"]
        email_primary = attribs["email_primary"]
        email_secondary = attribs["email_secondary"]
        lowtide = attribs["lowtide"]

        # QgsMessageLog.logMessage('lowtide: ' + lowtide + '....', 'BRS_GIS', level=Qgis.Info)

        if lowtide == 't':
            #QgsMessageLog.logMessage('YES...', 'BRS_GIS', level=Qgis.Info)
            lowtide = 'YES'
        else:
            #QgsMessageLog.logMessage('NOPE...', 'BRS_GIS', level=Qgis.Info)
            lowtide = 'NO'

        lowtide_hrs = attribs["lowtide_hrs"]
        # QgsMessageLog.logMessage('lowtide_hrs: ' + str(lowtide_hrs) + '....', 'BRS_GIS', level=Qgis.Info)
        if lowtide == 'YES':
            pass
        else:
            lowtide_hrs = 'N/A'

        town = attribs["town"]
        map_bk_lot = attribs["map_bk_lot"]
        mbl = map_bk_lot.split('-')
        mbLen = len(mbl)

        if mbLen == 1:
            map_bk_lot = map_bk_lot
        elif mbLen == 2:
            map_bk_lot = 'Map ' + mbl[0].lstrip('0') + ', Lot ' + mbl[1].lstrip('0')
        elif mbLen == 3:
            map_bk_lot = 'Map ' + mbl[0].lstrip('0') + ', Lot ' + mbl[1].lstrip('0') + '-' + mbl[2].lstrip('0')

        jobType = attribs["job_type"]
        folderName = attribs["folder_name"]

        hrs_rs_est = attribs["hrs_rs_est"]
        hrs_cad_est = attribs["hrs_cad_est"]
        hrs_fw_est = attribs["hrs_fw_est"]
        hrs_misc_est = attribs["hrs_misc_est"]

        rate_rs = ''
        rate_cad = ''
        rate_fw = ''
        rate_misc = ''

        amt_rs = attribs["amt_rs"]
        amt_cad = attribs["amt_cad"]
        amt_fw = attribs["amt_fw"]
        amt_misc = attribs["amt_misc"]
        amt_total = attribs["amt_total"]
        amt_dep = attribs["amt_dep"]

        date_estimate_sent = attribs["date_estimate_sent"]
        date_dep = attribs["date_dep"]

        date_prelim = attribs["date_prelim"]
        date_finalplans = attribs["date_finalplans"]
        date_mylar = attribs["date_mylar"]
        date_deeddesc = attribs["date_deeddesc"]
        date_pins = attribs["date_pins"]
        date_fw = attribs["date_fw"]
        date_cad = attribs["date_cad"]

        copies_prelim = attribs["copies_prelim"]
        copies_finalplans = attribs["copies_finalplans"]
        copies_mylar = attribs["copies_mylar"]
        copies_deeddesc = attribs["copies_deeddesc"]
        copies_pins = attribs["copies_pins"]
        copies_fw = attribs["copies_fw"]
        copies_cad = attribs["copies_cad"]

        to_prelim = attribs["to_prelim"]
        to_finalplans = attribs["to_finalplans"]
        to_mylar = attribs["to_mylar"]
        to_deeddesc = attribs["to_deeddesc"]
        to_pins = attribs["to_pins"]
        to_fw = attribs["to_fw"]
        to_cad = attribs["to_cad"]

        date_recorded = attribs["date_recorded"]
        recorded_by = attribs["recorded_by"]
        planbook_page = attribs["planbook_page"]

        date_invoice1 = attribs["date_invoice1"]
        date_invoice2 = attribs["date_invoice2"]
        date_invoice3 = attribs["date_invoice3"]

        amt_invoice1 = attribs["amt_invoice1"]
        amt_invoice2 = attribs["amt_invoice2"]
        amt_invoice3 = attribs["amt_invoice3"]

        job_desc = attribs["job_desc"]

        path = os.path.join("Z:\\", "BRS", year, jobNo)
        jipath = os.path.join(path, "Job_Info")
        # QgsMessageLog.logMessage('Checking output folder: ' + path + '...', 'BRS_GIS', level=Qgis.Info)
        if not os.path.exists(path):
            os.makedirs(path)
        # QgsMessageLog.logMessage('Checking output folder: ' + jipath + '...', 'BRS_GIS', level=Qgis.Info)
        if not os.path.exists(jipath):
            os.makedirs(jipath)

        from openpyxl import load_workbook
        wb = load_workbook('z:/0 - settings/gis/qgis/plugins/brsgis_plugin/BRS_templates.xlsx')

        # QgsMessageLog.logMessage('wb: ' + str(wb.active), 'BRS_GIS', level=Qgis.Info)
        # remove unused templates
        sheets = wb.sheetnames
        for s in sheets:

            if s != 'yellow':
                sheet_name = wb.get_sheet_by_name(s)
                # QgsMessageLog.logMessage('Sheet Name: ' + str(sheet_name) + '...', 'BRS_GIS', level=Qgis.Info)
                wb.remove_sheet(sheet_name)
        # grab the correct worksheet
        for s in range(len(wb.sheetnames)):
            if wb.sheetnames[s] == 'yellow':
                break
        wb.active = s

        try:
            ws2 = wb.active
            # required fields - return if null
            ws2['B1'] = date_requested
            ws2['I1'] = jobNo
            ws2['I2'] = revNo
            ws2['B5'] = clientName
            ws2['B6'] = locus_addr
            ws2['F4'] = mail_addr
            ws2['B7'] = town
            ws2['B8'] = map_bk_lot
            ws2['F6'] = phone_mobile
            ws2['B9'] = folderName
            ws2['C1'] = jobType
            ws2['B10'] = lowtide
            ws2['B11'] = lowtide_hrs

            ws2['C18'] = rate_rs
            ws2['C17'] = rate_cad
            ws2['C16'] = rate_fw
            ws2['C19'] = rate_misc

            # optional fields - allow nulls
            if str(email_secondary) == 'NULL':
                ws2['F10'] = ''
            else:
                ws2['F10'] = email_secondary
            if str(email_primary) == 'NULL':
                ws2['F9'] = ''
            else:
                ws2['F9'] = email_primary
            if str(phone_work) == 'NULL':
                ws2['F7'] = ''
            else:
                ws2['F7'] = phone_work
            if str(phone_home) == 'NULL':
                ws2['F8'] = ''
            else:
                ws2['F8'] = phone_home
            if str(date_recorded) == '1900-01-01':
                ws2['B32'] = ''
            else:
                ws2['B32'] = date_recorded
            if str(recorded_by) == 'NULL':
                ws2['B33'] = ''
            else:
                ws2['B33'] = recorded_by
            if str(planbook_page) == 'NULL':
                ws2['B34'] = ''
            else:
                ws2['B34'] = planbook_page

            if str(date_due) == '1900-01-01':
                ws2['B2'] = ''
            else:
                ws2['B2'] = date_due

            if str(job_desc) == 'NULL':
                ws2['B39'] = ''
            else:
                ws2['B39'] = job_desc

            # ws2['B25'] = hrs_rs_est
            # ws2['B26'] = hrs_cad_est
            # ws2['B27'] = hrs_fw_est
            # ws2['B28'] = hrs_misc_est

            # ws2['C25'] = rate_rs
            # ws2['C26'] = rate_cad
            # ws2['C27'] = rate_fw
            # ws2['C28'] = rate_misc
            #
            # ws2['D25'] = amt_rs
            # ws2['D26'] = amt_cad
            # ws2['D27'] = amt_fw
            # ws2['D28'] = amt_misc
            # ws2['H24'] = amt_total
            # ws2['H27'] = amt_dep
            #
            # ws2['H25'] = date_estimate_sent
            # ws2['H28'] = date_dep
            #
            # ws2['B34'] = date_prelim
            # ws2['B35'] = date_finalplans
            # ws2['B36'] = date_mylar
            # ws2['B37'] = date_deeddesc
            # ws2['B38'] = date_pins
            # ws2['B39'] = date_fw
            # ws2['B40'] = date_cad
            #
            # ws2['C34'] = copies_prelim
            # ws2['C35'] = copies_finalplans
            # ws2['C36'] = copies_mylar
            # ws2['C37'] = copies_deeddesc
            # ws2['C38'] = copies_pins
            # ws2['C39'] = copies_fw
            # ws2['C40'] = copies_cad
            #
            # ws2['D34'] = to_prelim
            # ws2['D35'] = to_finalplans
            # ws2['D36'] = to_mylar
            # ws2['D37'] = to_deeddesc
            # ws2['D38'] = to_pins
            # ws2['D39'] = to_fw
            # ws2['D40'] = to_cad

            # ws2['E44'] = date_invoice1
            # ws2['E45'] = date_invoice2
            # ws2['E46'] = date_invoice3
            #
            # ws2['H44'] = amt_invoice1
            # ws2['H45'] = amt_invoice2
            # ws2['H46'] = amt_invoice3

            # ws2['B50'] = job_desc

        except Exception as e:
            exc_type, exc_obj, exc_tb = sys.exc_info()
            fname = os.path.split(exc_tb.tb_frame.f_code.co_filename)[1]
            QMessageBox.critical(self.iface.mainWindow(), "EXCEPTION",
                                 "REQUIRED FIELDS ARE EMPTY - check job and try again.\n\nDetails: " + str(exc_type) + ' ' + str(fname) + ' ' + str(
                                     exc_tb.tb_lineno) + ' ' + str(e))
            return

        # Save the file
        yellowfile = str(jipath) + "\\" + jobNo + "_YellowSheet_" + datetime.datetime.today().strftime(
            '%Y.%m.%d') + ".xlsx"
        QgsMessageLog.logMessage('Saving file: ' + yellowfile + '...', 'BRS_GIS', level=Qgis.Info)
        wb.save(yellowfile)

class msgBoxSelection(QDialog):
    def __init__(self, map_bk_lot, parent=None):
        super(msgBoxSelection, self).__init__(parent)

        msgBox = QMessageBox()
        msgBox.setWindowTitle('New Job')
        msgBox.setText(map_bk_lot + ' has been selected. Continue?')
        create_button = msgBox.addButton(QPushButton('Create Job'), QMessageBox.YesRole)
        # create_button.clicked.connect
        add_button = msgBox.addButton(QPushButton(' Select Additional Parcel(s) '), QMessageBox.NoRole)
        cancel_button = msgBox.addButton(QPushButton('Cancel'), QMessageBox.RejectRole)
        ret = msgBox.exec_()

class brsgis_label_dialog(QDialog, Ui_brsgis_label_form):
    dValue = 4

    def __init__(self, iface):
        QDialog.__init__(self)
        self.iface = iface
        self.setupUi(self)

        buttonBox = self.buttonBox

        # Wire up our own signals.
        # self.dial.valueChanged.connect(self.dv)
        self.dValue = self.dial.value()
        # buttonBox.accepted.connect(self.print_label, dValue)
        buttonBox.accepted.connect(partial(self.print_label, self.dValue))
        buttonBox.rejected.connect(self.finished)

    def dv(self):
        self.dValue = self.dial.value()
        QgsMessageLog.logMessage('Dial Value : ' + str(self.dValue) + '...', 'BRS_GIS', level=Qgis.Info)

    def print_label(self, dv):
        self.dValue = self.dial.value()
        import datetime
        dv = self.dValue
        QgsMessageLog.logMessage('Labels Used: ' + str(dv) + '...', 'BRS_GIS', level=Qgis.Info)

        year = datetime.datetime.today().strftime('%Y')
        self.vl = QgsProject.instance().mapLayersByName('brs_jobs')[0]
        self.iface.setActiveLayer(self.vl)
        attribs = self.iface.activeLayer().selectedFeatures()[0]
        clientLast = attribs["client_name"]
        clientFirst = attribs["client_name"]
        try:
            clientLast = clientLast.split()[1]
            clientFirst = clientFirst.split()[0]
        except Exception as e:
            exc_type, exc_obj, exc_tb = sys.exc_info()
            fname = os.path.split(exc_tb.tb_frame.f_code.co_filename)[1]
            QMessageBox.critical(self.iface.mainWindow(), "EXCEPTION",
                                 "Details: " + str(exc_type) + ' ' + str(fname) + ' ' + str(
                                     exc_tb.tb_lineno) + ' ' + str(e))
            return

        addr = attribs["locus_addr"]
        town = attribs["town"]
        map_bk_lot = attribs["map_bk_lot"]
        mbl = map_bk_lot.split('-')
        mbLen = len(mbl)

        if mbLen == 1:
            map_bk_lot = map_bk_lot
        elif mbLen == 2:
            map_bk_lot = 'Map ' + mbl[0].lstrip('0') + ', Lot ' + mbl[1].lstrip('0')
        elif mbLen == 3:
            map_bk_lot = 'Map ' + mbl[0].lstrip('0') + ', Lot ' + mbl[1].lstrip('0') + '-' + mbl[2].lstrip('0')
        jobNo = attribs["job_no"]
        jobType = attribs["job_type"]

        path = os.path.join("z:\\", "BRS", year, jobNo)
        jipath = os.path.join(path, "Job_Info")
        QgsMessageLog.logMessage('Checking output folder: ' + path + '...', 'BRS_GIS', level=Qgis.Info)
        if not os.path.exists(path):
            os.makedirs(path)
        QgsMessageLog.logMessage('Checking output folder: ' + jipath + '...', 'BRS_GIS', level=Qgis.Info)
        if not os.path.exists(jipath):
            os.makedirs(jipath)

        from openpyxl import load_workbook
        wb = load_workbook('z:/0 - settings/gis/qgis/plugins/brsgis_plugin/BRS_templates.xlsx')

        sheets = wb.sheetnames
        for s in sheets:

            if s != 'label':
                sheet_name = wb.get_sheet_by_name(s)
                # QgsMessageLog.logMessage('Sheet Name: ' + str(sheet_name) + '...', 'BRS_GIS', level=Qgis.Info)
                wb.remove_sheet(sheet_name)

        # grab the correct worksheet
        for s in range(len(wb.sheetnames)):
            if wb.sheetnames[s] == 'label':
                break
        wb.active = s

        #QgsMessageLog.logMessage('wb.active FIRST: ' + str(wb.active) + '...', 'BRS_GIS', level=Qgis.Info)

        ws3 = wb.active

        #QgsMessageLog.logMessage('ws3 BEFORE: ' + str(ws3) + '...', 'BRS_GIS', level=Qgis.Info)

        cv1 = clientLast + ", " + clientFirst + " | " + map_bk_lot
        cv2 = addr + ", " + town + " | " + jobType

        # use dv to determine where to drop data
        #QgsMessageLog.logMessage('cv1: ' + cv1 + '...', 'BRS_GIS', level=Qgis.Info)
        #QgsMessageLog.logMessage('cv2: ' + cv2 + '...', 'BRS_GIS', level=Qgis.Info)
        #QgsMessageLog.logMessage('ws3: ' + str(ws3) + '...', 'BRS_GIS', level=Qgis.Info)

        if dv == 0:
            ws3['A19'] = cv1
            ws3['A20'] = cv2
        elif dv == 1:
            ws3['A16'] = cv1
            ws3['A17'] = cv2
        elif dv == 2:
            ws3['A13'] = cv1
            ws3['A14'] = cv2
        elif dv == 3:
            ws3['A10'] = cv1
            ws3['A11'] = cv2
        elif dv == 4:
            ws3['A7'] = cv1
            ws3['A8'] = cv2
        elif dv == 5:
            ws3['A4'] = cv1
            ws3['A5'] = cv2
        elif dv == 6:
            ws3['A1'] = cv1
            ws3['A2'] = cv2
        elif dv == 7:
            QMessageBox.critical(self.iface.mainWindow(), "HEY, GENIUS...",
                                 "Your sheet of labels is empty - get a new one.  Derp.")
            return
        else:
            pass

        # Save the file
        labelfile = str(jipath) + "\\" + jobNo + "_FolderLabel_" + datetime.datetime.today().strftime(
            '%Y.%m.%d') + ".xlsx"
        QgsMessageLog.logMessage('Saving file: ' + labelfile + '...', 'BRS_GIS', level=Qgis.Info)
        wb.save(labelfile)

    def finished(self):
        self.done(1)

class brsgis_search(object):

    def __init__(self, iface):
        self.iface = iface

    def run(self):
        QgsMessageLog.logMessage('Search initiated...', 'BRS_GIS', level=Qgis.Info)
        eMenu = self.iface.mainWindow()

        vLayer = self.iface.activeLayer()

        try:
            if vLayer:
                pass
            else:
                self.vl = QgsProject.instance().mapLayersByName('brs_jobs')[0]
                self.iface.setActiveLayer(self.vl)
                vLayer = self.iface.activeLayer()
        except Exception as e:
            exc_type, exc_obj, exc_tb = sys.exc_info()
            fname = os.path.split(exc_tb.tb_frame.f_code.co_filename)[1]
            QMessageBox.critical(self.iface.mainWindow(), "EXCEPTION",
                                 "Details: " + str(exc_type) + ' ' + str(fname) + ' ' + str(
                                     exc_tb.tb_lineno) + ' ' + str(e))
            return

        if vLayer.name() == 'brs_jobs':

            pLayer = QgsProject.instance().mapLayersByName('brs_jobs')[0]
            cLayer = QgsProject.instance().mapLayersByName('brs_contacts')[0]
            pLayer = pLayer.id()
            cLayer = cLayer.id()

            QgsMessageLog.logMessage('Hiding all columns...', 'BRS_GIS', level=Qgis.Info)
            self.setAllColumnVisibility(vLayer)
            QgsMessageLog.logMessage('All columns hidden successfully...', 'BRS_GIS', level=Qgis.Info)

            self.killRelation(pLayer, cLayer)

            QgsMessageLog.logMessage('Unhiding specific columns...', 'BRS_GIS', level=Qgis.Info)
            self.setColumnVisibility(vLayer, 'map_bk_lot')
            self.setColumnVisibility(vLayer, 'job_no')
            self.setColumnVisibility(vLayer, 'job_desc')
            self.setColumnVisibility(vLayer, 'old_plan_no')
            self.setColumnVisibility(vLayer, 'job_type')
            self.setColumnVisibility(vLayer, 'client_name')
            self.setColumnVisibility(vLayer, 'locus_addr')
            self.setColumnVisibility(vLayer, 'town')
            self.setColumnVisibility(vLayer, 'state')
            self.setColumnVisibility(vLayer, 'planbook_page')
            self.setColumnVisibility(vLayer, 'active')
            self.setColumnVisibility(vLayer, 'pins_set')

            QgsMessageLog.logMessage('Launching search form...', 'BRS_GIS', level=Qgis.Info)

            for a in eMenu.findChildren(QAction, 'mActionSelectByForm'):
                # QgsMessageLog.logMessage(a.objectName(), 'BRS_GIS', level=Qgis.Info)
                a.trigger()

            self.resetColumnVisibility(vLayer)
            self.setRelation(pLayer, cLayer)
        else:
            QgsMessageLog.logMessage('Launching search form...', 'BRS_GIS', level=Qgis.Info)

            for a in eMenu.findChildren(QAction, 'mActionSelectByForm'):
                # QgsMessageLog.logMessage(a.objectName(), 'BRS_GIS', level=Qgis.Info)
                a.trigger()

    def finished(self):
        self.done(1)

    def setAllColumnVisibility(self, layer):
        columns = layer.fields()

        editor_widget_setup = QgsEditorWidgetSetup('Hidden', {})

        for c in columns:
            #QgsMessageLog.logMessage(c.name(), 'BRS_GIS', level=Qgis.Info)
            fieldIndex = layer.fields().indexFromName(c.name())
            layer.setEditorWidgetSetup(fieldIndex, editor_widget_setup)

    def setColumnVisibility(self, layer, columnName):
        columns = layer.fields()

        for c in columns:
            #QgsMessageLog.logMessage('columnName: ' + c.name(), 'BRS_GIS', level=Qgis.Info)
            #QgsMessageLog.logMessage(c.name(), 'BRS_GIS', level=Qgis.Info)

            if c.name() == columnName:
                if c.name() == 'active':
                    editor_widget_setup = QgsEditorWidgetSetup('CheckBox', {})
                    fieldIndex = layer.fields().indexFromName(c.name())
                    layer.setEditorWidgetSetup(fieldIndex, editor_widget_setup)
                elif c.name() == 'pins_set':
                    editor_widget_setup = QgsEditorWidgetSetup('ValueMap', {
                        'map': {u'N/A': u'N/A',
                                u'NO': u'NO',
                                u'YES': u'YES'}
                    }
                                                               )
                    fieldIndex = layer.fields().indexFromName(c.name())
                    layer.setEditorWidgetSetup(fieldIndex, editor_widget_setup)
                elif c.name() == 'job_type':
                    #BRS,SDP,BRSDP,MIS,FEMA,SUBDIVISION,OTHER
                    editor_widget_setup = QgsEditorWidgetSetup('ValueMap', {
                        'map': {u'BRS': u'BRS',
                                u'SDP': u'SDP',
                                u'BRSDP': u'BRSDP',
                                u'MIS': u'MIS',
                                u'FEMA': u'FEMA',
                                u'RESEARCH': u'RESEARCH',
                                u'OTHER': u'OTHER'}
                    }
                                                               )
                    fieldIndex = layer.fields().indexFromName(c.name())
                    layer.setEditorWidgetSetup(fieldIndex, editor_widget_setup)
                elif c.name() == 'folder_name':
                    #owner,buyer,seller,realtor,lawyer,builder,banker,leaseholder, surveyor,other
                    editor_widget_setup = QgsEditorWidgetSetup('ValueMap', {
                        'map': {u'Owner': u'Owner',
                                u'Buyer': u'Buyer',
                                u'Seller': u'Seller',
                                u'Realtor': u'Realtor',
                                u'Attorney': u'Attorney',
                                u'Builder': u'Builder',
                                u'Banker': u'Banker',
                                u'Leaseholder': u'Leaseholder',
                                u'Surveyor': u'Surveyor',
                                u'Other': u'Other'}
                    }
                                                               )
                    fieldIndex = layer.fields().indexFromName(c.name())
                    layer.setEditorWidgetSetup(fieldIndex, editor_widget_setup)
                elif c.name() == 'folder_present':
                    editor_widget_setup = QgsEditorWidgetSetup('CheckBox', {})
                    fieldIndex = layer.fields().indexFromName(c.name())
                    layer.setEditorWidgetSetup(fieldIndex, editor_widget_setup)
                elif c.name() == 'low_tide':
                    editor_widget_setup = QgsEditorWidgetSetup('CheckBox', {})
                    fieldIndex = layer.fields().indexFromName(c.name())
                    layer.setEditorWidgetSetup(fieldIndex, editor_widget_setup)
                elif 'date_' in c.name():
                    editor_widget_setup = QgsEditorWidgetSetup('DateTime', {})
                    fieldIndex = layer.fields().indexFromName(c.name())
                    layer.setEditorWidgetSetup(fieldIndex, editor_widget_setup)
                else:
                    editor_widget_setup = QgsEditorWidgetSetup('TextEdit', {'IsMultiline': 'False'})
                    fieldIndex = layer.fields().indexFromName(c.name())
                    layer.setEditorWidgetSetup(fieldIndex, editor_widget_setup)
            else:
                pass

    def resetColumnVisibility(self, layer):
        columns = layer.fields()

        for c in columns:
            #QgsMessageLog.logMessage('columnName: ' + c.name(), 'BRS_GIS', level=Qgis.Info)
            #QgsMessageLog.logMessage(c.name(), 'BRS_GIS', level=Qgis.Info)

            if c.name() == c.name():
                if c.name() == 'active':
                    editor_widget_setup = QgsEditorWidgetSetup('CheckBox', {})
                    fieldIndex = layer.fields().indexFromName(c.name())
                    layer.setEditorWidgetSetup(fieldIndex, editor_widget_setup)
                elif c.name() == 'pins_set':
                    editor_widget_setup = QgsEditorWidgetSetup('ValueMap', {
                        'map': {u'N/A': u'N/A',
                                u'NO': u'NO',
                                u'YES': u'YES'}
                    }
                                                               )
                    fieldIndex = layer.fields().indexFromName(c.name())
                    layer.setEditorWidgetSetup(fieldIndex, editor_widget_setup)
                elif c.name() == 'job_type':
                    #BRS,SDP,BRSDP,MIS,FEMA,SUBDIVISION,OTHER
                    editor_widget_setup = QgsEditorWidgetSetup('ValueMap', {
                        'map': {u'BRS': u'BRS',
                                u'SDP': u'SDP',
                                u'BRSDP': u'BRSDP',
                                u'MIS': u'MIS',
                                u'FEMA': u'FEMA',
                                u'RESEARCH': u'RESEARCH',
                                u'STAKEOUT': u'STAKEOUT',
                                u'STAKE LINE': u'STAKE LINE',
                                u'FLAG LINE': u'FLAG LINE',
                                u'SITE WORK': u'SITE WORK',
                                u'TENANT SPECIFIC': u'TENANT SPECIFIC',
                                u'SUBDIVISION': u'SUBDIVISION',
                                u'DESIGN': u'DESIGN',
                                u'MAP': u'MAP',
                                u'PHOTO': u'PHOTO',
                                u'OTHER': u'OTHER'
                                }
                        }
                    )

                    fieldIndex = layer.fields().indexFromName(c.name())
                    layer.setEditorWidgetSetup(fieldIndex, editor_widget_setup)

                # elif c.name() == 'folder_name':
                #     #owner,buyer,seller,realtor,lawyer,builder,banker,leaseholder, surveyor,other
                #     editor_widget_setup = QgsEditorWidgetSetup('ValueMap', {
                #         'map': {u'Owner': u'Owner',
                #                 u'Buyer': u'Buyer',
                #                 u'Seller': u'Seller',
                #                 u'Realtor': u'Realtor',
                #                 u'Attorney': u'Attorney',
                #                 u'Builder': u'Builder',
                #                 u'Banker': u'Banker',
                #                 u'Leaseholder': u'Leaseholder',
                #                 u'Surveyor': u'Surveyor',
                #                 u'Architect': u'Architect',
                #                 u'Engineer': u'Engineer',
                #                 u'Site Contractor': u'Site Contractor',
                #                 u'Other': u'Other'}
                #     }
                #                                                )
                #     fieldIndex = layer.fields().indexFromName(c.name())
                #     layer.setEditorWidgetSetup(fieldIndex, editor_widget_setup)
                # elif c.name() == 'folder_present':
                #     editor_widget_setup = QgsEditorWidgetSetup('CheckBox', {})
                #     fieldIndex = layer.fields().indexFromName(c.name())
                #     layer.setEditorWidgetSetup(fieldIndex, editor_widget_setup)

                elif c.name() == 'low_tide':
                    editor_widget_setup = QgsEditorWidgetSetup('CheckBox', {})
                    fieldIndex = layer.fields().indexFromName(c.name())
                    layer.setEditorWidgetSetup(fieldIndex, editor_widget_setup)
                elif c.name() == 'estimate':
                    editor_widget_setup = QgsEditorWidgetSetup('CheckBox', {})
                    fieldIndex = layer.fields().indexFromName(c.name())
                    layer.setEditorWidgetSetup(fieldIndex, editor_widget_setup)
                elif 'date_' in c.name():
                    editor_widget_setup = QgsEditorWidgetSetup('DateTime', {})
                    fieldIndex = layer.fields().indexFromName(c.name())
                    layer.setEditorWidgetSetup(fieldIndex, editor_widget_setup)
                else:
                    editor_widget_setup = QgsEditorWidgetSetup('TextEdit', {'IsMultiline': 'False'})
                    fieldIndex = layer.fields().indexFromName(c.name())
                    layer.setEditorWidgetSetup(fieldIndex, editor_widget_setup)
            else:
                pass

    def setRelation(self, pLayer, cLayer):
        rel = QgsRelation()
        rel.setReferencingLayer(cLayer)
        rel.setReferencedLayer(pLayer)
        rel.addFieldPair('jobs_id', 'sid')
        rel.setId('fk_jobs_contacts')
        rel.setName('Job Contacts')
        # rel.isValid() # It will only be added if it is valid. If not, check the ids and field names
        QgsProject.instance().relationManager().addRelation(rel)

    def killRelation(self, pLayer, cLayer):
        rel = QgsRelation()
        rel.setReferencingLayer(cLayer)
        rel.setReferencedLayer(pLayer)
        rel.addFieldPair('jobs_id', 'sid')
        rel.setId('fk_jobs_contacts')
        rel.setName('Job Contacts')
        # rel.isValid() # It will only be added if it is valid. If not, check the ids and field names
        QgsProject.instance().relationManager().removeRelation(rel)

class brsgis_bulkMapExport(object):
    newJob = 0
    selComp = 0
    multiFeat = 0
    count = 0

    def __init__(self, iface):
        # save reference to the QGIS interface
        self.iface = iface

    def initGui(self):

        self.action = QAction("&Export map_bk_lot by Layer", self.iface.mainWindow())
        self.action.triggered.connect(self.run)
        self.action.trigger()
        self.iface.mapCanvas().selectionChanged.connect(self.select_changed)

    def run(self):
        self.vl = QgsProject.instance().mapLayersByName('parcels')[0]
        self.iface.setActiveLayer(self.vl)

        reply = QMessageBox.question(self.iface.mainWindow(), 'Select Feature(s)',
                                     'Click OK and select the correct parcel(s) for the new job.',
                                     QMessageBox.Ok, QMessageBox.Cancel)
        if reply == QMessageBox.Ok:
            if self.selComp == 1:
                return
            else:
                self.newJob = 1
                if self.count == 0:
                    for a in self.iface.attributesToolBar().actions():
                        if a.objectName() == 'mActionDeselectAll':
                            a.trigger()
                            QgsMessageLog.logMessage('FIRST RUN: Previously selected parcel(s) have been cleared.',
                                                     'BRS_GIS', level=Qgis.Info)
                            QgsMessageLog.logMessage('Selection starting...', 'BRS_GIS', level=Qgis.Info)
                            self.iface.actionSelectFreehand().trigger()
                            self.count = self.count + 1
                else:
                    self.iface.actionSelect().trigger()

        else:
            QgsMessageLog.logMessage('DEBUG: Job selection cancelled.', 'BRS_GIS', level=Qgis.Info)

    def select_changed(self):

        if self.newJob == 0:
            return
        else:
            vLayer = self.iface.activeLayer()
            feats_count = vLayer.selectedFeatureCount()

            msg = QMessageBox()
            msg.setWindowTitle('Selection')
            msg.setText(str(feats_count) + ' features have been selected. Continue?')
            create = msg.addButton('Continue', QMessageBox.AcceptRole)
            cancel = msg.addButton('Cancel', QMessageBox.RejectRole)
            msg.setDefaultButton(create)
            msg.exec_()
            msg.deleteLater()

            if msg.clickedButton() is create:
                self.iface.actionCopyFeatures().trigger()

                self.newJob = 0
                #self.vl = QgsProject.instance().mapLayersByName('brs_jobs')[0]

                self.tmpLayer = QgsVectorLayer('MultiPolygon', 'temp', 'memory')
                QgsProject.instance().addMapLayers([self.tmpLayer])
                self.iface.setActiveLayer(self.tmpLayer)
                self.iface.actionIdentify().trigger()
                # start editing
                self.iface.actionToggleEditing().trigger()
                self.layerData = self.tmpLayer.dataProvider()
                # create fields
                self.layerData.addAttributes([QgsField("gid", QVariant.String), QgsField("map_bk_lot", QVariant.String)])
                # end field creation, save layer
                self.iface.activeLayer().commitChanges()
                self.iface.actionToggleEditing().trigger()
                # end editing

                QgsMessageLog.logMessage('Pasting features to ' + str(self.tmpLayer.name()) + '...', 'BRS_GIS',
                                         level=Qgis.Info)
                self.iface.actionPasteFeatures().trigger()
                self.iface.activeLayer().commitChanges()


            elif msg.clickedButton() is cancel:
                self.iface.mapCanvas().selectionChanged.disconnect(self.select_changed)
                return
            self.active_edit(self.tmpLayer)
            #except Exception as e:
             #   QgsMessageLog.logMessage('EXCEPTION: ' + str(e), 'BRS_GIS', level=Qgis.Info)

    def active_edit(self, layer):

        self.iface.setActiveLayer(layer)
        self.features = self.iface.activeLayer().selectedFeatures()
        self.allmaps = ''
        for feature in layer.getFeatures():
            map_bk_lot = feature["map_bk_lot"]
            map_bk_lot = '\'' + map_bk_lot + '\''
            self.allmaps = str(self.allmaps) + str(map_bk_lot) + ','

        self.allmaps = self.allmaps[:-1]
        QgsMessageLog.logMessage('allmaps: ' + self.allmaps, 'BRS_GIS',
                                 level=Qgis.Info)
        pyperclip.copy(self.allmaps)
        #spam = pyperclip.paste()
        QgsMessageLog.logMessage('All map_bk_lot values copied to clipboard...paste as you will.', 'BRS_GIS',
                                 level=Qgis.Info)
        QgsProject.instance().removeMapLayer(layer.id())


        def finished(self):
            self.done(1)

class brsgis_abutters(object):
    newJob = 0
    selComp = 0
    multiFeat = 0
    count = 0

    def __init__(self, iface):
        # save reference to the QGIS interface
        self.iface = iface

    def run(self):

        self.set_abutters()

    def set_abutters(self):

        vLayer = self.iface.activeLayer()
        # QgsMessageLog.logMessage('Copying feature...', 'BRS_GIS',
        #                          level=Qgis.Info)
        self.iface.actionCopyFeatures().trigger()
        # QgsMessageLog.logMessage('Copy complete...', 'BRS_GIS',
        #                          level=Qgis.Info)
        self.newJob = 0
        self.fields = self.iface.activeLayer().fields()

        self.tmpLayer = QgsVectorLayer('MultiPolygon?crs=EPSG:102683', 'tmp_buffer', 'memory')
        QgsProject.instance().addMapLayers([self.tmpLayer])
        self.iface.actionIdentify().trigger()
        self.vl = QgsProject.instance().mapLayersByName('tmp_buffer')[0]
        self.iface.setActiveLayer(self.vl)

        # start editing to add fields
        self.iface.actionToggleEditing().trigger()
        self.layerData = self.tmpLayer.dataProvider()
        # create fields from parent layer
        self.layerData.addAttributes(self.fields)
        # end field creation, save layer
        self.iface.activeLayer().commitChanges()

        #start editing / paste feature
        self.iface.actionToggleEditing().trigger()
        self.iface.actionPasteFeatures().trigger()
        self.iface.activeLayer().commitChanges()

        Buffer_only_selected_features = True

        # Check for selected features
        if vLayer.selectedFeatures() and Buffer_only_selected_features is True:
            features = vLayer.selectedFeatures()

        else:
            # features = vLayer.getFeatures()
            features = vLayer.selectedFeatures()

        lyr = self.iface.activeLayer()

        feat = self.iface.activeLayer().selectedFeatures()[0]

        buff = feat.geometry().buffer(20, 5)
        lyr.dataProvider().changeGeometryValues({feat.id(): buff})

        self.layerData = lyr.dataProvider()
        # create additional field
        self.iface.actionToggleEditing().trigger()
        self.layerData.addAttributes([QgsField("referrer", QVariant.String)])
        self.layerData.addAttributes([QgsField("referrerJ", QVariant.String)])
        # end field creation, save layer
        self.iface.activeLayer().commitChanges()

        self.vl = QgsProject.instance().mapLayersByName('tmp_buffer')[0]
        self.iface.setActiveLayer(self.vl)

        lyr = self.iface.activeLayer()

        # start editing, change field value
        self.iface.actionToggleEditing().trigger()
        idx = self.layerData.fieldNameIndex('referrer')
        idx2 = self.layerData.fieldNameIndex('referrerJ')

        feat = self.iface.activeLayer().selectedFeatures()[0]

        lyr.changeAttributeValue(feat.id(), idx, feat['objectid'])
        lyr.changeAttributeValue(feat.id(), idx2, feat['job_no'])
        lyr.updateFields()
        # end field update, save layer
        self.iface.activeLayer().commitChanges()

        try:
            # now we have buffered feature in tmp_buffers...need intersections, grab referrer first
            feat = self.iface.activeLayer().selectedFeatures()[0]
            referrer = feat['referrer']
            referrerJ = feat['job_no']
            self.iface.actionToggleEditing().trigger()
            field_ids = []
            # Fieldnames to keep
            fieldnames = set(['objectid', 'map_bk_lot', 'town', 'county', 'prop_loc', 'referrer', 'referrerJ',
                              'owner1', 'owner2', 'own_addr1', 'own_addr2', 'own_city', 'own_state', 'own_zip',
                              'own_cntry', 'ls_date', 'ls_book', 'ls_page', 'geocode', 'state_id', 'lat_lon'])

            for field in lyr.fields():
                if field.name() not in fieldnames:
                    idx = self.layerData.fieldNameIndex(field.name())
                    field_ids.append(idx)

            self.layerData.deleteAttributes(field_ids)
            self.tmpLayer.updateFields()
            self.iface.activeLayer().commitChanges()

        except Exception as e:
            exc_type, exc_obj, exc_tb = sys.exc_info()
            fname = os.path.split(exc_tb.tb_frame.f_code.co_filename)[1]
            QMessageBox.critical(self.iface.mainWindow(), "EXCEPTION!",
                                 "Details: " + str(exc_type) + ' ' + str(fname) + ' ' + str(exc_tb.tb_lineno) + ' ' + str(e))
            return

        # QgsMessageLog.logMessage('Out of try block...', 'BRS_GIS',
        #                          level=Qgis.Info)
        # now we have buffered feature in tmp_buffers...need intersections

        layer1 = QgsProject.instance().mapLayersByName('parcels')[0]
        layer2 = QgsProject.instance().mapLayersByName('tmp_buffer')[0]
        layer3 = QgsProject.instance().mapLayersByName('abutters')[0]
        layer4 = QgsProject.instance().mapLayersByName('parcels_aux')[0]

        self.fb = QgsProcessingFeedback()
        self.context = QgsProcessingContext

        processing.run("native:selectbylocation", {
            'INPUT': layer1,
            'PREDICATE': [0],
            'INTERSECT': layer2, 'METHOD': 0}, feedback=self.fb)

        # make parcels active layer
        self.iface.setActiveLayer(layer1)

        # self.iface.mapCanvas().selectionChanged.disconnect(self.select_changed)

        self.iface.actionCopyFeatures().trigger()
        self.iface.setActiveLayer(layer3)
        self.iface.actionToggleEditing().trigger()
        self.iface.actionPasteFeatures().trigger()
        self.iface.activeLayer().commitChanges()

        cLayer = self.iface.activeLayer()

        self.iface.actionToggleEditing().trigger()
        for f in cLayer.selectedFeatures():

            self.layerData = self.iface.activeLayer().dataProvider()
            idx = self.layerData.fieldNameIndex('referrer')
            idx2 = self.layerData.fieldNameIndex('referrerJ')

            if str(f['referrer']) == 'NULL':
                self.iface.activeLayer().changeAttributeValue(f.id(), idx,
                                                            str(referrer), True)
            if str(f['referrerJ']) == 'NULL':
                self.iface.activeLayer().changeAttributeValue(f.id(), idx2,
                                                            str(referrerJ), True)
            if str(f['objectid']) in referrer:
                cLayer.deleteFeature(f.id())

            else:
                pass

        self.iface.activeLayer().commitChanges()
        QgsProject.instance().removeMapLayer(layer2.id())
        # QgsMessageLog.logMessage('Removing abutters from selection...ActiveLayer is ' + str(self.iface.activeLayer().name()), 'BRS_GIS', level=Qgis.Info)
        self.iface.activeLayer().removeSelection()

        self.vl = QgsProject.instance().mapLayersByName('parcels')[0]
        self.iface.setActiveLayer(self.vl)
        self.iface.activeLayer().removeSelection()

        self.vl = QgsProject.instance().mapLayersByName('brs_jobs')[0]
        self.iface.setActiveLayer(self.vl)
        canvas = self.iface.mapCanvas()
        canvas.zoomToSelected(self.vl)

        ex = canvas.extent()
        ex.scale(2.0)
        canvas.setExtent(ex)
        canvas.refresh()

        return

class brsgis_printMapTable(object):

    def __init__(self, iface):
        # save reference to the QGIS interface
        self.iface = iface

    def initGui(self):

        self.action = QAction("PMT", self.iface.mainWindow())
        self.action.triggered.connect(self.run)
        self.action.trigger()
        #QgsMessageLog.logMessage('Generating MapTable Output...', 'BRS_GIS', level=Qgis.Info)

    def run(self):

        cfg0 = 0
        cfg1 = 1

        layerActive = self.iface.activeLayer()
        # QgsMessageLog.logMessage('START: ' + str(layerActive.name()), 'BRS_GIS', level=Qgis.Info)
        feat = self.iface.activeLayer().selectedFeatures()[0]

        self.iface.setActiveLayer(layerActive)

        #identify related PLANS and JOBS for selected FEATURE, add to db:relatedwork.
        self.getRelatedWork(feat, cfg0)

        if layerActive.name() == 'brs_jobs':
            import datetime
            relW = self.updateJobRelated(feat)

            # if len(relW) == 0:
            #     QgsMessageLog.logMessage('NO RELATED JOBS.', 'BRS_GIS', level=Qgis.Info)
            # else:
            #     QgsMessageLog.logMessage('JOB RELATED: ' + str(relW), 'BRS_GIS', level=Qgis.Info)

            year = datetime.datetime.today().strftime('%Y')

            try:
                attribs = self.iface.activeLayer().selectedFeatures()[0]
            except Exception as e:
                exc_type, exc_obj, exc_tb = sys.exc_info()
                fname = os.path.split(exc_tb.tb_frame.f_code.co_filename)[1]
                QMessageBox.critical(self.iface.mainWindow(), "No Selection",
                                     "Please ensure that you have a parcel selected\nand attempt to "
                                     "generate the output again.\n\n"
                                     "Details: " + str(exc_type) + ' ' + str(fname) + ' ' + str(exc_tb.tb_lineno) + ' ' + str(e))
                return

            jobNo = attribs["job_no"]
            #NOT FUTURE PROOF - WILL BREAK IN 2099
            jobYear = '20' + jobNo[:2]

            if jobYear == year:
                year = year
            else:
                year = jobYear

            #NEED TO CHECK FOR PREVIOUS YEAR JOB, USE EXISTING FOLDER IF PRESENT.
            path = os.path.join("Z:\\", "BRS", year, jobNo)
            jipath = os.path.join(path, "Job_Info")
            QgsMessageLog.logMessage('Checking output folder: ' + path + '...', 'BRS_GIS', level=Qgis.Info)
            if not os.path.exists(path):
                os.makedirs(path)
            QgsMessageLog.logMessage('Checking output folder: ' + jipath + '...', 'BRS_GIS', level=Qgis.Info)
            if not os.path.exists(jipath):
                os.makedirs(jipath)

            from openpyxl import load_workbook
            wb = load_workbook('z:/0 - settings/gis/qgis/plugins/brsgis_plugin/BRS_templates.xlsx')

            for s in range(len(wb.sheetnames)):
                if wb.sheetnames[s] == 'maptable':
                    break
            wb.active = s
            sheets = wb.sheetnames
            ws = wb.active

            clientName = attribs["client_name"]
            addr = attribs["locus_addr"]
            town = attribs["town"]
            map_bk_lot = attribs["map_bk_lot"]
            map_bk_lotO = attribs["map_bk_lot"]
            mbl = map_bk_lot.split('-')
            mbLen = len(mbl)
            #NEED TO HANDLE MORE THAN 3 SECTIONS OF MBL
            if mbLen == 1:
                map_bk_lot = map_bk_lot
            elif mbLen == 2:
                map_bk_lot = 'Map ' + mbl[0].lstrip('0') + ', Lot ' + mbl[1].lstrip('0')
            elif mbLen == 3:
                map_bk_lot = 'Map ' + mbl[0].lstrip('0') + ', Lot ' + mbl[1].lstrip('0') + '-' + mbl[2].lstrip('0')

            jobType = attribs["job_type"]
            revNo = attribs["rev_no"]
            county = attribs["county"]
            state = attribs["state"]
            perimeter = attribs["sPerimeter"]
            area = attribs["area"]
            planbook_page = attribs["planbook_page"]
            referrerJ = attribs['job_no']
            zipCode = attribs['zipcode']

            if str(zipCode) == 'NULL':
                zipCode = ''
            else:
                zipCode = zipCode

            lat_lon = attribs['lat_lon']

            try:
                ws['A1'] = clientName
                ws['D2'] = town.upper()
                ws['E2'] = county
                ws['F2'] = state
                ws['A3'] = 'Job#: ' + str(jobNo)
                ws['B3'] = 'Rev#: ' + str(revNo)
                ws['C3'] = 'Type: ' + str(jobType)
                ws['D3'] = 'Perimeter: ' + str(perimeter) + ' L.Ft'
                ws['E3'] = 'Area: ' + str(area) + ' Ac.'
                ws['F3'] = 'Centroid: ' + str(lat_lon)
                ws['D4'] = zipCode
                ws['A6'] = map_bk_lot  # 'Map R7, Lot 58'
                ws['B6'] = addr  # from locus, contacts or state/town data?
                ws['E6'] = clientName
                ws['B7'] = 'Planbook/Page: '  # + str(planbook_page)
                ws['B8'] = str(relW)

                layer3 = QgsProject.instance().mapLayersByName('abutters')[0]
                exp = QgsExpression(u'"referrerJ" = \'%s\'' % (jobNo))
                request = QgsFeatureRequest(exp)
                request.setSubsetOfAttributes(['referrerJ'], layer3.fields())
                request.setFlags(QgsFeatureRequest.NoGeometry)

                aNo = 0
                startCell = 11
                startCellp = 13
                startCellj = 13

                for f in layer3.getFeatures(request):

                    #QgsMessageLog.logMessage('abutter found: ' + str(f['map_bk_lot']), 'BRS_GIS',level=Qgis.Info)

                    aNo += 1
                    c1 = 'A' + str(startCell)
                    c2 = 'B' + str(startCell)
                    c3 = 'E' + str(startCell)
                    c4 = 'B' + str(startCellp)

                    map_bk_lotP = f['map_bk_lot']
                    mbl = map_bk_lotP.split('-')
                    mbLen = len(mbl)

                    if mbLen == 1:
                        map_bk_lotP = map_bk_lotP
                    elif mbLen == 2:
                        map_bk_lotP = 'Map ' + mbl[0].lstrip('0') + ', Lot ' + mbl[1].lstrip('0')
                    elif mbLen == 3:
                        map_bk_lotP = 'Map ' + mbl[0].lstrip('0') + ', Lot ' + mbl[1].lstrip('0') + '-' + mbl[2].lstrip(
                            '0')

                    ws[c1] = str(map_bk_lotP)

                    if str(f['own_addr1']) == 'NULL':
                        ownInfo = ''
                    else:
                        ownInfo = str(f['own_addr1']) + ' ' + str(f['own_city']) + ', ' + str(
                            f['own_state']) + ' ' + str(f['own_zip'])

                    try:
                        if len(ownInfo) > 0:
                            ws[c2] = ownInfo
                        else:
                            ws[c2] = ''
                    except Exception as e:
                        ws[c2] = ''
                        exc_type, exc_obj, exc_tb = sys.exc_info()
                        fname = os.path.split(exc_tb.tb_frame.f_code.co_filename)[1]
                        QMessageBox.critical(self.iface.mainWindow(), "EXCEPTION!",
                                             "Details: " + str(exc_type) + ' ' + str(fname) + ' ' + str(
                                                 exc_tb.tb_lineno) + ' ' + str(e))
                        return

                    try:
                        if len(f['owner']) > 0:
                            ws[c3] = f['owner1']
                        else:
                            ws[c3] = ''
                    except Exception as e:
                        ws[c3] = ''

                    layer3.selectByIds([f.id()])
                    self.iface.setActiveLayer(layer3)
                    sA = self.iface.activeLayer().selectedFeatures()[0]
                    oid = sA['gid']
                    #QgsMessageLog.logMessage('SELECTED: ' + str(oid), 'BRS_GIS',level=Qgis.Info)

                    try:
                        # t1 = FuncThread(self.getRelatedWork, sA, cfg0)
                        # t1.start()
                        # t1.join()
                        self.getRelatedWork(sA, cfg0)

                        # t2 = FuncThread(self.updateAbutterRelated, sA)
                        # t2.start()
                        # t2.join()
                        relAW = self.updateAbutterRelated(sA)

                        # QgsMessageLog.logMessage('RELATED: ' + str(relAW), 'BRS_GIS', level=Qgis.Info)
                        ws[c4] = relAW
                        # delRow = ''
                        # delRow = startCell + 3
                        # ws.delete_rows(delRow,1)
                        startCell += 4
                        startCellp += 4
                        relAW = ''

                        #QgsMessageLog.logMessage('RELATED: ' + relW, 'BRS_GIS',level=Qgis.Info)

                    except Exception as e:
                        # QgsMessageLog.logMessage('NO RELATED WORK found: ' + str(f['map_bk_lot']), 'BRS_GIS',level=Qgis.Info)
                        # delRow = startCellp + 2
                        # ws.delete_rows(delRow,2)
                        startCell += 4
                        startCellp += 4
                        #QgsMessageLog.logMessage('NO RELATED WORK.', 'BRS_GIS', level=Qgis.Info)
                        relAW = 'N/A'
                        ws[c4] = relAW
                        # rd = ws.row_dimensions[startCellj]
                        # rd.height = 1
                        pass

            except Exception as e:
                exc_type, exc_obj, exc_tb = sys.exc_info()
                fname = os.path.split(exc_tb.tb_frame.f_code.co_filename)[1]
                QMessageBox.critical(self.iface.mainWindow(), "No Selection",
                                     "Please ensure that you have a parcel selected\nand attempt to "
                                     "generate the output again.\n\n"
                                     "Details: " + str(exc_type) + ' ' + str(fname) + ' ' + str(
                                         exc_tb.tb_lineno) + ' ' + str(e))

            delRow = startCell
            ws.delete_rows(delRow, 200)
            #QgsMessageLog.logMessage('cell/aNo: ' + str(startCell) + '/' + str(aNo), 'BRS_GIS',level=Qgis.Info)

            # pr = 'A1:H' + str(delRow)
            # ws.print_rows = pr
            # wb.create_named_range('_xlnm.Print_Area', ws, pr, scope=0)

            for s in sheets:

                if s != 'maptable':
                    sheet_name = wb.get_sheet_by_name(s)
                    wb.remove_sheet(sheet_name)

            # Save the file
            mtfile = str(jipath) + "\\" + jobNo + "_MapTable_" + datetime.datetime.today().strftime(
                '%Y.%m.%d') + ".xlsx"
            QgsMessageLog.logMessage('Saving file: ' + mtfile + '...', 'BRS_GIS', level=Qgis.Info)
            try:
                wb.save(mtfile)

            except Exception as e:
                exc_type, exc_obj, exc_tb = sys.exc_info()
                fname = os.path.split(exc_tb.tb_frame.f_code.co_filename)[1]
                QMessageBox.critical(self.iface.mainWindow(), "File Open",
                                     "Please ensure that you do not have today's mapTable open in Excel\nand attempt to "
                                     "generate the output again.\n\n"
                                     "Details: " + str(exc_type) + ' ' + str(fname) + ' ' + str(exc_tb.tb_lineno) + ' ' + str(e))
                return

        else:
            relW = self.updateAbutterRelated(feat)
            QgsMessageLog.logMessage('ABUTTER RELATED: ' + str(relW), 'BRS_GIS', level=Qgis.Info)


        self.iface.setActiveLayer(layerActive)

    def is_contained_in(layername, column, feature, parent):
        layer = QgsProject.instance().mapLayersByName(layername)[0]
        for feat in layer.getFeatures():
            if feature.geometry().within(feat.geometry()):
                return feat[column]

    def identAbutters(self):

            aNo = 0

            self.vl = QgsProject.instance().mapLayersByName('brs_jobs')[0]
            self.iface.setActiveLayer(self.vl)

            try:
                attribs = self.iface.activeLayer().selectedFeatures()[0]

            except Exception as e:
                exc_type, exc_obj, exc_tb = sys.exc_info()
                fname = os.path.split(exc_tb.tb_frame.f_code.co_filename)[1]
                QMessageBox.critical(self.iface.mainWindow(), "No Selection",
                                     "Please ensure that you have a parcel selected\nand attempt to "
                                     "generate the output again.\n\n"
                                     "Details: " + str(exc_type) + ' ' + str(fname) + ' ' + str(exc_tb.tb_lineno) + ' ' + str(e))
                return

            jobNo = attribs["job_no"]
            map_bk_lot = attribs["map_bk_lot"]

    def getRelatedWork(self, feature, cfg):
        if cfg == 0:

            layer = self.iface.activeLayer()
            #QgsMessageLog.logMessage('NEXT: ' + str(layer.name()), 'BRS_GIS', level=Qgis.Info)

            if layer.name() not in ('brs_jobs', 'abutters'):
                return

            layerJobs = QgsProject.instance().mapLayersByName('brs_jobs')[0]
            layerPlans = QgsProject.instance().mapLayersByName('la_plans')[0]
            layerRelated = QgsProject.instance().mapLayersByName('relatedwork')[0]
            layerAbutters = QgsProject.instance().mapLayersByName('abutters')[0]

            self.fb = QgsProcessingFeedback()
            self.context = QgsProcessingContext

            if self.iface.activeLayer().name() == 'brs_jobs':
                jobNo = feature['job_no']
                self.iface.actionToggleEditing().trigger()
                layerRelated.setSubsetString(u'"job_no" = \'%s\'' % (jobNo))
                listOfIds = [feat.id() for feat in layerRelated.getFeatures()]
                layerRelated.dataProvider().deleteFeatures(listOfIds)
                self.iface.activeLayer().commitChanges()
                self.iface.setActiveLayer(layerJobs)
                layerRelated.setSubsetString('id > 1')
                # getRelated PLANS for JOB feature
                processing.runAndLoadResults("qgis:intersection",
                                             {'INPUT': QgsProcessingFeatureSourceDefinition(
                                                 'brs_jobs_ff168cff_1c0e_47e8_b18c_cb8b59c8d07b', True),
                                                 'INPUT_FIELDS': ['job_no', 'map_bk_lot'],
                                                 'OUTPUT': 'memory:tmp_related',
                                                 'OVERLAY': 'dbname=\'BRS_GIS_PRD\' host=localhost port=5432 sslmode=disable key=\'gid\' srid=0 '
                                                            'type=MultiPolygon table="public"."la_plans_final" (geom) sql=',
                                                 'OVERLAY_FIELDS': ['plan_no', 'job', 'old_plan']
                                             }, feedback=self.fb)
                self.addRelated(0)
                # getRelated JOBS for JOB feature
                processing.runAndLoadResults("qgis:intersection",
                                             {'INPUT': QgsProcessingFeatureSourceDefinition(
                                                 'brs_jobs_ff168cff_1c0e_47e8_b18c_cb8b59c8d07b', True),
                                                 'INPUT_FIELDS': ['job_no', 'map_bk_lot'],
                                                 'OUTPUT': 'memory:tmp_related',
                                                 'OVERLAY': QgsProcessingFeatureSourceDefinition(
                                                     'brs_jobs_ff168cff_1c0e_47e8_b18c_cb8b59c8d07b'),
                                                 'OVERLAY_FIELDS': ['plan_no', 'job', 'old_plan']
                                             }, feedback=self.fb)

                #self.addLayerDB(layerRelated) --don't remember why i did this
                self.addRelated(0)

            elif self.iface.activeLayer().name() == 'abutters':
                mbl = feature['map_bk_lot']
                self.iface.actionToggleEditing().trigger()
                #NEED TO CHECK POTENTIAL TOWN OVERLAP ISSUES. add TOWN condition when getting RELATED for ABUTTER?
                layerRelated.setSubsetString(u'"map_bk_lot" = \'%s\'' % (mbl))
                listOfIds = [feat.id() for feat in layerRelated.getFeatures()]
                layerRelated.dataProvider().deleteFeatures(listOfIds)
                self.iface.activeLayer().commitChanges()
                self.iface.setActiveLayer(layerAbutters)
                layerRelated.setSubsetString('id > 1')
                # getRelated JOBS for ABUTTER feature
                processing.runAndLoadResults("qgis:intersection",
                                   {'INPUT': QgsProcessingFeatureSourceDefinition('abutters_a7752f9f_2bd3_4bbd_b554_a095bde80b82', True),
                                    'INPUT_FIELDS': ['map_bk_lot'],
                                    'OUTPUT': 'memory:tmp_related',
                                    'OVERLAY': 'dbname=\'BRS_GIS_PRD\' host=localhost port=5432 sslmode=disable key=\'gid\' srid=0 '
                                               'type=MultiPolygon table="public"."la_plans_final" (geom) sql=',
                                    'OVERLAY_FIELDS': ['plan_no', 'job', 'old_plan']
                        }, feedback=self.fb)

                self.addRelated(0)
                # getRelated PLANS for ABUTTER feature
                processing.runAndLoadResults("qgis:intersection",
                                   {'INPUT':QgsProcessingFeatureSourceDefinition('abutters_a7752f9f_2bd3_4bbd_b554_a095bde80b82', True),
                                    'INPUT_FIELDS': ['map_bk_lot'],
                                    'OUTPUT': 'memory:tmp_related',
                                    'OVERLAY': QgsProcessingFeatureSourceDefinition(
                                        'brs_jobs_ff168cff_1c0e_47e8_b18c_cb8b59c8d07b'),
                                    'OVERLAY_FIELDS': ['plan_no', 'id','job', 'old_plan']
                        }, feedback=self.fb)
                self.addRelated(0)

            else:
                pass

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

    def addRelated(self, cfg):
        #try:
        layerTmpRelated = QgsProject.instance().mapLayersByName('Intersection')[0]
        layerTmpRelated.selectAll()
        self.iface.actionCopyFeatures().trigger()

        self.vl = QgsProject.instance().mapLayersByName('relatedwork')[0]
        self.iface.setActiveLayer(self.vl)
        self.iface.actionToggleEditing().trigger()

        self.iface.actionIdentify().trigger()
        self.iface.actionPasteFeatures().trigger()
        self.iface.activeLayer().commitChanges()

        QgsProject.instance().removeMapLayer(layerTmpRelated.id())
        self.vl.dataProvider().forceReload()
        self.iface.mapCanvas().refresh()

    def addLayerDB(self, layerToAdd):
        layerRelated = QgsProject.instance().mapLayersByName('Intersection')[0]
        tableName = layerToAdd.name()
        uri = QgsDataSourceUri()
        uri.setConnection("localhost", "5432", "BRS_GIS_PRD", "postgres", "Schl1g3n#")
        uri.setDataSource("public", tableName, "the_geom")
        vlayer = QgsVectorLayer(uri.uri(False), tableName, "postgres")
        layerRelated = QgsProject.instance().mapLayersByName(str(layerToAdd.name()))[0]
        layers = QgsProject.instance().mapLayers().values()
        rLoaded = 0
        for layer in layers:
            l = layer.name()
            layerType = layer.type()
            if layerType == QgsMapLayer.VectorLayer:
                if l == 'relatedwork':
                    rLoaded = 1
                else:
                    pass
        if rLoaded == 1:
            # QgsProject.instance().removeMapLayer(layerRelated.id())
            QgsProject.instance().addMapLayer(layerToAdd)
            self.iface.mapCanvas().refresh()
        else:
            QgsProject.instance().addMapLayer(vlayer)

    def showFeatureCount(layers):

        layer = layers[0]
        if layer.type() == QgsMapLayer.VectorLayer:
            root = QgsProject.instance().layerTreeRoot()
            myLayerNode = root.findLayer(layer.id())
            myLayerNode.setCustomProperty("showFeatureCount", True)

    def updateJobRelated(self, feat):

        self.vl = QgsProject.instance().mapLayersByName('brs_jobs')[0]
        self.iface.setActiveLayer(self.vl)
        jobNo = feat['job_no']
        layerRelated = QgsProject.instance().mapLayersByName('relatedwork')[0]
        relatedWork = []
        plans = []
        plans2 = []
        ppval = ''
        pval = ''
        pNo = 0

        layerRelated.setSubsetString(u'"job_no" = \'%s\'' % (jobNo))
        exp = QgsExpression(u'"job_no" = \'%s\'' % (jobNo))
        request = QgsFeatureRequest(exp)
        request.setSubsetOfAttributes(['job_no','old_plan'], layerRelated.fields())
        request.setFlags(QgsFeatureRequest.NoGeometry)

        for feat in layerRelated.getFeatures(request):

            pFinal = ''
            oldPlan = feat['old_plan']
            pval = oldPlan

            if str(ppval) == str(pval):
                pval = ''

            plen = len(plans)
            plans.append(pval)

            pNo += 1
            ppval = pval
            #QgsMessageLog.logMessage('plans: ' + str(plans), 'BRS_GIS', level=Qgis.Info)

        feat = self.iface.activeLayer().selectedFeatures()[0]

        if len(plans) > 1:
            plans.sort(reverse=True)
            pFinal = str(plans)
            pFinal = pFinal.strip('[')
            pFinal = pFinal.strip(']')
            pFinal = pFinal.replace('\'', '')

            self.iface.actionToggleEditing().trigger()
            layerData = self.vl.dataProvider()
            idx3 = layerData.fieldNameIndex('old_plan_no')
            self.vl.changeAttributeValue(feat.id(), idx3, str(pFinal))
            self.vl.updateFields()
            self.iface.activeLayer().commitChanges()

            plans = []
            #QgsMessageLog.logMessage('pFinal: ' + str(pFinal), 'BRS_GIS', level=Qgis.Info)

        else:
            pFinal = ''
        layerRelated.setSubsetString('id > 1')
        # END getAllRelated for selected JOB
        return pFinal

    def updateAbutterRelated(self, feat):

        self.vl = QgsProject.instance().mapLayersByName('abutters')[0]
        self.iface.setActiveLayer(self.vl)
        mbl = feat['map_bk_lot']
        layerRelated = QgsProject.instance().mapLayersByName('relatedwork')[0]
        relatedWork = []
        plans = []
        plans2 = []
        ppval = ''
        pval = ''
        pNo = 0

        layerRelated.setSubsetString(u'"map_bk_lot" = \'%s\'' % (mbl))
        exp = QgsExpression(u'"map_bk_lot" = \'%s\'' % (mbl))
        request = QgsFeatureRequest(exp)
        request.setSubsetOfAttributes(['old_plan'], layerRelated.fields())
        request.setFlags(QgsFeatureRequest.NoGeometry)

        for feat in layerRelated.getFeatures(request):

            oldPlan = feat['old_plan']
            pval = oldPlan

            if str(ppval) == str(pval):
                pval = ''

            plen = len(plans)
            plans.append(pval)

            pNo += 1
            ppval = pval
            #QgsMessageLog.logMessage('plans: ' + str(plans), 'BRS_GIS', level=Qgis.Info)

        feat = self.iface.activeLayer().selectedFeatures()[0]

        if len(plans) > 1:
            plans.sort(reverse=True)
            pFinal = str(plans)
            pFinal = pFinal.strip('[')
            pFinal = pFinal.strip(']')
            pFinal = pFinal.replace('\'', '')

            plans = []
            #QgsMessageLog.logMessage('pFinal: ' + str(pFinal), 'BRS_GIS', level=Qgis.Info)

        else:
            pass
        layerRelated.setSubsetString('id > 1')
        # END getAllRelated for selected JOB
        return pFinal

class brsgis_editPlan(object):

    newJob = 0
    selComp = 0
    multiFeat = 0
    count = 0

    def __init__(self, iface):
        # save reference to the QGIS interface
        self.iface = iface

    def initGui(self):

        self.action = QAction("Edit Plan", self.iface.mainWindow())
        self.action.triggered.connect(self.run)
        self.action.trigger()
        self.iface.mapCanvas().selectionChanged.connect(self.select_changed)

    def run(self):
        self.vl = QgsProject.instance().mapLayersByName('la_plans')[0]
        self.iface.setActiveLayer(self.vl)

        reply = QMessageBox.question(self.iface.mainWindow(), 'Edit Plan',
                                     'Click OK and select the correct parcel for the plan you wish to edit.',
                                     QMessageBox.Ok, QMessageBox.Cancel)
        if reply == QMessageBox.Ok:
            if self.selComp == 1:
                return
            else:
                self.newJob = 1
                if self.count == 0:
                    for a in self.iface.attributesToolBar().actions():
                        if a.objectName() == 'mActionDeselectAll':
                            a.trigger()
                            QgsMessageLog.logMessage('FIRST RUN: Previously selected parcel(s) have been cleared.',
                                                     'BRS_GIS', level=Qgis.Info)
                            QgsMessageLog.logMessage('Job editing starting...', 'BRS_GIS', level=Qgis.Info)
                            self.iface.actionSelect().trigger()
                            self.count = self.count + 1
                else:
                    self.iface.actionSelect().trigger()
        else:
            QgsMessageLog.logMessage('DEBUG: Job editing cancelled.', 'BRS_GIS', level=Qgis.Info)
            self.iface.mapCanvas().selectionChanged.disconnect(self.select_changed)

    def select_changed(self):

        try:
            parcel = self.iface.activeLayer().selectedFeatures()[0]
            planNo = parcel["plan_no"]
            msg = QMessageBox()
            msg.setWindowTitle('Edit Plan')
            msg.setText('PlanNo: ' + planNo + ' has been selected. Continue?')
            edit = msg.addButton('Edit Plan', QMessageBox.AcceptRole)
            cancel = msg.addButton('Cancel', QMessageBox.RejectRole)
            msg.setDefaultButton(edit)
            QGuiApplication.setOverrideCursor(Qt.ArrowCursor)
            msg.exec_()
            msg.deleteLater()
            QGuiApplication.restoreOverrideCursor()
            if msg.clickedButton() is edit:
                if self.multiFeat == 0:
                    QgsMessageLog.logMessage('Plan editing will begin for: ' + planNo,
                                             'BRS_GIS', level=Qgis.Info)
                    QgsMessageLog.logMessage('Launching form...', 'BRS_GIS', level=Qgis.Info)
                    self.iface.actionToggleEditing().trigger()
                    self.active_edit()
                    QgsMessageLog.logMessage('PlanNo:' + parcel["plan_no"] + ' has been modified and saved.',
                                             'BRS_GIS', level=Qgis.Info)

                    lyr = QgsProject.instance().mapLayersByName('la_plans')[0]
                    self.iface.setActiveLayer(lyr)
                    self.iface.mapCanvas().selectionChanged.disconnect(self.select_changed)
                    self.iface.actionIdentify().trigger()

                elif msg.clickedButton() is cancel:
                    self.iface.mapCanvas().selectionChanged.disconnect(self.select_changed)
                    QgsMessageLog.logMessage('DEBUG: Plan editing cancelled.', 'BRS_GIS', level=Qgis.Info)
                    QGuiApplication.restoreOverrideCursor()
                    return
                else:
                    self.iface.mapCanvas().selectionChanged.disconnect(self.select_changed)
                    QgsMessageLog.logMessage('DEBUG: Plan editing cancelled.', 'BRS_GIS', level=Qgis.Info)
                    QGuiApplication.restoreOverrideCursor()
            else:
                self.iface.mapCanvas().selectionChanged.disconnect(self.select_changed)
                QGuiApplication.restoreOverrideCursor()
                return

        except Exception as e:
            exc_type, exc_obj, exc_tb = sys.exc_info()
            fname = os.path.split(exc_tb.tb_frame.f_code.co_filename)[1]
            QMessageBox.critical(self.iface.mainWindow(), "EXCEPTION",
                                 "Details: " + str(exc_type) + ' ' + str(fname) + ' ' + str(
                                     exc_tb.tb_lineno) + ' ' + str(e))
            QGuiApplication.restoreOverrideCursor()
            return


    def active_edit(self):

        try:
            self.vl = QgsProject.instance().mapLayersByName('la_plans')[0]
            self.iface.setActiveLayer(self.vl)
            f = self.vl.selectedFeatures()[0]
            #change to la_plans form
            form_config = self.iface.activeLayer().editFormConfig()
            form_config.setUiForm('z:/0 - settings/gis/qgis/plugins/brsgis_plugin/ui/la_plans.ui')
            form_config.setInitFilePath('z:/0 - settings/gis/qgis/plugins/brsgis_plugin/la_plans_init.py')
            self.iface.activeLayer().setEditFormConfig(form_config)
            QGuiApplication.setOverrideCursor(Qt.ArrowCursor)
            self.iface.openFeatureForm(self.iface.activeLayer(), f, False, True)
            QGuiApplication.restoreOverrideCursor()
            QgsMessageLog.logMessage('Saving changes...', 'BRS_GIS', level=Qgis.Info)
        except Exception as e:
            exc_type, exc_obj, exc_tb = sys.exc_info()
            fname = os.path.split(exc_tb.tb_frame.f_code.co_filename)[1]
            QMessageBox.critical(self.iface.mainWindow(), "EXCEPTION",
                                 "Details: " + str(exc_type) + ' ' + str(fname) + ' ' + str(
                                     exc_tb.tb_lineno) + ' ' + str(e))
            QGuiApplication.restoreOverrideCursor()

            return

        self.vl = QgsProject.instance().mapLayersByName('la_plans')[0]
        self.iface.setActiveLayer(self.vl)
        self.iface.activeLayer().commitChanges()

class brsgis_printContacts(object):
    def __init__(self, iface):
        # save reference to the QGIS interface
        self.iface = iface

    def initGui(self):

        self.action = QAction("PC", self.iface.mainWindow())
        self.action.triggered.connect(self.run)
        self.action.trigger()

    def run(self):
        self.identContacts()

    def identContacts(self):
            import datetime
            year = datetime.datetime.today().strftime('%Y')

            aNo = 0

            self.vl = QgsProject.instance().mapLayersByName('brs_jobs')[0]
            self.iface.setActiveLayer(self.vl)

            attribs = self.iface.activeLayer().selectedFeatures()[0]

            jobNo = attribs["job_no"]
            jobID = attribs["sid"]

            path = os.path.join("Z:\\", "BRS", year, jobNo)
            jipath = os.path.join(path, "Job_Info")
            QgsMessageLog.logMessage('Checking output folder: ' + path + '...', 'BRS_GIS', level=Qgis.Info)
            if not os.path.exists(path):
                os.makedirs(path)
            QgsMessageLog.logMessage('Checking output folder: ' + jipath + '...', 'BRS_GIS', level=Qgis.Info)
            if not os.path.exists(jipath):
                os.makedirs(jipath)

            from openpyxl import load_workbook
            wb = load_workbook('z:/0 - settings/gis/qgis/plugins/brsgis_plugin/BRS_templates.xlsx')

            # grab the correct worksheet
            for s in range(len(wb.sheetnames)):
                if wb.sheetnames[s] == 'contacts':
                    break
            wb.active = s
            sheets = wb.sheetnames
            ws = wb.active

            for s in sheets:
                if s != 'contacts':
                    sheet_name = wb.get_sheet_by_name(s)
                    wb.remove_sheet(sheet_name)

            layer3 = QgsProject.instance().mapLayersByName('brs_contacts')[0]
            exp = QgsExpression(u'"jobs_id" = \'%s\'' % (jobID))
            request = QgsFeatureRequest(exp)
            request.setSubsetOfAttributes(['jobs_id'], layer3.fields())
            request.setFlags(QgsFeatureRequest.NoGeometry)

            startCell = 3

            for f in layer3.getFeatures(request):

                try:
                        aNo += 1
                        ws['A2'] = str(jobNo) + ' Contacts:'
                        c1 = 'A' + str(startCell)
                        c2 = 'A' + str(startCell + 2)
                        c3 = 'B' + str(startCell + 3)
                        c4 = 'B' + str(startCell + 4)
                        c5 = 'B' + str(startCell + 2)
                        c6 = 'D' + str(startCell + 3)
                        c7 = 'D' + str(startCell + 4)
                        c8 = 'F' + str(startCell + 3)
                        c9 = 'F' + str(startCell + 4)
                        c10 = 'H' + str(startCell + 3)

                        ws[c1] = str(f["contact_type"])
                        ws[c2] = str(f["contact_name"])
                        ws[c3] = str(f["primary_contact"])
                        ws[c4] = str(f["secondary_contact"])
                        ws[c5] = str(f["contact_addr"])
                        ws[c6] = str(f["phone_mobile"])
                        ws[c7] = str(f["email_primary"])
                        ws[c8] = str(f["phone_work"])
                        ws[c9] = str(f["email_secondary"])
                        ws[c10] = str(f["phone_home"])

                        startCell += 5

                except Exception as e:
                    exc_type, exc_obj, exc_tb = sys.exc_info()
                    fname = os.path.split(exc_tb.tb_frame.f_code.co_filename)[1]
                    QMessageBox.critical(self.iface.mainWindow(), "EXCEPTION",
                                         "Details: " + str(exc_type) + ' ' + str(fname) + ' ' + str(
                                             exc_tb.tb_lineno) + ' ' + str(e))
                    return

            if aNo == 1:
                delRow = startCell
                ws.delete_rows(delRow, 100)
            else:
                delRow = startCell
                ws.delete_rows(delRow, 100)
            QgsMessageLog.logMessage(str(aNo) + ' contacts found.', 'BRS_GIS', level=Qgis.Info)
            # Save the file
            cfile = str(jipath) + "\\" + jobNo + "_Contacts_" + datetime.datetime.today().strftime(
                '%Y.%m.%d') + ".xlsx"
            QgsMessageLog.logMessage('Saving file: ' + cfile + '...', 'BRS_GIS', level=Qgis.Info)
            wb.save(cfile)

class brsgis_printMapView(object):

    def __init__(self, iface):
        # save reference to the QGIS interface
        self.iface = iface

    def initGui(self):
        self.action = QAction("PMV", self.iface.mainWindow())
        self.action.triggered.connect(self.run)
        self.action.trigger()

    def run(self):
        import datetime
        year = datetime.datetime.today().strftime('%Y')
        self.vl = QgsProject.instance().mapLayersByName('brs_jobs')[0]
        self.iface.setActiveLayer(self.vl)
        attribs = self.iface.activeLayer().selectedFeatures()[0]
        jobNo = attribs["job_no"]
        clientName = attribs["client_name"]

        self.vl = QgsProject.instance().mapLayersByName('abutters')[0]
        self.iface.setActiveLayer(self.vl)
        self.vl.loadNamedStyle('z:/0 - settings/gis/qgis/plugins/brsgis_plugin/QML/abutters_print.qml')
        self.vl.setSubsetString('"referrerJ"=\'%s\'' % jobNo)


        self.vl = QgsProject.instance().mapLayersByName('brs_jobs')[0]
        self.iface.setActiveLayer(self.vl)
        self.vl.loadNamedStyle('z:/0 - settings/gis/qgis/plugins/brsgis_plugin/QML/brs_jobs_print.qml')
        self.vl.setSubsetString('"job_no"=\'%s\'' % jobNo)

        path = os.path.join("Z:\\", "BRS", year, jobNo)
        jipath = os.path.join(path, "Job_Info")
        QgsMessageLog.logMessage('Checking output folder: ' + path + '...', 'BRS_GIS', level=Qgis.Info)
        if not os.path.exists(path):
            os.makedirs(path)
        QgsMessageLog.logMessage('Checking output folder: ' + jipath + '...', 'BRS_GIS', level=Qgis.Info)
        if not os.path.exists(jipath):
            os.makedirs(jipath)
        cfile = str(jipath) + "\\" + jobNo + "_MapView_" + datetime.datetime.today().strftime(
            '%Y.%m.%d') + ".pdf"
        QgsMessageLog.logMessage('Saving file: ' + cfile + '...', 'BRS_GIS', level=Qgis.Info)

        self.make_pdf(cfile, jobNo, clientName)

        self.vl = QgsProject.instance().mapLayersByName('abutters')[0]
        self.iface.setActiveLayer(self.vl)
        self.vl.loadNamedStyle('z:/0 - settings/gis/qgis/plugins/brsgis_plugin/QML/abutters_std.qml')
        self.vl.setSubsetString('')

        self.vl = QgsProject.instance().mapLayersByName('brs_jobs')[0]
        self.iface.setActiveLayer(self.vl)
        self.vl.loadNamedStyle('z:/0 - settings/gis/qgis/plugins/brsgis_plugin/QML/brs_jobs_std.qml')
        self.vl.setSubsetString('')

    def make_pdf(self, cf, jn, cn):

        # QGuiApplication.setOverrideCursor(Qt.WaitCursor)
        if str(cn) == 'NULL':
            cn = 'Client Name'
        else:
            cn = cn

        title = str(jn) + ' (' + str(cn) + ')'
        
        project = QgsProject.instance()
        l = QgsPrintLayout(project)
        l.initializeDefaults()
        l.setUnits(QgsUnitTypes.LayoutMillimeters)
        page = l.pageCollection().pages()[0]

        paperSize = self.getPaperSize()
        page.setPageSize(QgsLayoutSize(paperSize[0], paperSize[1]))

        lm = 10  # left margin
        tm = 30  # upper margin
        bm = 65  # lower margin

        refSize = paperSize[0]
        if paperSize[1] < refSize:
            refSize = paperSize[1]

        # add map
        x, y = lm, tm
        w, h = paperSize[0] - 2 * lm, paperSize[1] - bm

        theMap = QgsLayoutItemMap(l)
        theMap.updateBoundingRect()
        theMap.setRect(QRectF(x, y, w, h))
        theMap.setPos(x, y)
        theMap.setFrameEnabled(True)

        theMap.setLayers(project.mapThemeCollection().masterVisibleLayers())  # remember ANNOTATION!
        theMap.setExtent(self.iface.mapCanvas().extent())
        theMap.attemptSetSceneRect(QRectF(x, y, w, h))
        l.addItem(theMap)

        titleFont = QFont("Arial", 20)
        titleFont.setBold(True)

        titleLabel = QgsLayoutItemLabel(l)
        titleLabel.setText(title)
        titleLabel.setPos(lm, 10)
        titleLabel.setFont(titleFont)
        titleLabel.adjustSizeToText()
        l.addItem(titleLabel)

        scaleBar = QgsLayoutItemScaleBar(l)
        scaleBar.setLinkedMap(theMap)
        scaleBar.applyDefaultSettings()
        scaleBar.applyDefaultSize(QgsUnitTypes.DistanceFeet)

        scaleBar.setNumberOfSegmentsLeft(0)
        scaleBar.setNumberOfSegments(5)
        scaleBar.update()
        scaleBar.setPos(lm, tm + (paperSize[1] - bm) + 10)

        l.addItem(scaleBar)

        exporter = QgsLayoutExporter(l)
        pdf_settings = exporter.PdfExportSettings()  # dpi?
        exporter.exportToPdf(cf, pdf_settings)

        # QGuiApplication.restoreOverrideCursor()

    def getPaperSize(self):

        longSide = 297
        shortSide = 210
        width = shortSide
        height = longSide

        return width, height

class brsgis_newK(object):
    newJob = 0
    selComp = 0
    multiFeat = 0
    count = 0

    def __init__(self, iface):
        # save reference to the QGIS interface
        self.iface = iface

    def initGui(self):

        self.action = QAction("Create New K-Plan", self.iface.mainWindow())
        self.action.triggered.connect(self.run)
        self.action.trigger()
        self.iface.mapCanvas().selectionChanged.connect(self.select_changed)

    def run(self):
        self.vl = QgsProject.instance().mapLayersByName('parcels')[0]
        self.iface.setActiveLayer(self.vl)

        reply = QMessageBox.question(self.iface.mainWindow(), 'New K-Plan',
                                     'Click OK and select the correct parcel(s) for the new job.',
                                     QMessageBox.Ok, QMessageBox.Cancel)
        if reply == QMessageBox.Ok:
            if self.selComp == 1:
                return
            else:
                self.newJob = 1
                if self.count == 0:
                    for a in self.iface.attributesToolBar().actions():
                        if a.objectName() == 'mActionDeselectAll':
                            a.trigger()
                            QgsMessageLog.logMessage('FIRST RUN: Previously selected parcel(s) have been cleared.',
                                                     'BRS_GIS', level=Qgis.Info)
                            QgsMessageLog.logMessage('Job creation starting...', 'BRS_GIS', level=Qgis.Info)
                            self.iface.actionSelectFreehand().trigger()
                            self.count = self.count + 1
                else:
                    self.iface.actionSelect().trigger()

        else:
            QgsMessageLog.logMessage('DEBUG: Job creation cancelled.', 'BRS_GIS', level=Qgis.Info)

    def select_changed(self):

        if self.newJob == 0:
            return
        else:
            try:

                vLayer = self.iface.activeLayer()
                feats_count = vLayer.selectedFeatureCount()

                msg = QMessageBox()
                msg.setWindowTitle('Selection')
                msg.setText(str(feats_count) + ' features have been selected. Continue?')
                create = msg.addButton('Continue', QMessageBox.AcceptRole)
                cancel = msg.addButton('Cancel', QMessageBox.RejectRole)
                msg.setDefaultButton(create)
                msg.exec_()
                msg.deleteLater()

                QGuiApplication.restoreOverrideCursor()

                if msg.clickedButton() is create:

                        QgsMessageLog.logMessage('Job creation will begin for multiple parcels:', 'BRS_GIS', level=Qgis.Info)
                        self.iface.actionCopyFeatures().trigger()
                        self.newJob = 0
                        self.vl = QgsProject.instance().mapLayersByName('la_plans')[0]
                        self.iface.setActiveLayer(self.vl)

                        self.iface.actionIdentify().trigger()
                        self.iface.actionToggleEditing().trigger()
                        self.iface.actionPasteFeatures().trigger()
                        self.iface.mainWindow().findChild(QAction, 'mActionMergeFeatures').trigger()
                        # end merge features, launch form
                        self.iface.activeLayer().commitChanges()
                        layer = self.iface.activeLayer()
                        prov = layer.dataProvider()

                        idx = prov.fieldNameIndex('objectid')

                        oid = layer.maximumValue(idx)
                        it = layer.getFeatures(QgsFeatureRequest().setFilterExpression(u'"objectid" = {0}'.format(oid)))
                        # QgsMessageLog.logMessage('sid: ' + str(sid) + ' it: ' + str(it), 'BRS_GIS', level=Qgis.Info)
                        for feature in it:
                            f = feature.id()
                            layer.select(f)

                        QgsMessageLog.logMessage('Launching form for merged feature...', 'BRS_GIS', level=Qgis.Info)
                        self.iface.activeLayer().commitChanges()
                        self.iface.actionToggleEditing().trigger()

                        #  ------------- EDITING BEGINS -------------
                        self.active_edit()
                        #  ------------- EDITING ENDS -------------

                        self.vl = QgsProject.instance().mapLayersByName('la_plans')[0]

                        jobNo = self.vl.selectedFeatures()[0]
                        lat_lon = jobNo['lat_lon']
                        dd = float(lat_lon.split(',')[0])
                        dd2 = float(lat_lon.split(',')[1])

                        d = int(float(dd))
                        m = int(float((dd - d)) * 60)
                        s = (dd - d - m / 60) * 3600.00
                        z = round(s, 2)

                        if d >= 0:
                            lat = (str(abs(d)) + '°' + str(abs(m)) + "'" + str(abs(z)) + '"' + 'N')
                        else:
                            lat = (str(abs(d)) + '°' + str(abs(m)) + "'" + str(abs(z)) + '"' + 'S')

                        d = int(float(dd2))
                        m = int(float((dd2 - d)) * 60)
                        s = (dd2 - d - m / 60) * 3600.00
                        z = round(s, 2)

                        if d >= 0:
                            lon = (str(abs(d)) + '°' + str(abs(m)) + "'" + str(abs(z)) + '"' + 'E')
                        else:
                            lon = (str(abs(d)) + '°' + str(abs(m)) + "'" + str(abs(z)) + '"' + 'W')

                        lat_lon = str(lat) + '    ' + str(lon)
                        lyr = QgsProject.instance().mapLayersByName('la_plans')[0]
                        # start editing, change field value
                        self.iface.actionToggleEditing().trigger()
                        layerData = lyr.dataProvider()
                        idx3 = layerData.fieldNameIndex('lat_lon')
                        lyr.changeAttributeValue(jobNo.id(), idx3, lat_lon)
                        lyr.updateFields()
                        # end field update, save layer
                        self.iface.activeLayer().commitChanges()

                        self.iface.setActiveLayer(self.vl)

                        layer = self.iface.activeLayer()
                        prov = layer.dataProvider()

                        idx = prov.fieldNameIndex('objectid')

                        oid = layer.maximumValue(idx)
                        it = layer.getFeatures(QgsFeatureRequest().setFilterExpression(u'"objectid" = {0}'.format(oid)))

                        for feature in it:
                            f = feature.id()
                            layer.select(f)

                        jobNo = self.vl.selectedFeatures()[0]
                        kNo = jobNo["plan_no"]
                        QgsMessageLog.logMessage('K-No: ' + str(kNo) + ' has been created and saved.',
                                                 'BRS_GIS', level=Qgis.Info)
                        lyr = QgsProject.instance().mapLayersByName('la_plans')[0]
                        self.iface.setActiveLayer(lyr)

                elif msg.clickedButton() is cancel:
                    self.iface.mapCanvas().selectionChanged.disconnect(self.select_changed)
                    # QGuiApplication.restoreOverrideCursor()
                    return

            except Exception as e:
                exc_type, exc_obj, exc_tb = sys.exc_info()
                fname = os.path.split(exc_tb.tb_frame.f_code.co_filename)[1]
                QMessageBox.critical(self.iface.mainWindow(), "EXCEPTION",
                                     "Details: " + str(exc_type) + ' ' + str(fname) + ' ' + str(
                                         exc_tb.tb_lineno) + ' ' + str(e))
                return

    def active_edit(self):

        try:

            self.vl = QgsProject.instance().mapLayersByName('la_plans')[0]
            self.iface.setActiveLayer(self.vl)
            self.iface.activeLayer().commitChanges()
            self.iface.actionToggleEditing().trigger()
            layer = self.iface.activeLayer()
            # prov = layer.dataProvider()
            #
            # idx = prov.fieldNameIndex('gid')
            #
            # gid = layer.maximumValue(idx)
            # it = layer.getFeatures(QgsFeatureRequest().setFilterExpression(u'"gid" = {0}'.format(gid)))
            #
            # for feature in it:
            #     f = feature.id()
            #     layer.select(f)
            #
            f = layer.selectedFeatures()[0]

            #change to brs_jobs form
            form_config = self.iface.activeLayer().editFormConfig()
            form_config.setUiForm('z:/0 - settings/gis/qgis/plugins/brsgis_plugin/ui/brs_k.ui')
            form_config.setInitFilePath('z:/0 - settings/gis/qgis/plugins/brsgis_plugin/brs_k_init.py')
            self.iface.activeLayer().setEditFormConfig(form_config)

            QGuiApplication.setOverrideCursor(Qt.ArrowCursor)
            self.iface.openFeatureForm(self.iface.activeLayer(), f, False, True)
            QGuiApplication.restoreOverrideCursor()

            QgsMessageLog.logMessage('Saving changes...', 'BRS_GIS', level=Qgis.Info)

        except Exception as e:
            exc_type, exc_obj, exc_tb = sys.exc_info()
            fname = os.path.split(exc_tb.tb_frame.f_code.co_filename)[1]
            QMessageBox.critical(self.iface.mainWindow(), "EXCEPTION",
                                 "Details: " + str(exc_type) + ' ' + str(fname) + ' ' + str(
                                     exc_tb.tb_lineno) + ' ' + str(e))
            return

        self.vl = QgsProject.instance().mapLayersByName('la_plans')[0]
        self.iface.setActiveLayer(self.vl)
        self.iface.activeLayer().commitChanges()

class brsgis_newPlan(object):
    newJob = 0
    selComp = 0
    multiFeat = 0
    count = 0

    def __init__(self, iface):
        # save reference to the QGIS interface
        self.iface = iface

    def initGui(self):

        self.action = QAction("Create New Plan", self.iface.mainWindow())
        self.action.triggered.connect(self.run)
        self.action.trigger()
        self.iface.mapCanvas().selectionChanged.connect(self.select_changed)

    def run(self):
        self.vl = QgsProject.instance().mapLayersByName('parcels')[0]
        self.iface.setActiveLayer(self.vl)

        reply = QMessageBox.question(self.iface.mainWindow(), 'New Plan',
                                     'Click OK and select the correct parcel(s) for the new plan.',
                                     QMessageBox.Ok, QMessageBox.Cancel)
        if reply == QMessageBox.Ok:
            if self.selComp == 1:
                return
            else:
                self.newJob = 1
                if self.count == 0:
                    for a in self.iface.attributesToolBar().actions():
                        if a.objectName() == 'mActionDeselectAll':
                            a.trigger()
                            QgsMessageLog.logMessage('FIRST RUN: Previously selected parcel(s) have been cleared.',
                                                     'BRS_GIS', level=Qgis.Info)
                            QgsMessageLog.logMessage('Job creation starting...', 'BRS_GIS', level=Qgis.Info)
                            self.iface.actionSelectFreehand().trigger()
                            self.count = self.count + 1
                else:
                    self.iface.actionSelect().trigger()

        else:
            QgsMessageLog.logMessage('DEBUG: Job creation cancelled.', 'BRS_GIS', level=Qgis.Info)

    def select_changed(self):

        if self.newJob == 0:
            return
        else:
            try:

                vLayer = self.iface.activeLayer()
                feats_count = vLayer.selectedFeatureCount()

                msg = QMessageBox()
                msg.setWindowTitle('Selection')
                msg.setText(str(feats_count) + ' features have been selected. Continue?')
                create = msg.addButton('Continue', QMessageBox.AcceptRole)
                cancel = msg.addButton('Cancel', QMessageBox.RejectRole)
                msg.setDefaultButton(create)
                msg.exec_()
                msg.deleteLater()

                QGuiApplication.restoreOverrideCursor()

                if msg.clickedButton() is create:

                        QgsMessageLog.logMessage('Job creation will begin for multiple parcels:', 'BRS_GIS', level=Qgis.Info)
                        self.iface.actionCopyFeatures().trigger()
                        self.newJob = 0
                        self.vl = QgsProject.instance().mapLayersByName('la_plans')[0]
                        self.iface.setActiveLayer(self.vl)

                        self.iface.actionIdentify().trigger()
                        self.iface.actionToggleEditing().trigger()
                        self.iface.actionPasteFeatures().trigger()
                        self.iface.mainWindow().findChild(QAction, 'mActionMergeFeatures').trigger()
                        # end merge features, launch form
                        self.iface.activeLayer().commitChanges()
                        layer = self.iface.activeLayer()
                        prov = layer.dataProvider()

                        idx = prov.fieldNameIndex('objectid')

                        oid = layer.maximumValue(idx)
                        it = layer.getFeatures(QgsFeatureRequest().setFilterExpression(u'"objectid" = {0}'.format(oid)))
                        # QgsMessageLog.logMessage('sid: ' + str(sid) + ' it: ' + str(it), 'BRS_GIS', level=Qgis.Info)
                        for feature in it:
                            f = feature.id()
                            layer.select(f)

                        QgsMessageLog.logMessage('Launching form for merged feature...', 'BRS_GIS', level=Qgis.Info)
                        self.iface.activeLayer().commitChanges()
                        self.iface.actionToggleEditing().trigger()

                        #  ------------- EDITING BEGINS -------------
                        self.active_edit()
                        #  ------------- EDITING ENDS -------------

                        self.vl = QgsProject.instance().mapLayersByName('la_plans')[0]

                        jobNo = self.vl.selectedFeatures()[0]
                        lat_lon = jobNo['lat_lon']
                        dd = float(lat_lon.split(',')[0])
                        dd2 = float(lat_lon.split(',')[1])

                        d = int(float(dd))
                        m = int(float((dd - d)) * 60)
                        s = (dd - d - m / 60) * 3600.00
                        z = round(s, 2)

                        if d >= 0:
                            lat = (str(abs(d)) + '°' + str(abs(m)) + "'" + str(abs(z)) + '"' + 'N')
                        else:
                            lat = (str(abs(d)) + '°' + str(abs(m)) + "'" + str(abs(z)) + '"' + 'S')

                        d = int(float(dd2))
                        m = int(float((dd2 - d)) * 60)
                        s = (dd2 - d - m / 60) * 3600.00
                        z = round(s, 2)

                        if d >= 0:
                            lon = (str(abs(d)) + '°' + str(abs(m)) + "'" + str(abs(z)) + '"' + 'E')
                        else:
                            lon = (str(abs(d)) + '°' + str(abs(m)) + "'" + str(abs(z)) + '"' + 'W')

                        lat_lon = str(lat) + '    ' + str(lon)
                        lyr = QgsProject.instance().mapLayersByName('la_plans')[0]
                        # start editing, change field value
                        self.iface.actionToggleEditing().trigger()
                        layerData = lyr.dataProvider()
                        idx3 = layerData.fieldNameIndex('lat_lon')
                        lyr.changeAttributeValue(jobNo.id(), idx3, lat_lon)
                        lyr.updateFields()
                        # end field update, save layer
                        self.iface.activeLayer().commitChanges()

                        self.iface.setActiveLayer(self.vl)

                        layer = self.iface.activeLayer()
                        prov = layer.dataProvider()

                        idx = prov.fieldNameIndex('objectid')

                        oid = layer.maximumValue(idx)
                        it = layer.getFeatures(QgsFeatureRequest().setFilterExpression(u'"objectid" = {0}'.format(oid)))

                        for feature in it:
                            f = feature.id()
                            layer.select(f)

                        jobNo = self.vl.selectedFeatures()[0]
                        kNo = jobNo["plan_no"]
                        QgsMessageLog.logMessage('Plan: ' + str(kNo) + ' has been created and saved.',
                                                 'BRS_GIS', level=Qgis.Info)
                        lyr = QgsProject.instance().mapLayersByName('la_plans')[0]
                        self.iface.setActiveLayer(lyr)

                elif msg.clickedButton() is cancel:
                    self.iface.mapCanvas().selectionChanged.disconnect(self.select_changed)
                    # QGuiApplication.restoreOverrideCursor()
                    return

            except Exception as e:
                exc_type, exc_obj, exc_tb = sys.exc_info()
                fname = os.path.split(exc_tb.tb_frame.f_code.co_filename)[1]
                QMessageBox.critical(self.iface.mainWindow(), "EXCEPTION",
                                     "Details: " + str(exc_type) + ' ' + str(fname) + ' ' + str(
                                         exc_tb.tb_lineno) + ' ' + str(e))
                return

    def active_edit(self):

        try:

            self.vl = QgsProject.instance().mapLayersByName('la_plans')[0]
            self.iface.setActiveLayer(self.vl)
            self.iface.activeLayer().commitChanges()
            self.iface.actionToggleEditing().trigger()
            layer = self.iface.activeLayer()
            # prov = layer.dataProvider()
            #
            # idx = prov.fieldNameIndex('gid')
            #
            # gid = layer.maximumValue(idx)
            # it = layer.getFeatures(QgsFeatureRequest().setFilterExpression(u'"gid" = {0}'.format(gid)))
            #
            # for feature in it:
            #     f = feature.id()
            #     layer.select(f)
            #
            f = layer.selectedFeatures()[0]

            #change to brs_jobs form
            form_config = self.iface.activeLayer().editFormConfig()
            form_config.setUiForm('z:/0 - settings/gis/qgis/plugins/brsgis_plugin/ui/la_plans.ui')
            form_config.setInitFilePath('z:/0 - settings/gis/qgis/plugins/brsgis_plugin/la_plans_init.py')
            self.iface.activeLayer().setEditFormConfig(form_config)

            QGuiApplication.setOverrideCursor(Qt.ArrowCursor)
            self.iface.openFeatureForm(self.iface.activeLayer(), f, False, True)
            QGuiApplication.restoreOverrideCursor()

            QgsMessageLog.logMessage('Saving changes...', 'BRS_GIS', level=Qgis.Info)

        except Exception as e:
            exc_type, exc_obj, exc_tb = sys.exc_info()
            fname = os.path.split(exc_tb.tb_frame.f_code.co_filename)[1]
            QMessageBox.critical(self.iface.mainWindow(), "EXCEPTION",
                                 "Details: " + str(exc_type) + ' ' + str(fname) + ' ' + str(
                                     exc_tb.tb_lineno) + ' ' + str(e))
            return

        self.vl = QgsProject.instance().mapLayersByName('la_plans')[0]
        self.iface.setActiveLayer(self.vl)
        self.iface.activeLayer().commitChanges()

class brsgis_editK(object):

    newJob = 0
    selComp = 0
    multiFeat = 0
    count = 0

    def __init__(self, iface):
        # save reference to the QGIS interface
        self.iface = iface

    def initGui(self):

        self.action = QAction("Edit K-Plan", self.iface.mainWindow())
        # self.iface.mapCanvas().selectionChanged.disconnect(self.select_changed)
        self.action.triggered.connect(self.run)
        self.action.trigger()
        self.iface.mapCanvas().selectionChanged.connect(self.select_changed)

    def run(self):
        self.vl = QgsProject.instance().mapLayersByName('la_plans')[0]
        self.iface.setActiveLayer(self.vl)

        reply = QMessageBox.question(self.iface.mainWindow(), 'Edit K-Plan',
                                     'Click OK and select the correct parcel for the plan you wish to edit.',
                                     QMessageBox.Ok, QMessageBox.Cancel)
        if reply == QMessageBox.Ok:
            if self.selComp == 1:
                return
            else:
                self.newJob = 1
                if self.count == 0:
                    for a in self.iface.attributesToolBar().actions():
                        if a.objectName() == 'mActionDeselectAll':
                            a.trigger()
                            QgsMessageLog.logMessage('FIRST RUN: Previously selected parcel(s) have been cleared.',
                                                     'BRS_GIS', level=Qgis.Info)
                            QgsMessageLog.logMessage('K-Plan editing starting...', 'BRS_GIS', level=Qgis.Info)
                            self.iface.actionSelect().trigger()
                            self.count = self.count + 1
                else:
                    self.iface.actionSelect().trigger()
        else:
            QgsMessageLog.logMessage('DEBUG: Job editing cancelled.', 'BRS_GIS', level=Qgis.Info)
            self.iface.mapCanvas().selectionChanged.disconnect(self.select_changed)

    def select_changed(self):

        try:
            parcel = self.iface.activeLayer().selectedFeatures()[0]
            planNo = parcel["plan_no"]
            msg = QMessageBox()
            msg.setWindowTitle('Edit K-Plan')
            msg.setText('K-PlanNo: ' + planNo + ' has been selected. Continue?')
            edit = msg.addButton('Edit K-Plan', QMessageBox.AcceptRole)
            cancel = msg.addButton('Cancel', QMessageBox.RejectRole)
            msg.setDefaultButton(edit)
            QGuiApplication.setOverrideCursor(Qt.ArrowCursor)
            msg.exec_()
            msg.deleteLater()
            QGuiApplication.restoreOverrideCursor()
            if msg.clickedButton() is edit:
                if self.multiFeat == 0:
                    QgsMessageLog.logMessage('K-Plan editing will begin for: ' + planNo,
                                             'BRS_GIS', level=Qgis.Info)
                    QgsMessageLog.logMessage('Launching form...', 'BRS_GIS', level=Qgis.Info)
                    self.iface.actionToggleEditing().trigger()
                    self.active_edit()
                    QgsMessageLog.logMessage('K-PlanNo: ' + str(planNo) + ' has been modified and saved.',
                                             'BRS_GIS', level=Qgis.Info)

                    lyr = QgsProject.instance().mapLayersByName('la_plans')[0]
                    self.iface.setActiveLayer(lyr)
                    self.iface.mapCanvas().selectionChanged.disconnect(self.select_changed)
                    self.iface.actionIdentify().trigger()

                elif msg.clickedButton() is cancel:
                    self.iface.mapCanvas().selectionChanged.disconnect(self.select_changed)
                    QgsMessageLog.logMessage('DEBUG: Plan editing cancelled.', 'BRS_GIS', level=Qgis.Info)
                    QGuiApplication.restoreOverrideCursor()
                    return
                else:
                    self.iface.mapCanvas().selectionChanged.disconnect(self.select_changed)
                    QgsMessageLog.logMessage('DEBUG: Plan editing cancelled.', 'BRS_GIS', level=Qgis.Info)
                    QGuiApplication.restoreOverrideCursor()
            else:
                self.iface.mapCanvas().selectionChanged.disconnect(self.select_changed)
                QGuiApplication.restoreOverrideCursor()
                return

        except Exception as e:
            exc_type, exc_obj, exc_tb = sys.exc_info()
            fname = os.path.split(exc_tb.tb_frame.f_code.co_filename)[1]
            QMessageBox.critical(self.iface.mainWindow(), "EXCEPTION",
                                 "Details: " + str(exc_type) + ' ' + str(fname) + ' ' + str(
                                     exc_tb.tb_lineno) + ' ' + str(e))
            QGuiApplication.restoreOverrideCursor()
            return


    def active_edit(self):

        try:
            self.vl = QgsProject.instance().mapLayersByName('la_plans')[0]
            self.iface.setActiveLayer(self.vl)
            f = self.vl.selectedFeatures()[0]
            #change to la_plans form
            form_config = self.iface.activeLayer().editFormConfig()
            form_config.setUiForm('z:/0 - settings/gis/qgis/plugins/brsgis_plugin/ui/brs_k.ui')
            form_config.setInitFilePath('z:/0 - settings/gis/qgis/plugins/brsgis_plugin/brs_k_init.py')
            self.iface.activeLayer().setEditFormConfig(form_config)
            QGuiApplication.setOverrideCursor(Qt.ArrowCursor)
            self.iface.openFeatureForm(self.iface.activeLayer(), f, False, True)
            QGuiApplication.restoreOverrideCursor()
            QgsMessageLog.logMessage('Saving changes...', 'BRS_GIS', level=Qgis.Info)
        except Exception as e:
            exc_type, exc_obj, exc_tb = sys.exc_info()
            fname = os.path.split(exc_tb.tb_frame.f_code.co_filename)[1]
            QMessageBox.critical(self.iface.mainWindow(), "EXCEPTION",
                                 "Details: " + str(exc_type) + ' ' + str(fname) + ' ' + str(
                                     exc_tb.tb_lineno) + ' ' + str(e))
            QGuiApplication.restoreOverrideCursor()

            return

        self.vl = QgsProject.instance().mapLayersByName('la_plans')[0]
        self.iface.setActiveLayer(self.vl)
        self.iface.activeLayer().commitChanges()

class brsgis_newP(object):
    newJob = 0
    selComp = 0
    multiFeat = 0
    count = 0

    def __init__(self, iface):
        # save reference to the QGIS interface
        self.iface = iface

    def initGui(self):

        self.action = QAction("Create New P-Plan", self.iface.mainWindow())
        self.action.triggered.connect(self.run)
        self.action.trigger()
        self.iface.mapCanvas().selectionChanged.connect(self.select_changed)

    def run(self):
        self.vl = QgsProject.instance().mapLayersByName('parcels')[0]
        self.iface.setActiveLayer(self.vl)

        reply = QMessageBox.question(self.iface.mainWindow(), 'New P-Plan',
                                     'Click OK and select the correct parcel(s) for the new job.',
                                     QMessageBox.Ok, QMessageBox.Cancel)
        if reply == QMessageBox.Ok:
            if self.selComp == 1:
                return
            else:
                self.newJob = 1
                if self.count == 0:
                    for a in self.iface.attributesToolBar().actions():
                        if a.objectName() == 'mActionDeselectAll':
                            a.trigger()
                            QgsMessageLog.logMessage('FIRST RUN: Previously selected parcel(s) have been cleared.',
                                                     'BRS_GIS', level=Qgis.Info)
                            QgsMessageLog.logMessage('P-Plan creation starting...', 'BRS_GIS', level=Qgis.Info)
                            self.iface.actionSelectFreehand().trigger()
                            self.count = self.count + 1
                else:
                    self.iface.actionSelect().trigger()

        else:
            QgsMessageLog.logMessage('DEBUG: Job creation cancelled.', 'BRS_GIS', level=Qgis.Info)

    def select_changed(self):

        if self.newJob == 0:
            return
        else:
            try:

                vLayer = self.iface.activeLayer()
                feats_count = vLayer.selectedFeatureCount()

                msg = QMessageBox()
                msg.setWindowTitle('Selection')
                msg.setText(str(feats_count) + ' features have been selected. Continue?')
                create = msg.addButton('Continue', QMessageBox.AcceptRole)
                cancel = msg.addButton('Cancel', QMessageBox.RejectRole)
                msg.setDefaultButton(create)
                msg.exec_()
                msg.deleteLater()

                QGuiApplication.restoreOverrideCursor()

                if msg.clickedButton() is create:

                        QgsMessageLog.logMessage('P-Plan creation will begin for multiple parcels:', 'BRS_GIS', level=Qgis.Info)
                        self.iface.actionCopyFeatures().trigger()
                        self.newJob = 0
                        self.vl = QgsProject.instance().mapLayersByName('brs_p')[0]
                        self.iface.setActiveLayer(self.vl)
                        self.iface.actionToggleEditing().trigger()
                        self.iface.actionIdentify().trigger()
                        self.iface.actionPasteFeatures().trigger()
                        self.iface.mainWindow().findChild(QAction, 'mActionMergeFeatures').trigger()
                        # end merge features, launch form
                        # self.iface.activeLayer().commitChanges()
                        # layer = self.iface.activeLayer()
                        # prov = layer.dataProvider()
                        #
                        # idx = prov.fieldNameIndex('gid')
                        #
                        # gid = layer.maximumValue(idx)
                        # it = layer.getFeatures(QgsFeatureRequest().setFilterExpression(u'"gid" = {0}'.format(gid)))
                        # # QgsMessageLog.logMessage('sid: ' + str(sid) + ' it: ' + str(it), 'BRS_GIS', level=Qgis.Info)
                        # for feature in it:
                        #     f = feature.id()
                        #     layer.select(f)

                        QgsMessageLog.logMessage('Launching form for merged feature...', 'BRS_GIS', level=Qgis.Info)
                        self.iface.activeLayer().commitChanges()
                        # self.iface.actionToggleEditing().trigger()

                        #  ------------- EDITING BEGINS -------------
                        self.active_edit()
                        #  ------------- EDITING ENDS -------------

                        self.vl = QgsProject.instance().mapLayersByName('brs_p')[0]

                        jobNo = self.vl.selectedFeatures()[0]
                        lat_lon = jobNo['lat_lon']
                        dd = float(lat_lon.split(',')[0])
                        dd2 = float(lat_lon.split(',')[1])

                        d = int(float(dd))
                        m = int(float((dd - d)) * 60)
                        s = (dd - d - m / 60) * 3600.00
                        z = round(s, 2)

                        if d >= 0:
                            lat = (str(abs(d)) + '°' + str(abs(m)) + "'" + str(abs(z)) + '"' + 'N')
                        else:
                            lat = (str(abs(d)) + '°' + str(abs(m)) + "'" + str(abs(z)) + '"' + 'S')

                        d = int(float(dd2))
                        m = int(float((dd2 - d)) * 60)
                        s = (dd2 - d - m / 60) * 3600.00
                        z = round(s, 2)

                        if d >= 0:
                            lon = (str(abs(d)) + '°' + str(abs(m)) + "'" + str(abs(z)) + '"' + 'E')
                        else:
                            lon = (str(abs(d)) + '°' + str(abs(m)) + "'" + str(abs(z)) + '"' + 'W')

                        lat_lon = str(lat) + '    ' + str(lon)
                        lyr = QgsProject.instance().mapLayersByName('brs_p')[0]
                        # start editing, change field value
                        self.iface.actionToggleEditing().trigger()
                        layerData = lyr.dataProvider()
                        idx3 = layerData.fieldNameIndex('lat_lon')
                        lyr.changeAttributeValue(jobNo.id(), idx3, lat_lon)
                        lyr.updateFields()
                        # end field update, save layer
                        self.iface.activeLayer().commitChanges()

                        self.iface.setActiveLayer(self.vl)

                        layer = self.iface.activeLayer()
                        prov = layer.dataProvider()

                        idx = prov.fieldNameIndex('gid')

                        gid = layer.maximumValue(idx)
                        it = layer.getFeatures(QgsFeatureRequest().setFilterExpression(u'"gid" = {0}'.format(gid)))

                        for feature in it:
                            f = feature.id()
                            layer.select(f)

                        jobNo = self.vl.selectedFeatures()[0]
                        jobNo["p_no"]
                        QgsMessageLog.logMessage('P-No:' + str(jobNo) + ' has been created and saved.',
                                                 'BRS_GIS', level=Qgis.Info)
                        lyr = QgsProject.instance().mapLayersByName('brs_p')[0]
                        self.iface.setActiveLayer(lyr)

                elif msg.clickedButton() is cancel:
                    self.iface.mapCanvas().selectionChanged.disconnect(self.select_changed)
                    # QGuiApplication.restoreOverrideCursor()
                    return

            except Exception as e:
                exc_type, exc_obj, exc_tb = sys.exc_info()
                fname = os.path.split(exc_tb.tb_frame.f_code.co_filename)[1]
                QMessageBox.critical(self.iface.mainWindow(), "EXCEPTION",
                                     "Details: " + str(exc_type) + ' ' + str(fname) + ' ' + str(
                                         exc_tb.tb_lineno) + ' ' + str(e))
                return

    def active_edit(self):

        try:

            self.vl = QgsProject.instance().mapLayersByName('brs_p')[0]
            self.iface.setActiveLayer(self.vl)
            # self.iface.activeLayer().commitChanges()
            self.iface.actionToggleEditing().trigger()
            layer = self.iface.activeLayer()
            prov = layer.dataProvider()

            idx = prov.fieldNameIndex('gid')

            gid = layer.maximumValue(idx)
            it = layer.getFeatures(QgsFeatureRequest().setFilterExpression(u'"gid" = {0}'.format(gid)))

            for feature in it:
                f = feature.id()
                layer.select(f)

            f = layer.selectedFeatures()[0]

            #change to brs_jobs form
            form_config = self.iface.activeLayer().editFormConfig()
            form_config.setUiForm('z:/0 - settings/gis/qgis/plugins/brsgis_plugin/ui/brs_p.ui')
            form_config.setInitFilePath('z:/0 - settings/gis/qgis/plugins/brsgis_plugin/brs_p_init.py')
            self.iface.activeLayer().setEditFormConfig(form_config)

            QGuiApplication.setOverrideCursor(Qt.ArrowCursor)
            self.iface.openFeatureForm(self.iface.activeLayer(), f, False, True)
            QGuiApplication.restoreOverrideCursor()

            QgsMessageLog.logMessage('AE Saving changes...', 'BRS_GIS', level=Qgis.Info)

        except Exception as e:
            exc_type, exc_obj, exc_tb = sys.exc_info()
            fname = os.path.split(exc_tb.tb_frame.f_code.co_filename)[1]
            QMessageBox.critical(self.iface.mainWindow(), "EXCEPTION IN ACTIVE EDIT",
                                 "Details: " + str(exc_type) + ' ' + str(fname) + ' ' + str(
                                     exc_tb.tb_lineno) + ' ' + str(e))
            return

        self.vl = QgsProject.instance().mapLayersByName('brs_p')[0]
        self.iface.setActiveLayer(self.vl)
        self.iface.activeLayer().commitChanges()

class brsgis_editP(object):

    newJob = 0
    selComp = 0
    multiFeat = 0
    count = 0

    def __init__(self, iface):
        # save reference to the QGIS interface
        self.iface = iface

    def initGui(self):

        self.action = QAction("Edit P-Plan", self.iface.mainWindow())
        self.action.triggered.connect(self.run)
        self.action.trigger()
        self.iface.mapCanvas().selectionChanged.connect(self.select_changed)

    def run(self):
        self.vl = QgsProject.instance().mapLayersByName('brs_p')[0]
        self.iface.setActiveLayer(self.vl)

        reply = QMessageBox.question(self.iface.mainWindow(), 'Edit P-Plan',
                                     'Click OK and select the correct parcel for the plan you wish to edit.',
                                     QMessageBox.Ok, QMessageBox.Cancel)
        if reply == QMessageBox.Ok:
            if self.selComp == 1:
                return
            else:
                self.newJob = 1
                if self.count == 0:
                    for a in self.iface.attributesToolBar().actions():
                        if a.objectName() == 'mActionDeselectAll':
                            a.trigger()
                            QgsMessageLog.logMessage('FIRST RUN: Previously selected parcel(s) have been cleared.',
                                                     'BRS_GIS', level=Qgis.Info)
                            QgsMessageLog.logMessage('P-Plan editing starting...', 'BRS_GIS', level=Qgis.Info)
                            self.iface.actionSelect().trigger()
                            self.count = self.count + 1
                else:
                    self.iface.actionSelect().trigger()
        else:
            QgsMessageLog.logMessage('DEBUG: Job editing cancelled.', 'BRS_GIS', level=Qgis.Info)
            self.iface.mapCanvas().selectionChanged.disconnect(self.select_changed)

    def select_changed(self):

        try:
            parcel = self.iface.activeLayer().selectedFeatures()[0]
            planNo = parcel["p_no"]
            msg = QMessageBox()
            msg.setWindowTitle('Edit P-Plan')
            msg.setText('P-PlanNo: ' + planNo + ' has been selected. Continue?')
            edit = msg.addButton('Edit P-Plan', QMessageBox.AcceptRole)
            cancel = msg.addButton('Cancel', QMessageBox.RejectRole)
            msg.setDefaultButton(edit)
            QGuiApplication.setOverrideCursor(Qt.ArrowCursor)
            msg.exec_()
            msg.deleteLater()
            QGuiApplication.restoreOverrideCursor()
            if msg.clickedButton() is edit:
                if self.multiFeat == 0:
                    QgsMessageLog.logMessage('P-Plan editing will begin for: ' + planNo,
                                             'BRS_GIS', level=Qgis.Info)
                    QgsMessageLog.logMessage('Launching form...', 'BRS_GIS', level=Qgis.Info)
                    self.iface.actionToggleEditing().trigger()
                    self.active_edit()
                    QgsMessageLog.logMessage('P-PlanNo:' + str(planNo) + ' has been modified and saved.',
                                             'BRS_GIS', level=Qgis.Info)

                    lyr = QgsProject.instance().mapLayersByName('brs_p')[0]
                    self.iface.setActiveLayer(lyr)
                    self.iface.mapCanvas().selectionChanged.disconnect(self.select_changed)
                    self.iface.actionIdentify().trigger()

                elif msg.clickedButton() is cancel:
                    self.iface.mapCanvas().selectionChanged.disconnect(self.select_changed)
                    QgsMessageLog.logMessage('DEBUG: Plan editing cancelled.', 'BRS_GIS', level=Qgis.Info)
                    QGuiApplication.restoreOverrideCursor()
                    return
                else:
                    self.iface.mapCanvas().selectionChanged.disconnect(self.select_changed)
                    QgsMessageLog.logMessage('DEBUG: Plan editing cancelled.', 'BRS_GIS', level=Qgis.Info)
                    QGuiApplication.restoreOverrideCursor()
            else:
                self.iface.mapCanvas().selectionChanged.disconnect(self.select_changed)
                QGuiApplication.restoreOverrideCursor()
                return

        except Exception as e:
            exc_type, exc_obj, exc_tb = sys.exc_info()
            fname = os.path.split(exc_tb.tb_frame.f_code.co_filename)[1]
            QMessageBox.critical(self.iface.mainWindow(), "EXCEPTION",
                                 "Details: " + str(exc_type) + ' ' + str(fname) + ' ' + str(
                                     exc_tb.tb_lineno) + ' ' + str(e))
            QGuiApplication.restoreOverrideCursor()
            return


    def active_edit(self):

        try:
            self.vl = QgsProject.instance().mapLayersByName('brs_p')[0]
            self.iface.setActiveLayer(self.vl)
            f = self.vl.selectedFeatures()[0]
            #change to la_plans form
            form_config = self.iface.activeLayer().editFormConfig()
            form_config.setUiForm('z:/0 - settings/gis/qgis/plugins/brsgis_plugin/ui/brs_p.ui')
            form_config.setInitFilePath('z:/0 - settings/gis/qgis/plugins/brsgis_plugin/brs_p_init.py')
            self.iface.activeLayer().setEditFormConfig(form_config)
            QGuiApplication.setOverrideCursor(Qt.ArrowCursor)
            self.iface.openFeatureForm(self.iface.activeLayer(), f, False, True)
            QGuiApplication.restoreOverrideCursor()
            QgsMessageLog.logMessage('Saving changes...', 'BRS_GIS', level=Qgis.Info)
        except Exception as e:
            exc_type, exc_obj, exc_tb = sys.exc_info()
            fname = os.path.split(exc_tb.tb_frame.f_code.co_filename)[1]
            QMessageBox.critical(self.iface.mainWindow(), "EXCEPTION",
                                 "Details: " + str(exc_type) + ' ' + str(fname) + ' ' + str(
                                     exc_tb.tb_lineno) + ' ' + str(e))
            QGuiApplication.restoreOverrideCursor()

            return

        self.vl = QgsProject.instance().mapLayersByName('brs_p')[0]
        self.iface.setActiveLayer(self.vl)
        self.iface.activeLayer().commitChanges()

class brsgis_mergeFeatures(object):

    import csv

    def __init__(self, iface):
        # save reference to the QGIS interface
        self.iface = iface

    def initGui(self):

        self.action = QAction("&MergeFeatures", self.iface.mainWindow())
        self.action.triggered.connect(self.run)
        self.action.trigger()

    def run(self):
        self.vl = QgsProject.instance().mapLayersByName('parcels')[0]
        self.iface.setActiveLayer(self.vl)
        cLayer = self.iface.mapCanvas().currentLayer()

        import openpyxl
        path = "C:\\BRS_GIS\\sptWIP.xlsx"
        wb_obj = openpyxl.load_workbook(path)
        sheet_obj = wb_obj.active
        #cell_obj = sheet_obj.cell(row=1, column=1)

        max_col = sheet_obj.max_column
        max_row = sheet_obj.max_row
        planData = []
        allPlans = []
        error_count = 0

        for j in range(2, max_row + 1):

            for i in range(1, max_col + 1):

                cell_obj = sheet_obj.cell(row=j, column=i)
                #QgsMessageLog.logMessage(str(j) + ' ' + str(i), 'BRS_GIS', level=Qgis.Info)
                planData.append(str(cell_obj.value))
                #QgsMessageLog.logMessage(str(planData), 'BRS_GIS', level=Qgis.Info)
            allPlans.append(planData)
            planData = []

        #QgsMessageLog.logMessage(str(allPlans), 'BRS_GIS', level=Qgis.Info)


        # town = 'Alna' #R-6-10,R-6-10-A
        # town = 'Arrowsic'
        # town = 'Boothbay' #R04-173-B4
        # town = 'Bowdoin'
        # town = 'Boothbay Harbor' #000-000-A-000
        # town = 'Bath' #27-175-000,27-176-000,27-178-000
        # town = 'Bremen'
        # town = 'Brunswick'
        # town = 'Bristol'
        # town = 'Chelsea'
        # town = 'Cumberland'
        # town = 'Cutler'
        # town = 'Damariscotta'
        # town = 'Deer Isle'
        # town = 'Dresden'
        # town = 'Edgecomb' #R07-015-03
        # town = 'Freeport'
        # town = 'Gardiner'
        # town = 'Friendship' #006-001-00A
        # town = 'Georgetown' #12U-012,12U-018,12U-020
        # town = 'Harpswell' #'020042,020020
        # town = 'Jefferson'
        # town = 'Monmouth' #3013000000
        # town = 'Newcastle' #005-067,005-067-00A
        # town = 'Nobleboro' #4-45
        # town = 'Old Orchard Beach' #301-5-2
        # town = 'Owls Head'
        # town = 'Palermo'
        # town = 'Phippsburg' #041-071-02,041-053
        # town = 'West Bath'
        # town = 'South Bristol' #13 11,13 11A,13 15
        # town = 'Southport' #xx-x-x
        # town = 'Saint George'
        # town = 'Stonington'
        # town = 'Thomaston' #102-175
        # town = 'Topsham'
        # town = 'Waldoboro'
        # town = 'Wales' #R01-027
        # town = 'Warren'
        # town = 'West Bath'
        # town = 'Whitefield'
        town = 'Wiscasset' #R05-074
        # town = 'Woolwich' #R07-003-A,R07-004
        # town = 'Westport Island' #005-18

        expr1 = QgsExpression(" \"town\" = '{}' ".format(town))
        it = cLayer.getFeatures(QgsFeatureRequest(expr1))
        ids = [i.id() for i in it]

        for plan in allPlans:

            #QgsMessageLog.logMessage(str(plan), 'BRS_GIS', level=Qgis.Info)
            idValue = plan[0]
            size_num = plan[1]
            file_num = plan[2]
            plan_no = plan[3]
            name = plan[4]
            address = plan[5]
            townLA = plan[6]
            job = plan[7]
            date = plan[8]
            initials = plan[9]
            map = plan[10]
            lot = plan[11]
            map_bk_lot = plan[12]
            surveyor = plan[13]
            notes = plan[14]
            cd_no = plan[15]
            latitude = plan[16]
            longitude = plan[17]

            maps = map_bk_lot.split(",")

            #QgsMessageLog.logMessage(str(ids), 'BRS_GIS', level=Qgis.Info)

            for x in range(0, len(maps)):
                #QgsMessageLog.logMessage('map' + ' ' + str(x) + ': ' + maps[x], 'BRS_GIS', level=Qgis.Info)

                expr2 = QgsExpression(" \"map_bk_lot\" = '{}' ".format(maps[x]))

                try:
                    it2 = cLayer.getFeatures(QgsFeatureRequest(expr2))
                    newIds = [i2.id() for i2 in it2]
                    QgsMessageLog.logMessage(str(newIds), 'BRS_GIS', level=Qgis.Info)
                    idsToSel = list(set(ids).intersection(newIds))
                    cLayer.selectByIds(idsToSel, 1)
                    features = cLayer.selectedFeatures()
                    #QgsMessageLog.logMessage('map' + ' ' + str(x) + ': ' + maps[x] + ' id: ' + str(idsToSel) + str(features), 'BRS_GIS', level=Qgis.Info)

                    geom = None
                    for feat in features:
                        if geom == None:
                            geom = feat.geometry()
                            #QgsMessageLog.logMessage('feat: ' + str(feat.id()), 'BRS_GIS',level=Qgis.Info)

                        else:
                            geom = geom.combine(feat.geometry())
                            #sQgsMessageLog.logMessage('feat: ' + str(feat.id()), 'BRS_GIS', level=Qgis.Info)


                except Exception as e:
                    exc_type, exc_obj, exc_tb = sys.exc_info()
                    fname = os.path.split(exc_tb.tb_frame.f_code.co_filename)[1]
                    QMessageBox.critical(self.iface.mainWindow(), "EXCEPTION",
                                     "Details: " + str(exc_type) + ' ' + str(fname) + ' ' + str(
                                         exc_tb.tb_lineno) + ' ' + str(e))
                    QGuiApplication.restoreOverrideCursor()
                    return

            cLayer.selectByIds([])

            self.vl = QgsProject.instance().mapLayersByName('la_plans')[0]
            self.iface.setActiveLayer(self.vl)
            self.iface.actionToggleEditing().trigger()
            feature = QgsFeature()
            #QgsMessageLog.logMessage('NEW: ' + str(feature.id()), 'BRS_GIS', level=Qgis.Info)

            try:

                feature.setGeometry(geom)

                dataProvider = self.vl.dataProvider()

                layer = QgsProject.instance().mapLayersByName('la_plans')[0]
                dataProvider.addFeature(feature)

                self.iface.activeLayer().commitChanges()
                self.vl.dataProvider().forceReload()
                self.iface.mapCanvas().refresh()

                f2 = layer.getFeatures()
                fCount = layer.featureCount()

                fIds = []
                fIds = [f.id() for f in f2]
                fIds.sort()

                #QgsMessageLog.logMessage('count: ' + str(fCount), 'BRS_GIS', level=Qgis.Info)
                fId = [fIds[-1]]
                #QgsMessageLog.logMessage('fId: ' + str(fId) + ' | ' + str(id), 'BRS_GIS', level=Qgis.Info)
                self.vl.selectByIds(fId)

                newF = self.vl.selectedFeatures()[0]
                self.iface.actionToggleEditing().trigger()

                idx = dataProvider.fieldNameIndex('idValue')
                #QgsMessageLog.logMessage('idx: ' + str(idx), 'BRS_GIS', level=Qgis.Info)
                self.vl.changeAttributeValue(newF.id(), idx, int(idValue))
                #QgsMessageLog.logMessage('newF.id: ' + str(newF.id()) + ' | ' + str(id), 'BRS_GIS', level=Qgis.Info)

                idx = dataProvider.fieldNameIndex('size_no')
                #QgsMessageLog.logMessage('idx: ' + str(idx), 'BRS_GIS', level=Qgis.Info)
                self.vl.changeAttributeValue(newF.id(), idx, size_num)

                #QgsMessageLog.logMessage(str(newF.id()) + ' | updating...', 'BRS_GIS', level=Qgis.Info)

                idx = dataProvider.fieldNameIndex('file_no')
                self.vl.changeAttributeValue(newF.id(), idx, file_num)
                idx = dataProvider.fieldNameIndex('plan_no')
                self.vl.changeAttributeValue(newF.id(), idx, plan_no)
                idx = dataProvider.fieldNameIndex('name')
                self.vl.changeAttributeValue(newF.id(), idx, name)
                idx = dataProvider.fieldNameIndex('address')
                self.vl.changeAttributeValue(newF.id(), idx, address)
                idx = dataProvider.fieldNameIndex('town')
                self.vl.changeAttributeValue(newF.id(), idx, townLA)
                idx = dataProvider.fieldNameIndex('town_parcels')
                self.vl.changeAttributeValue(newF.id(), idx, town)
                idx = dataProvider.fieldNameIndex('job')
                self.vl.changeAttributeValue(newF.id(), idx, job)
                idx = dataProvider.fieldNameIndex('date')
                self.vl.changeAttributeValue(newF.id(), idx, date)
                idx = dataProvider.fieldNameIndex('initials')
                self.vl.changeAttributeValue(newF.id(), idx, initials)
                idx = dataProvider.fieldNameIndex('map')
                self.vl.changeAttributeValue(newF.id(), idx, map)
                idx = dataProvider.fieldNameIndex('lot')
                self.vl.changeAttributeValue(newF.id(), idx, lot)
                idx = dataProvider.fieldNameIndex('map_bk_lot')
                self.vl.changeAttributeValue(newF.id(), idx, map_bk_lot)
                idx = dataProvider.fieldNameIndex('surveyor')
                self.vl.changeAttributeValue(newF.id(), idx, surveyor)
                idx = dataProvider.fieldNameIndex('notes')
                self.vl.changeAttributeValue(newF.id(), idx, notes)
                idx = dataProvider.fieldNameIndex('cd_no')
                self.vl.changeAttributeValue(newF.id(), idx, cd_no)
                idx = dataProvider.fieldNameIndex('latitude')
                self.vl.changeAttributeValue(newF.id(), idx, latitude)
                idx = dataProvider.fieldNameIndex('longitude')
                self.vl.changeAttributeValue(newF.id(), idx, longitude)

                self.vl.updateFields()
                self.iface.activeLayer().commitChanges()
                geom = None

            except Exception as e:
                error_count = error_count + 1
                exc_type, exc_obj, exc_tb = sys.exc_info()
                fname = os.path.split(exc_tb.tb_frame.f_code.co_filename)[1]
                QMessageBox.critical(self.iface.mainWindow(), "EXCEPTION",
                                     "Details: " + str(exc_type) + ' ' + str(fname) + ' ' + str(
                                         exc_tb.tb_lineno) + ' ' + str(e))
                QgsMessageLog.logMessage('ERROR: | ' + str(plan_no) + ' with ' + str(maps[x]), 'BRS_GIS', level=Qgis.Info)
                self.iface.actionToggleEditing().trigger()
                QGuiApplication.restoreOverrideCursor()

                #return
        self.vl.selectByIds([])

        QgsMessageLog.logMessage('DONE.', 'BRS_GIS', level=Qgis.Info)

class brsgis_datafix(object):

    import csv

    def __init__(self, iface):
        # save reference to the QGIS interface
        self.iface = iface

    def initGui(self):

        self.action = QAction("&FixData", self.iface.mainWindow())
        self.action.triggered.connect(self.run)
        self.action.trigger()

    def run(self):

        import openpyxl
        path = "C:\\BRS_GIS\\dataFIX.xlsx"
        wb_obj = openpyxl.load_workbook(path)
        sheet_obj = wb_obj.active
        #cell_obj = sheet_obj.cell(row=1, column=1)

        max_col = sheet_obj.max_column
        max_row = sheet_obj.max_row
        lotData = []
        allLots = []

        for j in range(2, max_row + 1):

            for i in range(1, max_col + 1):

                cell_obj = sheet_obj.cell(row=j, column=i)
                #QgsMessageLog.logMessage(str(j) + ' ' + str(i), 'BRS_GIS', level=Qgis.Info)
                lotData.append(str(cell_obj.value))
                #QgsMessageLog.logMessage(str(planData), 'BRS_GIS', level=Qgis.Info)
                allLots.append(lotData)

        QgsMessageLog.logMessage('ALL LOTS: ' + str(allLots), 'BRS_GIS', level=Qgis.Info)

        for lot in allLots:

            ll = str(lot).split(',')
            l = len(lot)

            QgsMessageLog.logMessage('LOT: ' + str(ll), 'BRS_GIS', level=Qgis.Info)
            QgsMessageLog.logMessage('LOTLENGTH: ' + str(len(ll)), 'BRS_GIS', level=Qgis.Info)

            if l == 1:
                QgsMessageLog.logMessage('ONE.length: ' + str(l), 'BRS_GIS', level=Qgis.Info)
                lots = str(lot[0])
                QgsMessageLog.logMessage('element: ' + str(lots), 'BRS_GIS', level=Qgis.Info)
                finalLot = str(lots)
            else:
                QgsMessageLog.logMessage('MANY.length: ' + str(l), 'BRS_GIS', level=Qgis.Info)
                lots = lotData.append(lot[l-1])
                QgsMessageLog.logMessage('element: ' + str(lots), 'BRS_GIS', level=Qgis.Info)
                finalLot = str(lots)

            if len(finalLot) == 1:

                QgsMessageLog.logMessage('final lot: ' + finalLot, 'BRS_GIS', level=Qgis.Info)

            else:

                for x in range(0, len(finalLot)):

                    #QgsMessageLog.logMessage('element is: ' + str(lots[x]), 'BRS_GIS', level=Qgis.Info)

                    try:

                        QgsMessageLog.logMessage('final lot: ' + finalLot, 'BRS_GIS', level=Qgis.Info)
                        # QgsMessageLog.logMessage('map' + ' ' + str(x) + ': ' + maps[x] + ' id: ' + str(idsToSel) + str(features), 'BRS_GIS', level=Qgis.Info)
                        lotData.append(x)


                    except Exception as e:
                        exc_type, exc_obj, exc_tb = sys.exc_info()
                        fname = os.path.split(exc_tb.tb_frame.f_code.co_filename)[1]
                        # QMessageBox.critical(self.iface.mainWindow(), "EXCEPTION",
                        #                  "Details: " + str(exc_type) + ' ' + str(fname) + ' ' + str(
                        #                      exc_tb.tb_lineno) + ' ' + str(e))
                        QGuiApplication.restoreOverrideCursor()
                        return

            QgsMessageLog.logMessage('lot is: ' + str(lots), 'BRS_GIS', level=Qgis.Info)

        QgsMessageLog.logMessage(str(error_count) + ' plans NOT added.', 'BRS_GIS', level=Qgis.Info)
        QgsMessageLog.logMessage('DONE.', 'BRS_GIS', level=Qgis.Info)

def brsgis_read_csv_header(qgis, filename):
    try:
        infile = open(filename, 'r')
    except Exception as e:
        QMessageBox.information(qgis.mainWindow(),
                                "Input CSV File", "Failure opening " + filename + ": " + str(e))
        return None

    try:
        dialect = csv.Sniffer().sniff(infile.read(4096))
    except:
        QMessageBox.information(qgis.mainWindow(), "Input CSV File",
                                "Bad CSV file - verify that your delimiters are consistent");
        return None

    infile.seek(0)
    reader = csv.reader(infile, dialect)

    # Decode from UTF-8 characters because csv.reader can only handle 8-bit characters
    try:
        header = next(reader)
        header = [str(field, "utf-8") for field in header]
    except:
        QMessageBox.information(qgis.mainWindow(), "Input CSV File",
                                "Invalid character in file - verify your file uses UTF-8 character encoding");
        return None

    del reader
    del infile

    if len(header) <= 0:
        QMessageBox.information(qgis.mainWindow(), "Input CSV File",
                                filename + " does not appear to be a CSV file")
        return None

    return header

