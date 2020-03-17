# -------------------------------------------------------------
#    brsgis_menu - QGIS plugins menu class
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
from builtins import object

from PyQt5.QtCore import *
from PyQt5.QtWidgets import *
from .brsgis_dialogs import *

# ---------------------------------------------

class brsgis_menu(object):
    def __init__(self, iface):
        self.iface = iface
        self.brsgis_menu = None

    def brsgis_add_submenu(self, submenu):
        if self.brsgis_menu != None:
            self.brsgis_menu.addMenu(submenu)
        else:
            self.iface.addPluginToMenu("&brsgis", submenu.menuAction())

    def initGui(self):

        icon = QIcon(os.path.dirname(__file__) + "/icons/create.svg")
        self.prep_action = QAction(icon, "&Set formConfig", self.iface.mainWindow())
        self.prep_action.triggered.connect(self.setFormsConfig)
        # self.newJob_action.triggered.connect(self.newJob)
        self.prep_action.trigger()
        # self.iface.removeToolBarIcon(self.action)

        self.brsgis_menu = QMenu(QCoreApplication.translate("brsgis", "&BRS GIS"))
        self.iface.mainWindow().menuBar().insertMenu(self.iface.firstRightStandardMenu().menuAction(), self.brsgis_menu)

        icon = QIcon(os.path.dirname(__file__) + "/icons/create.svg")
        self.new_menu = QMenu(QCoreApplication.translate("brsgis", "&New"))
        self.new_menu.setIcon(icon)
        self.brsgis_add_submenu(self.new_menu)

        icon = QIcon(os.path.dirname(__file__) + "/icons/create.svg")
        self.newJob_action = QAction(icon, "&Create New Job", self.iface.mainWindow())
        self.newJob_action.triggered.connect(self.newJob)
        self.new_menu.addAction(self.newJob_action)

        icon = QIcon(os.path.dirname(__file__) + "/icons/create.svg")
        self.newLPJob_action = QAction(icon, "&Create New Line/Point Job", self.iface.mainWindow())
        self.newLPJob_action.triggered.connect(self.newLPJob)
        self.new_menu.addAction(self.newLPJob_action)

        # Output / PrintOuts Submenu
        icon = QIcon(os.path.dirname(__file__) + "/icons/print.svg")
        self.output_entry_menu = QMenu(QCoreApplication.translate("&New", "&Outputs / PrintOuts"))
        self.output_entry_menu.setIcon(icon)
        self.new_menu.addMenu(self.output_entry_menu)

        icon = QIcon(os.path.dirname(__file__) + "/icons/face.svg")
        self.printFolderLabel_action = QAction(icon, "Print &Folder Face Label", self.iface.mainWindow())
        self.printFolderLabel_action.triggered.connect(self.printFolderLabel)
        self.output_entry_menu.addAction(self.printFolderLabel_action)

        icon = QIcon(os.path.dirname(__file__) + "/icons/yellow.svg")
        self.printYellowSheet_action = QAction(icon, "Print &YellowSheet", self.iface.mainWindow())
        self.printYellowSheet_action.triggered.connect(self.printYellowSheet)
        self.output_entry_menu.addAction(self.printYellowSheet_action)

        icon = QIcon(os.path.dirname(__file__) + "/icons/label.svg")
        self.printFolderLabel2_action = QAction(icon, "Print Folder &Label", self.iface.mainWindow())
        self.printFolderLabel2_action.triggered.connect(self.printFolderLabel2)
        self.output_entry_menu.addAction(self.printFolderLabel2_action)

        icon = QIcon(os.path.dirname(__file__) + "/icons/maptable.svg")
        self.printMapTable_action = QAction(icon, "Print &MapTable", self.iface.mainWindow())
        self.printMapTable_action.triggered.connect(self.printMapTable)
        self.output_entry_menu.addAction(self.printMapTable_action)

        icon = QIcon(os.path.dirname(__file__) + "/icons/user.svg")
        self.printContacts_action = QAction(icon, "Print &Contacts", self.iface.mainWindow())
        self.printContacts_action.triggered.connect(self.printContacts)
        self.output_entry_menu.addAction(self.printContacts_action)

        icon = QIcon(os.path.dirname(__file__) + "/icons/mv.svg")
        self.printMapView_action = QAction(icon, "Print &MapView", self.iface.mainWindow())
        self.printMapView_action.triggered.connect(self.printMapView)
        self.output_entry_menu.addAction(self.printMapView_action)

        icon = QIcon(os.path.dirname(__file__) + "/icons/mv.svg")
        self.printSiteMap_action = QAction(icon, "Print &SiteMap", self.iface.mainWindow())
        self.printSiteMap_action.triggered.connect(self.printSiteMap)
        self.output_entry_menu.addAction(self.printSiteMap_action)

        icon = QIcon(os.path.dirname(__file__) + "/icons/create.svg")
        self.newPlan_action = QAction(icon, "C&reate New Plan", self.iface.mainWindow())
        self.newPlan_action.triggered.connect(self.newPlan)
        # self.newJob_action.triggered.connect(self.newJob)
        self.new_menu.addAction(self.newPlan_action)

        icon = QIcon(os.path.dirname(__file__) + "/icons/edit.svg")
        self.edit_menu = QMenu(QCoreApplication.translate("brsgis", "&Edit"))
        self.edit_menu.setIcon(icon)
        self.brsgis_add_submenu(self.edit_menu)

        icon = QIcon(os.path.dirname(__file__) + "/icons/edit.svg")
        self.editJob_action = QAction(icon, "&Edit Existing Job", self.iface.mainWindow())
        self.editJob_action.triggered.connect(self.editJob)
        self.edit_menu.addAction(self.editJob_action)

        icon = QIcon(os.path.dirname(__file__) + "/icons/search.svg")
        self.search_menu = QMenu(QCoreApplication.translate("brsgis", "&Search"))
        self.search_menu.setIcon(icon)
        self.brsgis_add_submenu(self.search_menu)

        icon = QIcon(os.path.dirname(__file__) + "/icons/edit.svg")
        self.editPlan_action = QAction(icon, "&Edit Existing Plan", self.iface.mainWindow())
        self.editPlan_action.triggered.connect(self.editPlan)
        self.edit_menu.addAction(self.editPlan_action)

        # search menu
        icon = QIcon(os.path.dirname(__file__) + "/icons/search.svg")
        self.search_action = QAction(icon, "&Search by Value", self.iface.mainWindow())
        self.search_action.triggered.connect(self.search)
        self.search_menu.addAction(self.search_action)

        # Utilities Submenu
        icon = QIcon(os.path.dirname(__file__) + "/icons/util.svg")
        self.util_menu = QMenu(QCoreApplication.translate("brsgis", "&Utilities"))
        self.util_menu.setIcon(icon)
        self.brsgis_add_submenu(self.util_menu)

        icon = QIcon(os.path.dirname(__file__) + "/icons/freehand.svg")
        self.export_action = QAction(icon, "&Freehand Select/map_bk_lots to Clipboard", self.iface.mainWindow())
        self.export_action.triggered.connect(self.bulkExport)
        self.util_menu.addAction(self.export_action)

        icon = QIcon(os.path.dirname(__file__) + "/icons/util.svg")
        self.merge_action = QAction(icon, "&PLAN import from EXCEL", self.iface.mainWindow())
        self.merge_action.triggered.connect(self.planImportXLSX)
        self.util_menu.addAction(self.merge_action)

        icon = QIcon(os.path.dirname(__file__) + "/icons/util.svg")
        self.jobImport_action = QAction(icon, "&JOB import from EXCEL", self.iface.mainWindow())
        self.jobImport_action.triggered.connect(self.jobImportXLSX)
        self.util_menu.addAction(self.jobImport_action)

        icon = QIcon(os.path.dirname(__file__) + "/icons/freehand.svg")
        self.addNewParcel_action = QAction(icon, "&Add NEW parcel", self.iface.mainWindow())
        self.addNewParcel_action.triggered.connect(self.addNewParcel)
        self.util_menu.addAction(self.addNewParcel_action)

        icon = QIcon(os.path.dirname(__file__) + "/icons/util.svg")
        self.moveJob_action = QAction(icon, "&MOVE Job", self.iface.mainWindow())
        self.moveJob_action.triggered.connect(self.moveJob)
        self.util_menu.addAction(self.moveJob_action)

        icon = QIcon(os.path.dirname(__file__) + "/icons/util.svg")
        self.movePlan_action = QAction(icon, "M&OVE Plan", self.iface.mainWindow())
        self.movePlan_action.triggered.connect(self.movePlan)
        self.util_menu.addAction(self.movePlan_action)

        #
        # icon = QIcon(os.path.dirname(__file__) + "/icons/util.svg")
        # self.fix_action = QAction(icon, "&DATA.FIX", self.iface.mainWindow())
        # self.fix_action.triggered.connect(self.dataFix)
        # self.util_menu.addAction(self.fix_action)
        #
        icon = QIcon(os.path.dirname(__file__) + "/icons/buffers.svg")
        self.abutters_action = QAction(icon, "&Generate Buffer/Abutters", self.iface.mainWindow())
        self.abutters_action.triggered.connect(self.abutters)
        self.util_menu.addAction(self.abutters_action)

    def setFormsConfig(self):
        # Must be saved in self, otherwise garbage collector destroys dialog
        # QgsMessageLog.logMessage('Resetting form config...', 'BRS_GIS', level=Qgis.Info)
        self.prep_dialog = brsgis_prep(self.iface)
        self.prep_dialog.initGui()

    def unload(self):
        if self.brsgis_menu != None:
            self.iface.mainWindow().menuBar().removeAction(self.brsgis_menu.menuAction())
        else:
            self.iface.removePluginMenu("&brsgis", self.animate_menu.menuAction())

    def bulkExport(self):
        # Must be saved in self, otherwise garbage collector destroys dialog
        QgsMessageLog.logMessage('Launching Export...', 'BRS_GIS', level=Qgis.Info)
        self.export_dialog = brsgis_bulkMapExport(self.iface)
        self.export_dialog.initGui()

    def planImportXLSX(self):
        # Must be saved in self, otherwise garbage collector destroys dialog
        QgsMessageLog.logMessage('Launching PLAN import from EXCEL...', 'BRS_GIS', level=Qgis.Info)
        self.merge_dialog = brsgis_planImportXLSX(self.iface)
        self.merge_dialog.initGui()

    def jobImportXLSX(self):
        # Must be saved in self, otherwise garbage collector destroys dialog
        QgsMessageLog.logMessage('Launching JOB import from EXCEL...', 'BRS_GIS', level=Qgis.Info)
        self.jobImport_dialog = brsgis_jobImportXLSX(self.iface)
        self.jobImport_dialog.initGui()

    def moveJob(self):
        # Must be saved in self, otherwise garbage collector destroys dialog
        QgsMessageLog.logMessage('Launching moveJob utility...', 'BRS_GIS', level=Qgis.Info)
        self.moveJob_dialog = brsgis_moveJob(self.iface)
        self.moveJob_dialog.initGui()

    def movePlan(self):
        # Must be saved in self, otherwise garbage collector destroys dialog
        QgsMessageLog.logMessage('Launching movePlan utility...', 'BRS_GIS', level=Qgis.Info)
        self.movePlan_dialog = brsgis_movePlan(self.iface)
        self.movePlan_dialog.initGui()

    def dataFix(self):
        # Must be saved in self, otherwise garbage collector destroys dialog
        QgsMessageLog.logMessage('Launching Fix...', 'BRS_GIS', level=Qgis.Info)
        self.fix_dialog = brsgis_datafix(self.iface)
        self.fix_dialog.initGui()

    def newJob(self):
        # Must be saved in self, otherwise garbage collector destroys dialog
        # QgsMessageLog.logMessage('Launching new job...', 'BRS_GIS', level=Qgis.Info)
        self.newJob_dialog = brsgis_newJob_ORIGINAL(self.iface)
        self.newJob_dialog.initGui()

    def newLPJob(self):
        # Must be saved in self, otherwise garbage collector destroys dialog
        QgsMessageLog.logMessage('Launching new LP job...', 'BRS_GIS', level=Qgis.Info)
        self.newLPJob_dialog = brsgis_newLPJob(self.iface)
        self.newLPJob_dialog.initGui()

    def newPlan(self):
        # Must be saved in self, otherwise garbage collector destroys dialog
        QgsMessageLog.logMessage('Launching new plan...', 'BRS_GIS', level=Qgis.Info)
        self.newPlan_dialog = brsgis_newPlan(self.iface)
        self.newPlan_dialog.initGui()

    def editJob(self):
        # Must be saved in self, otherwise garbage collector destroys dialog
        QgsMessageLog.logMessage('Editing Existing job...', 'BRS_GIS', level=Qgis.Info)
        self.editJob_dialog = brsgis_editJob(self.iface)
        self.editJob_dialog.initGui()

    def editPlan(self):
        # Must be saved in self, otherwise garbage collector destroys dialog
        QgsMessageLog.logMessage('Editing Existing Plan...', 'BRS_GIS', level=Qgis.Info)
        self.editPlan_dialog = brsgis_editPlan(self.iface)
        self.editPlan_dialog.initGui()

    def search(self):
        # Must be saved in self, otherwise garbage collector destroys dialog
        QgsMessageLog.logMessage('Launching search...', 'BRS_GIS', level=Qgis.Info)
        self.search_dialog = brsgis_search(self.iface)
        self.search_dialog.run()

    def printFolderLabel(self):
        # Must be saved in self, otherwise garbage collector destroys dialog
        QgsMessageLog.logMessage('Generating Folder Face Label...', 'BRS_GIS', level=Qgis.Info)
        self.printFolderLabel_dialog = brsgis_printFolderLabel(self.iface)
        self.printFolderLabel_dialog.initGui()

    def printYellowSheet(self):
        # Must be saved in self, otherwise garbage collector destroys dialog
        QgsMessageLog.logMessage('Generating YellowSheet...', 'BRS_GIS', level=Qgis.Info)
        self.printYellowSheet_dialog = brsgis_printYellowSheet(self.iface)
        self.printYellowSheet_dialog.initGui()

    def printFolderLabel2(self):
        # Must be saved in self, otherwise garbage collector destroys dialog
        QgsMessageLog.logMessage('Generating Folder Label...', 'BRS_GIS', level=Qgis.Info)
        self.label_dialog = brsgis_label_dialog(self.iface)
        #self.label_dialog.setWindowModality(NonModal)
        self.label_dialog.show()

    def abutters(self):
        # Must be saved in self, otherwise garbage collector destroys dialog
        QgsMessageLog.logMessage('Launching Abutters...', 'BRS_GIS', level=Qgis.Info)
        self.abutters_dialog = brsgis_abutters(self.iface)
        self.abutters_dialog.run()

    def printMapTable(self):
        # Must be saved in self, otherwise garbage collector destroys dialog
        QgsMessageLog.logMessage('Generating Map Table...', 'BRS_GIS', level=Qgis.Info)
        self.mt_dialog = brsgis_printMapTable(self.iface)
        self.mt_dialog.initGui()

    def printMapView(self):
        # Must be saved in self, otherwise garbage collector destroys dialog
        QgsMessageLog.logMessage('Generating Map View...', 'BRS_GIS', level=Qgis.Info)
        self.mv_dialog = brsgis_printMapView(self.iface)
        self.mv_dialog.initGui()

    def printContacts(self):
        # Must be saved in self, otherwise garbage collector destroys dialog
        QgsMessageLog.logMessage('Generating Contacts...', 'BRS_GIS', level=Qgis.Info)
        self.c_dialog = brsgis_printContacts(self.iface)
        self.c_dialog.initGui()

    def printSiteMap(self):
        # Must be saved in self, otherwise garbage collector destroys dialog
        QgsMessageLog.logMessage('Generating Site Map...', 'BRS_GIS', level=Qgis.Info)
        self.mv_dialog = brsgis_printSiteMap(self.iface)
        self.mv_dialog.initGui()

    def addNewParcel(self):
        QgsMessageLog.logMessage('Adding NEW parcel...', 'BRS_GIS', level=Qgis.Info)
        self.parcel_dialog = brsgis_parcel(self.iface)
        self.parcel_dialog.initGui()