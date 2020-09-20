*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R13-R19    : NO CHANGES        
*-----------------------------------------------------------------------------
* <Rating>-1</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.FORM.ID.PREL.REPRIS
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*-----------------------------------------------------------------------------
* Modification History :                                                      
*ZIT-UPG-R09-R13  : $INSERT BP to $INCLUDE BZDEV.BP                           
*-----------------------------------------------------------------------------
$INSERT I_COMMON
$INSERT I_EQUATE
$INSERT I_ENQUIRY.COMMON
*ZIT-UPG-R09-R13/S
*$INSERT BP I_F.BZ.MDP.PREL.EMIS
$INSERT I_F.BZ.MDP.PREL.EMIS
*ZIT-UPG-R09-R13/E

    FN.PREL.EMIS='F.BZ.MDP.PREL.EMIS'
    F.PREL.EMIS=''
	REG.REC =''
	ERR =''

* $INSERT I_EQUATE - Not Used anymore;
* * $INSERT I_ENQUIRY.COMMON - Not Used anymore;EST - Not Used anymore;EMIS)
    CALL F.READ(FN.PREL.EMIS,PREL.ID,REG.REC,F.PREL.EMIS,ERR)
    NUM.PREL=REG.REC<PREL.EMIS.NUM.PREL>
    REF.DOM=REG.REC<PREL.EMIS.REF.DOM>
* $INSERT I_F.BZ.COFFRE.LOYER - Not Used anymore;EMIS.DATE.ECHEANCE>

    CODE.DEST=REG.REC<PREL.EMIS.RIB.PAYEUR>[1,2]

    IF CODE.DEST NE 25 THEN
        IDENTIF=TODAY:NUM.PREL:REF.DOM:DATE.ECHEANCE
    END ELSE
        IDENTIF=PREL.ID
    END
    R.RECORD<26>=IDENTIF

    RETURN

END
