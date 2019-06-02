from PyQt5.QtWidgets import QLineEdit, QToolButton, QStackedWidget, QPushButton, QDateTimeEdit, QComboBox
from qgis.core import *

# nameField = None
from qgis.utils import iface

myDialog = None
stackedWidget = None

def formOpen(dialog, layerid, featureid):

    if 1 == 1:

        global myDialog
        myDialog = dialog

        name = dialog.findChild(QLineEdit, "name")
        address = dialog.findChild(QLineEdit, "address")
        town = dialog.findChild(QLineEdit, "town")
        townP = dialog.findChild(QLineEdit, "town_parcels")
        cd_no = dialog.findChild(QLineEdit, "cd_no")
        job = dialog.findChild(QLineEdit, "job")
        initials = dialog.findChild(QLineEdit, "initials")
        map = dialog.findChild(QLineEdit, "map")
        lot = dialog.findChild(QLineEdit, "lot")
        surveyor = dialog.findChild(QLineEdit, "surveyor")
        notes = dialog.findChild(QLineEdit, "notes")

        rev_no = dialog.findChild(QLineEdit, "rev_no")
        planbook = dialog.findChild(QLineEdit, "planbook")
        planpage = dialog.findChild(QLineEdit, "planpage")
        size_no = dialog.findChild(QLineEdit, "size_no")

        plan_no = dialog.findChild(QLineEdit, "plan_no")
        plan_type = dialog.findChild(QComboBox, "plan_type")

        idValue = dialog.findChild(QLineEdit, "idValue")
        file_no = dialog.findChild(QLineEdit, "file_no")

        if name.text() == 'NULL':
            name.setText('')
        else:
            pass
        if address.text() == 'NULL':
            address.setText('')
        else:
            pass
        if town.text() == 'NULL':
            town.setText('')
        else:
            pass
        if townP.text() == 'NULL':
            townP.setText('')
        else:
            pass
        if cd_no.text() == 'NULL':
            cd_no.setText('')
        else:
            pass
        if job.text() == 'NULL':
            job.setText('')
        else:
            pass
        if rev_no.text() == 'NULL':
            rev_no.setText('')
        else:
            pass
        if initials.text() == 'NULL':
            initials.setText('')
        else:
            pass
        if map.text() == 'NULL':
            map.setText('')
        else:
            pass
        if lot.text() == 'NULL':
            lot.setText('')
        else:
            pass
        if surveyor.text() == 'NULL':
            surveyor.setText('')
        else:
            pass
        if notes.text() == 'NULL':
            notes.setText('')
        else:
            pass
        if planbook.text() == 'NULL':
            planbook.setText('')
        else:
            pass
        if planpage.text() == 'NULL':
            planpage.setText('')
        else:
            pass
        try:
            if size_no.text() == 'NULL':
                plan_type.setCurrentIndex(0)
                size_no.setText('')
            else:
                pass
            if plan_no.text() == 'NULL':
                plan_no.setText('')
            else:
                pass
            if plan_type.currentIndex() == 0:
                pass
            elif plan_type.currentIndex() == 1:
                pass
            else:
                if size_no.text() == 'K':
                    plan_type.setCurrentIndex(0)
                else:
                    plan_type.setCurrentIndex(1)
            if plan_type.currentText() == 'K':
                size_no.setText('K')
            else:
                pass
            if file_no.text() == 'NULL':
                file_no.setText('')
            else:
                pass
            if idValue.text() == 'NULL':
                idValue.setText('')
            else:
                pass
        except Exception as e:
            pass
    else:
        pass
