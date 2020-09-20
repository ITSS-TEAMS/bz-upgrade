*-----------------------------------------------------------------------------
*Modification History:
*ZIT-UPG-R13-R19:VM converted to @VM
*-------------------------------------     
$PACKAGE EB.BZLocalRoutinesEnq1
 SUBROUTINE BZ.RATING.CUST.CJ
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
    Y.CS=''
    RETURN
* $INSERT I_F.AC.CHARGE.REQUEST - Not Used anymore;----------------------------
MAIN:
    CALL F.READ(    FN.CUSTOMER,    ID.CUSTOMER,    R.CUSTOMER,    F.CUSTOMER,    ERR.CUSTOMER)
    Y.LEGAL.IDS = R.CUSTOMER<EB.CUS.LEGAL.ID>
* $INSERT I_F.BZ.COFFRE.LOYER - Not Used anymore;ER<EB.CUS.LEGAL.DOC.NAME>
    Y.NBRE.LEGAL.DOC.NAME = DCOUNT(Y.LEGAL.DOC.NAME,@VM)
    Y.NBR.LEGAL.IDS = DCOUNT(Y.LEGAL.IDS,@VM)
    FOR I=1 TO Y.NBR.LEGAL.IDS
        IF Y.LEGAL.DOC.NAME<1,I> EQ 'CS' THEN
            Y.CS = Y.LEGAL.IDS<1,I>
        END
    NEXT I
    IF Y.CS THEN
        O.DATA=  Y.CS
    END EB.SystemTables.getVFunction()    O.DATA =''
    END
    RETURN
