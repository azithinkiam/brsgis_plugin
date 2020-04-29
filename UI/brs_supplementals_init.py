from PyQt5.QtWidgets import QLineEdit, QToolButton, QStackedWidget, QSizePolicy, QTextEdit, QDialogButtonBox, QLabel, \
    QPlainTextEdit, QComboBox, QGroupBox

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
            dialog.parent().setFixedWidth(875)
            dialog.parent().setFixedHeight(600)
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
        folder_type = dialog.findChild(QLineEdit, "folder_type")
        folder_name = dialog.findChild(QLineEdit, "folder_name")
        buttonBox = dialog.findChild(QDialogButtonBox, "buttonBox")
        client_name = dialog.findChild(QLineEdit, "client_name")
        lowtide_hrs = dialog.findChild(QLineEdit, "lowtide_hrs")
        client_role = dialog.findChild(QLineEdit, "folder_type")
        objectType = dialog.findChild(QPlainTextEdit, "objectType")

        mbl = dialog.findChild(QPlainTextEdit, "map_bk_lot")
        lblOT = dialog.findChild(QLabel, "label_ot")
        lblMBL = dialog.findChild(QLabel, "label_mbl")
        lblDate = dialog.findChild(QLabel, "l_date")
        lblType1 = dialog.findChild(QLabel, "l_type1")
        type1 = dialog.findChild(QComboBox, "type1")
        type2 = dialog.findChild(QComboBox, "type2")
        scale = dialog.findChild(QLineEdit, "scale")
        pls = dialog.findChild(QLineEdit, "pls_no")
        lblType2 = dialog.findChild(QLabel, "l_type2")
        lblName1 = dialog.findChild(QLabel, "l_1")
        lblName2 = dialog.findChild(QLabel, "l_2")
        lblName3 = dialog.findChild(QLabel, "l_3")
        lbl3 = dialog.findChild(QLabel, "l_name3")
        lbl4 = dialog.findChild(QLabel, "l_name4")
        lpls = dialog.findChild(QLabel, "l_pls")

        supp = dialog.findChild(QComboBox, "supp_type")
        job_type = dialog.findChild(QComboBox, "job_type")
        jobSubType = dialog.findChild(QComboBox, "jobSubtype")
        designType = dialog.findChild(QComboBox, "design_type")
        mapType = dialog.findChild(QComboBox, "map_type")
        mapSubtype = dialog.findChild(QComboBox, "map_subtype")
        docSubtype = dialog.findChild(QComboBox, "document_subtype")

        gbRecording = dialog.findChild(QGroupBox, "groupBox_recording")

        job_type.hide()

        try:
            s = dialog.findChild(QStackedWidget, "stackedWidget")
            buttonP2.clicked.connect(lambda: s.setCurrentIndex(1))
            buttonP1.clicked.connect(lambda: s.setCurrentIndex(0))

        except Exception as e:
            pass

        if supp.currentText() == 'D':
            lblDate.setText("Document Date")
            lblType1.setText("Document SubType")
            lblType2.hide()
            type2.hide()
            designType.hide()
            jobSubType.hide()
            job_type.hide()
            lblName3.hide()
            scale.hide()
            lblName1.setText("Document Number")
            lblName2.setText("Office")
            lbl3.hide()
            lbl4.hide()
            mapType.hide()
            mapSubtype.hide()
            lpls.hide()
            pls.hide()

        elif supp.currentText() == 'R':
            lblType1.setText("Job Type")
            lblType2.setText("Job SubType")
            designType.hide()
            type1.hide()
            job_type.show()
            jobSubType.show()
            lblDate.setText("Photo Date")
            lblName1.setText("Photographer")
            lblName2.setText("Quality")
            lblName3.hide()
            lbl3.hide()
            lbl4.hide()
            scale.hide()
            gbRecording.hide()
            mapType.hide()
            mapSubtype.hide()
            docSubtype.hide()
            lpls.hide()
            pls.hide()

        elif supp.currentText() == 'P':
            lblDate.setText("Date")
            lblType1.setText("Job Type")
            lblType2.setText("Job SubType")
            designType.show()
            type1.hide()
            job_type.show()
            jobSubType.show()
            lblName1.setText("Author")
            lblName2.hide()
            folder_type.hide()
            lblName3.hide()
            lbl3.setText("Design Type")
            lbl4.hide()
            scale.hide()
            gbRecording.hide()
            mapType.hide()
            mapSubtype.hide()
            docSubtype.hide()
            lpls.hide()
            pls.hide()

        elif supp.currentText() == 'H':
            lblDate.setText("Date")
            lblType1.hide()
            lblType2.hide()
            designType.hide()
            type1.hide()
            type2.hide()
            job_type.hide()
            jobSubType.hide()
            lblName1.setText("Author")
            lblName2.setText("Title")
            lblName3.hide()
            lbl3.show()
            lbl4.show()
            scale.hide()
            gbRecording.hide()
            mapType.show()
            mapSubtype.show()
            docSubtype.hide()
            lpls.hide()
            pls.hide()

        elif supp.currentText() == 'T':
            lblDate.setText("Date")
            lblType1.hide()
            type1.hide()
            lblType2.hide()
            type2.hide()
            designType.hide()
            type1.hide()
            job_type.hide()
            jobSubType.hide()
            lblName1.setText("Author")
            lblName2.setText("Quality")
            lblName3.setText("Map Number")
            lbl3.hide()
            lbl4.hide()
            scale.show()
            if scale.text() == 'NULL':
                scale.setText('')
            gbRecording.hide()
            mapType.hide()
            mapSubtype.hide()
            docSubtype.hide()
            lpls.hide()
            pls.hide()

        elif supp.currentText() == 'M':
            lblDate.setText("Date")
            lblType1.setText("Job Type")
            lblType2.setText("Job SubType")
            designType.hide()
            job_type.show()
            jobSubType.show()
            lblName1.setText("Author")
            lblName2.setText("Quality")
            lblName3.setText("Scale")
            lbl3.show()
            lbl4.show()
            scale.show()
            if scale.text() == 'NULL':
                scale.setText('')
            gbRecording.hide()
            mapType.show()
            mapSubtype.show()
            docSubtype.hide()
            lpls.hide()
            pls.hide()

        elif supp.currentText() == 'O':
            lblDate.setText("Date")
            lblType1.hide()
            lblType2.hide()
            designType.hide()
            type1.hide()
            type2.hide()
            job_type.hide()
            jobSubType.hide()
            lblName1.hide()
            lblName2.hide()
            lblName3.hide()
            lbl3.hide()
            lbl4.hide()
            client_name.hide()
            folder_type.hide()
            lblName3.hide()
            scale.hide()
            gbRecording.hide()
            mapType.hide()
            mapSubtype.hide()
            docSubtype.hide()
            lpls.hide()
            pls.hide()

        elif supp.currentText() == 'Q':
            lblDate.setText("Date")
            lblType1.hide()
            lblType2.hide()
            designType.hide()
            type1.hide()
            type2.hide()
            job_type.hide()
            jobSubType.hide()
            lblName1.setText("Name")
            lblName2.hide()
            lblName3.hide()
            lbl3.show()
            lbl4.hide()
            client_name.show()
            folder_type.hide()
            lblName3.show()
            scale.show()
            if scale.text() == 'NULL':
                scale.setText('')
            gbRecording.hide()
            mapType.show()
            mapSubtype.hide()
            docSubtype.hide()
            lpls.hide()
            pls.hide()

        elif supp.currentText() == 'K':
            lblDate.setText("Date of Plan")
            lblType1.setText("Job Type")
            lblType2.setText("Job SubType")
            designType.hide()
            type1.hide()
            type2.hide()
            job_type.show()
            jobSubType.show()
            lblName1.setText("Name")
            lblName2.setText("Address")
            lblName3.setText("Surveyor Name")
            lbl3.hide()
            lbl4.hide()
            client_name.show()
            folder_type.show()
            scale.show()
            if scale.text() == 'NULL':
                scale.setText('')
            gbRecording.show()
            mapType.hide()
            mapSubtype.hide()
            docSubtype.hide()
            if pls.text() == 'NULL':
                pls.setText('')
        else:
            lblDate.setText("Date")

        if objectType.toPlainText() == 'polygon':
            mbl.show()
            lblMBL.show()
            lblOT.hide()
            lblOT.setEnabled(False)
            objectType.hide()
            pass
        else:
            mbl.hide()
            lblMBL.hide()
            lblOT.show()
            lblOT.setEnabled(True)
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
