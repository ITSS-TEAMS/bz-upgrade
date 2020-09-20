*---------------------------------------------
*@author Abdelmonaam Mastouri le 18/04/2016
*<abdelmonaam.mastouri@banquezitouna.com>
*---------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.GET.TRANS.LD
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
* $INSERT I_F.AC.CHARGE.REQUEST - Not Used anymore;N)
    ID.PW = O.DATA
    SEL.CMD = "SELECT ":FN.ACT.TXN : " WITH PROCESS EQ " : ID.PW
	SEL.LISTS = '' ; NO.SEL = '' ; SEL.ERR = ''  
* $INSERT I_F.BZ.COFFRE.LOYER - Not Used anymore;L.LISTS,'',NO.SEL,SEL.ERR)

    IF SEL.LISTS THEN

        FOR I = 1 TO NO.SEL
            REMOVE SEL.LIST FROM SEL.LISTS SETTING LIST.POS
            CALL F.READ(FN.ACT.TXN,SEL.LIST,R.ACT.TXN,F.TXN.ACT,ERR.ACT.TXN)
            V.ACTIVITE=R.ACT.TXN<PW.ACT.TXN.ACTIVITY>

            IF  V.ACTIVITE  EQ 'BZISB.AUTHCONTRAT' THEN

                V.REF=R.ACT.TXN<PW.ACT.TXN.TRANSACTION.REFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus   O.DATA=V.REF

            END ELSE

   FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus.REF EQ '' THEN
                    O.DATA=V.REF

                END


            END
        NEXT I
    END
    RETURN
END
