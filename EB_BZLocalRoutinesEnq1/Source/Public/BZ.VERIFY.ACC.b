*-----------------------------------------------------------------------------
* <Rating>0</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.VERIFY.ACC(ENQ.DATA)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*-------------------------------------------------------------
* @author BenOthmenZeki
*-----------------------------------------------------------------------------
*Modification History:

*ZIT-UPG-R13-R19 : NO CHANGES
*-----------------------------------------------------------------------------
*ZIT-UPG-R13-R19/S
$INSERT I_COMMON
$INSERT I_EQUATE
$INSERT I_ENQUIRY.COMMON
$INSERT I_F.ACCOUNT
*ZIT-UPG-R13-R19/E
*-------------------------------------------------------------

    FN.ACCOUNT='F.ACCOUNT'
    F.ACCOUNT=''
    R.ACCOUNT=''
    ACCOUNT.ERR=''
* $INSERT I_COMMON - Not Used anymore;A<4,1>

* $INSERT I_ENQUIRY.COMMON - Not Used anymore;CCOUNT)

    CALL F.READ(FN.ACCOUNT,NUM.AC,R.ACCOUNT,F.ACCOUNT,ACCOUNT.ERR)

    CATEGORIE = R.ACCOUNT<AC.CATEGORY>

    IF CATEGORIE LT 10000 THEN
        ENQ.DATA<4,1> = 0

    END

    RETURN
END
