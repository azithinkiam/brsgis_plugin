# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'brsgis_cadOutputs_form.ui'
#
# Created by: PyQt5 UI code generator 5.9
#
# WARNING! All changes made in this file will be lost!

from PyQt5 import QtCore, QtGui, QtWidgets

class Ui_brsgis_cadOutputs_form(object):
    def setupUi(self, brsgis_cadOutputs_form):
        brsgis_cadOutputs_form.setObjectName("brsgis_cadOutputs_form")
        brsgis_cadOutputs_form.resize(440, 251)
        self.buttonBox = QtWidgets.QDialogButtonBox(brsgis_cadOutputs_form)
        self.buttonBox.setGeometry(QtCore.QRect(330, 170, 91, 61))
        self.buttonBox.setOrientation(QtCore.Qt.Vertical)
        self.buttonBox.setStandardButtons(QtWidgets.QDialogButtonBox.Cancel|QtWidgets.QDialogButtonBox.Ok)
        self.buttonBox.setObjectName("buttonBox")
        self.label_9 = QtWidgets.QLabel(brsgis_cadOutputs_form)
        self.label_9.setGeometry(QtCore.QRect(10, 10, 151, 16))
        font = QtGui.QFont()
        font.setBold(False)
        font.setWeight(50)
        self.label_9.setFont(font)
        self.label_9.setScaledContents(True)
        self.label_9.setObjectName("label_9")
        self.cb_contours = QtWidgets.QCheckBox(brsgis_cadOutputs_form)
        self.cb_contours.setGeometry(QtCore.QRect(30, 40, 231, 17))
        self.cb_contours.setChecked(True)
        self.cb_contours.setObjectName("cb_contours")
        self.cb_ae = QtWidgets.QCheckBox(brsgis_cadOutputs_form)
        self.cb_ae.setGeometry(QtCore.QRect(30, 80, 321, 17))
        self.cb_ae.setChecked(True)
        self.cb_ae.setObjectName("cb_ae")
        self.cb_ve = QtWidgets.QCheckBox(brsgis_cadOutputs_form)
        self.cb_ve.setGeometry(QtCore.QRect(30, 100, 321, 17))
        self.cb_ve.setChecked(True)
        self.cb_ve.setObjectName("cb_ve")
        self.cb_hat2015 = QtWidgets.QCheckBox(brsgis_cadOutputs_form)
        self.cb_hat2015.setGeometry(QtCore.QRect(30, 120, 121, 17))
        self.cb_hat2015.setChecked(True)
        self.cb_hat2015.setObjectName("cb_hat2015")
        self.cb_parcels = QtWidgets.QCheckBox(brsgis_cadOutputs_form)
        self.cb_parcels.setGeometry(QtCore.QRect(30, 60, 161, 17))
        self.cb_parcels.setChecked(True)
        self.cb_parcels.setObjectName("cb_parcels")
        self.cb_slope = QtWidgets.QCheckBox(brsgis_cadOutputs_form)
        self.cb_slope.setGeometry(QtCore.QRect(30, 140, 201, 17))
        self.cb_slope.setChecked(True)
        self.cb_slope.setObjectName("cb_slope")
        self.label_10 = QtWidgets.QLabel(brsgis_cadOutputs_form)
        self.label_10.setGeometry(QtCore.QRect(30, 190, 221, 20))
        font = QtGui.QFont()
        font.setBold(True)
        font.setWeight(75)
        self.label_10.setFont(font)
        self.label_10.setScaledContents(True)
        self.label_10.setObjectName("label_10")
        self.cb_rdss = QtWidgets.QCheckBox(brsgis_cadOutputs_form)
        self.cb_rdss.setGeometry(QtCore.QRect(30, 160, 201, 17))
        self.cb_rdss.setChecked(True)
        self.cb_rdss.setObjectName("cb_rdss")

        self.retranslateUi(brsgis_cadOutputs_form)
        self.buttonBox.accepted.connect(brsgis_cadOutputs_form.accept)
        self.buttonBox.rejected.connect(brsgis_cadOutputs_form.reject)
        QtCore.QMetaObject.connectSlotsByName(brsgis_cadOutputs_form)
        brsgis_cadOutputs_form.setTabOrder(self.cb_contours, self.cb_parcels)
        brsgis_cadOutputs_form.setTabOrder(self.cb_parcels, self.cb_ae)
        brsgis_cadOutputs_form.setTabOrder(self.cb_ae, self.cb_ve)
        brsgis_cadOutputs_form.setTabOrder(self.cb_ve, self.cb_hat2015)
        brsgis_cadOutputs_form.setTabOrder(self.cb_hat2015, self.cb_slope)

    def retranslateUi(self, brsgis_cadOutputs_form):
        _translate = QtCore.QCoreApplication.translate
        brsgis_cadOutputs_form.setWindowTitle(_translate("brsgis_cadOutputs_form", "CAD Exports"))
        self.label_9.setText(_translate("brsgis_cadOutputs_form", "Choose the layers to export:"))
        self.cb_contours.setText(_translate("brsgis_cadOutputs_form", "GOV-GIS-LIDAR-2FT-CONTOURS"))
        self.cb_ae.setText(_translate("brsgis_cadOutputs_form", "GOV-GIS-FEMA-AE"))
        self.cb_ve.setText(_translate("brsgis_cadOutputs_form", "GOV-GIS-FEMA-VE"))
        self.cb_hat2015.setText(_translate("brsgis_cadOutputs_form", "GOV-GIS-HAT-2015"))
        self.cb_parcels.setText(_translate("brsgis_cadOutputs_form", "GOV-GIS-PARCELS"))
        self.cb_slope.setText(_translate("brsgis_cadOutputs_form", "GOV-GIS+2ac+20pct-SLOPE"))
        self.label_10.setText(_translate("brsgis_cadOutputs_form", "NOTE: You MUST choose at least one."))
        self.cb_rdss.setText(_translate("brsgis_cadOutputs_form", "GOV-GIS-911-ROADS"))

