*-----------------------------------------------------------------------------
* <Rating>47</Rating>
*-----------------------------------------------------------------------------
*Modification History:
*ZIT-UPG-R13-R19:Converted VM to @VM
*               :Converted AC.WORKING.BALANCE to ECB.WORKING.BALANCE
*               :Included Insert File
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.E.NOF.VIEW.IJARA(OUT.ARR)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*-----------------------------------------------------------------------------
* Author      : ITSS India Pvt Ltd
* Date        : 02 May 2018
* Description : Nofile routine to display the Ijara simulation details
*-----------------------------------------------------------------------------

    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.ACCOUNT
$INSERT I_F.BZ.LD.POST.SIMULATION
	$INSERT I_F.EB.CONTRACT.BALANCES  ;*Included Insert file

    GOSUB INITIALISE
    GOSUB PROCESS

    RETURN

*------------------
INITIALISE:
*------------------

    OUT.ARR = ''

    FN.BZ.LD.POST.SIMULATION = 'F.BZ.LD.POST.SIMULATION'
    F.BZ.LD.POST.SIMULATION = ''
    CALL OPF(FN.BZ.LD.POST.SIMULATION,F.BZ.LD.POST.SIMULATION)

    FN.CUSTOMER.ACCOUNT = 'F.CUSTOMER.ACCOUNT'
    F.CUSTOMER.ACCOUNT = ''
    CALL OPF(FN.CUSTOMER.ACCOUNT,F.CUSTOMER.ACCOUNT)

    FN.ACCOUNT = 'F.ACCOUNT'
    F.ACCOUNT = ''
    CALFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusF.ACCOUNT)

    LOCATE 'CUSTOMER.ID' IN D.FIFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusOS1 THEN
        CUST.ID = D.RANGE.AND.VALUE<POS1>
    END

    LOCATE 'LD.ID' IN D.FIELDS<1> SETTING POS2 THEN
        LD.ID = D.RANGE.AND.VALUE<POS2>
    END

    LOCATE 'OPERATION.TYPE' IN D.FIELDS<1> SETTING POS3 THEN
        OPRN.TYPE = D.RANGE.AND.VALUE<POS3>
    END

    LOCATE 'LOSS.REASON' IN D.FIELDS<1> SETTING POS4 THEN
        L.REASON = D.RANGE.AND.VALUE<POS4>
    END

    LOCATE 'AGENCY' IN D.FIELDS<1> SETTING POS5 THEN
        Y.AGENCY = D.RANGE.AND.VALUE<POS5>
    END

    RETURN

*------------------
PROCESS:
*--------EB.DataAccess.Opf-------

    IF EB.DataAccess.OpfID EQ "" THEN
        IF CUST.ID EQ "" THEN
*            ENQ.ERROR = "Either Customer Id or LD Id mandatory"
*            RETURN
            SEL.CMEB.SystemTables.getRNew()SFT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefD.POST.SIMULATION
            CALL EB.READLIST(SEL.CMD,BZ.RECS,'',SEL.NOS,SEL.ERR)
         EB.DataAccess.FReadID = BZ.RECS
        END ELSE
            SEL.CMD = "SELECT ":FN.BZ.LD.POST.SIMULATION:" WITH CUSTOMER.ID EQ ":CUST.ID
            CALL EB.READLIST(SEL.CMD,BZ.RECS,'',SEL.NOS,SEL.ERR)
            LD.ID = BZ.RECSEB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyerEND

 EB.SystemTables.setE("No simulated contract for customer available")
        RETURN
 EB.DataAccess.FWriteELSE

        BEGIN CASE
        EB.SystemTables.setAf()*-----------------------------------------------------------------------------
* <Rating>47</Rating>
*-----------------------------------------------------------------------------
*Modification History:
*ZIT-UPG-R13-R19:Converted VM to @VM
*               :Converted AC.WORKING.BALANCE to ECB.WORKING.BALANCE
*               :Included Insert File
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.E.NOF.VIEW.IJARA(OUT.ARR)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*-----------------------------------------------------------------------------
* Author      : ITSS India Pvt Ltd
* Date        : 02 May 2018
* Description : Nofile routine to display the Ijara simulation details
*-----------------------------------------------------------------------------

    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.ACCOUNT
$INSERT I_F.BZ.LD.POST.SIMULATION
	$INSERT I_F.EB.CONTRACT.BALANCES  ;*Included Insert file

    GOSUB INITIALISE
    GOSUB PROCESS

    RETURN

*------------------
INITIALISE:
*------------------

    OUT.ARR = ''

    FN.BZ.LD.POST.SIMULATION = 'F.BZ.LD.POST.SIMULATION'
    F.BZ.LD.POST.SIMULATION = ''
    CALL OPF(FN.BZ.LD.POST.SIMULATION,F.BZ.LD.POST.SIMULATION)

    FN.CUSTOMER.ACCOUNT = 'F.CUSTOMER.ACCOUNT'
    F.CUSTOMER.ACCOUNT = ''
    CALL OPF(FN.CUSTOMER.ACCOUNT,F.CUSTOMER.ACCOUNT)

    FN.ACCOUNT = 'F.ACCOUNT'
    F.ACCOUNT = ''
    CALL OPF(FN.ACCOUNT,F.ACCOUNT)

    LOCATE 'CUSTOMER.ID' IN D.FIELDS<1> SETTING POS1 THEN
        CUST.ID = D.RANGE.AND.VALUE<POS1>
    END

    LOCATE 'LD.ID' IN D.FIELDS<1> SETTING POS2 THEN
        LD.ID = D.RANGE.AND.VALUE<POS2>
    END

    LOCATE 'OPERATION.TYPE' IN D.FIELDS<1> SETTING POS3 THEN
        OPRN.TYPE = D.RANGE.AND.VALUE<POS3>
    END

    LOCATE 'LOSS.REASON' IN D.FIELDS<1> SETTING POS4 THEN
        L.REASON = D.RANGE.AND.VALUE<POS4>
    END

    LOCATE 'AGENCY' IN D.FIELDS<1> SETTING POS5 THEN
        Y.AGENCY = D.RANGE.AND.VALUE<POS5>
    END

    RETURN

*------------------
PROCESS:
*------------------

    IF LD.ID EQ "" THEN
        IF CUST.ID EQ "" THEN
*            ENQ.ERROR = "Either Customer Id or LD Id mandatory"
*            RETURN
            SEL.CMD = "SELECT ":FN.BZ.LD.POST.SIMULATION
            CALL EB.READLIST(SEL.CMD,BZ.RECS,'',SEL.NOS,SEL.ERR)
            LD.ID = BZ.RECS
        END ELSE
            SEL.CMD = "SELECT ":FN.BZ.LD.POST.SIMULATION:" WITH CUSTOMER.ID EQ ":CUST.ID
            CALL EB.READLIST(SEL.CMD,BZ.RECS,'',SEL.NOS,SEL.ERR)
            LD.ID = BZ.RECS
        END
    END

    IF NOT(LD.ID) THEN
        ENQ.ERROR = "No simulated contract for customer available"
        RETURN
    END ELSE

        BEGIN CASE
        CASFT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRef"SALE"
        EB.SystemTables.setE()*-----------------------------------------------------------------------------
* <Rating>47</Rating>
*-----------------------------------------------------------------------------
*Modification History:
*ZIT-UPG-R13-R19:Converted VM to @VM
*               :Converted AC.WORKING.BALANCE to ECB.WORKING.BALANCE
*               :Included Insert File
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.E.NOF.VIEW.IJARA(OUT.ARR)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*-----------------------------------------------------------------------------
* Author      : ITSS India Pvt Ltd
* Date        : 02 May 2018
* Description : Nofile routine to display the Ijara simulation details
*-----------------------------------------------------------------------------

    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.ACCOUNT
$INSERT I_F.BZ.LD.POST.SIMULATION
	$INSERT I_F.EB.CONTRACT.BALANCES  ;*Included Insert file

    GOSUB INITIALISE
    GOSUB PROCESS

    RETURN

*------------------
INITIALISE:
*------------------

    OUT.ARR = ''

    FN.BZ.LD.POST.SIMULATION = 'F.BZ.LD.POST.SIMULATION'
    F.BZ.LD.POST.SIMULATION = ''
    CALL OPF(FN.BZ.LD.POST.SIMULATION,F.BZ.LD.POST.SIMULATION)

    FN.CUSTOMER.ACCOUNT = 'F.CUSTOMER.ACCOUNT'
    F.CUSTOMER.ACCOUNT = ''
    CALL OPF(FN.CUSTOMER.ACCOUNT,F.CUSTOMER.ACCOUNT)

    FN.ACCOUNT = 'F.ACCOUNT'
    F.ACCOUNT = ''
    CALL OPF(FN.ACCOUNT,F.ACCOUNT)

    LOCATE 'CUSTOMER.ID' IN D.FIELDS<1> SETTING POS1 THEN
        CUST.ID = D.RANGE.AND.VALUE<POS1>
    END

    LOCATE 'LD.ID' IN D.FIELDS<1> SETTING POS2 THEN
        LD.ID = D.RANGE.AND.VALUE<POS2>
    END

    LOCATE 'OPERATION.TYPE' IN D.FIELDS<1> SETTING POS3 THEN
        OPRN.TYPE = D.RANGE.AND.VALUE<POS3>
    END

    LOCATE 'LOSS.REASON' IN D.FIELDS<1> SETTING POS4 THEN
        L.REASON = D.RANGE.AND.VALUE<POS4>
    END

    LOCATE 'AGENCY' IN D.FIELDS<1> SETTING POS5 THEN
        Y.AGENCY = D.RANGE.AND.VALUE<POS5>
    END

    RETURN

*------------------
PROCESS:
*------------------

    IF LD.ID EQ "" THEN
        IF CUST.ID EQ "" THEN
*            ENQ.ERROR = "Either Customer Id or LD Id mandatory"
*            RETURN
            SEL.CMD = "SELECT ":FN.BZ.LD.POST.SIMULATION
            CALL EB.READLIST(SEL.CMD,BZ.RECS,'',SEL.NOS,SEL.ERR)
            LD.ID = BZ.RECS
        END ELSE
            SEL.CMD = "SELECT ":FN.BZ.LD.POST.SIMULATION:" WITH CUSTOMER.ID EQ ":CUST.ID
            CALL EB.READLIST(SEL.CMD,BZ.RECS,'',SEL.NOS,SEL.ERR)
            LD.ID = BZ.RECS
        END
    END

    IF NOT(LD.ID) THEN
        ENQ.ERROR = "No simulated contract for customer available"
        RETURN
    END ELSE

        BEGIN CASE
        CASE OPRN.TYPE EQ "SALE"
            GOSUB PROCESS.SALE

        CASE OPRN.TYPE EQ "LOSS"
            GOSUB PROCESS.LOSS

        CASE OPRN.TYPE EQ "ALL"
            GOSUB PROCESS.ALL
        END CASE

    END

    RETURN

*------------------
PROCESS.SALE:
*------------------

    LOOP
        REMOVE BZ.ID FROM LD.ID SETTING REM.POS
    WHILE BZ.ID:REM.POS
        CALL F.READ(FN.BZ.LD.POST.SIMULATION,BZ.ID,R.BZ.LD.POST.SIMULATION,F.BZ.LD.POST.SIMULATION,ERR.READ)
        IF R.BZ.LD.POST.SIMULATION NE '' THEN
            IF Y.AGENCY EQ 'HDOFF' THEN
                GOSUB FETCH.ROWS
            END ELSE
                IF Y.AGENCY EQ R.BZ.LD.POST.SIMULATION<BZ.SIM.AGENCY> THEN
                    GOSUB FETCH.ROWS
                END
            END
        END
    REPEAT

    RETURN

*-----------
FETCH.ROWS:
*-----------
    OPR.CNT = DCOUNT(R.BZ.LD.POST.SIMULATION<BZ.SIM.OPERATION.TYPE>,@VM)
    FOR I = 1 TO OPR.CNT
        IF R.BZ.LD.POST.SIMULATION<BZ.SIM.OPERATION.TYPE,I> EQ OPRN.TYPE THEN
            IF R.BZ.LD.POST.SIMULATION<BZ.SIM.OPERATION.STATUS,I> EQ 'COMPLETED' THEN
                Y.OPERATION.STA = 'Cession Anticipée Terminée'
            END ELSE
                Y.OPERATION.STA = 'Simulation terminée'
            END
            IF R.BZ.LD.POST.SIMULATION<BZ.SIM.OPERATION.TYPE,I> EQ 'SALE' THEN
                Y.OPERATION.TYPE = 'Cession Anticipée'
            END

            OUT.ARR<-1> = BZ.ID:'*':R.BZ.LD.POST.SIMULATION<BZ.SIM.CUSTOMER.ID>:'*':Y.OPERATION.TYPE:'*':R.BZ.LD.POST.SIMULATION<BZ.SIM.OPERATION,I>:'*':R.BZ.LD.POST.SIMULATION<BZ.SIM.LOSS.REASON,I>:'*'
            OUT.ARR:= R.BZ.LD.POST.SIMULATION<BZ.SIM.GOOD.TYPE,I>:'*':R.BZ.LD.POST.SIMULATION<BZ.SIM.GOOD.REF,I>:'*':R.BZ.LD.POST.SIMULATION<BZ.SIM.OUTS.TOT.AMT,I>:'*':R.BZ.LD.POST.SIMULATION<BZ.SIM.OUTS.LD.AMOUNT,I>:'*'
            OUT.ARR:= R.BZ.LD.POST.SIMULATION<BZ.SIM.PAYMENT.AMT,I>:'*':R.BZ.LD.POST.SIMULATION<BZ.SIM.PAYMENT.DATE,I>:'*':R.BZ.LD.POST.SIMULATION<BZ.SIM.INCIDENT.DATE,I>:'*':R.BZ.LD.POST.SIMULATION<BZ.SIM.VAT.ON.GOOD,I>:'*'
            OUT.ARR:= R.BZ.LD.POST.SIMULATION<BZ.SIM.PROFIT,I>:'*':R.BZ.LD.POST.SIMULATION<BZ.SIM.PD.TOT.AMT,I>:'*':R.BZ.LD.POST.SIMULATION<BZ.SIM.GOOD.PRORATA,I>:'*':R.BZ.LD.POST.SIMULATION<BZ.SIM.AMOUNT.PRORATA,I>:'*'
            OUT.ARR:= R.BZ.LD.POST.SIMULATION<BZ.SIM.OVERDUE.PRORATA,I>:'*':R.BZ.LD.POST.SIMULATION<BZ.SIM.VAT.ADJUST.CODE,I>:'*':R.BZ.LD.POST.SIMULATION<BZ.SIM.VAT.ADJUST.AMT,I>:'*':R.BZ.LD.POST.SIMULATION<BZ.SIM.CHRG.CODE,I>:'*'
            OUT.ARR:= R.BZ.LD.POST.SIMULATION<BZ.SIM.CHRG.AMT,I>:'*':R.BZ.LD.POST.SIMULATION<BZ.SIM.TOT.AMT,I>:'*':Y.OPERATION.STA:'*':R.BZ.LD.POST.SIMULATION<BZ.SIM.CONTRACT.STATUS>:'*'
            OUT.ARR:= DROUND(R.BZ.LD.POST.SIMULATION<BZ.SIM.IS.CON.TOT.AMT>,3):'*':DROUND(R.BZ.LD.POST.SIMULATION<BZ.SIM.IS.CON.DOWN.PAY>,3):'*':R.BZ.LD.POST.SIMULATION<BZ.SIM.CUR.OUTS.LD.AMOUNT>:'*'
            OUT.ARR:= '*'
            R.BZ.LD.POST.SIMULATION<BZ.SIM.CONTRACT.STATUS> = ''
            R.BZ.LD.POST.SIMULATION<BZ.SIM.IS.CON.TOT.AMT> = ''
            R.BZ.LD.POST.SIMULATION<BZ.SIM.IS.CON.DOWN.PAY> = ''
        END
    NEXT I


    RETURN

*------------------
PROCESS.LOSS:
*------------------

    LOOP
        REMOVE BZ.ID FROM LD.ID SETTING REM.POS
    WHILE BZ.ID:REM.POS
        CALL F.READ(FN.BZ.LD.POST.SIMULATION,BZ.ID,R.BZ.LD.POST.SIMULATION,F.BZ.LD.POST.SIMULATION,ERR.READ)
        IF R.BZ.LD.POST.SIMULATION NE '' THEN
            IF NOT(Y.AGENCY) OR Y.AGENCY EQ R.BZ.LD.POST.SIMULATION<BZ.SIM.AGENCY> THEN
                OPR.CNT = DCOUNT(R.BZ.LD.POST.SIMULATION<BZ.SIM.OPERATION.TYPE>,@VM)
                FOR I = 1 TO OPR.CNT
                    IF R.BZ.LD.POST.SIMULATION<BZ.SIM.LOSS.REASON,I> EQ L.REASON THEN
                        WRKBAL.7001 = ''
                        WRKBAL.7011 = ''
                        CUS.ID = R.BZ.LD.POST.SIMULATION<BZ.SIM.CUSTOMER.ID>
                        CALL F.READ(FN.CUSTOMER.ACCOUNT,CUS.ID,R.CUSTOMER.ACCOUNT,F.CUSTOMER.ACCOUNT,ERR.READ.CUS)
                        LOOP
                            REMOVE ACC.NO FROM R.CUSTOMER.ACCOUNT SETTING REM.ACC.POS
                        WHILE ACC.NO:REM.ACC.POS
                            CALL F.READ(FN.ACCOUNT,ACC.NO,R.ACCOUNT,F.ACCOUNT,ERR.READ.ACC)
                            IF R.ACCOUNT<AC.CATEGORY> EQ '7001' THEN	
*ZIT-UPG-R13-R19 S 						
*                               WRKBAL.7001 += R.ACCOUNT<AC.WORKING.BALANCE>
								CALL EB.READ.HVT ('EB.CONTRACT.BALANCES', ACC.NO, R.ECB, ECB.ERR)
                                WRKBAL.7001 += R.ECB<ECB.WORKING.BALANCE>
*ZIT-UPG-R13-R19  E	
                            END
                            IF R.ACCOUNT<AC.CATEGORY> EQ '7011' THEN
*ZIT-UPG-R13-R19  S
*                               WRKBAL.7011 += R.ACCOUNT<AC.WORKING.BALANCE>
								CALL EB.READ.HVT ('EB.CONTRACT.BALANCES', ACC.NO, R.ECB, ECB.ERR)
                                WRKBAL.7011 += R.ECB<ECB.WORKING.BALANCE>
*ZIT-UPG-R13-R19  E	
                            END
                        REPEAT
                        IF WRKBAL.7001 THEN
                            WRKBAL.7001 = DROUND(WRKBAL.7001,'R3')
                        END
                        IF WRKBAL.7011 THEN
                            WRKBAL.7011 = DROUND(WRKBAL.7011,'R3')
                        END
                        OUT.ARR<-1> = BZ.ID:'*':R.BZ.LD.POST.SIMULATION<BZ.SIM.CUSTOMER.ID>:'*':R.BZ.LD.POST.SIMULATION<BZ.SIM.OPERATION.TYPE,I>:'*':R.BZ.LD.POST.SIMULATION<BZ.SIM.OPERATION,I>:'*':R.BZ.LD.POST.SIMULATION<BZ.SIM.LOSS.REASON,I>:'*'
                        OUT.ARR:= R.BZ.LD.POST.SIMULATION<BZ.SIM.GOOD.TYPE,I>:'*':R.BZ.LD.POST.SIMULATION<BZ.SIM.GOOD.REF,I>:'*':R.BZ.LD.POST.SIMULATION<BZ.SIM.OUTS.TOT.AMT,I>:'*':R.BZ.LD.POST.SIMULATION<BZ.SIM.OUTS.LD.AMOUNT,I>:'*'
                        OUT.ARR:= R.BZ.LD.POST.SIMULATION<BZ.SIM.PAYMENT.AMT,I>:'*':R.BZ.LD.POST.SIMULATION<BZ.SIM.PAYMENT.DATE,I>:'*':R.BZ.LD.POST.SIMULATION<BZ.SIM.INCIDENT.DATE,I>:'*':R.BZ.LD.POST.SIMULATION<BZ.SIM.VAT.ON.GOOD,I>:'*'
                        OUT.ARR:= R.BZ.LD.POST.SIMULATION<BZ.SIM.PROFIT,I>:'*':R.BZ.LD.POST.SIMULATION<BZ.SIM.PD.TOT.AMT,I>:'*':R.BZ.LD.POST.SIMULATION<BZ.SIM.GOOD.PRORATA,I>:'*':R.BZ.LD.POST.SIMULATION<BZ.SIM.AMOUNT.PRORATA,I>:'*'
                        OUT.ARR:= R.BZ.LD.POST.SIMULATION<BZ.SIM.OVERDUE.PRORATA,I>:'*':R.BZ.LD.POST.SIMULATION<BZ.SIM.VAT.ADJUST.CODE,I>:'*':R.BZ.LD.POST.SIMULATION<BZ.SIM.VAT.ADJUST.AMT,I>:'*':R.BZ.LD.POST.SIMULATION<BZ.SIM.CHRG.CODE,I>:'*'
                        OUT.ARR:= R.BZ.LD.POST.SIMULATION<BZ.SIM.CHRG.AMT,I>:'*':R.BZ.LD.POST.SIMULATION<BZ.SIM.TOT.AMT,I>:'*':R.BZ.LD.POST.SIMULATION<BZ.SIM.OPERATION.STATUS,I>:'*':R.BZ.LD.POST.SIMULATION<BZ.SIM.CONTRACT.STATUS>:'*'
                        OUT.ARR:= DROUND(R.BZ.LD.POST.SIMULATION<BZ.SIM.IS.CON.TOT.AMT>,3):'*':DROUND(R.BZ.LD.POST.SIMULATION<BZ.SIM.IS.CON.DOWN.PAY>,3):'*':R.BZ.LD.POST.SIMULATION<BZ.SIM.CUR.OUTS.LD.AMOUNT>:'*'
                        OUT.ARR:= WRKBAL.7001:'*':WRKBAL.7011
                        R.BZ.LD.POST.SIMULATION<BZ.SIM.CONTRACT.STATUS> = ''
                        R.BZ.LD.POST.SIMULATION<BZ.SIM.IS.CON.TOT.AMT> = ''
                        R.BZ.LD.POST.SIMULATION<BZ.SIM.IS.CON.DOWN.PAY> = ''
                    END
                NEXT I
            END
        END
    REPEAT

    RETURN

*------------------
PROCESS.ALL:
*------------------

    LOOP
        REMOVE BZ.ID FROM LD.ID SETTING REM.POS
    WHILE BZ.ID:REM.POS
        CALL F.READ(FN.BZ.LD.POST.SIMULATION,BZ.ID,R.BZ.LD.POST.SIMULATION,F.BZ.LD.POST.SIMULATION,ERR.READ)
        IF R.BZ.LD.POST.SIMULATION THEN
            OPR.CNT = DCOUNT(R.BZ.LD.POST.SIMULATION<BZ.SIM.OPERATION.TYPE>,@VM)
            FOR I = 1 TO OPR.CNT
                WRKBAL.7001 = ''
                WRKBAL.7011 = ''
                CUS.ID = R.BZ.LD.POST.SIMULATION<BZ.SIM.CUSTOMER.ID>
                CALL F.READ(FN.CUSTOMER.ACCOUNT,CUS.ID,R.CUSTOMER.ACCOUNT,F.CUSTOMER.ACCOUNT,ERR.READ.CUS)
                LOOP
                    REMOVE ACC.NO FROM R.CUSTOMER.ACCOUNT SETTING REM.ACC.POS
                WHILE ACC.NO:REM.ACC.POS
                    CALL F.READ(FN.ACCOUNT,ACC.NO,R.ACCOUNT,F.ACCOUNT,ERR.READ.ACC)
                    IF R.ACCOUNT<AC.CATEGORY> EQ '7001' THEN
*ZIT-UPG-R13-R19 S 						
*                       WRKBAL.7001 += R.ACCOUNT<AC.WORKING.BALANCE>
						CALL EB.READ.HVT ('EB.CONTRACT.BALANCES', ACC.NO, R.ECB, ECB.ERR)
                        WRKBAL.7001 += R.ECB<ECB.WORKING.BALANCE>
*ZIT-UPG-R13-R19  E	
                        
                    END
                    IF R.ACCOUNT<AC.CATEGORY> EQ '7011' THEN
*ZIT-UPG-R13-R19  S
*                       WRKBAL.7011 += R.ACCOUNT<AC.WORKING.BALANCE>
						CALL EB.READ.HVT ('EB.CONTRACT.BALANCES', ACC.NO, R.ECB, ECB.ERR)
                        WRKBAL.7011 += R.ECB<ECB.WORKING.BALANCE>
*ZIT-UPG-R13-R19  E	
                        
                    END
                REPEAT
                IF WRKBAL.7001 THEN
                    WRKBAL.7001 = DROUND(WRKBAL.7001,'R3')
                END
                IF WRKBAL.7011 THEN
                    WRKBAL.7011 = DROUND(WRKBAL.7011,'R3')
                END
                OUT.ARR<-1> = BZ.ID:'*':R.BZ.LD.POST.SIMULATION<BZ.SIM.CUSTOMER.ID>:'*':R.BZ.LD.POST.SIMULATION<BZ.SIM.OPERATION.TYPE,I>:'*':R.BZ.LD.POST.SIMULATION<BZ.SIM.OPERATION,I>:'*':R.BZ.LD.POST.SIMULATION<BZ.SIM.LOSS.REASON,I>:'*'
                OUT.ARR:= R.BZ.LD.POST.SIMULATION<BZ.SIM.GOOD.TYPE,I>:'*':R.BZ.LD.POST.SIMULATION<BZ.SIM.GOOD.REF,I>:'*':R.BZ.LD.POST.SIMULATION<BZ.SIM.OUTS.TOT.AMT,I>:'*':R.BZ.LD.POST.SIMULATION<BZ.SIM.OUTS.LD.AMOUNT,I>:'*'
                OUT.ARR:= R.BZ.LD.POST.SIMULATION<BZ.SIM.PAYMENT.AMT,I>:'*':R.BZ.LD.POST.SIMULATION<BZ.SIM.PAYMENT.DATE,I>:'*':R.BZ.LD.POST.SIMULATION<BZ.SIM.INCIDENT.DATE,I>:'*':R.BZ.LD.POST.SIMULATION<BZ.SIM.VAT.ON.GOOD,I>:'*'
                OUT.ARR:= R.BZ.LD.POST.SIMULATION<BZ.SIM.PROFIT,I>:'*':R.BZ.LD.POST.SIMULATION<BZ.SIM.PD.TOT.AMT,I>:'*':R.BZ.LD.POST.SIMULATION<BZ.SIM.GOOD.PRORATA,I>:'*':R.BZ.LD.POST.SIMULATION<BZ.SIM.AMOUNT.PRORATA,I>:'*'
                OUT.ARR:= R.BZ.LD.POST.SIMULATION<BZ.SIM.OVERDUE.PRORATA,I>:'*':R.BZ.LD.POST.SIMULATION<BZ.SIM.VAT.ADJUST.CODE,I>:'*':R.BZ.LD.POST.SIMULATION<BZ.SIM.VAT.ADJUST.AMT,I>:'*':R.BZ.LD.POST.SIMULATION<BZ.SIM.CHRG.CODE,I>:'*'
                OUT.ARR:= R.BZ.LD.POST.SIMULATION<BZ.SIM.CHRG.AMT,I>:'*':R.BZ.LD.POST.SIMULATION<BZ.SIM.TOT.AMT,I>:'*':R.BZ.LD.POST.SIMULATION<BZ.SIM.OPERATION.STATUS,I>:'*':R.BZ.LD.POST.SIMULATION<BZ.SIM.CONTRACT.STATUS>:'*'
                OUT.ARR:= DROUND(R.BZ.LD.POST.SIMULATION<BZ.SIM.IS.CON.TOT.AMT>,3):'*':DROUND(R.BZ.LD.POST.SIMULATION<BZ.SIM.IS.CON.DOWN.PAY>,3):'*':R.BZ.LD.POST.SIMULATION<BZ.SIM.CUR.OUTS.LD.AMOUNT>:'*'
                OUT.ARR:= WRKBAL.7001:'*':WRKBAL.7011
                R.BZ.LD.POST.SIMULATION<BZ.SIM.CONTRACT.STATUS> = ''
                R.BZ.LD.POST.SIMULATION<BZ.SIM.IS.CON.TOT.AMT> = ''
                R.BZ.LD.POST.SIMULATION<BZ.SIM.IS.CON.DOWN.PAY> = ''
            NEXT I
        END
    REPEAT

    RETURN

END
