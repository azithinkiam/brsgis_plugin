
from PyQt5 import QtCore
from PyQt5.QtCore import QRect, QMetaObject
from PyQt5.QtGui import QFont
from PyQt5.QtWidgets import QLabel, QDialogButtonBox, QApplication, QComboBox

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


class Ui_brsgis_supp_pre_form(object):
    def setupUi(self, brsgis_supp_pre_form):
        brsgis_supp_pre_form.setObjectName(_fromUtf8("brsgis_supp_pre_form"))
        brsgis_supp_pre_form.resize(440, 150)
        self.buttonBox = QDialogButtonBox(brsgis_supp_pre_form)
        self.buttonBox.setGeometry(QRect(330, 90, 91, 61))
        self.buttonBox.setStandardButtons(QDialogButtonBox.Cancel|QDialogButtonBox.Ok)
        self.buttonBox.setObjectName(_fromUtf8("buttonBox"))
        self.label_9 = QLabel(brsgis_supp_pre_form)
        self.label_9.setGeometry(QRect(10, 10, 431, 16))
        font = QFont()
        font.setBold(False)
        font.setWeight(50)
        self.label_9.setFont(font)
        self.label_9.setObjectName(_fromUtf8("label_9"))

        self.supp_type = QComboBox(brsgis_supp_pre_form)
        self.supp_type.setGeometry(QRect(30, 40, 191, 22))
        self.supp_type.addItems([self.tr(""), self.tr("Plan by others (K)"), self.tr("Document (D)"), self.tr("Raster (R)"),
                                  self.tr("Proposed / Design (P)"), self.tr("Historical Map / 1857 County (H)"),
                                  self.tr("Tax Maps (T)"), self.tr("Map (M)"), self.tr("Other (O)"),
                                  self.tr("USGS QUADS (Q)"), self.tr("Folder (F)")])

        self.supp_type.setObjectName(_fromUtf8("supp_type"))

        self.retranslateUi(brsgis_supp_pre_form)
        self.buttonBox.accepted.connect(brsgis_supp_pre_form.accept)
        self.buttonBox.rejected.connect(brsgis_supp_pre_form.reject)
        QMetaObject.connectSlotsByName(brsgis_supp_pre_form)

    def retranslateUi(self, brsgis_supp_pre_form):
        brsgis_supp_pre_form.setWindowTitle(_translate("brsgis_supp_pre_form", "Supplemental Type", None))
        self.label_9.setText(_translate("brsgis_supp_pre_form", "Choose the type of supplemental you wish to create and then click OK.", None))

