*-----------------------------------------------------------------------------
*cree le 2019/12/06 par Fahmi Abdeltif(fahmi.abdeltif@banquezitouna.com)
*-----------------------------------------------------------------------------
*Modification History:
*-----------------------------------------------------------------------------

*ZIT-UPG-R13-R19 : VARIABLE INITIALISED
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.LIST.DL.RENOUV.ACCEPTEE
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3

*ZIT-UPG-R13-R19/S
    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.BZ.LI.DECISION.FINANCEMENT
*ZIT-UPG-R13-R19/E	
	
    ID.DF = O.DATA

    FN.DEC = "F.BZ.LI.DECISION.FINANCEMENT"
    F.DEC = ""
    R.DEC = ""
    ERR.DEC = ""
* $INSERT I_COMMON - Not Used anymore;F.DEC)
	
	SEL.LIST  = ''
	NO.OF.REC = ''
	ERR       = ''
	YERR      = ''
	
	
    CMD='SELECT ':FN.DEC:' WITH REF.PARENT EQ ':ID.DF:' AND TYPE.DECISION EQ 2 BY-DSND DATE.DECISION'
    CALL EB.READLIST(CMD,SEL.LIST,"",NO.OF.REC,ERR)
    IF NO.OF.REC NE 0 THEN
        FOR I =1 TO NO.OF.REC
            ID.RENOUV = SEL.LIST<I>
            CALL F.READ(FN.DEC,ID.RENOUV,R.DEC,F.DEC,YERR)
            STATUT = R.DEC<DEC.FIN.STATUT.DECISION>
            TYPE =R.DEC<DEC.FIN.TYPE.DECISION>

        EB.SystemTables.getVFunction()TUT EQ "NON.AEB.SystemTables.getVFunction()HEN
             FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusNOUV
                GOSUB END.PROGRAM

   FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus
                O.DATA = "F3"
            END
        NEXT I
    END ELSE

        O.DATA ='F3'
    END
    RETURN
END.PROGRAM:
END
