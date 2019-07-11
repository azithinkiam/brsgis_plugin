--------
v4.d (PRD) || 2019.10.JUL
--------

BUGFIX: exception occurs when parcel has no prop_loc or proplocnum data available (southport).  added another handler to insert a blank address value as-needed.

                try:
                    address = str(int(parcel["proplocnum"])) + ' ' + str(parcel["prop_loc"])

                except Exception:
                    address = ''
                    pass

--------
v4.a2 (PRD) || 2019.09.JUL
--------

MILESTONE UPDATE: legacy jobs imported in PRD, import tools complete, auto-populate locus added, portrait/landscape choice for mapView added, updated SOW reflects current overall status.

--------
v3.b2 (PRD) || 2019.03.JUN
--------

v3 INSTALLER published:

Z:\0 - Settings\GIS\QGIS\Plugins\BRSGIS.Install

SHORTCUT: "INSTALL QGIS 3.0.2 & BRSGIS_plugin (LAN).lnk"

--------
v2.d (PRD) || 2019.01.JUN
--------

2d. JOB CREATION HOUSEKEEPING - no feature is created, but job number is considered used by database...

--------
v2.c (PRD) || 2019.01.JUN
--------

2a. NEW LAYOUT (SiteMap) added

2b. LAYER VISIBILITY by job_type (MapView)

2b.i   SDP

2b.ii  MIS

2b.iii BRSDP

2c. ERROR CHECKING - all obvious error paths handled via exceptions, rework likely required...

--------

v2 will be final once 2d. JOB CREATION HOUSEKEEPING is implemented - eta 07.JUN

-t.
