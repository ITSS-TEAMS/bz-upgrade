*-----------------------------------------------------------------------------
* <Rating>-72</Rating>
*-----------------------------------------------------------------------------
*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13  : $INSERT BP to $INCLUDE BZDEV.BP
*ZIT-UPG-R13-R19  : INITIALISED VARIABLES;CORRECTED F.READ VARIABLE
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE COMPCONF.NOFILE(AC.DETAILS)
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
    $INSERT  I_F.TNA.ATM.FILES.LOAD
    $INSERT  I_F.TNA.ATM.PROCESSING.LIST.P1
*ZIT-UPG-R09-R13/E
    $INSERT I_F.FUNDS.TRANSFER
    $INSERT I_ENQUIRY.COMMON

    GOSUB INIT
    GOSUB OPENFILES
    GOSUB PROCESS
    RETURN

INIT:
* $INSERT I_F.AC.CHARGE.REQUEST - Not Used anymore;'
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
	EB.SystemTables.getVFunction()*********************************
    FNFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusRANSFER$HIS'
    F.FTHIS=''
	R.FTHIS=''
   FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusS:
    CALL OPF(FN.LOAD,F.LOAD)
    CALL OPF(FN.P1,F.P1)
    CALL OPF(FN.FT, F.FT)
    CALL OPF(FN.FTHIS, F.FTHIS)

    RETURN

************************************
PROCESS:
************************************
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

       EB.DataAccess.OpfB.DataAccess.OpfB GET.FT.PRINCIPAL

    REPEAT
    RETURN

******************EB.SystemTables.getRNew()*FT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefET.FT.PRINCIPAL:
*********EB.DataAccess.FRead*********************

    INDICE=1
*    CALL F.READ(FN.P1,ID.TRANS,R.TRANS,F.TRANS,ERR1)
	CALL F.READ(FN.P1,IDEB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyer1,ERR1) ;*CORRECTED F.READ VARIABLE
    IF R.TRANS THEN
        NUM.EB.SystemTables.setE(FIELD(ID.TRANS,".",1))
        AUTO.NUM=FIELD(ID.TRANS,".",2)
        REF.FT=R.TRAEB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyerREF>
    END

    CALL F.READEB.DataAccess.FWriteREF.FT,R.FT,F.FT,ER)
    IF R.FT THEN
        DB.AC=R.FT<FT.DEBIT.ACCT.NO>
        EB.SystemTables.setAf()*-----------------------------------------------------------------------------
* <Rating>-72</Rating>
*-----------------------------------------------------------------------------
*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13  : $INSERT BP to $INCLUDE BZDEV.BP
*ZIT-UPG-R13-R19  : INITIALISED VARIABLES;CORRECTED F.READ VARIABLE
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE COMPCONF.NOFILE(AC.DETAILS)
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
    $INSERT  I_F.TNA.ATM.FILES.LOAD
    $INSERT  I_F.TNA.ATM.PROCESSING.LIST.P1
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

************************************
PROCESS:
************************************
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

        GOSUB GET.FT.PRINCIPAL

    REPEAT
    RETURN

************************************
GET.FT.PRINCIPAL:
************************************

    INDICE=1
*    CALL F.READ(FN.P1,ID.TRANS,R.TRANS,F.TRANS,ERR1)
	CALL F.READ(FN.P1,ID.TRANS,R.TRANS,F.P1,ERR1) ;*CORRECTED F.READ VARIABLE
    IF R.TRANS THEN
        NUM.CARTE=FIELD(ID.TRANS,".",1)
        AUTO.NUM=FIELD(ID.TRANS,".",2)
        REF.FT=R.TRANS<TNA.DATA.P1.FT.REF>
    END

    CALL F.READ(FN.FT,REF.FT,R.FT,F.FT,ER)
    IF R.FT THEN
        DB.AC=R.FT<FT.DEBIT.ACCT.NO>
        CR.FT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefIT.ACCT.NO>
        EB.SystemTables.setE(R.FT<FT.DEBIT.AMOUNT>)
        CODE.TRANS=R.FT<FT.TRANSACTION.TYPE>
    END ELSE
        CALL F.READ(FN.FTHIS,REF.FT,R.FTHIS,F.FTHIS,ER)
        IF R.FT THEN
            DB.AC=R.FTHIS<FT.DEBIT.ACCT.NO>
            CR.AC=R.FTHIS<FT.CREDIT.ACCT.NO>
            MNT=R.FTHIS<FT.DEBIT.AMOUNT>
            CODE.TRANS=R.FT<FT.TRANSACTION.TYPE>
        END
    END
    GOSUB WRITE.DETAILS
    GOSUB GET.FT.DETAILS
    RETURN

************************************
GET.FT.DETAILS:
************************************
	SEL.LIST2=''
	NO.OF.REC=''
	RET.CODE=''
    SEL.CMD="SELECT ":FN.FT:" WITH DEBIT.THEIR.REF EQ ":REF.FT
    CALL EB.READLIST(SEL.CMD,SEL.LIST2,'',NO.OF.REC,RET.CODE)
    LOOP
        REMOVE ID.FT FROM SEL.LIST2 SETTING POS
    WHILE ID.FT:POS
        CALL F.READ(FN.FT,ID.FT,R.FT,F.FT,ER)
        IF R.FT THEN
            DB.AC=R.FT<FT.DEBIT.ACCT.NO>
            CR.AC=R.FT<FT.CREDIT.ACCT.NO>
            MNT=R.FT<FT.CREDIT.AMOUNT>
            CODE.TRANS=R.FT<FT.TRANSACTION.TYPE>
        END ELSE
            CALL F.READ(FN.FTHIS,ID.FT,R.FTHIS,F.FTHIS,ER)
            IF R.FT THEN
                DB.AC=R.FTHIS<FT.DEBIT.ACCT.NO>
                CR.AC=R.FTHIS<FT.CREDIT.ACCT.NO>
                MNT=R.FTHIS<FT.CREDIT.AMOUNT>
                CODE.TRANS=R.FT<FT.TRANSACTION.TYPE>

            END
        END
        REF.FT=ID.FT
        GOSUB WRITE.DETAILS
    REPEAT
    RETURN




************************************
WRITE.DETAILS:
************************************
    IF INDICE EQ 1 THEN
        AC.DETAILS<-1>="----------":"*":"----------":"*":"----------":"*":"----------":"*":"----------":"*":"----------"
        AC.DETAILS<-1>=NUM.CARTE:"*":AUTO.NUM:"*":REF.FT:"*":DB.AC:"*":CR.AC:"*":MNT:"*":CODE.TRANS
    END ELSE
        AC.DETAILS<-1>=NUM.CARTE:"*":AUTO.NUM:"*":REF.FT:"*":DB.AC:"*":CR.AC:"*":MNT:"*":CODE.TRANS

    END
    INDICE=""
    RETURN


END
