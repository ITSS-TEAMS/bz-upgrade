*---------------------------------------------
*@author Abdelmonaam Mastouri le 18/04/2016
*<abdelmonaam.mastouri@banquezitouna.com> 
*ZIT-UPG-R13-R19     :  No Changes.
*---------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.FILTRE.ID.PROCESS(ENQ.DATA)
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

    FN.ACT.TXN = 'F.PW.ACTIVITY.TXN'
    F.ACT.TXN = ''


    CALL OPF (FN.PW,F.PW)
* $INSERT I_COMMON - Not Used anymore;TXN,F.ACT.TXN)
* $INSERT I_EQUATE - Not Used anymore;A<4,1>

* $INSERT I_F.AC.CHARGE.REQUEST - Not Used anymore;
        ENQ.DATA<2,1> = '@ID'
        ENQ.DATA<3,1> = 'EQ'
* $INSERT I_F.BZ.COFFRE.LOYER - Not Used anymore;
    END ELSE
        SEL.CMD = "SELECT ":FN.ACT.TXN : " WITH TRANSACTION.REF EQ " : PW.ID

        CALL EB.READLIST(SEL.CMD,SEL.LIST,'',NO.SEL,SEL.ERR)
        CALL F.READ(FN.ACT.TXN,SEL.LIST<1>,R.ACT.TXN,F.TXN.ACT,ERR.ACT.TXN)
        V.PROCESS=R.ACT.TXN<PW.ACT.TXN.PROCESS>

        ENQ.DATA<2,1> = '@ID'
        EB.SystemTables.getVFunction(),1> = 'EQ'
        ENQ.DATA<4,1> =  V.PRFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus

    RETURN
END
