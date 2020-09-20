*-------------------------------------------------------------
*----------------------------------------------------------------------
* <Rating>-30</Rating>
*----------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.IS.REST.FICH.REMET(ENQ.DATA)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*-------------------------------------------------------------
* @author azdadou@temenos.com
*
*
*------------------------------------------------------------------------
* 25 / 04 / 2010
*----------------------------------------------------------------------
* Modification History :
*-----------------------
*ZIT-UPG-R13-R19 : VM, FM CHANGED TO @VM, @FM;
*----------------------------------------------------------------------
*ZIT-UPG-R13-R19/S
$INSERT I_COMMON
$INSERT I_EQUATE
$INSERT I_ENQUIRY.COMMON
*ZIT-UPG-R13-R19/E
*-------------------------------------------------------------
    GOSUB MAIN
    RETURN
* $INSERT I_EQUATE - Not Used anymore;------------------------------------------
MAIN:
    NBR.LOTS = 0
    V.VM = DCOUNT(ENQ.DATA<2>,@VM)
    FOR I = 1 TO V.VM
        IF ENQ.DATA<2,I> EQ 'LOT.PROCESS.ID' THEN
* $INSERT I_F.BZ.COFFRE.LOYER - Not Used anymore;A<4,I>
            NBR.LOTS = DCOUNT(LIST.LOTS,@VM)
            CHANGE @VM TO @FM IN LIST.LOTS
            LOT.PRO = LIST.LOTS<1> : "..."
            FOR J = 2 TO NBR.LOTS
                LOT.PRO := " " : LIST.LOTS<J> : "..."
            NEXT J
            ENQ.DATA<3,I> = "LK"
            ENQ.DATA<4,I> = LOT.PRO
            I = V.VM
        EB.SystemTables.getVFunction()EXT I
    RETURN
END
