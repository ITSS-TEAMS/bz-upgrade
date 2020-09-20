* Modification History
*---------------------                                                      
*ZIT_UPG_R13_TO_R19 : NO CHANGES                          
*---------------------------------------------
*@author Abdelmonaam Mastouri le 18/04/2016
*<abdelmonaam.mastouri@banquezitouna.com>
*---------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.GET.TRANS.IS
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

    CALL OPF (FN.PW,F.PW)
* $INSERT I_F.AC.CHARGE.REQUEST - Not Used anymore;N)
    ID.PW = O.DATA
	SEL.LISTS =''
	NO.SEL =''
	SEL.ERR =''
    SEL.CMD = "SELECT ":FN.ACT.TXN : " WITH PROCESS EQ " : ID.PW
    CALL EB.READLIST(SEL.CMD,SEL.LISTS,'',NO.SEL,SEL.ERR)

    IF SEL.LISTS THEN

        FOR I = 1 TO NO.SEL
            REMOVE SEL.LIST FROM SEL.LISTS SETTING LIST.POS
            CALL F.READ(FN.ACT.TXN,SEL.LIST,R.ACT.TXN,F.TXN.ACT,ERR.ACT.TXN)
            V.ACTIVITE=R.ACT.TXN<PW.ACT.TXN.ACTIVITY>



* IF  V.ACTIVITE  EQ 'BZISB.AUHCOMMANDEBIEN' THEN
  FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusCTIVITE  EQ 'BZISB.AUHCOMMANDEBIEN' OR V.ACTIVFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusTHCOMMANDEBIENCRP' THEN
                V.REF=R.ACT.TXN<PW.ACT.TXN.TRANSACTION.REF>
                O.DATA=V.REF
            END ELSE
                IF V.REF EQ '' THEN
                    O.DATA=V.REF

                END

            END

        NEXT I
    END
    RETURN
END
