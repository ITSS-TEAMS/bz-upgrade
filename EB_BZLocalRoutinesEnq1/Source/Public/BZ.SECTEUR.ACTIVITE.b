*-----------------------------------------------------------------------------
* <Rating>0</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.SECTEUR.ACTIVITE(ENQ.DATA)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3

*-----------------------------------------------------------------------------
*Modification History:

*ZIT-UPG-R13-R19 : GET.LOC.REF TO MULTI.GET.LOC.REF
*-----------------------------------------------------------------------------

*ZIT-UPG-R13-R19/S
$INSERT I_COMMON
$INSERT I_EQUATE
$INSERT I_ENQUIRY.COMMON
$INSERT I_F.FUNDS.TRANSFER
$INSERT I_F.USER
$INSERT I_F.CUSTOMER

*    CALL GET.LOC.REF("CUSTOMER","BZ.ACTIV",POS)
    YAPPLICATION.NAME = "CUSTOMER"
    YFIELD.NAME ="BZ.ACTIV"
    LREF.POS = ''
* $INSERT I_COMMON - Not Used anymore;OC.REF(YAPPLICATION.NAME, YFIELD.NAME, LREF.POS)
* $INSERT I_EQUATE - Not Used anymore;, 1>
*ZIT-UPG-R13-R19/E

    ACTIVITE=R.NEW(EB.CUS.LOCAL.REF)<1,POS>

    ENQ.DATA<2,1> = 'BZ.ACTIV'
    ENQ.DATA<3,1> = 'EQ'
    ENQ.DATA<4,1> = ACTIVITE
    RETURN
END
