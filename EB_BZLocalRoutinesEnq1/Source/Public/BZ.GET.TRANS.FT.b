*---------------------------------------------
*@author Abdelmonaam Mastouri le 18/04/2016
*<abdelmonaam.mastouri@banquezitouna.com>
*---------------------------------------------    
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.GET.TRANS.FT  
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*------------------------------------------------------------	
*ZIT-UPG-R13-R19   :  removed BP's and changed INCLUDE to INSERT                   
*                     FM,VM converted to @FM,@VM , CONVERT to CHANGE          
*-------------------------------------------------------------	

    $INSERT I_COMMON
    $INSERT I_EQUATE  
    $INSERT I_ENQUIRY.COMMON  
    $INSERT I_F.PW.PROCESS
    $INSERT I_F.PW.ACTIVITY.TXN    

    FN.PW='F.PW.PROCESS'
    F.PW=''
    R.PW=''
    ERR1=''

    FN.ACT.TXN='F.PW.ACTIVITY.TXN'  
    F.ACT.TXN=''
    R.ACT.TXN=''
    ERR1=''

    CALL OPF (FN.PW,F.PW)
    CALL OPF (FN.ACT.TXN,F.ACT.TXN)


    PW.ID = O.DATA
  
    CALL F.READ(FN.PW,PW.ID,R.PW,F.PW,ERR1)
    ID.ACTIVITE.TXN=R.PW<PW.PROC.ACTIVITY.TXN>
    CHANGE @VM TO @FM IN ID.ACTIVITE.TXN
    NBR.ACT=DCOUNT(ID.ACTIVITE.TXN,@FM)
    FOR I=1 TO NBR.ACT

        CALL F.READ(FN.ACT.TXN,ID.ACTIVITE.TXN<I>,R.ACT.TXN,F.TXN.ACT,ERR.ACT.TXN)
        V.ACTIVITE=R.ACT.TXN<PW.ACT.TXN.ACTIVITY>
* IF  V.EB.SystemTables.getVFunction()EQ 'SAISIE.ISEB.SystemTables.getVFunction()Q.IMMO' THEN
    FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusE  EQ 'SAISIE.IS.PAYFRS.CHQ.IMMO' OR  V.ACTIVIFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus.PAYFRS.VIR.IMMO' OR  V.ACTIVITE  EQ 'SAISIE.IS.PAYFRS.INT.IMMO' THEN

            V.REF=R.ACT.TXN<PW.ACT.TXN.TRANSACTION.REF>
            O.DATA=V.REF
        END ELSE      
            IF V.REF EQ '' THEN  
                O.DATA=V.REF

            END
        END

    NEXT I

    RETURN
END
