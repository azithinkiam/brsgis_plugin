# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'brsgis_label_form.ui'
#
# Created: Wed May 09 13:43:33 2018
#      by: PyQt4 UI code generator 4.10.2
#
# WARNING! All changes made in this file will be lost!
from PyQt5.QtWidgets import QLabel, QDialogButtonBox, QApplication, QDial
from PyQt5.QtGui import QFont
from PyQt5 import QtCore
from PyQt5.QtCore import QRect, QObject, QMetaObject

try:
    _fromUtf8 = QtCore.QString.fromUtf8
except AttributeError:
    def _fromUtf8(s):
        return s

try:
    _encoding = QApplication.UnicodeUTF8
    def _translate(context, text, disambig):
        return QApplication.translate(context, text, disambig, _encoding)
except AttributeError:
    def _translate(context, text, disambig):
        return QApplication.translate(context, text, disambig)


class Ui_brsgis_label_form(object):
    def setupUi(self, brsgis_label_form):
        brsgis_label_form.setObjectName(_fromUtf8("brsgis_label_form"))
        brsgis_label_form.resize(440, 170)
        self.buttonBox = QDialogButtonBox(brsgis_label_form)
        self.buttonBox.setGeometry(QRect(250, 70, 91, 61))
        #self.buttonBox.setOrientation(Qt.Vertical)
        self.buttonBox.setStandardButtons(QDialogButtonBox.Cancel|QDialogButtonBox.Ok)
        self.buttonBox.setObjectName(_fromUtf8("buttonBox"))
        self.dial = QDial(brsgis_label_form)
        self.dial.setGeometry(QRect(93, 61, 111, 71))
        self.dial.setMaximum(7)
        self.dial.setPageStep(1)
        #self.dial.setOrientation(Vertical)
        self.dial.setInvertedAppearance(False)
        self.dial.setInvertedControls(False)
        self.dial.setNotchTarget(1.0)
        self.dial.setNotchesVisible(True)
        self.dial.setObjectName(_fromUtf8("dial"))
        self.label = QLabel(brsgis_label_form)
        self.label.setGeometry(QRect(120, 127, 16, 21))
        font = QFont()
        font.setPointSize(10)
        font.setBold(True)
        font.setWeight(75)
        self.label.setFont(font)
        self.label.setObjectName(_fromUtf8("label"))
        self.label_2 = QLabel(brsgis_label_form)
        self.label_2.setGeometry(QRect(99, 100, 16, 21))
        font = QFont()
        font.setPointSize(10)
        font.setBold(True)
        font.setWeight(75)
        self.label_2.setFont(font)
        self.label_2.setObjectName(_fromUtf8("label_2"))
        self.label_3 = QLabel(brsgis_label_form)
        self.label_3.setGeometry(QRect(102, 64, 16, 21))
        font = QFont()
        font.setPointSize(10)
        font.setBold(True)
        font.setWeight(75)
        self.label_3.setFont(font)
        self.label_3.setObjectName(_fromUtf8("label_3"))
        self.label_4 = QLabel(brsgis_label_form)
        self.label_4.setGeometry(QRect(125, 42, 16, 21))
        font = QFont()
        font.setPointSize(10)
        font.setBold(True)
        font.setWeight(75)
        self.label_4.setFont(font)
        self.label_4.setObjectName(_fromUtf8("label_4"))
        self.label_5 = QLabel(brsgis_label_form)
        self.label_5.setGeometry(QRect(163, 42, 16, 21))
        font = QFont()
        font.setPointSize(10)
        font.setBold(True)
        font.setWeight(75)
        self.label_5.setFont(font)
        self.label_5.setObjectName(_fromUtf8("label_5"))
        self.label_6 = QLabel(brsgis_label_form)
        self.label_6.setGeometry(QRect(187, 64, 16, 21))
        font = QFont()
        font.setPointSize(10)
        font.setBold(True)
        font.setWeight(75)
        self.label_6.setFont(font)
        self.label_6.setObjectName(_fromUtf8("label_6"))
        self.label_7 = QLabel(brsgis_label_form)
        self.label_7.setGeometry(QRect(190, 100, 16, 21))
        font = QFont()
        font.setPointSize(10)
        font.setBold(True)
        font.setWeight(75)
        self.label_7.setFont(font)
        self.label_7.setObjectName(_fromUtf8("label_7"))
        self.label_8 = QLabel(brsgis_label_form)
        self.label_8.setGeometry(QRect(171, 127, 16, 21))
        font = QFont()
        font.setPointSize(10)
        font.setBold(True)
        font.setWeight(75)
        self.label_8.setFont(font)
        self.label_8.setObjectName(_fromUtf8("label_8"))
        self.label_9 = QLabel(brsgis_label_form)
        self.label_9.setGeometry(QRect(10, 10, 431, 16))
        font = QFont()
        font.setBold(False)
        font.setWeight(50)
        self.label_9.setFont(font)
        self.label_9.setObjectName(_fromUtf8("label_9"))

        self.retranslateUi(brsgis_label_form)
        #QObject.connect(self.buttonBox, PYQT_SIGNAL(_fromUtf8("accepted()")), brsgis_label_form.accept)
        #self.buttonBox.connect(_fromUtf8("accepted()"), brsgis_label_form.accept)
        self.buttonBox.accepted.connect(brsgis_label_form.accept)
        #QObject.connect(self.buttonBox, PYQT_SIGNAL(_fromUtf8("rejected()")), brsgis_label_form.reject)
        #self.buttonBox.connect(_fromUtf8("rejected()"), brsgis_label_form.reject)
        self.buttonBox.rejected.connect(brsgis_label_form.reject)
        QMetaObject.connectSlotsByName(brsgis_label_form)

    def retranslateUi(self, brsgis_label_form):
        brsgis_label_form.setWindowTitle(_translate("brsgis_label_form", "Check Label Stock!", None))
        self.label.setText(_translate("brsgis_label_form", "0", None))
        self.label_2.setText(_translate("brsgis_label_form", "1", None))
        self.label_3.setText(_translate("brsgis_label_form", "2", None))
        self.label_4.setText(_translate("brsgis_label_form", "3", None))
        self.label_5.setText(_translate("brsgis_label_form", "4", None))
        self.label_6.setText(_translate("brsgis_label_form", "5", None))
        self.label_7.setText(_translate("brsgis_label_form", "6", None))
        self.label_8.setText(_translate("brsgis_label_form", "7", None))
        self.label_9.setText(_translate("brsgis_label_form", "Select the number of labels that have been USED from the current sheet, then click OK.", None))

