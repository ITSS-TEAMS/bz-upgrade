*---------------------------------------------
*@author Abdelmonaam Mastouri le 18/04/2016
*<abdelmonaam.mastouri@banquezitouna.com>

* Modification History:
* ZIT-UPG-R13-R19 : Variables initialized
*---------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.ENG.GET.DATA
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
    SEL.CMD = "SELECT ":FN.ACT.TXN : " WITH PROCESS EQ " : ID.PW
    NO.SEL=''
    SEL.ERR=''
    CALL EB.READLIST(SEL.CMD,SEL.LISTS,'',NO.SEL,SEL.ERR)

    IF SEL.LISTS THEN

        FOR I = 1 TO NO.SEL
            REMOVE SEL.LIST FROM SEL.LISTS SETTING LIST.POS
            ERR.ACT.TXN=''
            CALL F.READ(FN.ACT.TXN,SEL.LIST,R.ACT.TXN,F.TXN.ACT,ERR.ACT.TXN)
            V.ACTIVITE=R.ACT.TXN<PW.ACT.TXN.ACTIVITY>
        EB.SystemTables.getVFunction()ACTIVITE EQ 'EB.SystemTables.getVFunction()IS.PAYFRS.VIEB.SystemTables.getRNew()RFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusAUTHORISE.IS.PAYFREB.SystemTables.getVFunction() (V.ACTIVITEEB.SystemTables.getRNew()AFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusS.CHQ') THEN
                V.REF=R.ACT.TXN<PW.ACT.TXN.TRANSACTION.REF>
                O.DATA=V.REF
            END ELSE

                IF V.REF EQ '' THEN
                    O.DATA=""

                END
            END
        NEXT I
    END
    RETURN
END
