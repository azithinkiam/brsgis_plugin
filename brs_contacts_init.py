from PyQt5.QtWidgets import QLineEdit, QToolButton, QStackedWidget, QTextEdit
from qgis.core import *


# nameField = None
from qgis.utils import iface

myDialog = None
stackedWidget = None


def formOpen(dialog, layerid, featureid):

    if 1 == 1:

        global myDialog
        myDialog = dialog

        contact_name = dialog.findChild(QLineEdit, "contact_name")
        primary_contact = dialog.findChild(QLineEdit, "primary_contact")
        secondary_contact = dialog.findChild(QLineEdit, "secondary_contact")
        contact_addr = dialog.findChild(QLineEdit, "contact_addr")
        email_primary = dialog.findChild(QLineEdit, "email_primary")
        email_secondary = dialog.findChild(QLineEdit, "email_secondary")


        if contact_name.text() == 'NULL':
            contact_name.setText('')
        else:
            pass
        if primary_contact.text() == 'NULL':
            primary_contact.setText('')
        else:
            pass
        if secondary_contact.text() == 'NULL':
            secondary_contact.setText('')
        else:
            pass
        if contact_addr.text() == 'NULL':
            contact_addr.setText('')
        else:
            pass
        if email_primary.text() == 'NULL':
            email_primary.setText('')
        else:
            pass
        if email_secondary.text() == 'NULL':
            email_secondary.setText('')
        else:
            pass

    else:
        pass


