from PyQt5.QtWidgets import QLineEdit, QToolButton, QStackedWidget, QSizePolicy, QTextEdit, QDialogButtonBox, QLabel, \
    QPlainTextEdit
from qgis.core import *

# nameField = None

myDialog = None
stackedWidget = None

def formOpen(dialog, layerid, featureid):

# need to re-code this based on how it's launched...ignore for search, possibly kill all.
    if 1 == 1:

        global myDialog
        global stackedWidget
        myDialog = dialog

        try:
            # dialog.parent().setWindowFlags(Qt.CustomizeWindowHint | Qt.WindowTitleHint)  # no title bar/x, no Move.
            # dialog.parent().setWindowFlags(Qt.CustomizeWindowHint)  # x visible but not enabled
            dialog.parent().setFixedWidth(1080)
            dialog.parent().setFixedHeight(950)
            dialog.parent().setSizePolicy(QSizePolicy.Fixed, QSizePolicy.Fixed)

        except Exception:
            pass

        # global nameField
        # nameField = dialog.findChild(QLineEdit, "Name")
        buttonP2 = dialog.findChild(QToolButton, "buttonP2")
        buttonP1 = dialog.findChild(QToolButton, "buttonP1")
        job_desc = dialog.findChild(QTextEdit, "job_desc")
        state = dialog.findChild(QLineEdit, "state")
        locus_addr = dialog.findChild(QLineEdit,"locus_addr")
        rev_no = dialog.findChild(QLineEdit, "rev_no")
        old_plan_no = dialog.findChild(QLineEdit, "old_plan_no")
        hrs_fw_est = dialog.findChild(QLineEdit, "hrs_fw_est")
        hrs_fw_comp = dialog.findChild(QLineEdit, "hrs_fw_comp")
        hrs_cad_est = dialog.findChild(QLineEdit, "hrs_cad_est")
        hrs_cad_comp = dialog.findChild(QLineEdit, "hrs_cad_comp")
        hrs_rs_est = dialog.findChild(QLineEdit, "hrs_rs_est")
        hrs_rs_comp = dialog.findChild(QLineEdit, "hrs_rs_comp")
        hrs_misc_est = dialog.findChild(QLineEdit, "hrs_misc_est")
        hrs_misc_comp = dialog.findChild(QLineEdit, "hrs_misc_comp")
        planbook_page = dialog.findChild(QLineEdit, "planbook_page")
        recorded_by = dialog.findChild(QLineEdit, "recorded_by")
        folder_name = dialog.findChild(QLineEdit, "folder_name")
        buttonBox = dialog.findChild(QDialogButtonBox, "buttonBox")
        client_name = dialog.findChild(QLineEdit, "client_name")
        lowtide_hrs = dialog.findChild(QLineEdit, "lowtide_hrs")
        client_role = dialog.findChild(QLineEdit, "folder_type")
        objectType = dialog.findChild(QPlainTextEdit, "objectType")
        mbl = dialog.findChild(QPlainTextEdit, "map_bk_lot")
        lblOT = dialog.findChild(QLabel, "label_ot")
        lblMBL = dialog.findChild(QLabel, "label_mbl")

        try:
            s = dialog.findChild(QStackedWidget, "stackedWidget")
            buttonP2.clicked.connect(lambda: s.setCurrentIndex(1))
            buttonP1.clicked.connect(lambda: s.setCurrentIndex(0))

        except Exception as e:
            pass

        if objectType.toPlainText() == 'polygon':
            mbl.show()
            lblMBL.setText("map_bk_lot(s)")
            objectType.hide()
            pass
        else:
            mbl.hide()
            lblMBL.setText("Feature Type")
            objectType.show()

        try:
            if state.text() == 'NULL':
                state.setText('ME')
            else:
                pass
        except Exception as e:
            pass

        try:
            if locus_addr.text() == 'NULL':
                locus_addr.setText('')
            elif locus_addr.text() == 'New Polygon Feature':
                locus_addr.setText('')
            else:
                pass

        except Exception as e:
            pass

        try:
            if job_desc.toPlainText() == 'NULL':
                job_desc.setText('')
            else:
                pass
        except Exception as e:
            pass

        try:
            if rev_no.text() == 'NULL':
                rev_no.setText('')
            else:
                pass
        except Exception as e:
            pass

        try:
            if old_plan_no.text() == 'NULL':
                old_plan_no.setText('')
            else:
                pass
        except Exception as e:
            pass

        try:
            if folder_name.text() == 'NULL':
                folder_name.setText('')
            else:
                pass
        except Exception as e:
            pass

        try:
            if client_name.text() == 'NULL':
                client_name.setText('')
            else:
                pass
        except Exception as e:
            pass

        try:
            if str(len(hrs_fw_est.text())) == '0':
                hrs_fw_est.setText('0')
            else:
                pass
        except Exception as e:
            pass

        try:
            if str(len(hrs_fw_comp.text())) == '0':
                hrs_fw_comp.setText('0')
            else:
                pass
        except Exception as e:
            pass

        try:
            if str(len(hrs_cad_est.text())) == '0':
                hrs_cad_est.setText('0')
            else:
                pass
        except Exception as e:
            pass

        try:
            if str(len(hrs_cad_comp.text())) == '0':
                hrs_cad_comp.setText('0')
            else:
                pass
        except Exception as e:
            pass

        try:
            if str(len(hrs_rs_est.text())) == '0':
                hrs_rs_est.setText('0')
            else:
                pass
        except Exception as e:
            pass

        try:
            if str(len(hrs_rs_comp.text())) == '0':
                hrs_rs_comp.setText('0')
            else:
                pass
        except Exception as e:
            pass

        try:
            if str(len(hrs_misc_est.text())) == '0':
                hrs_misc_est.setText('0')
            else:
                pass
        except Exception as e:
            pass

        try:
            if str(len(hrs_misc_comp.text())) == '0':
                hrs_misc_comp.setText('0')
            else:
                pass
        except Exception as e:
            pass

        try:
            if planbook_page.text() == 'NULL':
                planbook_page.setText('')
            else:
                pass
        except Exception as e:
            pass
        try:
            if recorded_by.text() == 'NULL':
                recorded_by.setText('')
            else:
                pass
        except Exception as e:
            pass
        try:
            if client_role.text() == 'NULL':
                client_role.setText('')
            else:
                pass
        except Exception as e:
            pass

        try:
            if str(len(lowtide_hrs.text())) == '0':
                lowtide_hrs.setText('0')
            else:
                pass
        except Exception as e:
            pass

            # hrs_fw_est = dialog.findChild(QLineEdit, "hrs_fw_est")
            # hrs_fw_est_2 = dialog.findChild(QLineEdit, "hrs_fw_est_2")
            # if len(hrs_fw_est.text()) == 'NULL':
            #     hrs_fw_est_2.setText(hrs_fw_est.text())
            # else:
            #     pass
            #
            # hrs_cad_est = dialog.findChild(QLineEdit, "hrs_cad_est")
            # hrs_cad_est_2 = dialog.findChild(QLineEdit, "hrs_cad_est_2")
            # if len(hrs_cad_est.text()) == 'NULL':
            #     hrs_cad_est_2.setText(hrs_cad_est.text())
            # else:
            #     pass
            #
            # hrs_rs_est = dialog.findChild(QLineEdit, "hrs_rs_est")
            # hrs_rs_est_2 = dialog.findChild(QLineEdit, "hrs_rs_est_2")
            # if len(hrs_rs_est.text()) == 'NULL':
            #     hrs_rs_est_2.setText(hrs_rs_est.text())
            # else:
            #     pass
            #
            # hrs_misc_est = dialog.findChild(QLineEdit, "hrs_misc_est")
            # hrs_misc_est_2 = dialog.findChild(QLineEdit, "hrs_misc_est_2")
            # if len(hrs_misc_est.text()) == 'NULL':
            #     hrs_misc_est_2.setText(hrs_misc_est.text())
            # else:
            #     pass
    else:
        pass

def reject():
    return 1
