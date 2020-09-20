* Modification History:
* ZIT-UPG-R13-R19 : Converted $INCLUDE TO $INSERT, Converted VM to @VM

$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.RATING.CUST.CIN
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
    Y.LEGAL.IDS =''
    Y.CIN=''
RETURN
* $INSERT I_EQUATE - Not Used anymore;-----------------------------------------
MAIN:
* $INSERT I_F.AC.CHARGE.REQUEST - Not Used anymore;   ID.CUSTOMER,    R.CUSTOMER,    F.CUSTOMER,    ERR.CUSTOMER)
    Y.LEGAL.IDS = R.CUSTOMER<EB.CUS.LEGAL.ID>
    Y.LEGAL.DOC.NAME = R.CUSTOMER<EB.CUS.LEGAL.DOC.NAME>
    Y.NBRE.LEGAL.DOC.NAME = DCOUNT(Y.LEGAL.DOC.NAME,@VM)
* $INSERT I_F.BZ.COFFRE.LOYER - Not Used anymore;LEGAL.IDS,@VM)
    FOR I=1 TO Y.NBR.LEGAL.IDS
        IF Y.LEGAL.DOC.NAME<1,I> EQ 'CIN' THEN
            Y.CIN = Y.LEGAL.IDS<1,I>
        END
    NEXT I

    IF Y.CIN THEN
        O.DATA=  Y.CIN
    END ELSE
        EB.SystemTables.getVFunction()
    END
RETURN

END
