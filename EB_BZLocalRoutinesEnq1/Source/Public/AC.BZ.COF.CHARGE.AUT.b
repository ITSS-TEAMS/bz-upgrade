* @ValidationCode : MjoyNzE3MjA3Nzk6Q3AxMjUyOjE2MDA2MTMxMDg4MjA6QWRtaW5pc3RyYXRldXI6LTE6LTE6MDowOmZhbHNlOk4vQTpSMjBfU1A0LjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 20 Sep 2020 15:45:08
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : Administrateur
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : N/A
* @ValidationInfo : Bypass GateKeeper : false
* @ValidationInfo : Compiler Version  : R20_SP4.0
*-----------------------------------------------------------------------------
* <Rating>-30</Rating>
*-----------------------------------------------------------------------------
*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13  : $INSERT BP to $INCLUDE BZDEV.BP
*ZIT-UPG-R13-R19     :  No changes.
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
SUBROUTINE AC.BZ.COF.CHARGE.AUT
    
    $USING EB.API
    $USING EB.SystemTables
    $USING EB.Reports
    $USING EB.DataAccess
    $USING EB.ErrorProcessing
    $USING EB.BZLocalTable1
    $USING EB.BZLocalTable2
    $USING EB.BZLocalTable3
    $USING FT.AdhocChargeRequests

    * $INSERT I_COMMON - Not Used anymore;
    * $INSERT I_EQUATE - Not Used anymore;
    * $INSERT I_ENQUIRY.COMMON - Not Used anymore;
    * $INSERT I_F.AC.CHARGE.REQUEST - Not Used anymore;
    
*ZIT-UPG-R09-R13/S
*    $INSERT BP I_F.BZ.COFFRE.LOYER
    * $INSERT I_F.BZ.COFFRE.LOYER - Not Used anymore;
*ZIT-UPG-R09-R13/E




    GOSUB INITIALISATION
    GOSUB OPENFILES


    IF (EB.SystemTables.getVFunction() EQ "I") OR (EB.SystemTables.getVFunction() EQ "A" AND EB.SystemTables.getRNew(FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus) EQ "INAU") OR ( EB.SystemTables.getVFunction() EQ "A" AND EB.SystemTables.getRNew(FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus) EQ "INAO") THEN

        GOSUB PROCESS

    END


RETURN



INITIALISATION:

    FN.LOYER = "F.BZ.COFFRE.LOYER"
    F.LOYER = ''
    R.LOYER= ''
    ERR.LOYER = ''

    FN.CHG = "F.AC.CHARGE.REQUEST"
    F.CHG = ''
    R.CHG= ''
    ERR.CHG = ''



RETURN

OPENFILES:

    EB.DataAccess.Opf(FN.LOYER,F.LOYER)
    EB.DataAccess.Opf(FN.CHG,F.CHG)
RETURN

PROCESS:

    V.REF.LOYER = EB.SystemTables.getRNew(FT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRef)

    EB.DataAccess.FRead(FN.LOYER,V.REF.LOYER,R.LOYER,F.LOYER,ERR.LOYER)


    IF R.LOYER   THEN
        Y.REF.LOYER=R.LOYER<EB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyer>
        IF Y.REF.LOYER THEN
            EB.SystemTables.setE("LOYER-Duplicate ":Y.REF.LOYER)
        END ELSE
            R.LOYER<EB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyer>  = EB.SystemTables.getIdNew()

            EB.DataAccess.FWrite(FN.LOYER,V.REF.LOYER,R.LOYER)
        END

    END ELSE
        EB.SystemTables.setAf(FT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRef)
        EB.SystemTables.setE("Loyer inexistant")

    END


RETURN
END
