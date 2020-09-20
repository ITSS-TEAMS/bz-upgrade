*-----------------------------------------------------------------------------
* <Rating>0</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.LI.PRODUCT.RESTRICT(ENQ.DATA)
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
* Modification History :
*-----------------------
*ZIT-UPG-R13-R19 :  removed BP's and changed INCLUDE to INSERT         
*-------------------------------------------------------------              
    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON    
    $INSERT I_F.USER
    $INSERT I_F.BZ.LI.DECISION.FINANCEMENT
*-------------------------------------------------------------
    TYPE.LIMITE = R.NEW(DEC.FIN.NIVEAU.LIMITE)<1,AV>

    IF TYPE.LIMITE EQ "2" THEN

        ENQ.DATA<2,-1> = 'NIVEAU.LIMIT'
        ENQ.DATA<3,-1> = 'EQ'
* $INSERT I_COMMON - Not Used anymore;1> = '1'
    END ELSE
* $INSERT I_ENQUIRY.COMMON - Not Used anymore;VEAU.LIMIT'
        ENQ.DATA<3,-1> = 'EQ'
        ENQ.DATA<4,-1> = '1 0'
    END

    RETURN
END
