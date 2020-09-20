$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.E.GET.FT(OUT.ARR)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*------------------------------------------------------------------------
* Author      : ITSS India Pvt Ltd
* Date        : 18 May 2018
* Description : Nofile routine to display adjustment entries
*------------------------------------------------------------------------
* Modification History :
*ZIT-UPG-R13-R19 :     No change  
*------------------------------------------------------------------------

    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.FUNDS.TRANSFER

    FN.BZ.IJARA.FT = 'F.BZ.IJARA.FT'
    F.BZ.IJARA.FT = ''
    CALL OPF(FN.BZ.IJARA.FT,F.BZ.IJARA.FT)

    FN.FUNDS.TRANSFER = 'F.FUNDS.TRANSFER'
    F.FUNDS.TRANSFER = ''
    CALL OPF(FN.FUNDS.TRANSFER,F.FUNDS.TRANSFER)

* $INSERT I_COMMON - Not Used anymore;N D.FIELDS<1> SETTING POS2 THEN
* $INSERT I_EQUATE - Not Used anymore;NGE.AND.VALUE<POS2>
    END
* $INSERT I_F.AC.CHARGE.REQUEST - Not Used anymore;AD = ''   
    CALL F.READ(FN.BZ.IJARA.FT,LD.ID,R.BZ.IJARA.FT,F.BZ.IJARA.FT,ERR.READ)  
    IF R.BZ.IJARA.FT THEN
        LOOP
* $INSERT I_F.BZ.COFFRE.LOYER - Not Used anymore;.BZ.IJARA.FT SETTING REM.POS
        WHILE FT.ID:REM.POS
            CALL F.READ(FN.FUNDS.TRANSFER,FT.ID,R.FUNDS.TRANSFER,F.FUNDS.TRANSFER,ERR.READ.FT)
            IF R.FUNDS.TRANSFER THEN
                OUT.ARR<-1> = FT.ID:'*':R.FUNDS.TRANSFER<FT.DEBIT.ACCT.NO>:'*':R.FUNDS.TRANSFER<FT.DEBIT.CURRENCY>:'*':R.FUNDS.TRANSFER<FT.DEBIT.AMOUNT>:'*':R.FUNDS.TRANSFER<FT.DEBIT.VALUE.DATE>:'*':R.FUNDS.TRANSFER<FT.CREDIT.ACCT.NO>:'*':R.FUNDS.TRANSFER<FT.ORDERING.BANK>
            END
        REPEAT
    END ELSE
        OUT.ARR = ""
    END

    RETURN  
END
