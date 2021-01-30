from PyQt5.QtWidgets import QLineEdit, QToolButton, QStackedWidget, QTextEdit, QDialogButtonBox, QLabel, \
    QPlainTextEdit, QComboBox, QGroupBox, QDateTimeEdit

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
            dialog.parent().setWindowFlags(Qt.CustomizeWindowHint)  # x visible but not enabled
            dialog.parent().setFixedWidth(875)
            dialog.parent().setFixedHeight(600)
            # dialog.parent().setSizePolicy(QSizePolicy.Fixed, QSizePolicy.Fixed)
            pass

        except Exception:
            pass

        # global nameField
        # nameField = dialog.findChild(QLineEdit, "Name")

        try:
            buttonP2 = dialog.findChild(QToolButton, "buttonP2")
            buttonP1 = dialog.findChild(QToolButton, "buttonP1")
            job_desc = dialog.findChild(QTextEdit, "job_desc")
            state = dialog.findChild(QLineEdit, "state")
            locus_addr = dialog.findChild(QLineEdit,"locus_addr")
            l_rev = dialog.findChild(QLabel, "l_rev")
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
            date_recorded = dialog.findChild(QDateTimeEdit, "date_recorded")
            recorded_by = dialog.findChild(QLineEdit, "recorded_by")
            folder_type = dialog.findChild(QLineEdit, "folder_type")
            folder_name = dialog.findChild(QLineEdit, "folder_name")
            buttonBox = dialog.findChild(QDialogButtonBox, "buttonBox")
            client_name = dialog.findChild(QLineEdit, "client_name")
            client_role = dialog.findChild(QLineEdit, "client_role")
            lowtide_hrs = dialog.findChild(QLineEdit, "lowtide_hrs")
            client_role = dialog.findChild(QLineEdit, "folder_type")
            objectType = dialog.findChild(QPlainTextEdit, "objectType")

            lMBL = dialog.findChild(QLabel, "label_mbl")
            lDate = dialog.findChild(QLabel, "l_date")
            lSupp = dialog.findChild(QLabel, "l_sT")
            lSupp.setText("Supplemental Type")
            lT1 = dialog.findChild(QLabel, "l_t1")
            lT2 = dialog.findChild(QLabel, "l_t2")
            lT3 = dialog.findChild(QLabel, "l_t3")
            lT4 = dialog.findChild(QLabel, "l_t4")
            lT5 = dialog.findChild(QLabel, "l_t5")
            lQ = dialog.findChild(QLabel, "l_quality")
            lC = dialog.findChild(QLabel, "l_color")
            media = dialog.findChild(QComboBox, "media")
            color = dialog.findChild(QComboBox, "color")
            quality = dialog.findChild(QComboBox, "quality")

            mbl = dialog.findChild(QPlainTextEdit, "map_bk_lot")
            type1 = dialog.findChild(QComboBox, "type1")
            scale = dialog.findChild(QLineEdit, "scale")
            pls = dialog.findChild(QLineEdit, "pls_no")
            author = dialog.findChild(QLineEdit, "author")

            lD1 = dialog.findChild(QLabel, "l_1")
            lD2 = dialog.findChild(QLabel, "l_2")
            lD3 = dialog.findChild(QLabel, "l_3")

            lpls = dialog.findChild(QLabel, "l_pls")
            lDN = dialog.findChild(QLabel, "l_dN")

            lbl5 = dialog.findChild(QLabel, "l_rJ")
            lbl6 = dialog.findChild(QLabel, "l_rO")
            lbl7 = dialog.findChild(QLabel, "l_oF")
            lRB = dialog.findChild(QLabel, "lrB")
            lDR = dialog.findChild(QLabel, "ldR")

            supp = dialog.findChild(QComboBox, "supp_type")
            job_type = dialog.findChild(QComboBox, "job_type")
            jobSubType = dialog.findChild(QComboBox, "jobSubtype")
            designType = dialog.findChild(QComboBox, "design_type")
            mapType = dialog.findChild(QComboBox, "map_type")
            mapSubtype = dialog.findChild(QComboBox, "map_subtype")
            docSubtype = dialog.findChild(QComboBox, "document_subtype")

            recCounty = dialog.findChild(QComboBox, "record_jurisdiction")
            recOffice = dialog.findChild(QComboBox, "record_office")
            obtainedFrom = dialog.findChild(QComboBox, "obtained_from")

            gbRecording = dialog.findChild(QGroupBox, "groupBox_recording")


            job_type.hide()
        except Exception as e:
            pass

        try:
            s = dialog.findChild(QStackedWidget, "stackedWidget")
            buttonP2.clicked.connect(lambda: s.setCurrentIndex(1))
            buttonP1.clicked.connect(lambda: s.setCurrentIndex(0))

        except Exception as e:
            pass

        try:
            if supp.currentText() == 'D':
                lDate.setText("Date Requested")
                lT1.setText("Document Type")
                l_rev.hide()
                rev_no.hide()
                lT2.hide()
                job_type.hide()
                designType.hide()
                jobSubType.hide()
                docSubtype.show()
                lT3.hide()
                lT4.hide()
                folder_type.hide()
                author.hide()
                scale.hide()
                lD1.setText("Owner Name")
                client_name.show()
                lbl5.show()
                lbl6.show()
                lbl7.show()
                lD3.hide()
                locus_addr.hide()
                lpls.hide()
                pls.hide()
                lD2.hide()
                lT5.hide()
                recCounty.show()
                recOffice.show()
                mapType.hide()
                mapSubtype.hide()
                obtainedFrom.show()
                lDR.setText("Document Date")
                lDN.setText("DeedBook/Page")
                lRB.show()
                recorded_by.show()
                lQ.hide()
                lC.hide()
                quality.hide()
                media.hide()
                color.hide()

            elif supp.currentText() == 'R':
                lT1.setText("Job Type")
                l_rev.hide()
                rev_no.hide()
                author.hide()
                lT2.hide()
                lT3.setText("Job Purpose")
                lT4.setText("Photo Purpose")
                lT5.hide()
                pls.hide()
                designType.hide()
                job_type.show()
                jobSubType.show()
                lDate.setText("Photo Date")
                lD1.setText("Client Name")
                lD2.hide()
                lD3.setText("Media")
                lpls.setText("Photographer")
                lbl5.hide()
                lbl6.hide()
                folder_type.hide()
                client_name.show()
                scale.hide()
                mapType.hide()
                mapSubtype.show()
                docSubtype.hide()
                locus_addr.hide()
                lbl7.show()
                recCounty.hide()
                recOffice.hide()
                obtainedFrom.show()
                gbRecording.hide()
                author.show()

            elif supp.currentText() == 'P':
                lDate.setText("Date Requested")
                lT1.setText("Job Type")
                lT2.hide()
                lT5.setText("Design Type")
                designType.show()
                job_type.show()
                jobSubType.show()
                author.show()
                lD1.setText("Client Name")
                lD2.setText("Title")
                folder_type.hide()
                lD3.setText("Locus Address")
                lT3.setText("Job Purpose")
                lT4.hide()
                lbl5.hide()
                lbl6.hide()
                recCounty.hide()
                recOffice.hide()
                scale.hide()
                mapType.hide()
                mapSubtype.hide()
                docSubtype.hide()
                folder_type.show()
                lpls.setText("Author")
                pls.hide()
                lDR.setText("Document Date")
                recorded_by.hide()
                lRB.hide()
                lbl7.show()
                obtainedFrom.show()
                lQ.hide()
                lC.hide()
                quality.hide()
                media.hide()
                color.hide()

            elif supp.currentText() == 'H':
                lDate.setText("Date Requested")
                lT1.hide()
                designType.hide()
                job_type.hide()
                jobSubType.hide()
                lD1.hide()
                client_name.hide()
                locus_addr.hide()
                lD2.setText("Title")
                lD3.hide()
                lbl5.show()
                lbl6.show()
                recCounty.show()
                recOffice.show()
                scale.hide()
                mapType.show()
                lT2.setText("Map Type")
                lT3.hide()
                lT4.setText("Map Purpose")
                lT5.hide()
                mapSubtype.show()
                docSubtype.hide()
                lpls.setText("Author")
                pls.hide()
                lbl7.show()
                lDR.setText("Document Date")
                obtainedFrom.show()
                lQ.hide()
                lC.hide()
                quality.hide()
                media.hide()
                color.hide()
                author.show()
                if author.text() == 'NULL':
                    author.setText('')
                recCounty.show()
                recOffice.show()
                lRB.hide()
                recorded_by.hide()

            elif supp.currentText() == 'T':
                lDate.setText("Date Requested")
                lT1.hide()
                designType.hide()
                job_type.hide()
                jobSubType.hide()
                lD1.hide()
                client_name.hide()
                locus_addr.hide()
                lD2.hide()
                lD3.setText("Media")
                folder_type.hide()
                lbl5.show()
                lbl6.show()
                recCounty.show()
                recOffice.show()
                scale.hide()
                mapType.hide()
                lT2.hide()
                lT3.hide()
                lT4.hide()
                lT5.hide()
                mapSubtype.hide()
                docSubtype.hide()
                lpls.setText("Author")
                pls.hide()
                lbl7.show()
                lDR.setText("Document Date")
                lDN.setText("Map Number")
                obtainedFrom.show()
                lQ.show()
                lC.show()
                quality.show()
                media.show()
                color.show()
                author.show()
                if author.text() == 'NULL':
                    author.setText('')
                recCounty.show()
                recOffice.show()
                lRB.hide()
                recorded_by.hide()

            elif supp.currentText() == 'M':
                lDate.setText("Date Requested")
                lT1.setText("Job Type")
                designType.show()
                job_type.show()
                jobSubType.show()
                client_name.hide()
                locus_addr.hide()
                lD1.setText("Scale")
                lD2.hide()
                lD3.setText("Media")
                folder_type.hide()
                lbl5.show()
                lbl6.show()
                recCounty.show()
                recOffice.show()
                scale.show()
                mapType.show()
                lT2.setText("Map Type")
                lT3.show()
                lT4.show()
                lT5.setText("Design Type")
                mapSubtype.show()
                docSubtype.hide()
                lpls.setText("Author")
                pls.hide()
                lbl7.show()
                lDR.setText("Document Date")
                lDN.setText("Map Number")
                obtainedFrom.show()
                lQ.show()
                lC.show()
                quality.show()
                media.show()
                color.show()
                author.show()
                if author.text() == 'NULL':
                    author.setText('')
                recCounty.show()
                recOffice.show()
                lRB.hide()
                recorded_by.hide()

            elif supp.currentText() == 'O':

                l_rev.hide()
                rev_no.hide()
                lDate.setText("Date Requested")
                lT1.hide()
                job_type.hide()
                jobSubType.hide()

                lD1.hide()
                client_name.hide()
                lD2.hide()
                folder_type.hide()
                lD3.hide()
                scale.hide()
                locus_addr.hide()
                lpls.hide()
                pls.hide()

                lT3.hide()

                lT2.hide()
                mapType.hide()
                lT4.hide()
                lT5.hide()
                author.hide()
                mapSubtype.hide()

                lbl5.hide()
                lbl6.hide()
                lbl7.hide()
                recCounty.hide()
                recOffice.hide()
                obtainedFrom.hide()

                designType.hide()
                docSubtype.hide()

                gbRecording.hide()
                lQ.hide()
                lC.hide()
                quality.hide()
                media.hide()
                color.hide()

            elif supp.currentText() == 'Q':

                l_rev.hide()
                rev_no.hide()
                lDate.setText("Date Requested")
                lT1.hide()
                job_type.hide()
                jobSubType.hide()

                client_name.show()
                lD1.setText("Title")
                folder_type.show()
                lD2.setText("Scale")
                lD3.hide()
                scale.show()
                locus_addr.hide()
                lpls.hide()
                pls.hide()

                lT3.hide()

                lT2.setText("Map Type")
                mapType.show()
                lT4.show()
                lT5.hide()
                author.hide()
                mapSubtype.show()

                lbl5.hide()
                lbl6.hide()
                lbl7.hide()
                recCounty.hide()
                recOffice.hide()
                obtainedFrom.hide()

                designType.hide()
                docSubtype.hide()
                lDN.hide()
                planbook_page.hide()
                lRB.hide()
                recorded_by.hide()
                lDR.setText("Document Date")
                lQ.hide()
                lC.hide()
                quality.hide()
                media.hide()
                color.hide()

            elif supp.currentText() == 'K':
                lT1.setText("Job Type")
                l_rev.show()
                rev_no.show()
                author.hide()
                lT2.hide()
                lT3.setText("Job Purpose")
                lT4.hide()
                lT5.hide()
                pls.show()
                designType.hide()
                job_type.show()
                jobSubType.show()
                lDate.setText("Date Requested")
                lD1.setText("Client Name")
                lD2.setText("Surveyor")
                lD3.setText("Locus Address")
                lDN.setText("PlanBook/Page")
                locus_addr.show()
                lpls.show()
                lbl5.show()
                lbl6.show()
                folder_type.show()
                client_name.show()
                scale.hide()
                mapType.hide()
                mapSubtype.hide()
                docSubtype.hide()
                lbl7.show()
                recCounty.show()
                recOffice.show()
                obtainedFrom.show()
                gbRecording.show()

                lQ.hide()
                lC.hide()
                quality.hide()
                media.hide()
                color.hide()

            elif supp.currentText() == 'F':
                lT1.setText("Job Type")
                l_rev.show()
                rev_no.show()
                author.hide()
                lT2.hide()
                lT3.setText("Job Purpose")
                lT4.hide()
                lT5.hide()
                pls.show()
                designType.hide()
                job_type.show()
                jobSubType.show()
                lDate.setText("Date Requested")
                lD1.setText("Client Name")
                lD2.setText("Surveyor")
                lD3.setText("Locus Address")
                lDN.setText("PlanBook/Page")
                locus_addr.show()
                lpls.show()
                lbl5.show()
                lbl6.show()
                folder_type.show()
                client_name.show()
                scale.hide()
                mapType.hide()
                mapSubtype.hide()
                docSubtype.hide()
                lbl7.show()
                recCounty.show()
                recOffice.show()
                obtainedFrom.show()
                gbRecording.show()

                lQ.hide()
                lC.hide()
                quality.hide()
                media.hide()
                color.hide()
            else:
                lDate.setText("Date")

        except Exception as e:
            pass


        if objectType.toPlainText() == 'polygon':
            mbl.show()
            lMBL.setText("map_bk_lot(s)")
            objectType.hide()
            pass
        else:
            mbl.hide()
            lMBL.setText("Feature Type")
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
