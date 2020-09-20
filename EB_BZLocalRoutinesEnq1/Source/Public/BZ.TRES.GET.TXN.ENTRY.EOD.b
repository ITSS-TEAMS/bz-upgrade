*
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.TRES.GET.TXN.ENTRY.EOD
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*-------------------------------------------------------
*MODIFICATION HISTORY:
*ZIT-UPG-R13-R19-F.READ TO CACHE.READ;GET.LOC.REF TO MULTI.GET.LOC.REF;INITIALISED VARIABLES
*     			-FM TO @FM;ADDED MISSING RETURN
*-------------------------------------------------------

    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_F.ENQUIRY
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.BZ.POS.MVMT.TODAY
    $INSERT I_F.FX.PARAMETERS
    $INSERT I_F.CURRENCY

    GOSUB INIT
    GOSUB OPEN.FILES
    GOSUB PROCESS.HIST
    GOSUB PROCESS
RETURN
*********************
INIT:
* $INSERT I_COMMON - Not Used anymore;*
* $INSERT I_EQUATE - Not Used anymore;.FX.PARAMETERS"
    F.FX.PARAM = ""
	R.FX.PARAM=""
	E.FX.PARAM=""
	
    FN.CURR="F.CURRENCY"
    F.CURR=""
	CURR.REC=""
	CURR.ERR=""
    K.FX.PARAM = "FX.PARAMETERS"

*ZIT-UPG-R13-R19 S
*    CALL GET.LOC.REF("FX.PARAMETERS","MNT.FOND",POS.MNT)
		Y.APP='FX.PARAMETERS'
		Y.FIELD='MNT.FOND'
		Y.POEB.SystemTables.getVFunction()LL MULTI.GET.EB.SystemTables.getVFunction()APP,Y.FIELD,Y.POS)FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus<1,1>	
*ZIT-UPG-R13-R19 E 

*    CALL F.REAFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusX.PARAM,R.FX.PARAM,F.FX.PARAM,E.FX.PARAM)
	CALL CACHE.READ(FN.FX.PARAM,K.FX.PARAM,R.FX.PARAM,E.FX.PARAM)
    IF K.FX.PARAM THEN
        Y.MNT.FOND.PROPORE = R.FX.PARAM<FX.P.LOCAL.REF,POS.MNT>
    END

    FN.POS = "F.BZ.POS.MVMT.TODAY"
    F.POS = ""
	POS.REC=""
	POS.ERR=""

    FN.POS.MVMT.HIST = "F.POS.MVMT.HIST"
    F.POS.MVMT.HIST = ""
	R.POS.RECORD.MVMT.HIST=""
	POS.MVMT.ERR=""
	
    Y.YESTERDAY = TODAY
    CALL CDT('',Y.YESTERDAY,'-1W')

    RETURN

*********************
OPEN.FILES:
*********************

    EB.DataAccess.Opf(FN.POS,F.POS)
    EB.DataAccess.Opf(FN.POS.MVMT.HIST ,F.POS.MVMT.HIST)
    CALL OPF(FN.CURR,F.CURR)

    RETURN

******************EB.SystemTables.getRNew()PFT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRef********EB.DataAccess.FRead******

    TAB.DEVISE.HIST = ""
    TAB.SOLDE.HIST = ""
    NBRE.DEVISE.HIST =""
  EB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyer
    Y.SOMME.EB.SystemTables.setE(0)
	ENTRY.IDS=""
	ENTRY.COUNT=EB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyer"
    SEL.CMD="SSELEB.DataAccess.FWriteN.POS.MVMT.HIST:" WITH @ID UNLIKE *999999* AND @ID LIKE 'TN00100011TRF1...' AND TRANSACTION.CODE EQ 'EOD'"

    CALL EB.READLIST(SEL.CMD, ENTRY.IDS, '', ENTRY.COUNT, ENTRY.ERROR)

    IF EEB.SystemTables.setAf()*
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.TRES.GET.TXN.ENTRY.EOD
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*-------------------------------------------------------
*MODIFICATION HISTORY:
*ZIT-UPG-R13-R19-F.READ TO CACHE.READ;GET.LOC.REF TO MULTI.GET.LOC.REF;INITIALISED VARIABLES
*     			-FM TO @FM;ADDED MISSING RETURN
*-------------------------------------------------------

    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_F.ENQUIRY
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.BZ.POS.MVMT.TODAY
    $INSERT I_F.FX.PARAMETERS
    $INSERT I_F.CURRENCY

    GOSUB INIT
    GOSUB OPEN.FILES
    GOSUB PROCESS.HIST
    GOSUB PROCESS
RETURN
*********************
INIT:
*********************
    FN.FX.PARAM = "F.FX.PARAMETERS"
    F.FX.PARAM = ""
	R.FX.PARAM=""
	E.FX.PARAM=""
	
    FN.CURR="F.CURRENCY"
    F.CURR=""
	CURR.REC=""
	CURR.ERR=""
    K.FX.PARAM = "FX.PARAMETERS"

*ZIT-UPG-R13-R19 S
*    CALL GET.LOC.REF("FX.PARAMETERS","MNT.FOND",POS.MNT)
		Y.APP='FX.PARAMETERS'
		Y.FIELD='MNT.FOND'
		Y.POS=''
		CALL MULTI.GET.LOC.REF(Y.APP,Y.FIELD,Y.POS)
		POS.MNT=Y.POS<1,1>	
*ZIT-UPG-R13-R19 E 

*    CALL F.READ(FN.FX.PARAM,K.FX.PARAM,R.FX.PARAM,F.FX.PARAM,E.FX.PARAM)
	CALL CACHE.READ(FN.FX.PARAM,K.FX.PARAM,R.FX.PARAM,E.FX.PARAM)
    IF K.FX.PARAM THEN
        Y.MNT.FOND.PROPORE = R.FX.PARAM<FX.P.LOCAL.REF,POS.MNT>
    END

    FN.POS = "F.BZ.POS.MVMT.TODAY"
    F.POS = ""
	POS.REC=""
	POS.ERR=""

    FN.POS.MVMT.HIST = "F.POS.MVMT.HIST"
    F.POS.MVMT.HIST = ""
	R.POS.RECORD.MVMT.HIST=""
	POS.MVMT.ERR=""
	
    Y.YESTERDAY = TODAY
    CALL CDT('',Y.YESTERDAY,'-1W')

    RETURN

*********************
OPEN.FILES:
*********************

    CALL OPF(FN.POS,F.POS)
    CALL OPF(FN.POS.MVMT.HIST ,F.POS.MVMT.HIST)
    CALL OPF(FN.CURR,F.CURR)

    RETURN

*********************
PROCESS.HIST:
*********************

    TAB.DEVISE.HIST = ""
    TAB.SOLDE.HIST = ""
    NBRE.DEVISE.HIST =""
    Y.SOMME.HIST = 0
    Y.SOMME.HIST.LCY = 0
	ENTRY.IDS=""
	ENTRY.COUNT=""
	ENTRY.ERROR=""
    SEL.CMD="SSELECT ":FN.POS.MVMT.HIST:" WITH @ID UNLIKE *999999* AND @ID LIKE 'TN00100011TRF1...' AND TRANSACTION.CODE EQ 'EOD'"

    CALL EB.READLIST(SEL.CMD, ENTRY.IDS, '', ENTRY.COUNT, ENTRY.ERROR)

    IF ENTRFT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRef     EB.SystemTables.setE(1 TO ENTRY.COUNT)

            Y.CHANGE = 0

            CALL F.READ(FN.POS.MVMT.HIST,ENTRY.IDS<COMPTEUR.HIS>,R.POS.RECORD.MVMT.HIST,F.POS.MVMT.HIST,POS.MVMT.ERR)

            IF R.POS.RECORD.MVMT.HIST THEN

                Y.DEVISE.TMP = R.POS.RECORD.MVMT.HIST<12>   ;* DEVISE

                IF TAB.DEVISE.HIST EQ "" THEN
                    NBRE.DEVISE.HIST+=1
                    TAB.DEVISE.HIST<NBRE.DEVISE.HIST> = Y.DEVISE.TMP

                    Y.SOMME.HIST += R.POS.RECORD.MVMT.HIST<13>
                    Y.SOMME.HIST.LCY += R.POS.RECORD.MVMT.HIST<3>
                END ELSE
                    IF Y.DEVISE.TMP NE TAB.DEVISE.HIST<NBRE.DEVISE.HIST> THEN
                        Y.CHANGE = 1
                        NBRE.DEVISE.HIST+=1
                        TAB.DEVISE.HIST<NBRE.DEVISE.HIST> = Y.DEVISE.TMP

                        TAB.SOLDE.HIST<NBRE.DEVISE.HIST-1,1> = Y.SOMME.HIST * -1
                        TAB.SOLDE.HIST<NBRE.DEVISE.HIST-1,2> = Y.SOMME.HIST.LCY * -1

                        Y.SOMME.HIST = 0
                        Y.SOMME.HIST.LCY = 0

                        Y.SOMME.HIST += R.POS.RECORD.MVMT.HIST<13>
                        Y.SOMME.HIST.LCY += R.POS.RECORD.MVMT.HIST<3>

                    END ELSE
                        Y.SOMME.HIST += R.POS.RECORD.MVMT.HIST<13>
                        Y.SOMME.HIST.LCY += R.POS.RECORD.MVMT.HIST<3>
                    END

                END

            END

        NEXT COMPTEUR.HIS

        TAB.SOLDE.HIST<NBRE.DEVISE.HIST,1> = Y.SOMME.HIST * -1
        TAB.SOLDE.HIST<NBRE.DEVISE.HIST,2> = Y.SOMME.HIST.LCY * -1

    END

    RETURN

*********************
PROCESS:
*********************

    SEL.CMD="SELECT ":FN.POS:" WITH @ID LIKE '...":Y.YESTERDAY:"'"

    CALL EB.READLIST(SEL.CMD, ENTRY.IDS, '', ENTRY.COUNT, ENTRY.ERROR)

    IF ENTRY.IDS THEN
        NBRE.DEVISE.POS = DCOUNT(ENTRY.IDS,@FM)

        FOR COMPTEUR.DEV = 1 TO NBRE.DEVISE.POS

            Y.ID.POS= ENTRY.IDS<COMPTEUR.DEV>

            CALL F.READ(FN.POS,Y.ID.POS,POS.REC,F.POS,POS.ERR)

            IF POS.REC THEN
                Y.DEVISE = Y.ID.POS[1,3]
                Y.POS.AV.COB = POS.REC<POS.POSITION.FINAL>
                Y.POS.AV.COB.LCY = POS.REC<POS.POSITION.FINAL.LCY>
                Y.POS.RST = POS.REC<POS.RESULTAT>
                Y.FP.LAST = POS.REC<POS.POUR.FP>
                Y.REV.VEILLE = POS.REC<POS.REVAL.VEILLE>

                GOSUB GET.SOMME.HIST

                POS.REC<POS.TXN.EOD> = SOLDE.HIST
                POS.REC<POS.TXN.EOD.LCY> = SOLDE.HIST.LCY

                POS.REC<POS.POS.FINAL.NEW> = Y.POS.AV.COB + SOLDE.HIST
*******************
                CALL F.READ(FN.CURR,Y.DEVISE,CURR.REC,F.CURR,CURR.ERR)

                IF CURR.REC THEN
*Y.COUS.REVAL = CURR.REC<EB.CUR.REVAL.RATE,1>
                    Y.QUTATION = CURR.REC<EB.CUR.QUOTATION.CODE,1>
                    Y.QUTATION.FINAL=PWR(10,Y.QUTATION)
                END ELSE
                    E ="ERROR CURRENCY"
                END
**************
                Y.RES.NEW.NEW = Y.POS.RST + (( SOLDE.HIST*(Y.REV.VEILLE/Y.QUTATION.FINAL)) - SOLDE.HIST.LCY)

                CALL EB.ROUND.AMOUNT("TND",Y.RES.NEW.NEW, '','')

                POS.REC<POS.RESULTAT.NEW> = Y.RES.NEW.NEW

                IF SOLDE.HIST GT 0 THEN
                   * Y.FP.NEW = (ABS(Y.RES.NEW.NEW) /Y.MNT.FOND.PROPORE) * 100
                    Y.FP.NEW = (((Y.POS.AV.COB + SOLDE.HIST)/Y.MNT.FOND.PROPORE)*POS.REC<POS.REVAL>)* 100
                    Y.FP.NEW = FMT(Y.FP.NEW,"R4")

                    POS.REC<POS.POUR.FP.NEW> = Y.FP.NEW
                END ELSE
                    POS.REC<POS.POUR.FP.NEW> = Y.FP.LAST
                END

                CALL F.WRITE(FN.POS,Y.ID.POS,POS.REC)

            END

        NEXT COMPTEUR.DEV

    END

    RETURN

***************
GET.SOMME.HIST:
***************

    LOCATE Y.DEVISE IN TAB.DEVISE.HIST SETTING POS.DEV ELSE POS.DEV = 0

    IF POS.DEV GT 0 THEN
        SOLDE.HIST = TAB.SOLDE.HIST<POS.DEV,1>
        SOLDE.HIST.LCY = TAB.SOLDE.HIST<POS.DEV,2>
    END ELSE
        SOLDE.HIST = 0
        SOLDE.HIST.LCY = 0
    END

    RETURN
END
