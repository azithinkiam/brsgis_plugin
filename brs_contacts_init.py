from PyQt5.QtWidgets import QLineEdit, QCheckBox

# nameField = None

myDialog = None
stackedWidget = None


def formOpen(dialog, layerid, featureid):

    global myDialog
    myDialog = dialog
    main(dialog)

def main(dialog):

        contact_name = dialog.findChild(QLineEdit, "contact_name")
        primary_contact = dialog.findChild(QLineEdit, "primary_contact")
        secondary_contact = dialog.findChild(QLineEdit, "secondary_contact")
        contact_addr = dialog.findChild(QLineEdit, "contact_addr")
        email_primary = dialog.findChild(QLineEdit, "email_primary")
        email_secondary = dialog.findChild(QLineEdit, "email_secondary")
        flagged = dialog.findChild(QCheckBox, "flagr")

        #flagged.Hide()

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

        # if flagged.isChecked():
        #
        #     QMessageBox.critical(iface.mainWindow(), "WARNING!",
        #                          "This job currently has multiple contacts set as CLIENT\n"
        #                          "or FOLDER - please review and edit accordingly.\n"
        #                          "\n"
        #                          "REMINDER: Each JOB should have only one contact set\n"
        #                          "as CLIENT and one set as FOLDER.  Using the same contact\n"
        #                          "for both is acceptable.")
        # else:
        #     pass
