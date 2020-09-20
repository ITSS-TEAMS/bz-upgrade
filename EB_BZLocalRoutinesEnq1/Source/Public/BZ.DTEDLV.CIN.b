* Modification History :
*-----------------------
* ZIT-UPG-R13-R19      : VM CHANGED TO @VM  
* ----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.DTEDLV.CIN
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*------------------------------------------------------------
    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.CUSTOMER
*------------------------------------------------------------
    GOSUB INIT
    GOSUB MAIN
    RETURN
* ------------------------------------------------------------
INIT:
    FN.CUSTOMER='F.CUSTOMER'
    F.CUSTOMER=''
    ID.CUSTOMER=O.DATA

    R.CUSTOMER=''
    ERR.CUSTOMER=''
    CALL OPF (FN.CUSTOMER, F.CUSTOMER)
* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;
    RETURN
* $INSERT I_F.AC.CHARGE.REQUEST - Not Used anymore;----------------------------
MAIN:

    CALL F.READ(FN.CUSTOMER,ID.CUSTOMER,R.CUSTOMER,F.CUSTOMER,ERR.CUSTOMER)
* $INSERT I_F.BZ.COFFRE.LOYER - Not Used anymore;.CUS.LEGAL.ID>
    Y.LEGAL.DOC.NAME = R.CUSTOMER<EB.CUS.LEGAL.DOC.NAME>
    Y.LEGAL.ISS.DATE = R.CUSTOMER<EB.CUS.LEGAL.ISS.DATE>
    Y.NBRE.LEGAL.DOC.NAME = DCOUNT(Y.LEGAL.DOC.NAME,@VM)
    Y.NBR.LEGAL.IDS = DCOUNT(Y.LEGAL.IDS,@VM)
    Y.NBRE.DTE.DLV.CIN = DCOUNT(Y.LEGAL.ISS.DATE,@VM)
    FOR I=1 TO Y.NBR.LEGAL.IDS
        IF Y.LEGAL.DOC.NAME<1,I> EQ 'CIN' THEN
            Y.DTE.DLV.CIN=Y.LEGAL.ISS.DATE<1,I>
        END
    NEXTEB.SystemTables.getVFunction() Y.DTE.DLV.CIN THEN
        O.DATA= Y.DTFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusD
    ELSE
        O.DATA =''
    END
    RETURN
