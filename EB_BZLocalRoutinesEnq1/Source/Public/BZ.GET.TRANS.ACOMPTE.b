*---------------------------------------------
*@author Abdelmonaam Mastouri le 18/04/2016
*<abdelmonaam.mastouri@banquezitouna.com>
*ZIT-UPG-R13-R19 : Initialised variable F.ACT.TXN instead of wrong variable in F.READ.
*---------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.GET.TRANS.ACOMPTE
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

* $INSERT I_COMMON - Not Used anymore;F.PW)
* $INSERT I_EQUATE - Not Used anymore;.TXN,F.ACT.TXN)
    ID.PW = O.DATA
* $INSERT I_F.AC.CHARGE.REQUEST - Not Used anymore;N : " WITH PROCESS EQ " : ID.PW
    CALL EB.READLIST(SEL.CMD,SEL.LISTS,'',NO.SEL,SEL.ERR)

    IF SEL.LISTS THEN

        FOR I = 1 TO NO.SEL
            REMOVE SEL.LIST FROM SEL.LISTS SETTING LIST.POS
           * CALL F.READ(FN.ACT.TXN,SEL.LIST,R.ACT.TXN,F.TXN.ACT,ERR.ACT.TXN)
		   CALL F.READ(FN.ACT.TXN,SEL.LIST,R.ACT.TXN,F.ACT.TXN,ERR.ACT.TXN)   ;*Initialised variable instead of wrong variable in F.READ.
            V.ACTIVITE=R.ACT.TXN<PW.ACT.TXN.ACTIVITY>



            IF  V.ACTIVITE  EQ 'BZISB.AUTHACOMPTE' THEN
        EB.SystemTables.getVFunction()REF=R.ACT.TXNEB.SystemTables.getVFunction()N.TRANSACTIOEB.SystemTables.getRNew()>FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus O.DATA=V.REF
            END ELSE

       FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus EQ '' THEN
                    O.DATA=V.REF

                END

            END

        NEXT I
    END
    RETURN
END
