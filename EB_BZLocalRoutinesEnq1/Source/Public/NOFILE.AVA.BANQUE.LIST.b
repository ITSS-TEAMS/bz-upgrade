*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R13-R19   : NO CHANGES
*-----------------------------------------------------------------------------*
* <Rating>-41</Rating>
*-----------------------------------------------------------------------------*
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE NOFILE.AVA.BANQUE.LIST(TABLEAU)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3

$INSERT I_F.BC.SORT.CODE
$INSERT I_COMMON
$INSERT I_EQUATE
$INSERT I_ENQUIRY.COMMON

    GOSUB INITIALISATION
    GOSUB OPEN.FILES
    GOSUB PROCESS

    RETURN

*----------------------------------------------------------------------------*
INITIALISATION:
*----------------------------------------------------------------------------*

* $INSERT I_COMMON - Not Used anymore;RT.CODE'
    F.BC = ''

* $INSERT I_F.AC.CHARGE.REQUEST - Not Used anymore;TTING ID.POS THEN
        IDENTIF = D.RANGE.AND.VALUE<ID.POS>
    END

    RETURN

*----------------------------------------------------------------------------*
OPEN.FILES:
*----------------------------------------------------------------------------*
    CALL OPF(FN.BC,F.BC)
    RETURN
*----------------------------------------------------------------------------*
PROCESS:
*----------------------------------------------------------------------------*
SEL.LISTEB.SystemTables.getVFunction()EL =''
SEL.ERR =''
    SELECTION = "SELFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusH @ID NE 25 AND @ID NE 00 AND BQ.TYPE EQ '' BYFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusALL EB.READLIST(SELECTION,SEL.LIST,'',NO.SEL,SEL.ERR)

    LOOP

        REMOVE IDENTIF FROM SEL.LIST SETTING POS UNTIL IDENTIF = ''
R.BC =''
ERR.BC =''
        CALL F.READ(FN.BC,IDENTIF,R.BC,F.BC,ERR.BC)

        Y.ID=IDENTIF
        Y.NAME=R.BC<EB.BSC.NAME>

        TABLEAU<-1>=Y.ID:"*":Y.NAME
    REPEAT


    RETURN


END
