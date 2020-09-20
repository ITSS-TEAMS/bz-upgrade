* Version 007 12/34/56  GLOBUS Release No. G1X.X.XX 29/06/00
*-----------------------------------------------------------------------------
* <Rating>-50</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE T24.S.PM.MENU.STRUCT.WRITE(ID.HELPTEXT.MENU, DESC.HELPTEXT.MENU, DEPTH.HELPTEXT.MENU, TEXT.HELPTEXT.MENU, DL.DEFINE)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*===================================================================================
*===================================================================================
* Modification History :
* dd/mm/yyy    - CD_REFERENCE - author
*              Description of modification.
*-----------------------------------------------------------------------------------
*   Date            who                      Reference            Description
* 07/09/2009   ssenthamil@temenos.com    ODR-2009-09-0006     Initial Version
*-----------------------------------------------------------------------------------
*ZIT-UPG-R13-R19:CHAR converted to CHARX
*               :FM,VM converted to @FM,@VM
*===================================================================================
*
$INSERT I_COMMON
$INSERT I_ENQUIRY.COMMON
$INSERT I_EQUATE
$INSERT I_F.HELPTEXT.MENU
*
* $INSERT I_COMMON - Not Used anymore;================================================================
*
    GOSUB INITIALISE

    IF ID.HELPTEXT.MENU NE '*' THEN
        GOSUB PROCESS
    END

    RETURN
*
*===================================================================================
*
PROCESS:
*
    TEXT.HELPTEXT.MENU := STR(CHARX(9),DEPTH.HELPTEXT.MENU):DESC.HELPTEXT.MENU:CHARX(9)

    M.HELPTEXT.MENU.ID = ID.HELPTEXT.MENU
tmp.R.NEW.FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusPTEXT.MENU.ETEXT = EB.SystemTables.getRNew(FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusPTEXT.MENU, ETEXT)
    CALLEB.SystemTables.getVFunction().HELPTEXT.MENU, M.HELPTEXT.MENU.ID,tmp.R.NEW.FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusPTEXT.MENU.ETEXT
EB.SystemTables.setRNew(FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusPTEXT.MENU, ETEXT, tmp.R.NEW.FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusPTEXT.MENU.ETEXT)
    IF ETEXT THEN
       FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus      PA.CNT = DCOUNT(ID.HELPTEXT.MENU, ',')
        IF PA.CNT GT 1 THEN
            TEXT.HELPTEXT.MENU := FIELD(ID.HELPTEXT.MENU, ' ', 1):CHARX(9):'(Version)'
            DL.DEFINE := 'VERSION>':FIELD(ID.HELPTEXT.MENU, ' ', 1)
        END ELSE
            IF ID.HELPTEXT.MENU[1,4] EQ 'ENQ ' THEN
                TEXT.HELPTEXT.MENU := FIELD(ID.HELPTEXT.MENU, ' ', 2):CHARX(9):'(Enquiry)'
                DL.DEFINE := 'ENQUIRY>':FIELD(ID.HELPTEXT.MENU, ' ', 2)
            END ELSE
                TEXT.HELPTEXT.MENU := ID.HELPTEXT.MENU:CHARX(9):'(Application)'
            END
        END

        TEXT.HELPTEXT.MENU := @FM
        DL.DEFINE := @FM

    END ELSE
        TEXT.HELPTEXT.MENU := ID.HELPTEXT.MENU:CHARX(9):'(Menu)':@FM
        DL.DEFINE := 'HELPTEXT.MENU>':ID.HELPTEXT.MENU:@FM
        PA.CNT = DCOUNT(R.HELPTEXT.MENU<EB.MEN.APPLICATION>, @VM)
        FOR PA.I = 1 TO PA.CNT
            CALL T24.S.PM.MENU.STRUCT.WRITE(R.HELPTEXT.MENU<EB.MEN.APPLICATION, PA.I>, R.HELPTEXT.MENU<EB.MEN.DESCRIPT, PA.I>, DEPTH.HELPTEXT.MENU+1, TEXT.HELPTEXT.MENU,DL.DEFINE)
        NEXT PA.I
    END
*
    RETUREB.DataAccess.Opf*
*=====EB.DataAccess.Opf===========================================================================
*
INITIALISE:
*
    F.HELPTEXT.MENEB.SystemTables.getRNew()'FT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefXT.MENU = 'F.HELPTEXT.MENU'
    EB.DataAccess.FRead.HELPTEXT.MENU, F.HELPTEXT.MENU)
*
    RETURN
*===================================================================================
END
