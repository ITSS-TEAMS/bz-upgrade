*-----------------------------------------------------------------------------
* <Rating>0</Rating>
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------

*ZIT-UPG-R13-R19: NO CHANGES
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.CHEQUE.ISSUE.RESTRICT(ENQ.DATA)
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
*-------------------------------------------------------------
$INSERT I_COMMON             
$INSERT I_EQUATE             
$INSERT I_ENQUIRY.COMMON     
$INSERT I_F.USER 
*-------------------------------------------------------------
    FN.USER="F.USER"
    F.USER=""
    CALL OPF(FN.USER,F.USER)

    DEPART.CODE = R.USER<EB.USE.DEPARTMENT.CODE>
* $INSERT I_COMMON - Not Used anymore;HEN
* $INSERT I_EQUATE - Not Used anymore;1> = 'UNITE.GESTION'
* $INSERT I_ENQUIRY.COMMON - Not Used anymore;'
* $INSERT I_F.AC.CHARGE.REQUEST - Not Used anymore;ODE
    END ELSE
        ENQ.DATA<2,1> = 'UNITE.GESTION'
        ENQ.DATA<3,1> = 'EQ'
* $INSERT I_F.BZ.COFFRE.LOYER - Not Used anymore;CODE
    END

    RETURN
END
