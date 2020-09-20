*-----------------------------------------------------------------------------
* <Rating>-38</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.TMP.TODAY.ALLDAO(ENQ.DATA)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*Modification History:                                                        
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13  : INCLUDE GLOBUS.BP to $INCLUDE ../T24_BP                   
*                   INCLUDE BP to $INCLUDE BZDE.BP 
* Modification History :
* ZIT-UPG-R13-R19 : Converted $INCLUDE TO $INSERT, Variables initialized, Converted VM to @VM                           
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13/S
*INCLUDE GLOBUS.BP I_COMMON
*INCLUDE GLOBUS.BP I_EQUATE
*INCLUDE GLOBUS.BP I_ENQUIRY.COMMON
*INCLUDE GLOBUS.BP I_F.STMT.ENTRY
    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.STMT.ENTRY
*INCLUDE BP I_F.BZ.TMP.ENTRY.TODAY
    $INSERT I_F.BZ.TMP.ENTRY.TODAY
*$INSERT GLOBUS.BP I_F.USER
    * $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;
    GOSUB INITIALISATION
    GOSUB OPEN.FILES
    GOSUB PROCESS

RETURN

*----------------------------------------------------------------------------*
INITIALISATION:
*----------------------------------------------------------------------------*

    FN.ACC.ENT='F.ACCT.ENT.TODAY'
    F.ACC.ENT=''
    ACC.ENT.REC=''
    ERR=''
    FN.SEB.SystemTables.getVFunction()T.ENTRY'
    F.STMT=''
    STMT.REC=''FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusRR=''
    FN.TOD='F.BZ.TMP.ENTRY.TODAY'
    FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusCC.INTER='3A'

    CMD.LIST=''
    NBR.CPT=''
    ERR1=''
RETURN

*----------------------------------------------------------------------------*
OPEN.FILES:
*----------------------------------------------------------------------------*
    CALL OPF(FN.ACC.ENT,F.ACC.ENT)
    CALL OPF(FN.STMT,F.STMT)
    CALL OPF(FN.TOD,F.TOD)

RETURN

*----------------------------------------------------------------------------*
PROCESS:
*----------------------------------------------------------------------------*

    CMD='SELECT ':FN.ACC.ENT: " WITH @ID UNLIKE '":Y.ACC.INTER:"...'"
    CALL EB.READLIST(CMD,CMD.LIST,'',NBR.CPT,ERR1)

    FOR CEB.DataAccess.OpfTER=1 TO NBR.CPT
        REB.DataAccess.OpfVE COMPTE FROM CMD.LIST SETTING POS1

        CALL F.READ(FN.ACC.ENT,COMPTE,ACC.ENT.REC,F.ACC.ENT,ERR)
        NOMBRE.LINK=DCOUNT(ACC.ENT.REC,@FM)

        FOR I=1 TOEB.SystemTables.getRNew()RFT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRef    EB.DataAccess.FReadRY.NO = ACC.ENT.REC<I>
            CALL F.READ(FN.STMT,ENTRY.NO,STMT.REC,F.STMT,STMT.ENTRY.ERR)

*IF STMT.REC<AC.STE.ACCOUNT.OFFICER> NE R.USER<EB.USE.DEPARTMENT.CODE> THEN
*    CONTINUE
* END

    EB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyerles.setE(STMT.REC<AC.STE.ACCOUNT.NUMBER>)
            DONNE.REEB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyerDE>=SEB.SystemTables.getIdNew()C<AC.STE.COMPANY.CODE>
            DONNE.REC<STMTD.AMOUNT.LCY>=STMT.REC<AC.STE.AMOUNT.LCY>
            DONNEEB.DataAccess.FWriteMTD.TRANSACTION.CODE>=STMT.REC<AC.STE.TRANSACTION.CODE>
            DONNE.REC<STMTD.THEIR.REFERENCE>=STMT.REC<AC.STE.THEIR.REFERENCE>
            DONNE.REC<STMTD.NARRATIVE>=STMT.REC<AC.STE.NARRATIVE>
            DONNE.REC<STMTD.PL.CATEGORY>=STMT.REC<AC.STE.PL.CATEGORY>
        EB.SystemTables.setAf(STMT.REC<AC.STE.CUSTOMER.ID>)
        EB.SystemTables.setE(STMT.REC<AC.STE.ACCOUNT.OFFICER>)
            DONNE.REC<STMTD.PRODUCT.CATEGORY>=STMT.REC<AC.STE.PRODUCT.CATEGORY>
            DONNE.REC<STMTD.VALUE.DATE>=STMT.REC<AC.STE.VALUE.DATE>
            DONNE.REC<STMTD.CURRENCY>=STMT.REC<AC.STE.CURRENCY>
            DONNE.REC<STMTD.AMOUNT.FCY>=STMT.REC<AC.STE.AMOUNT.FCY>
            DONNE.REC<STMTD.EXCHANGE.RATE>=STMT.REC<AC.STE.EXCHANGE.RATE>
            DONNE.REC<STMTD.POSITION.TYPE>=STMT.REC<AC.STE.POSITION.TYPE>
            DONNE.REC<STMTD.OUR.REFERENCE>=STMT.REC<AC.STE.OUR.REFERENCE>
            DONNE.REC<STMTD.REVERSAL.MARKER>=STMT.REC<AC.STE.REVERSAL.MARKER>
            DONNE.REC<STMTD.EXPOSURE.DATE>=STMT.REC<AC.STE.EXPOSURE.DATE>
            DONNE.REC<STMTD.CURRENCY.MARKET>=STMT.REC<AC.STE.CURRENCY.MARKET>
            DONNE.REC<STMTD.LOCAL.REF>=STMT.REC<AC.STE.LOCAL.REF>
            DONNE.REC<STMTD.DEPARTMENT.CODE>=STMT.REC<AC.STE.DEPARTMENT.CODE>
            DONNE.REC<STMTD.TRANS.REFERENCE>=STMT.REC<AC.STE.TRANS.REFERENCE>
            DONNE.REC<STMTD.SYSTEM.ID>=STMT.REC<AC.STE.SYSTEM.ID>
            DONNE.REC<STMTD.BOOKING.DATE>=STMT.REC<AC.STE.BOOKING.DATE>
            Y.INPUTTER = STMT.REC<AC.STE.INPUTTER>
            DONNE.REC<STMTD.INPUTTER>=Y.INPUTTER
            DONNE.REC<STMTD.DATE.TIME>=STMT.REC<AC.STE.DATE.TIME>
            DONNE.REC<STMTD.AUTHORISER>=STMT.REC<AC.STE.AUTHORISER>
            DONNE.REC<STMTD.OVERRIDE>=STMT.REC<AC.STE.OVERRIDE>

            CALL F.WRITE(FN.TOD,ENTRY.NO,DONNE.REC)
            CALL JOURNAL.UPDATE(ENTRY.NO)
        NEXT I
    NEXT COUNTER

    V.VM = DCOUNT(ENQ.DATA<2>,@VM) + 1

*  DEPART.CODE = R.USER<EB.USE.DEPARTMENT.CODE>
* ENQ.DATA<2,V.VM> = 'ACCOUNT.OFFICER'
*  ENQ.DATA<3,V.VM> = 'EQ'
* ENQ.DATA<4,V.VM> = DEPART.CODE



RETURN

END
