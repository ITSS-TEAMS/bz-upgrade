 *-----------------------------------------------------------------------------
 *cree le 2019/12/06 par Fahmi Abdeltif(fahmi.abdeltif@banquezitouna.com)
 * Modification History:
* ZIT-UPG-R13-R19 : Converted $INCLUDE TO $INSERT, Variables initialized
 *-----------------------------------------------------------------------------

$PACKAGE EB.BZLocalRoutinesEnq1
     SUBROUTINE BZ.LIST.DL.EXT.ACCEPTEE
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3

     $INSERT I_COMMON
     $INSERT I_EQUATE
     $INSERT I_ENQUIRY.COMMON
     $INSERT I_F.BZ.LI.DECISION.FINANCEMENT
     ID.DF = O.DATA

     FN.DEC = "F.BZ.LI.DECISION.FINANCEMENT"
     F.DEC = ""
     R.DEC = ""
     ERR.DEC = ""
     CALL OPF(FN.DEC,F.DEC)
    
    SEL.LIST=''
    NO.OF.REC=''
    ERR=''
    YERR=''


* $INSERT I_F.AC.CHARGE.REQUEST - Not Used anymore;REF.PARENT EQ ':ID.DF:' AND TYPE.DECISION EQ 3 BY-DSND DATE.DECISION'
     CALL EB.READLIST(CMD,SEL.LIST,"",NO.OF.REC,ERR)
     IF NO.OF.REC NE 0 THEN
         FOR I =1 TO NO.OF.REC
* $INSERT I_F.BZ.COFFRE.LOYER - Not Used anymore;I>
             CALL F.READ(FN.DEC,ID.EXT,R.DEC,F.DEC,YERR)
             STATUT = R.DEC<DEC.FIN.STATUT.DECISION>
             TYPE =R.DEC<DEC.FIN.TYPE.DECISION>

             IF STATUT EQ "NON.ACCEPTEE" THEN
                 O.DATA = ID.EXT
                 GOSUB END.PROGRAM

             END ELSE
        EB.SystemTables.getVFunction().DATA = "F3"
             END
         FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusELSE

         O.DATA ='F3'
     END
     FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusRAM:
 END
