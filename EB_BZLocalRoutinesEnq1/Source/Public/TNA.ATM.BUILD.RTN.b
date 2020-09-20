*-----------------------------------------------------------------------------
* <Rating>59</Rating>
*Modification History : 
*ZIT-UPG-R13-R19   : Arithmetic operators converted to operands.
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE TNA.ATM.BUILD.RTN(ENQ.DATA)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
$INSERT  I_COMMON
$INSERT  I_EQUATE
$INSERT  I_ENQUIRY.COMMON
$INSERT  I_F.FUNDS.TRANSFER
    GOSUB INIT
    GOSUB OPENFILES
    GOSUB PROCESS
    RETURN
INIT:
    FN.FT='F.FUNDS.TRANSFER'
    F.FT=''
    LISTEID=''
    RETURN

OPENFILES:
    CALL OPF(FN.FT,F.FT)
    RETURN
PROCESS:
* $INSERT I_EQUATE - Not Used anymore;":FN.FT:" WITH CARD.TXN.DETAIL MATCHES VISA "
* $INSERT I_ENQUIRY.COMMON - Not Used anymore;,SEL.LIST,'',NO.OF.REC,RET.CODE)
    NBRE.TOT=0
    LOOP
        REMOVE ID.CUS FROM SEL.LIST SETTING POSITION
    WHILE ID.CUS:POSITION
* $INSERT I_F.BZ.COFFRE.LOYER - Not Used anymore;            LISTEID=ID.CUS
        END ELSE
            LISTEID=LISTEID:" ":ID.CUS
        END
    REPEAT

    LOCATE '@ID' IN ENQ.DATA<2,1> SETTING POS ELSE NULL
    ENQ.DATA<2,POS>='@ID'
    ENQ.DATA<3,POS>='EQ'
    ENQ.EB.SystemTables.getVFunction()>=LISTEID

    RETURN

    RETURN
END
