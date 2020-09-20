*-----------------------------------------------------------------------------
* <Rating>20</Rating>
*-----------------------------------------------------------------------------
*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13  : $INSERT BP to $INCLUDE BZDEV.BP
*ZIT-UPG-R13-R19  : NO CHANGES 
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE P2.NOFILE(AC.DETAILS)
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
*ZIT-UPG-R09-R13/S
*$INSERT BP I_F.TNA.ATM.FILES.LOAD
*$INSERT BP I_F.TNA.ATM.PROCESSING.LIST.P2
$INSERT I_F.TNA.ATM.FILES.LOAD
$INSERT I_F.TNA.ATM.PROCESSING.LIST.P2
*ZIT-UPG-R09-R13/E
$INSERT I_F.FUNDS.TRANSFER
$INSERT I_ENQUIRY.COMMON

    GOSUB INIT
    GOSUB OPENFILES
    GOSUB PROCESS
    RETURN


INIT:
    FN.LOAD='F.TNA.ATM.FILES.LOAD'
    F.LOAD=''
    R.LOAD=''
    LOAD.ERR=''

    FN.P2='F.TNA.ATM.PROCESSING.LIST.P2'
    F.P2=''

    FN.FT='F.FUNDS.TRANSFER'
    F.FT=''

    FN.FTHIS='F.FUNDS.TRANSFER$HIS'
    F.FTHIS=''

    RETURN


OPENFILES:

tmp.R.NEW.FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusN.P2.F.P2 = EB.SystemTables.getRNew(FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusN.P2,F.P2)
    CALL OPF(FN.LOAD,tmp.R.NEW.FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusN.P2.F.P2
EB.SystemTables.setRNew(FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusN.P2,F.P2, tmp.R.NEW.FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusN.P2.F.P2)
    CALL OPF(FN.FT, F.FT)
    CALFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus.FTHIS)

    RETURN

PROCESS:
    LOCATE 'ID.FICHIER'IN D.FIELDS<1> SETTING FILE.POS THEN
        FILE.ID =D.RANGE.AND.VALUE<FILE.POS>
    END
SEL.LIST =''
NO.OF.REC =''
RET.CODE =''
    SEL.CMD="SELECT ":FN.P2:" WITH ID.CHG EQ ":FILE.ID
    CALL EB.READLIST(SEL.CMD,SEL.LIST,'',NO.OF.REC,RET.CODE)

    FOR I=1 TO NO.OF.REC

        ID.TRANS = SEL.LIST<I>
R.TRANS =''
ERR =''
        CALL F.READ(FN.P2,ID.TRANS,R.TRANS,F.P2,ERR)
        IEB.DataAccess.Opf.TRANS THEN

       EB.DataAccess.Opf  NUM.CARTE=FIELD(ID.TRANS,".",1)
            AUTO.NUM=FIELD(ID.TRANS,".",2)
            REF.FT=R.TRANS<TNA.DATA.P2.FT.REF>
R.FT =''
ER =''
            CALLFT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefEF.FT,R.FT,F.FT,ER)
         EB.DataAccess.FReadR.FT THEN
                DB.AC=R.FT<FT.DEBIT.ACCT.NO>
                CR.AC=R.FT<FT.CREDIT.ACCT.NO>
                MNT=R.FT<FT.DEBIT.AMOUNT>
            END ELSE
R.FTHIEB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyer EB.SystemTables.setE()*-----------------------------------------------------------------------------
* <Rating>20</Rating>
*-----------------------------------------------------------------------------
*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13  : $INSERT BP to $INCLUDE BZDEV.BP
*ZIT-UPG-R13-R19  : NO CHANGES 
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE P2.NOFILE(AC.DETAILS)
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
*ZIT-UPG-R09-R13/S
*$INSERT BP I_F.TNA.ATM.FILES.LOAD
*$INSERT BP I_F.TNA.ATM.PROCESSING.LIST.P2
$INSERT I_F.TNA.ATM.FILES.LOAD
$INSERT I_F.TNA.ATM.PROCESSING.LIST.P2
*ZIT-UPG-R09-R13/E
$INSERT I_F.FUNDS.TRANSFER
$INSERT I_ENQUIRY.COMMON

    GOSUB INIT
    GOSUB OPENFILES
    GOSUB PROCESS
    RETURN


INIT:
    FN.LOAD='F.TNA.ATM.FILES.LOAD'
    F.LOAD=''
    R.LOAD=''
    LOAD.ERR=''

    FN.P2='F.TNA.ATM.PROCESSING.LIST.P2'
    F.P2=''

    FN.FT='F.FUNDS.TRANSFER'
    F.FT=''

    FN.FTHIS='F.FUNDS.TRANSFER$HIS'
    F.FTHIS=''

    RETURN


OPENFILES:

    CALL OPF(FN.LOAD,F.LOAD)
    CALL OPF(FN.P2,F.P2)
    CALL OPF(FN.FT, F.FT)
    CALL OPF(FN.FTHIS, F.FTHIS)

    RETURN

PROCESS:
    LOCATE 'ID.FICHIER'IN D.FIELDS<1> SETTING FILE.POS THEN
        FILE.ID =D.RANGE.AND.VALUE<FILE.POS>
    END
SEL.LIST =''
NO.OF.REC =''
RET.CODE =''
    SEL.CMD="SELECT ":FN.P2:" WITH ID.CHG EQ ":FILE.ID
    CALL EB.READLIST(SEL.CMD,SEL.LIST,'',NO.OF.REC,RET.CODE)

    FOR I=1 TO NO.OF.REC

        ID.TRANS = SEL.LIST<I>
R.TRANS =''
ERR =''
        CALL F.READ(FN.P2,ID.TRANS,R.TRANS,F.P2,ERR)
        IF R.TRANS THEN

            NUM.CARTE=FIELD(ID.TRANS,".",1)
            AUTO.NUM=FIELD(ID.TRANS,".",2)
            REF.FT=R.TRANS<TNA.DATA.P2.FT.REF>
R.FT =''
ER =''
            CALL F.READ(FN.FT,REF.FT,R.FT,F.FT,ER)
            IF R.FT THEN
                DB.AC=R.FT<FT.DEBIT.ACCT.NO>
                CR.AC=R.FT<FT.CREDIT.ACCT.NO>
                MNT=R.FT<FT.DEBIT.AMOUNT>
            END ELSE
R.FTHIS =''
ERR =''
                CALL F.READ.HISTORY(FN.FTHIS,REF.FT,R.FTHIS,F.FTHIS,ERR)
                IF REB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyer               DB.AC=R.FTHIS<FT.DEBIT.ACCT.NO>
                 EB.DataAccess.FWriteC=R.FTHIS<FT.CREDIT.ACCT.NO>
                    MNT=R.FTHIS<FT.DEBIT.AMOUNT>

                END
        EB.SystemTables.setAf()*-----------------------------------------------------------------------------
* <Rating>20</Rating>
*-----------------------------------------------------------------------------
*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13  : $INSERT BP to $INCLUDE BZDEV.BP
*ZIT-UPG-R13-R19  : NO CHANGES 
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE P2.NOFILE(AC.DETAILS)
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
*ZIT-UPG-R09-R13/S
*$INSERT BP I_F.TNA.ATM.FILES.LOAD
*$INSERT BP I_F.TNA.ATM.PROCESSING.LIST.P2
$INSERT I_F.TNA.ATM.FILES.LOAD
$INSERT I_F.TNA.ATM.PROCESSING.LIST.P2
*ZIT-UPG-R09-R13/E
$INSERT I_F.FUNDS.TRANSFER
$INSERT I_ENQUIRY.COMMON

    GOSUB INIT
    GOSUB OPENFILES
    GOSUB PROCESS
    RETURN


INIT:
    FN.LOAD='F.TNA.ATM.FILES.LOAD'
    F.LOAD=''
    R.LOAD=''
    LOAD.ERR=''

    FN.P2='F.TNA.ATM.PROCESSING.LIST.P2'
    F.P2=''

    FN.FT='F.FUNDS.TRANSFER'
    F.FT=''

    FN.FTHIS='F.FUNDS.TRANSFER$HIS'
    F.FTHIS=''

    RETURN


OPENFILES:

    CALL OPF(FN.LOAD,F.LOAD)
    CALL OPF(FN.P2,F.P2)
    CALL OPF(FN.FT, F.FT)
    CALL OPF(FN.FTHIS, F.FTHIS)

    RETURN

PROCESS:
    LOCATE 'ID.FICHIER'IN D.FIELDS<1> SETTING FILE.POS THEN
        FILE.ID =D.RANGE.AND.VALUE<FILE.POS>
    END
SEL.LIST =''
NO.OF.REC =''
RET.CODE =''
    SEL.CMD="SELECT ":FN.P2:" WITH ID.CHG EQ ":FILE.ID
    CALL EB.READLIST(SEL.CMD,SEL.LIST,'',NO.OF.REC,RET.CODE)

    FOR I=1 TO NO.OF.REC

        ID.TRANS = SEL.LIST<I>
R.TRANS =''
ERR =''
        CALL F.READ(FN.P2,ID.TRANS,R.TRANS,F.P2,ERR)
        IF R.TRANS THEN

            NUM.CARTE=FIELD(ID.TRANS,".",1)
            AUTO.NUM=FIELD(ID.TRANS,".",2)
            REF.FT=R.TRANS<TNA.DATA.P2.FT.REF>
R.FT =''
ER =''
            CALL F.READ(FN.FT,REF.FT,R.FT,F.FT,ER)
            IF R.FT THEN
                DB.AC=R.FT<FT.DEBIT.ACCT.NO>
                CR.AC=R.FT<FT.CREDIT.ACCT.NO>
                MNT=R.FT<FT.DEBIT.AMOUNT>
            END ELSE
R.FTHIS =''
ERR =''
                CALL F.READ.HISTORY(FN.FTHIS,REF.FT,R.FTHIS,F.FTHIS,ERR)
                IF R.FTHIS THEN
                    DB.AC=R.FTHIS<FT.DEBIT.ACCT.NO>
                    CR.AC=R.FTHIS<FT.CREDIT.ACCT.NO>
                    MNT=R.FTHIS<FT.DEBIT.AMOUNT>

                END
           FT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefB.SystemTables.setE()*-----------------------------------------------------------------------------
* <Rating>20</Rating>
*-----------------------------------------------------------------------------
*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13  : $INSERT BP to $INCLUDE BZDEV.BP
*ZIT-UPG-R13-R19  : NO CHANGES 
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE P2.NOFILE(AC.DETAILS)
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
*ZIT-UPG-R09-R13/S
*$INSERT BP I_F.TNA.ATM.FILES.LOAD
*$INSERT BP I_F.TNA.ATM.PROCESSING.LIST.P2
$INSERT I_F.TNA.ATM.FILES.LOAD
$INSERT I_F.TNA.ATM.PROCESSING.LIST.P2
*ZIT-UPG-R09-R13/E
$INSERT I_F.FUNDS.TRANSFER
$INSERT I_ENQUIRY.COMMON

    GOSUB INIT
    GOSUB OPENFILES
    GOSUB PROCESS
    RETURN


INIT:
    FN.LOAD='F.TNA.ATM.FILES.LOAD'
    F.LOAD=''
    R.LOAD=''
    LOAD.ERR=''

    FN.P2='F.TNA.ATM.PROCESSING.LIST.P2'
    F.P2=''

    FN.FT='F.FUNDS.TRANSFER'
    F.FT=''

    FN.FTHIS='F.FUNDS.TRANSFER$HIS'
    F.FTHIS=''

    RETURN


OPENFILES:

    CALL OPF(FN.LOAD,F.LOAD)
    CALL OPF(FN.P2,F.P2)
    CALL OPF(FN.FT, F.FT)
    CALL OPF(FN.FTHIS, F.FTHIS)

    RETURN

PROCESS:
    LOCATE 'ID.FICHIER'IN D.FIELDS<1> SETTING FILE.POS THEN
        FILE.ID =D.RANGE.AND.VALUE<FILE.POS>
    END
SEL.LIST =''
NO.OF.REC =''
RET.CODE =''
    SEL.CMD="SELECT ":FN.P2:" WITH ID.CHG EQ ":FILE.ID
    CALL EB.READLIST(SEL.CMD,SEL.LIST,'',NO.OF.REC,RET.CODE)

    FOR I=1 TO NO.OF.REC

        ID.TRANS = SEL.LIST<I>
R.TRANS =''
ERR =''
        CALL F.READ(FN.P2,ID.TRANS,R.TRANS,F.P2,ERR)
        IF R.TRANS THEN

            NUM.CARTE=FIELD(ID.TRANS,".",1)
            AUTO.NUM=FIELD(ID.TRANS,".",2)
            REF.FT=R.TRANS<TNA.DATA.P2.FT.REF>
R.FT =''
ER =''
            CALL F.READ(FN.FT,REF.FT,R.FT,F.FT,ER)
            IF R.FT THEN
                DB.AC=R.FT<FT.DEBIT.ACCT.NO>
                CR.AC=R.FT<FT.CREDIT.ACCT.NO>
                MNT=R.FT<FT.DEBIT.AMOUNT>
            END ELSE
R.FTHIS =''
ERR =''
                CALL F.READ.HISTORY(FN.FTHIS,REF.FT,R.FTHIS,F.FTHIS,ERR)
                IF R.FTHIS THEN
                    DB.AC=R.FTHIS<FT.DEBIT.ACCT.NO>
                    CR.AC=R.FTHIS<FT.CREDIT.ACCT.NO>
                    MNT=R.FTHIS<FT.DEBIT.AMOUNT>

                END
            END
        END

        AC.DETAILS<-1>=NUM.CARTE:"*":AUTO.NUM:"*":REF.FT:"*":DB.AC:"*":CR.AC:"*":MNT

    NEXT I
    RETURN
    RETURN
END
