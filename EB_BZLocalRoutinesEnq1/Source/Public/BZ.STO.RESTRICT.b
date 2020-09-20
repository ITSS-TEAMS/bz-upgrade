* Modification History :
*-----------------------
*ZIT-UPG-R13-R19  : NO CHANGES
*-----------------------------------------------------------------------------
* <Rating>0</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.STO.RESTRICT(ENQ.DATA)
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
*-------------------------------------------------------------
$INSERT I_COMMON
$INSERT I_EQUATE
$INSERT I_ENQUIRY.COMMON
$INSERT I_F.USER
$INSERT I_F.STANDING.ORDER

    FN.STO='F.STANDING.ORDER'
    F.STO=''
STO.REC =''
ERR.STO =''
    CALL OPF(FN.STO,F.STO)

    IDENTIFIANT=ENQ.DATA<4,1>

* $INSERT I_EQUATE - Not Used anymore;TO,IDENTIFIANT,STO.REC,F.STO,ERR.STO)

* $INSERT I_F.AC.CHARGE.REQUEST - Not Used anymore;END.DATE>

    IF DATE.FIN EQ "" THEN

    END ELSE
        ENQ.DATA<2,2> = 'CURRENT.END.DATE'
        ENQ.DATA<3,2> = 'GT'
        ENQ.DATA<4,2> = TODAY
    END

    RETURN

END
