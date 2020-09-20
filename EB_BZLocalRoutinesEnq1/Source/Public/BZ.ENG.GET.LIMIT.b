*---------------------------------------------
*@author Abdelmonaam Mastouri
*<abdelmonaam.mastouri@banquezitouna.com>
* Modification History :  
*ZIT-UPG-R13-R19     :  No Changes.
*---------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.ENG.GET.LIMIT
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

* $INSERT I_EQUATE - Not Used anymore;F.PW)
* $INSERT I_ENQUIRY.COMMON - Not Used anymore;CT.TXN)
    ID.PW = O.DATA
    SEL.CMD = "SELECT ":FN.ACT.TXN : " WITH PROCESS EQ " : ID.PW
    CALL EB.READLIST(SEL.CMD,SEL.LISTS,'',NO.SEL,SEL.ERR)

    IF SEL.LISTS THEN

        FOR I = 1 TO NO.SEL
            REMOVE SEL.LIST FROM SEL.LISTS SETTING LIST.POS
            CALL F.READ(FN.ACT.TXN,SEL.LIST,R.ACT.TXN,F.TXN.ACT,ERR.ACT.TXN)
            V.ACTIVITE=R.ACT.TXN<PW.ACT.TXN.ACTIVITY>
            IF  (V.ACTIVITE  EQ 'SAISIE.IS.LIMIT.SEC') OR (V.ACTIVITE  EQ 'SAISIE.IS.LIMIT.UNSEC') THEN
                V.REF=R.ACT.TXN<PW.ACT.TXN.TRANSACTION.REF>
                O.DATA=V.REF
            END

            IF  (V.ACTIVITE  NE 'SAISIE.IS.LIMIT.SEC') ORFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus'SAISIE.IS.LIMIT.UNSEC') THEN
               FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus          END



        NEXT I
    END
    RETURN
END
