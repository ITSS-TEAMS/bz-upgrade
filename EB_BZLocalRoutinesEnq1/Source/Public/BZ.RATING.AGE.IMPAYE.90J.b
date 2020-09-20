$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.RATING.AGE.IMPAYE.90J
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*---------------------------------------------------
* Modification History :   	
*ZITUNA-UPG-R13-R19 :  removed BP's and changed INCLUDE to INSERT 
*                      removed hardcoding in RECORD variable  
*---------------------------------------------------
    $INSERT I_COMMON  
    $INSERT I_EQUATE  
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.PD.BALANCES                  
*-------------------------------------------------   
    GOSUB INIT
    GOSUB PROCESS.BALANCES      
    GOSUB PROCESS.BALANCES.HIST

    RETURN
*-------------------------------------
INIT:

    Y.LD.ID =O.DATA

    FN.PD.BALANCES = "F.PD.BALANCES"
    F.PD.BALANCES = ""

* $INSERT I_EQUATE - Not Used anymore;IST = "F.PD.BALANCES.HIST"    
* $INSERT I_ENQUIRY.COMMON - Not Used anymore; 

    CALL OPF(FN.PD.BALANCES,F.PD.BALANCES)
    CALL OPF(FN.PD.BALANCES.HIST,F.PD.BALANCES.HIST)

    Y.DATA.FORM=TODAY
    Y.AGE.IMPAYE.MAX = 0

    CALL CDT('',Y.DATA.FORM,'-90C')

    RETURN

*-------------------------------------
PROCESS.BALANCES:

    SQL.EB.SystemTables.getVFunction() "SELECT ":FNEB.SystemTables.getVFunction()ES:" WITH @IEB.SystemTables.getRNew()EFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus.'"
    SQL.BALANCES.IDS = '' ; SQL.BALANCES.FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusBALANCES.ERROR = ''     
    CALL EB.READLIST(SQL.BALANCES, SQL.BALANCES.IDS, '',SQL.BALANCES.COUNT,SQL.BALANCES.ERROR)

    IF SQL.BALANCES.IDS THEN

        FOR COMPTERUR = 1 TO SQL.BALANCES.COUNT
            Y.REF.PD.TMP = SQL.BALANCES.IDS<COMPTERUR>
            Y.DATE.PD = FIELD(Y.REF.PD.TMP,'-',2)

            IF Y.DATE.PD LT Y.DATA.FORM THEN
                CONTINUE
            END ELSE
			    PD.BALANCES.REC = '' ;  PD.BALANCES.ERR = ''    
                CALL F.READ(FN.PD.BALANCES,Y.REF.PD.TMP,PD.BALANCES.REC,F.PD.BALANCES,PD.BALANCES.ERR)

                Y.AGE.IMPAYE = PD.BALANCES.REC<PD.BAL.NO.DAYS.OVERDUE>

                IF Y.AGE.IMPAYE GT Y.AGE.IMPAYE.MAX THEN
                    Y.AGE.IMPAYE.MAX = Y.AGE.IMPAYE  
                END
            END
        NEXT COMPTERUR
    END
    RETURN

*-------------------------------------
PROCESS.BALANCES.HIST:

    SQL.BEB.DataAccess.OpfNCES = "SELECT ":FN.PD.BALANCES.HIST:" WITH @ID LIKE 'PD":Y.LD.ID:"...'"

    CALEB.DataAccess.OpfB.READLIST(SQL.BALANCES, SQL.BALANCES.IDS, '',SQL.BALANCES.COUNT,SQL.BALANCES.ERROR)

    IF SQL.BALANCES.IDS THEN

        FOR COMPTEEB.SystemTables.getRNew()FT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefES.COUNT
            Y.REF.PD.TMP = SQL.BALANCES.IDS<COMPTERUR>
         EB.DataAccess.FReadATE.PD = FIELD(Y.REF.PD.TMP,'-',2)

            IF Y.DATE.PD LT Y.DATA.FORM THEN
                CONTINUE
            END ELSE
      EB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyerEAD(FN.PD.BALANCES.HIST,Y.REF.PD.TMP,PD.BALANCES.REC,F.PD.BALANCES.HIST,PD.BALANCES.ERR)

          EB.SystemTables.setE(PD.BALANCES.REC<PD.BAL.NO.DAYS.OVERDUE>)

                IFEB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyer.AGE.IMPAYE.MAX THEN
                 EB.DataAccess.FWriteE.IMPAYE.MAX = Y.AGE.IMPAYE
                END
            END
        NEXT COMPTERUR
    ENDEB.SystemTables.setAf()$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.RATING.AGE.IMPAYE.90J
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*---------------------------------------------------
* Modification History :   	
*ZITUNA-UPG-R13-R19 :  removed BP's and changed INCLUDE to INSERT 
*                      removed hardcoding in RECORD variable  
*---------------------------------------------------
    $INSERT I_COMMON  
    $INSERT I_EQUATE  
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.PD.BALANCES                  
*-------------------------------------------------   
    GOSUB INIT
    GOSUB PROCESS.BALANCES      
    GOSUB PROCESS.BALANCES.HIST

    RETURN
*-------------------------------------
INIT:

    Y.LD.ID =O.DATA

    FN.PD.BALANCES = "F.PD.BALANCES"
    F.PD.BALANCES = ""

    FN.PD.BALANCES.HIST = "F.PD.BALANCES.HIST"    
    F.PD.BALANCES.HIST = ""  

    CALL OPF(FN.PD.BALANCES,F.PD.BALANCES)
    CALL OPF(FN.PD.BALANCES.HIST,F.PD.BALANCES.HIST)

    Y.DATA.FORM=TODAY
    Y.AGE.IMPAYE.MAX = 0

    CALL CDT('',Y.DATA.FORM,'-90C')

    RETURN

*-------------------------------------
PROCESS.BALANCES:

    SQL.BALANCES = "SELECT ":FN.PD.BALANCES:" WITH @ID LIKE 'PD":Y.LD.ID:"...'"
    SQL.BALANCES.IDS = '' ; SQL.BALANCES.COUNT = '' ; SQL.BALANCES.ERROR = ''     
    CALL EB.READLIST(SQL.BALANCES, SQL.BALANCES.IDS, '',SQL.BALANCES.COUNT,SQL.BALANCES.ERROR)

    IF SQL.BALANCES.IDS THEN

        FOR COMPTERUR = 1 TO SQL.BALANCES.COUNT
            Y.REF.PD.TMP = SQL.BALANCES.IDS<COMPTERUR>
            Y.DATE.PD = FIELD(Y.REF.PD.TMP,'-',2)

            IF Y.DATE.PD LT Y.DATA.FORM THEN
                CONTINUE
            END ELSE
			    PD.BALANCES.REC = '' ;  PD.BALANCES.ERR = ''    
                CALL F.READ(FN.PD.BALANCES,Y.REF.PD.TMP,PD.BALANCES.REC,F.PD.BALANCES,PD.BALANCES.ERR)

                Y.AGE.IMPAYE = PD.BALANCES.REC<PD.BAL.NO.DAYS.OVERDUE>

                IF Y.AGE.IMPAYE GT Y.AGE.IMPAYE.MAX THEN
                    Y.AGE.IMPAYE.MAX = Y.AGE.IMPAYE  
                END
            END
        NEXT COMPTERUR
    END
    RETURN

*-------------------------------------
PROCESS.BALANCES.HIST:

    SQL.BALANCES = "SELECT ":FN.PD.BALANCES.HIST:" WITH @ID LIKE 'PD":Y.LD.ID:"...'"

    CALL EB.READLIST(SQL.BALANCES, SQL.BALANCES.IDS, '',SQL.BALANCES.COUNT,SQL.BALANCES.ERROR)

    IF SQL.BALANCES.IDS THEN

        FOR COMPTERUR = 1 TO SQL.BALANCES.COUNT
            Y.REF.PD.TMP = SQL.BALANCES.IDS<COMPTERUR>
            Y.DATE.PD = FIELD(Y.REF.PD.TMP,'-',2)

            IF Y.DATE.PD LT Y.DATA.FORM THEN
                CONTINUE
            END ELSE
                CALL F.READ(FN.PD.BALANCES.HIST,Y.REF.PD.TMP,PD.BALANCES.REC,F.PD.BALANCES.HIST,PD.BALANCES.ERR)

                Y.AGE.IMPAYE = PD.BALANCES.REC<PD.BAL.NO.DAYS.OVERDUE>    

                IF Y.AGE.IMPAYE GT Y.AGE.IMPAYE.MAX THEN
                    Y.AGE.IMPAYE.MAX = Y.AGE.IMPAYE
                END
            END
        NEXT COMPTERUR
    END
  FT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefTables.setE(Y.AGE.IMPAYE.MAX)

    RETURN

*---------------------------------------------------------------------
END.PROGRAM:
END
