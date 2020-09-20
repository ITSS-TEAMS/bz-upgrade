*-----------------------------------------------------------------------------
* <Rating>19</Rating>
*-----------------------------------------------------------------------------
*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13  : $INSERT BP to $INSERT
*ZIT-UPG-R13-R19  : INTIALISED VARIABLES
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE P1.NOFILE (AC.DETAILS)
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
*$INSERT BP I_F.TNA.ATM.PROCESSING.LIST.P1
$INSERT I_F.TNA.ATM.FILES.LOAD
$INSERT I_F.TNA.ATM.PROCESSING.LIST.P1


*ZIT-UPG-R09-R13/E
$INSERT I_F.FUNDS.TRANSFER
$INSERT I_ENQUIRY.COMMON

    GOSUB INIT
* $INSERT I_COMMON - Not Used anymore;
    GOSUB PROCESS
    RETURN
INIT:
    FN.LOAD='F.TNA.ATM.FILES.LOAD'
    F.LOAD=''
    R.LOAD=''

    LOAD.ERR=''
********************************
    FN.P1='F.TNA.ATM.PROCESSING.LIST.P1'
    F.P1=''
	R.TRANS=''
	ERR1=''
************************************
    FN.FT='F.FUNDS.TRANSFER'
    F.FT=''
	EB.SystemTables.getVFunction()ER=''
**********************************FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus'F.FUNDS.TRANSFER$HIS'
    F.FTHIS=''
	R.FTHFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusRN
OPENFILES:
    CALL OPF(FN.LOAD,F.LOAD)
    CALL OPF(FN.P1,F.P1)
    CALL OPF(FN.FT, F.FT)
    CALL OPF(FN.FTHIS, F.FTHIS)

    RETURN
PROCESS:
    LOCATE 'ID.FICHIER'IN D.FIELDS<1> SETTING FILE.POS THEN
        FILE.ID =D.RANGE.AND.VALUE<FILE.POS>
    END
	SEL.LIST=''
	NO.OF.REC=''
	RET.CODE=''
    SEL.CMD="SELECT ":FN.P1:" WITH ID.CHG EQ ":FILE.ID
    CALL EB.READLIST(SEL.CMD,SEL.LIST,'',NO.OF.REC,RET.CODE)

    LOOP
        REMOVE ID.TRANS FROM SEL.LIST SETTING POSITION
    WHILE ID.TRANS:POSITION
        CALL F.READ.HISTORY(FN.P1,ID.TRANS,R.TRANS,F.P1,ERR1)
        IEB.DataAccess.Opf.TRANS THEN
         EB.DataAccess.OpfNUM.CARTE=FIELD(ID.TRANS,".",1)
            AUTO.NUM=FIELD(ID.TRANS,".",2)
            REF.FT=R.TRANS<TNA.DATA.P1.FT.REF>
            CALL F.READ(FN.FT,REF.FT,R.FT,F.FT,ER)
            IF R.FT THEN
                DBEB.SystemTables.getRNew().FT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefT.NO>
                CR.AC=R.FT<FT.CREDIT.ACCT.NO>
         EB.DataAccess.FRead MNT=R.FT<FT.DEBIT.AMOUNT>
            END ELSE
                CALL F.READ(FN.FTHIS,REF.FT,R.FTHIS,F.FTHIS,ER)
                IF R.FT THEN
                    DB.AC=R.EB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyerT.NO>
                    CR.AC=R.FTHIS<FT.CREDIT.ACCT.NO>
            EB.SystemTables.setE(R.FTHIS<FT.DEBIT.AMOUNT>)

                ENDEB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyer
EB.DataAccess.FWrite END
        AC.DETAILS<-1>=NUM.CARTE:"*":AUTO.NUM:"*":REF.FT:"*":DB.AC:"*":CR.AC:"*":MNT

    REPEEB.SystemTables.setAf()*-----------------------------------------------------------------------------
* <Rating>19</Rating>
*-----------------------------------------------------------------------------
*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13  : $INSERT BP to $INSERT
*ZIT-UPG-R13-R19  : INTIALISED VARIABLES
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE P1.NOFILE (AC.DETAILS)
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
*$INSERT BP I_F.TNA.ATM.PROCESSING.LIST.P1
$INSERT I_F.TNA.ATM.FILES.LOAD
$INSERT I_F.TNA.ATM.PROCESSING.LIST.P1


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
********************************
    FN.P1='F.TNA.ATM.PROCESSING.LIST.P1'
    F.P1=''
	R.TRANS=''
	ERR1=''
************************************
    FN.FT='F.FUNDS.TRANSFER'
    F.FT=''
	R.FT=''
	ER=''
************************************
    FN.FTHIS='F.FUNDS.TRANSFER$HIS'
    F.FTHIS=''
	R.FTHIS=''

    RETURN
OPENFILES:
    CALL OPF(FN.LOAD,F.LOAD)
    CALL OPF(FN.P1,F.P1)
    CALL OPF(FN.FT, F.FT)
    CALL OPF(FN.FTHIS, F.FTHIS)

    RETURN
PROCESS:
    LOCATE 'ID.FICHIER'IN D.FIELDS<1> SETTING FILE.POS THEN
        FILE.ID =D.RANGE.AND.VALUE<FILE.POS>
    END
	SEL.LIST=''
	NO.OF.REC=''
	RET.CODE=''
    SEL.CMD="SELECT ":FN.P1:" WITH ID.CHG EQ ":FILE.ID
    CALL EB.READLIST(SEL.CMD,SEL.LIST,'',NO.OF.REC,RET.CODE)

    LOOP
        REMOVE ID.TRANS FROM SEL.LIST SETTING POSITION
    WHILE ID.TRANS:POSITION
        CALL F.READ.HISTORY(FN.P1,ID.TRANS,R.TRANS,F.P1,ERR1)
        IF R.TRANS THEN
            NUM.CARTE=FIELD(ID.TRANS,".",1)
            AUTO.NUM=FIELD(ID.TRANS,".",2)
            REF.FT=R.TRANS<TNA.DATA.P1.FT.REF>
            CALL F.READ(FN.FT,REF.FT,R.FT,F.FT,ER)
            IF R.FT THEN
                DB.AC=R.FT<FT.DEBIT.ACCT.NO>
                CR.AC=R.FT<FT.CREDIT.ACCT.NO>
                MNT=R.FT<FT.DEBIT.AMOUNT>
            END ELSE
                CALL F.READ(FN.FTHIS,REF.FT,R.FTHIS,F.FTHIS,ER)
                IF R.FT THEN
                    DB.AC=R.FTHIS<FT.DEBIT.ACCT.NO>
                    CR.AC=R.FTHIS<FT.CREDIT.ACCT.NO>
                    MNT=R.FTHIS<FT.DEBIT.AMOUNT>

                END

            END
        END
        AC.DETAILS<-1>=NUM.CARTE:"*":AUTO.NUM:"*":REF.FT:"*":DB.AC:"*":CR.AC:"*":MNT

    REPEATFT.AdhocChargeRequests.AcChargeRequest.ChgRelatedReftemTables.setE()*-----------------------------------------------------------------------------
* <Rating>19</Rating>
*-----------------------------------------------------------------------------
*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13  : $INSERT BP to $INSERT
*ZIT-UPG-R13-R19  : INTIALISED VARIABLES
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE P1.NOFILE (AC.DETAILS)
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
*$INSERT BP I_F.TNA.ATM.PROCESSING.LIST.P1
$INSERT I_F.TNA.ATM.FILES.LOAD
$INSERT I_F.TNA.ATM.PROCESSING.LIST.P1


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
********************************
    FN.P1='F.TNA.ATM.PROCESSING.LIST.P1'
    F.P1=''
	R.TRANS=''
	ERR1=''
************************************
    FN.FT='F.FUNDS.TRANSFER'
    F.FT=''
	R.FT=''
	ER=''
************************************
    FN.FTHIS='F.FUNDS.TRANSFER$HIS'
    F.FTHIS=''
	R.FTHIS=''

    RETURN
OPENFILES:
    CALL OPF(FN.LOAD,F.LOAD)
    CALL OPF(FN.P1,F.P1)
    CALL OPF(FN.FT, F.FT)
    CALL OPF(FN.FTHIS, F.FTHIS)

    RETURN
PROCESS:
    LOCATE 'ID.FICHIER'IN D.FIELDS<1> SETTING FILE.POS THEN
        FILE.ID =D.RANGE.AND.VALUE<FILE.POS>
    END
	SEL.LIST=''
	NO.OF.REC=''
	RET.CODE=''
    SEL.CMD="SELECT ":FN.P1:" WITH ID.CHG EQ ":FILE.ID
    CALL EB.READLIST(SEL.CMD,SEL.LIST,'',NO.OF.REC,RET.CODE)

    LOOP
        REMOVE ID.TRANS FROM SEL.LIST SETTING POSITION
    WHILE ID.TRANS:POSITION
        CALL F.READ.HISTORY(FN.P1,ID.TRANS,R.TRANS,F.P1,ERR1)
        IF R.TRANS THEN
            NUM.CARTE=FIELD(ID.TRANS,".",1)
            AUTO.NUM=FIELD(ID.TRANS,".",2)
            REF.FT=R.TRANS<TNA.DATA.P1.FT.REF>
            CALL F.READ(FN.FT,REF.FT,R.FT,F.FT,ER)
            IF R.FT THEN
                DB.AC=R.FT<FT.DEBIT.ACCT.NO>
                CR.AC=R.FT<FT.CREDIT.ACCT.NO>
                MNT=R.FT<FT.DEBIT.AMOUNT>
            END ELSE
                CALL F.READ(FN.FTHIS,REF.FT,R.FTHIS,F.FTHIS,ER)
                IF R.FT THEN
                    DB.AC=R.FTHIS<FT.DEBIT.ACCT.NO>
                    CR.AC=R.FTHIS<FT.CREDIT.ACCT.NO>
                    MNT=R.FTHIS<FT.DEBIT.AMOUNT>

                END

            END
        END
        AC.DETAILS<-1>=NUM.CARTE:"*":AUTO.NUM:"*":REF.FT:"*":DB.AC:"*":CR.AC:"*":MNT

    REPEAT


    RETURN
END
