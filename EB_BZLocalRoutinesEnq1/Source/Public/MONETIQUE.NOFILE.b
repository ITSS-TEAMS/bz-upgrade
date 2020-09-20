*-----------------------------------------------------------------------------
* <Rating>-52</Rating>
*-----------------------------------------------------------------------------
*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13  : $INSERT BP to $INCLUDE BZDEV.BP
*ZIT-UPG-R13-R19 : removed BP's and changed INCLUDE to INSERT   
*                  removed hardcoding in F.READ  
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE MONETIQUE.NOFILE (AC.DETAILS)
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
$INSERT I_F.FUNDS.TRANSFER      
*ZIT-UPG-R09-R13/S
*$INSERT BP I_F.TNA.ATM.BANK.ACCOUNT    

 $INSERT I_F.TNA.ATM.BANK.ACCOUNT
*ZIT-UPG-R09-R13/E


    GOSUB INIT
    GOSUB OPENFILES  
    GOSUB PROCESS
    RETURN
INIT:
    FN.FT='F.FUNDS.TRANSFER'
    F.FT=''
    R.FT=''
    FT.ERR=''
* $INSERT I_F.BZ.COFFRE.LOYER - Not Used anymore;NT'
    F.BK=''
    RETURN
OPENFILES:
    CALL OPF(FN.FT,F.FT)
    CALL OPF(FN.BK,F.BK)
    RETURN
PROCESS:
     BK.ID = '0125' ; R.BK = '' ; ERR = ''      
    CALL F.READ(FN.BK,BK.ID,R.BK,F.BK,ERR)  
    AC1=EB.SystemTables.getVFunction()FRAIS.ACCOUNTEB.SystemTables.getVFunction()1 = '01XX' ; R.BK FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus 
    CALL F.READ(FN.BK,BK.ID1,R.BK,F.BK,ERR)FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusK<BANK.FRAIS.ACCOUNT>
    AC3= R.BK<BANK.PAY.ACCOUNT>
    AC4=R.BK<BANK.RECEIVE.ACCOUNT>
    LISTAC=AC1:".":AC2:".":AC3:".":AC4

    FOR I=1 TO 4
        DB.MNT=0
        CR.MNT=0
        NUM.AC=FIELD(LISTAC,".",I)
        SEL.CMD='SELECT ':FN.FT: ' WITH DEBIT.ACCT.NO EQ ':NUM.AC:' AND TRANSACTION.TYPE EQ ACN7'
		SEL.LIST = '' ; NO.OF.REC = '' ; RET.CODE = ''      
        CALL EB.READLIST(SEL.CMD,SEL.LIST,'',NO.OF.REC,RET.CODE)
        LOOP
            REMOVE FT.ID FROM SEL.LIST SETTING POS
        WHILE FT.ID:POS
            CALL F.READ(FN.FT,FT.ID,R.FT,F.FT,FT.ERR)
            DB.MNT+=R.FT<FT.LOC.AMT.DEBITED>
        REPEAT
        SEL.CMD='SELECT ':FN.FT: ' WITH CREDIT.ACCT.NO EQ ':NUM.AC:' AND TRANSACTION.TYPE EQ ACN7'
        SEL.LIST = '' ; NO.OF.REC = '' ; RET.CODE = ''  
	   CALL EB.READLIST(SEL.CMD,SEL.LIST,'',NO.OF.REC,RET.CODE)    
        LOOP
            REMOVE FT.ID FROM SEL.LIST SETTING POS
        WHILE FT.ID:POS
            CALL F.READ(FN.FT,FT.ID,R.FT,F.FT,FT.ERR)
            CR.MNT+=R.FT<FT.LOC.AMT.CREDITED>
        REB.DataAccess.OpfAT
        IEB.DataAccess.OpfB.MNT EQ '' THEN
            DB.MNT=0
        END  
        IF CR.MNT EQ '' THEN
            CR.MNT=0
        END
        AC.FT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRef.AC:"*":DB.MNT:"*":CR.MNT
    NEXT EB.DataAccess.FRead RETURN  
    RETURN
