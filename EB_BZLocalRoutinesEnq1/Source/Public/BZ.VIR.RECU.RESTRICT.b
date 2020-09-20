*-----------------------------------------------------------------------------
* <Rating>0</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.VIR.RECU.RESTRICT(ENQ.DATA)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*-------------------------------------------------------------
* @author BounouaraFehmi
*------------------------------------------------------------------------
* 12 / 01 / 2010
*-----------------------------------------------------------------------------
*Modification History:

*ZIT-UPG-R13-R19 : VM CHANGED TO @VM; 
*-----------------------------------------------------------------------------
*ZIT-UPG-R13-R19/S
$INSERT I_COMMON
$INSERT I_EQUATE
$INSERT I_ENQUIRY.COMMON
$INSERT I_F.USER
*ZIT-UPG-R13-R19/E

    FN.USER="F.USER"
    F.USER=""
    CALL OPF(FN.USER,F.USER)

    NOMBRE=0
* $INSERT I_ENQUIRY.COMMON - Not Used anymore;>,@VM)
    NOMBRE=NOMBRE+1

    DEPART.CODE = R.USER<EB.USE.DEPARTMENT.CODE>

* $INSERT I_F.BZ.COFFRE.LOYER - Not Used anymore;.GESTION'
    ENQ.DATA<3,NOMBRE> = 'EQ'
    ENQ.DATA<4,NOMBRE> = DEPART.CODE
    RETURN
END
