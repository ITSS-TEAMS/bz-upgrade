*-----------------------------------------------------------------------------
* <Rating>1566</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE PACS.LENDING.EXTRACT.SUB
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3

    *Modifications done to incorporate details extraction across applications - 20180529
*-------------------------------------------------------
*MODIFICATION HISTORY:
*ZIT-UPG-R13-R19  : REPLACED HARDCODED FILE NAME TO FILE VARIABELE;CONVERT TO CHANGE;INITIALISED F.READ VARIABLES
*				  : WRITE TO F.WRITE;READ TO CACHE.READ;COMMENTED HUSHON/HUSHOFF;OPERATIONS TO OPERANDS;VM TO @VM
*				  : COMMENTED OPF;I_EB.TRANS.COMMON COMMENTED
*-------------------------------------------------------
    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_F.ACCOUNT
    $INSERT I_F.EB.CONTRACT.BALANCES
    $INSERT I_F.STMT.ENTRY
    $INSERT I_F.DATES
    $INSERT I_F.CONSOLIDATE.ASST.LIAB
    $INSERT I_F.EB.SYSTEM.SUMMARY
    $INSERT I_F.EB.JOURNAL.SUMMARY
    $INSERT I_F.COMPANY
    $INSERT I_F.SPF
    * $INSERT I_COMMON - Not Used anymore;.LENDING.EXTRACT
    * $INSERT I_EQUATE - Not Used anymore;MMON
    $INSERT I_BATCH.FILES
*    * $INSERT I_F.AC.CHARGE.REQUEST - Not Used anymore;*COMMENTED
    $INSERT I_F.FOREX
    $INSERT I_F.MM.MONEY.MARKET
    $INSERT I_F.SWAP
    $INSERT I_F.REPO
    $INSERT I_F.LMM.SCHEDULES
    $INSERT I_F.LMM.ACCOUNT.BALANCES
    $INSERT I_F.POSITION
    $INSERT I_F.POS.TRANSACTION
*    $INSERT JBC.h
	$INCLUDE JBC.h  ;*CHANGED TO INCLUDE
    $INSERT I_F.LD.LOANS.AND.DEPOSITS
    $INSERT I_F.PD.PAYMENT.DUE
    $INSERT I_F.PD.PARAMETER
    $INSEB.SystemTables.getVFunction().BALANCES
    $INSERT I_F.LMM.INSTALL.COFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusI_F.PGM.FILE
    $INSERT I_RC.COMMON
    $INFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusONTROL
    $INSERT I_S.COMMON
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_GTS.COMMON
    $INSERT I_F.COMPANY.CHECK
    $INSERT I_F.LC.TYPES
    $INSERT I_F.MD.DEAL



    GOSUB INITIALISE
    GOSUB OPEN.FILES
    GOSUB GET.OPTION

    RETURN

*---------------------------------------------------------------------------------------*
GET.OPTION:
*---------------------------------------------------------------------------------------*

    BEGIN CASE

    CASE R.PACS<TR.TOOL.CONTRACT.NUMBER> NE ''
        CONTRACT.LIST.TO.PROCESS = R.PACS<TR.TOOL.CONTRACT.NUMBER>
*        CONVERT @VM TO @FM IN CONTRACT.LIST.TO.PROCEB.DataAccess.Opf
		CHANGE @VM TO @FM IN CONTRACT.LIST.TO.PROCESS
        IEB.DataAccess.OpfONTRACT.LIST.TO.PROCESS THEN
            GOSUB PROCESS.MULTIPLE.CONTRACTS
        END

    CASE R.PACS<TR.TOOL.LIST.FILE.PATH> NE '' AND R.PACS<TR.TOOL.FILE.NAME>
       
        F.FOLDEFT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRef FEB.DataAccess.FReadC = ''
        FN.FOLDER = R.PACS<TR.TOOL.LIST.FILE.PATH>
        CALL OPF(FN.FOLDER, F.FOLDER)
        FILE.REC = R.PACS<TR.TOOL.FILE.NAME>
        READ R.REC FROM F.FOEB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyerE R.TXN.LIST  = ''
        LOOP
            EB.SystemTables.setE(R.REC<1>)
        WHILE LINE NE '' DO
           

     EB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyeraAccess.FWrite(R.REC<1>,',',1)
        APPI.ID = FIELD(R.REC<1>,',',2)

	    FN.APP = 'F.':APP.NAME
        EB.SystemTables.setAf()*-----------------------------------------------------------------------------
* <Rating>1566</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE PACS.LENDING.EXTRACT.SUB
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3

    *Modifications done to incorporate details extraction across applications - 20180529
*-------------------------------------------------------
*MODIFICATION HISTORY:
*ZIT-UPG-R13-R19  : REPLACED HARDCODED FILE NAME TO FILE VARIABELE;CONVERT TO CHANGE;INITIALISED F.READ VARIABLES
*				  : WRITE TO F.WRITE;READ TO CACHE.READ;COMMENTED HUSHON/HUSHOFF;OPERATIONS TO OPERANDS;VM TO @VM
*				  : COMMENTED OPF;I_EB.TRANS.COMMON COMMENTED
*-------------------------------------------------------
    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_F.ACCOUNT
    $INSERT I_F.EB.CONTRACT.BALANCES
    $INSERT I_F.STMT.ENTRY
    $INSERT I_F.DATES
    $INSERT I_F.CONSOLIDATE.ASST.LIAB
    $INSERT I_F.EB.SYSTEM.SUMMARY
    $INSERT I_F.EB.JOURNAL.SUMMARY
    $INSERT I_F.COMPANY
    $INSERT I_F.SPF
    $INSERT I_F.PACS.LENDING.EXTRACT
    $INSERT I_TSA.COMMON
    $INSERT I_BATCH.FILES
*    $INSERT I_EB.TRANS.COMMON  ;*COMMENTED
    $INSERT I_F.FOREX
    $INSERT I_F.MM.MONEY.MARKET
    $INSERT I_F.SWAP
    $INSERT I_F.REPO
    $INSERT I_F.LMM.SCHEDULES
    $INSERT I_F.LMM.ACCOUNT.BALANCES
    $INSERT I_F.POSITION
    $INSERT I_F.POS.TRANSACTION
*    $INSERT JBC.h
	$INCLUDE JBC.h  ;*CHANGED TO INCLUDE
    $INSERT I_F.LD.LOANS.AND.DEPOSITS
    $INSERT I_F.PD.PAYMENT.DUE
    $INSERT I_F.PD.PARAMETER
    $INSERT I_F.PD.BALANCES
    $INSERT I_F.LMM.INSTALL.CONDS
    $INSERT I_F.PGM.FILE
    $INSERT I_RC.COMMON
    $INSERT I_F.REPORT.CONTROL
    $INSERT I_S.COMMON
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_GTS.COMMON
    $INSERT I_F.COMPANY.CHECK
    $INSERT I_F.LC.TYPES
    $INSERT I_F.MD.DEAL



    GOSUB INITIALISE
    GOSUB OPEN.FILES
    GOSUB GET.OPTION

    RETURN

*---------------------------------------------------------------------------------------*
GET.OPTION:
*---------------------------------------------------------------------------------------*

    BEGIN CASE

    CASE R.PACS<TR.TOOL.CONTRACT.NUMBER> NE ''
        CONTRACT.LIST.TO.PROCESS = R.PACS<TR.TOOL.CONTRACT.NUMBER>
*        CONVERT @VM TO @FM IN CONTRACT.LIST.TO.PROCESS
		CHANGE @VM TO @FM IN CONTRACT.LIST.TO.PROCESS
        IF CONTRACT.LIST.TO.PROCESS THEN
            GOSUB PROCESS.MULTIPLE.CONTRACTS
        END

    CASE R.PACS<TR.TOOL.LIST.FILE.PATH> NE '' AND R.PACS<TR.TOOL.FILE.NAME>
       
        F.FOLDER = ''
        FILE.REC = ''
        FN.FOLDER = R.PACS<TR.TOOL.LIST.FILE.PATH>
        CALL OPF(FN.FOLDER, F.FOLDER)
        FILE.REC = R.PACS<TR.TOOL.FILE.NAME>
        READ R.REC FROM F.FOLDER, FILE.REC ELSE R.TXN.LIST  = ''
        LOOP
            LINE = R.REC<1>
        WHILE LINE NE '' DO
           

        APP.NAME = FIELD(R.REC<1>,',',1)
        APPI.ID = FIELD(R.REC<1>,',',2)

	    FN.APP = 'F.':APP.NAME
           FT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRef      EB.SystemTables.setE()*-----------------------------------------------------------------------------
* <Rating>1566</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE PACS.LENDING.EXTRACT.SUB
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3

    *Modifications done to incorporate details extraction across applications - 20180529
*-------------------------------------------------------
*MODIFICATION HISTORY:
*ZIT-UPG-R13-R19  : REPLACED HARDCODED FILE NAME TO FILE VARIABELE;CONVERT TO CHANGE;INITIALISED F.READ VARIABLES
*				  : WRITE TO F.WRITE;READ TO CACHE.READ;COMMENTED HUSHON/HUSHOFF;OPERATIONS TO OPERANDS;VM TO @VM
*				  : COMMENTED OPF;I_EB.TRANS.COMMON COMMENTED
*-------------------------------------------------------
    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_F.ACCOUNT
    $INSERT I_F.EB.CONTRACT.BALANCES
    $INSERT I_F.STMT.ENTRY
    $INSERT I_F.DATES
    $INSERT I_F.CONSOLIDATE.ASST.LIAB
    $INSERT I_F.EB.SYSTEM.SUMMARY
    $INSERT I_F.EB.JOURNAL.SUMMARY
    $INSERT I_F.COMPANY
    $INSERT I_F.SPF
    $INSERT I_F.PACS.LENDING.EXTRACT
    $INSERT I_TSA.COMMON
    $INSERT I_BATCH.FILES
*    $INSERT I_EB.TRANS.COMMON  ;*COMMENTED
    $INSERT I_F.FOREX
    $INSERT I_F.MM.MONEY.MARKET
    $INSERT I_F.SWAP
    $INSERT I_F.REPO
    $INSERT I_F.LMM.SCHEDULES
    $INSERT I_F.LMM.ACCOUNT.BALANCES
    $INSERT I_F.POSITION
    $INSERT I_F.POS.TRANSACTION
*    $INSERT JBC.h
	$INCLUDE JBC.h  ;*CHANGED TO INCLUDE
    $INSERT I_F.LD.LOANS.AND.DEPOSITS
    $INSERT I_F.PD.PAYMENT.DUE
    $INSERT I_F.PD.PARAMETER
    $INSERT I_F.PD.BALANCES
    $INSERT I_F.LMM.INSTALL.CONDS
    $INSERT I_F.PGM.FILE
    $INSERT I_RC.COMMON
    $INSERT I_F.REPORT.CONTROL
    $INSERT I_S.COMMON
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_GTS.COMMON
    $INSERT I_F.COMPANY.CHECK
    $INSERT I_F.LC.TYPES
    $INSERT I_F.MD.DEAL



    GOSUB INITIALISE
    GOSUB OPEN.FILES
    GOSUB GET.OPTION

    RETURN

*---------------------------------------------------------------------------------------*
GET.OPTION:
*---------------------------------------------------------------------------------------*

    BEGIN CASE

    CASE R.PACS<TR.TOOL.CONTRACT.NUMBER> NE ''
        CONTRACT.LIST.TO.PROCESS = R.PACS<TR.TOOL.CONTRACT.NUMBER>
*        CONVERT @VM TO @FM IN CONTRACT.LIST.TO.PROCESS
		CHANGE @VM TO @FM IN CONTRACT.LIST.TO.PROCESS
        IF CONTRACT.LIST.TO.PROCESS THEN
            GOSUB PROCESS.MULTIPLE.CONTRACTS
        END

    CASE R.PACS<TR.TOOL.LIST.FILE.PATH> NE '' AND R.PACS<TR.TOOL.FILE.NAME>
       
        F.FOLDER = ''
        FILE.REC = ''
        FN.FOLDER = R.PACS<TR.TOOL.LIST.FILE.PATH>
        CALL OPF(FN.FOLDER, F.FOLDER)
        FILE.REC = R.PACS<TR.TOOL.FILE.NAME>
        READ R.REC FROM F.FOLDER, FILE.REC ELSE R.TXN.LIST  = ''
        LOOP
            LINE = R.REC<1>
        WHILE LINE NE '' DO
           

        APP.NAME = FIELD(R.REC<1>,',',1)
        APPI.ID = FIELD(R.REC<1>,',',2)

	    FN.APP = 'F.':APP.NAME
            F.APP = ''
            CALL OPF(FN.APP, F.APP)

                APPLICATION = APP.NAME


******CODE to Extract HISTORY records for LD and PD ; 

                IF APPLICATION EQ 'LD.LOANS.AND.DEPOSITS' OR APPLICATION EQ 'PD.PAYMENT.DUE' THEN

                    FN.APHIS = 'F.':APPLICATION:'$HIS'
                    F.APHIS = ''
                    CALL OPF(FN.APHIS,F.APHIS)
                    APPI.ID.HIS = APPI.ID
                    CALL EB.READ.HISTORY.REC(F.APHIS,APPI.ID.HIS,R.HIS.REC,APHIS.ERR)     ;*Read History records

					FL.NAM = "CURR.NO"
					CALL EB.GET.APPL.FIELD(APPLICATION,FL.NAM,R.SS,ERR.MSG)
					
					LH = R.HIS.REC<FL.NAM>
					
                    HIS.COUNTER = 1
										
                    FOR LHP = LH TO 1 STEP -1

PGM.TYPE = 'H'
                        REC.ID1= APPI.ID:";":LHP
                        W.REC.ID = APPLICATION:".HIS.":LHP:".":APPI.ID
                        INPUT.BUFFER = REC.ID1
                        SAVE.APPLICATION = APPLICATION
                        SAVE.REC.ID = REC.ID1
                        REC.ID = REC.ID1
			APPL.ID.LIST = APPLICATION

                        GOSUB T24.OUTPUT.EXTRACTION
                        CALL PRINTER.OFF
                        GOSUB WRITE.OUT.RECORD

***TO Control the History record to be printed***
                        HIS.COUNTER +=1

                        IF HIS.COUNTER GT 10 THEN GOTO HIS.END

                    NEXT LHP
HIS.END:
                    LHP = ''

                END
				
****** END of CODE to extract HISTORY records for PD and LD



                REC.ID1= APPI.ID
                W.REC.ID = APP.NAME:"-":APPI.ID
                INPUT.BUFFER = REC.ID1
                APPLICATION = APP.NAME
                SAVE.APPLICATION = APPLICATION
                SAVE.REC.ID = REC.ID1
		APPL.ID.LIST = APPLICATION
	
	   FN.PGM = 'F.PGM.FILE'
	    F.PGM = ''
		R.PGM=''
		PGM.ERR=''
	    CALL OPF(FN.PGM, F.PGM)

	    CALL F.READ(FN.PGM,APP.NAME,R.PGM,F.PGM,PGM.ERR)          ;* Read PGM.FILE for the incoming application
            PGM.TYPE = R.PGM<EB.PGM.TYPE>

                REC.ID = REC.ID1
                GOSUB T24.OUTPUT.EXTRACTION
                CALL PRINTER.OFF
                GOSUB WRITE.OUT.RECORD

            DEL R.REC<1>

        REPEAT

    END CASE

    RETURN

*---------------------------------------------------------------------------------------*
PROCESS.MULTIPLE.CONTRACTS:
*---------------------------------------------------------------------------------------*

    CONTRACT.LIST = CONTRACT.LIST.TO.PROCESS
    MUL.POS = ''
    MUL.CNT = DCOUNT(CONTRACT.LIST.TO.PROCESS, @FM)

    FOR MUL.POS = 1 TO MUL.CNT
        CONT.ID = CONTRACT.LIST.TO.PROCESS<MUL.POS>
        R.PACS<TR.TOOL.EXECUTION.STATUS> = 'Processing contract ':CONT.ID
*        WRITE R.PACS TO F.PACS, PACS.ID
		CALL F.WRITE(FN.PACS,PACS.ID,R.PACS)
        IF MUL.POS EQ 2 THEN
            EXTRACTED = 1
        END
        GOSUB EXTRACT.DETAILS
    NEXT MUL.POS

*    WRITE CONSOLIDATE.DETS TO F.BP,'CONSOLIDATED.RECORD.':TODAY

    R.PACS<TR.TOOL.EXECUTION.STATUS> = ''         ;* reset for next run - implies completed
*    WRITE R.PACS TO F.PACS, PACS.ID
	CALL F.WRITE(FN.PACS,PACS.ID,R.PACS)


    RETURN

*---------------------------------------------------------------------------------------*
EXTRACT.DETAILS:
*---------------------------------------------------------------------------------------*


    APPLN = ID.NEW
    CONSOL.DETS = ''
    GOSUB SPF.DETS
    GOSUB GET.DATE.RECORD
    GOSUB GET.COMPANY.DETS

    IF EXTRACTED NE 1 THEN
        WRITE.PARAM = 1
        GOSUB WRITE.OUT.RECORD
    END

*    GOSUB CONTRACT.EXTRACT

    BEGIN CASE

    CASE APPLN EQ 'LD.LOANS.AND.DEPOSITS'
    
	GOSUB CONTRACT.EXTRACT


APPLICATION = APPLN

    FN.CONTRACT$HIS = 'F.':APPLN:'$HIS'; F.CONTRACT$HIS = ''
    CALL OPF(FN.CONTRACT$HIS, F.CONTRACT$HIS)

    CONT.HIS.ID = CONT.ID

    CALL EB.READ.HISTORY.REC(F.CONTRACT$HIS,CONT.HIS.ID,R.CONT,"")
    Y.CURR.NO = R.CONT<LD.CURR.NO>
    HIST.NO = R.PACS<TR.TOOL.NO.OF.HISTORY>
	IF Y.CURR.NO EQ '' THEN
	Y.CURR.NO = 0
	END
    
    LOOP UNTIL Y.CURR.NO EQ '0' DO   ;    *FOR LHP = 1 TO HIST.NO being changed to to LOOP

        HIST.ID = CONT.ID:';':Y.CURR.NO
        APPL.ID.LIST = APPLN
        REC.ID1 = HIST.ID
        PGM.TYPE = 'H'
*        W.REC.ID = "LDHIS.":HIST.ID
	W.REC.ID = "LDHIS.":CONT.ID:".":Y.CURR.NO

        GOSUB T24.OUTPUT.EXTRACTION
        CALL PRINTER.OFF
        GOSUB WRITE.OUT.RECORD
        Y.CURR.NO = Y.CURR.NO-1
        
REPEAT   ;**    NEXT LHP

       GOSUB ACCBAL.EXTRACT
        GOSUB LD.EXTRACT



    CASE APPLN EQ 'PD.PAYMENT.DUE'
        GOSUB CONTRACT.EXTRACT
        GOSUB PD.EXTRACT

    END CASE


    RETURN

*---------------------------------------------------------------------------------------*
OPEN.FILES:
*---------------------------------------------------------------------------------------*

    ARRAY = ''
    FN.PACS = "F.PACS.LENDING.EXTRACT"
    F.PACS = ""; CALL OPF(FN.PACS,F.PACS)

    R.PACS = ''
    CALL F.READU(FN.PACS, PACS.ID, R.PACS, F.PACS, YERR, '')

    FN.AC = "F.ACCOUNT"
    F.AC = ""; CALL OPF(FN.AC,F.AC)

    FN.ECB = "F.EB.CONTRACT.BALANCES"
    F.ECB = ""; CALL OPF(FN.ECB,F.ECB)

    OPEN '','&HOLD&' TO F.HLD ELSE
        PRINT 'UNABLE TO OPEN &HOLD&'
        RETURN
    END

    FN.SPF = "F.SPF"
    F.SPF = ""; SPF.ERR=""
	CALL OPF(FN.SPF,F.SPF) ;*COMMENTING CALL OPF AS F.READ IS REPLACED WITH CACHE READ

    C$RPT.IN.HOLD.ID = ''

    FN.ESS = "F.EB.SYSTEM.SUMMARY"
    F.ESS = ""; CALL OPF(FN.ESS,F.ESS)

    FN.EJS = "F.EB.JOURNAL.SUMMARY"
    F.EJS = ""; CALL OPF(FN.EJS, F.EJS)

    CONTRACT.LIST.TO.PROCESS = ''

    DATE.ID = R.DATES(EB.DAT.LAST.WORKING.DAY)

    FN.BP = R.PACS<TR.TOOL.LOG.FILE.PATH>
    F.BP = ''; CALL OPF(FN.BP,F.BP)

    IF R.PACS<TR.TOOL.CLEAR.LOG.FILES> THEN
        GOSUB FLUSH.OUT.OLD.RECS
    END

    CONT.ID = ''; WRITE.PARAM =''; SAVE.PATH = ''; EXTRACTED = ''
    CONSOLIDATE.DETS = ''

  
******FOR LD/PD *****************

    FN.VERSION = 'F.VERSION'
    F.VERSION = ''
    CALL OPF(FN.VERSION, F.VERSION)

    FN.SCH.DATE='F.LMM.SCHEDULE.DATES'
    F.SCH.DATE = ''
    CALL OPF(FN.SCH.DATE,F.SCH.DATE)

    FN.CUS = 'F.CUSTOMER'
    F.CUS = ''
    CALL OPF(FN.CUS,F.CUS)


    F.STANDARD.SELECTION = ""
	FN.STANDARD.SELECTION="F.STANDARD.SELECTION"
    CALL OPF(FN.STANDARD.SELECTION, F.STANDARD.SELECTION)


    FN.SL.FILE='&SAVEDLISTS&'
    F.SL.FILE=''
    CALL OPF(FN.SL.FILE,F.SL.FILE)

    FN.OFS.SOURCE ='F.OFS.SOURCE'
    F.OFS.SOURCE=''
    CALL OPF(FN.OFS.SOURCE,F.OFS.SOURCE)


    FN.LD = 'F.LD.LOANS.AND.DEPOSITS'
    F.LD = ''
    CALL OPF(FN.LD,F.LD)

    FN.LDNAU = 'F.LD.LOANS.AND.DEPOSITS$NAU'
    F.LDNAU = ''
    CALL OPF(FN.LDNAU,F.LDNAU)

    FN.LDHIS = 'F.LD.LOANS.AND.DEPOSITS$HIS'
    F.LDHIS = ''
    CALL OPF(FN.LDHIS,F.LDHIS)

    FN.LAB.HIST = 'F.LMM.ACCOUNT.BALANCES.HIST'
    F.LAB.HIST = ''
    CALL OPF(FN.LAB.HIST, F.LAB.HIST)

    FN.PD = 'F.PD.PAYMENT.DUE'
    F.PD = ''
    CALL OPF(FN.PD,F.PD)

    FN.PDNAU = 'F.PD.PAYMENT.DUE$NAU'
    F.PDNAU = ''
    CALL OPF(FN.PDNAU,F.PDNAU)

    FN.PDHIS = 'F.PD.PAYMENT.DUE$HIS'
    F.PDHIS = ''
    CALL OPF(FN.PDHIS,F.PDHIS)

    FN.PDBAL = 'F.PD.BALANCES'
    F.PDBAL = ''
    CALL OPF(FN.PDBAL,F.PDBAL)

    FN.PDBALHIS = 'F.PD.BALANCES.HIST'
    F.PDBALHIS = ''
    CALL OPF(FN.PDBALHIS,F.PDBALHIS)

*    FN.PDPARAM = 'F.PD.PARAMETER'
*    F.PDPARAM = ''
*    CALL OPF(FN.PDPARAM,F.PDPARAM)  ;*NOT USED ANYWHERE

    FN.COM = 'F.COMPANY'
    F.COM = ''
    CALL OPF(FN.COM,F.COM)


    FN.PD = 'F.PD.PAYMENT.DUE'
    F.PD = ''
    CALL OPF(FN.PD,F.PD)


    FN.COMO = '&COMO&'
    F.COMO = ''
    CALL OPF(FN.COMO,F.COMO)


******************FOR LD/PD********************




    RETURN

*---------------------------------------------------------------------------------------*
GET.COMPANY.DETS:
*---------------------------------------------------------------------------------------*

    R.SPF = ''
    IF EXTRACTED EQ 1 THEN
        RETURN
    END ELSE
        APPL.ID.LIST = 'COMPANY'
        PGM.TYPE = 'H'
        REC.ID1 = IN.COMP
        GOSUB T24.OUTPUT.EXTRACTION
    END
    RETURN

*---------------------------------------------------------------------------------------*
GET.DATE.RECORD:
*---------------------------------------------------------------------------------------*

    R.SPF = ''
    IF EXTRACTED EQ 1 THEN
        RETURN
    END ELSE
        APPL.ID.LIST = 'DATES'
        PGM.TYPE = 'H'
        REC.ID1 = IN.COMP
        GOSUB T24.OUTPUT.EXTRACTION
    END

    RETURN

*---------------------------------------------------------------------------------------*
SPF.DETS:
*---------------------------------------------------------------------------------------*

    R.SPF = ''
    IF EXTRACTED EQ 1 THEN
        RETURN
    END ELSE
*        READ R.SPF FROM F.SPF,'SYSTEM' ELSE R.SPF = ""
		Y.SPF.ID='SYSTEM'
		CALL CACHE.READ(FN.SPF,Y.SPF.ID,R.SPF,SPF.ERR)
		IF NOT(R.SPF) THEN
		R.SPF=''
		END
        IF R.SPF THEN
            REL = R.SPF<SPF.CURRENT.RELEASE>
            CLIENT.REL = RIGHT(REL,2)
        END
        APPL.ID.LIST = 'SPF'
        PGM.TYPE = 'U'
        REC.ID1 = 'SYSTEM'
        GOSUB T24.OUTPUT.EXTRACTION
    END

    RETURN

*---------------------------------------------------------------------------------------*
CONTRACT.EXTRACT:
*---------------------------------------------------------------------------------------*

    R.CONT = '';CONT.ERR=''

    FN.CONTRACT = 'F.':APPLN; F.CONTRACT = ''
    CALL OPF(FN.CONTRACT, F.CONTRACT)

*    READ R.CONT FROM F.CONTRACT, CONT.ID ELSE R.CONT = ''
	CALL F.READ(FN.CONTRACT,CONT.ID,R.CONT,F.CONTRACT,CONT.ERR)
	IF NOT(R.CONT) THEN
	R.CONT=''
	END
    IF R.CONT THEN
        APPL.ID.LIST = APPLN
        APPLICATION = APPLN
        REC.ID1 = CONT.ID
        W.REC.ID = APPLN:"-FULLVIEW-":REC.ID1
        PGM.TYPE = 'H'
        GOSUB T24.OUTPUT.EXTRACTION
        CALL PRINTER.OFF
        GOSUB WRITE.OUT.RECORD
    END


    RETURN


*---------------------------------------------------------------------------------------*
ACCBAL.EXTRACT:
*---------------------------------------------------------------------------------------*

    FN.ACCBAL = 'F.LMM.ACCOUNT.BALANCES'
    F.ACCBAL = '';R.ACCBAL='';ACCBAL.ERR=''
	CALL OPF(FN.ACCBAL, F.ACCBAL)
    ACCBAL.ID = CONT.ID:'00'
*    READ R.ACCBAL FROM F.ACCBAL, ACCBAL.ID ELSE R.ACCBAL = ''
	CALL F.READ(FN.ACCBAL,ACCBAL.ID,R.ACCBAL,F.ACCBAL,ACCBAL.ERR)
	IF NOT(R.ACCBAL) THEN
	R.ACCBAL=''
	END
    IF ACCBAL.ID THEN
        APPL.ID.LIST = 'LMM.ACCOUNT.BALANCES'
        REC.ID1 = ACCBAL.ID
        PGM.TYPE = 'L'
        W.REC.ID = "LAB.":CONT.ID
        GOSUB T24.OUTPUT.EXTRACTION
        CALL PRINTER.OFF
        GOSUB WRITE.OUT.RECORD
    END

    RETURN


*---------------------------------------------------------------------------------------*
EXTRACT.RCC:
*---------------------------------------------------------------------------------------*

    FN.RE.CONSOL.CONTRACT = 'F.RE.CONSOL.CONTRACT'
    F.RE.CONSOL.CONTRACT = '';R.RE.CONSOL.CONTRACT='' ;CONSOL.ERR=''
	CALL OPF(FN.RE.CONSOL.CONTRACT, F.RE.CONSOL.CONTRACT)
CAL.IDS = ''
    LOOP
        REMOVE CAL.ID FROM CAL.IDS SETTING RCC.POS
    WHILE CAL.ID:RCC.POS

*        READ R.RE.CONSOL.CONTRACT FROM F.RE.CONSOL.CONTRACT, CAL.ID ELSE R.RE.CONSOL.CONTRACT = ''
		CALL F.READ(FN.RE.CONSOL.CONTRACT,CAL.ID,R.RE.CONSOL.CONTRACT,F.RE.CONSOL.CONTRACT,CONSOL.ERR)
        IF R.RE.CONSOL.CONTRACT THEN
            APPL.ID.LIST = 'RE.CONSOL.CONTRACT'
            REC.ID1 = CAL.ID
            PGM.TYPE = 'L'
            GOSUB T24.OUTPUT.EXTRACTION
        END

    REPEAT

    RETURN

*---------------------------------------------------------------------------------------*
EXTRACT.LIMIT.TXN:
*---------------------------------------------------------------------------------------*

    RETURN

*---------------------------------------------------------------------------------------*
EXTRACT.HISTORY:
*---------------------------------------------------------------------------------------*

    FN.CONTRACT$HIS = 'F.':APPLN:'$HIS'; F.CONTRACT$HIS = '';R.CONT='';CONT.ERR=''
    CALL OPF(FN.CONTRACT$HIS, F.CONTRACT$HIS)

*    READ R.CONT FROM F.CONTRACT, CONT.ID ELSE R.CONT = ''
	CALL F.READ(FN.CONTRACT,CONT.ID,R.CONT,F.CONTRACT,CONT.ERR)
	IF NOT(R.CONT) THEN
	R.CONT=''
	END
    Y.CURR.NO = R.CONT<V-7>
    HIST.NO = R.PACS<TR.TOOL.NO.OF.HISTORY>

    IF Y.CURR.NO EQ '' THEN

       Y.CURR.NO = 1

    END


    LOOP UNTIL Y.CURR.NO EQ '1' DO   ;    *FOR LHP = 1 TO HIST.NO being changed to to LOOP

        HIST.ID = CONT.ID:';':Y.CURR.NO
        APPL.ID.LIST = APPLN
        REC.ID1 = HIST.ID
        PGM.TYPE = 'H'
        W.REC.ID = "LDHIS.":HIST.ID

        GOSUB T24.OUTPUT.EXTRACTION
        CALL PRINTER.OFF
        GOSUB WRITE.OUT.RECORD
        Y.CURR.NO = Y.CURR.NO-1
        
REPEAT   ;**    NEXT LHP


    RETURN


*---------------------------------------------------------------------------------------*
T24.OUTPUT.EXTRACTION:
*---------------------------------------------------------------------------------------*

    APPLICATION = APPL.ID.LIST
    REC.ID = REC.ID1

    V$FUNCTION = 'GET.PARAM'
    CALL EB.EXECUTE.APPLICATION(APPLICATION)

    CALL MATRIX.UPDATE
    LOOP
        V$FUNCTION = 'P'      ;* Set it to NULL
        REMOVE INPUT.BUFFER FROM REC.ID SETTING ID.ERR      ;* Record ID
    WHILE INPUT.BUFFER:ID.ERR

        CALL RECORDID.INPUT

        IF E THEN
            ETEXT = E
            RETURN
        END

*        HUSH ON ; 
		CALL RECORD.READ 
*   	 HUSH OFF

        CALL MATRIX.ALTER
	MAT CHECKFILE = ''
        GOSUB PRINT.RECORD
    REPEAT


    RETURN


*---------------------------------------------------------------------------------------*
PRINT.RECORD:
*---------------------------------------------------------------------------------------*

    IF ETEXT THEN
        RETURN
    END

    CALL PRINTER.ON('P.FUNCTION',0)
    PRINT
    PRINT "==============================================="
    PRINT APPLICATION
    PRINT "==============================================="
    CALL PRINTER.OFF


    IF PGM.TYPE[1,1] EQ 'T' THEN
        CALL TABLE.DISPLAY
    END ELSE
        CALL FIELD.DISPLAY
    END

    RETURN

*---------------------------------------------------------------------------------------*
WRITE.OUT.RECORD:
*---------------------------------------------------------------------------------------*

    HLD.ID = C$RPT.IN.HOLD.ID<1>        ;* HOLD ID Generated

    CALL PRINTER.CLOSE('P.FUNCTION',0,OPERATOR)

    IF TRIM(HLD.ID) EQ '' THEN
        RETURN      ;* Nothing to do
    END

    READ R.HOLD FROM F.HLD,HLD.ID ELSE
        RETURN      ;* Nothing to do
    END
    
    LOOP
        REMOVE CONT FROM R.HOLD SETTING CONT.POS
    WHILE CONT:CONT.POS DO
        BEGIN CASE
        CASE INDEX(CONT,CHARX(12),1)    ;* line feed
            IF CONT[1,1] NE CHARX(12) THEN
                ARRAY<-1> = CONT[1,INDEX(CONT,CHARX(12),1)-1]
            END
        CASE INDEX(CONT,'Page',1)
        CASE TRIM(CONT[1,4]) EQ 'Area'
        CASE TRIM(CONT[1,2]) EQ 'To'
        CASE 1
            ARRAY<-1> = CONT
        END CASE

    REPEAT

    DELETE F.HLD, HLD.ID

    IF ARRAY THEN
        GOSUB FLUSH.RECORD
    END

    RETURN


*---------------------------------------------------------------------------------------*
FLUSH.RECORD:
*---------------------------------------------------------------------------------------*

    IF WRITE.PARAM EQ 1 THEN
        ID.WRITE = 'PARAMETER_FILES_FULL_VIEW_':TODAY
        WRITE.PARAM = 0
    END ELSE
*        ID.WRITE = CONT.ID:'.DETAILS.WITH.FULL.VIEWS.':TODAY
        ID.WRITE = W.REC.ID:'-FULLVIEW'

    END
    WRITE ARRAY TO F.BP, ID.WRITE
    ARRAY = ''
    W.REC.ID = ''
    RETURN

*---------------------------------------------------------------------------------------*
FLUSH.OUT.OLD.RECS:
*---------------------------------------------------------------------------------------*

    CLEARFILE F.BP

    RETURN

*---------------------------------------------------------------------------------------*
INITIALISE:
*---------------------------------------------------------------------------------------*

    IN.COMP = ID.COMPANY
    PACS.ID = ID.NEW
    ARRAY = ''
    MAT R.VERSION = ''

    RETURN


*--------------------------------------------------------------------------------*
LD.EXTRACT:
*--------------------------------------------------------------------------------*

***LD ECB FULL VIEW;
    LD.ID = CONT.ID

    R.LD = ''
	LD.ERR=''
    CALL F.READ(FN.LD,LD.ID,R.LD,F.LD,LD.ERR)     ;* Read LD record
    LD.ONLY = ''
    IF R.LD<LD.LIQUIDATION.MODE> EQ 'AUTOMATIC' THEN
        LD.ONLY  = 'YES'
    END
    COMP.CODE = R.LD<LD.CO.CODE>

    REC.ID1= LD.ID
    W.REC.ID = "LD.ECB.":LD.ID
    PGM.TYPE ="L"
    APPL.ID.LIST = "EB.CONTRACT.BALANCES"
    GOSUB T24.OUTPUT.EXTRACTION
    CALL PRINTER.OFF
    GOSUB WRITE.OUT.RECORD
    CRT "LD ECB Full view Printed :"


***LD.SCHEDULE.DEFINE FULL VIEW;

    REC.ID1= LD.ID
    W.REC.ID = "LSD.":LD.ID
    PGM.TYPE ="U"
    APPL.ID.LIST = "LD.SCHEDULE.DEFINE"
    REC.ID = REC.ID1
    GOSUB T24.OUTPUT.EXTRACTION
    CALL PRINTER.OFF
    GOSUB WRITE.OUT.RECORD
    CRT "LD Schedule define Full view Printed :"


***LMM.INSTALL.CONDS FULL VIEW;

    R.COMP = ''
    COM.ERR = ''
    CALL F.READ(FN.COM,R.LD<LD.CO.CODE>,R.COMP,F.COM,COM.ERR)         ;* Read COMPANY record
    LIC.ID = R.COMP<EB.COM.FINANCIAL.COM>

    REC.ID1= LIC.ID
    W.REC.ID = "LIC.":LD.ID
    PGM.TYPE ="H"
    APPL.ID.LIST = "LMM.INSTALL.CONDS"
    GOSUB T24.OUTPUT.EXTRACTION
    CALL PRINTER.OFF
    GOSUB WRITE.OUT.RECORD
    CRT "LMM.INSTALL.CONDS Full view Printed :"

***LMM.SCHEDULE.DATES FULL VIEW;

    REC.ID1= LD.ID:"00"
    W.REC.ID = "LSHD.":LD.ID
    PGM.TYPE ="T"
    APPL.ID.LIST = "LMM.SCHEDULE.DATES"
    REC.ID = REC.ID1
    GOSUB T24.OUTPUT.EXTRACTION
    CALL PRINTER.OFF
    GOSUB WRITE.OUT.RECORD
    CRT "LMM.SCHDULE.DATES Full view Printed :"


***LD ACCOUNT FULL VIEW ;

    LD.ACC = ''
    LD.ACC = R.LD<LD.PRIN.LIQ.ACCT>
    LDAC.ERR = ''


    CALL F.READ(FN.AC,LD.ACC,R.PDAC,F.AC,LDAC.ERR)          ;* Read AC record

    LD.ACC.HIS = ''
	LDACHIS.ERR=''
    IF LDAC.ERR THEN

        LD.ACC.HIS = LD.ACC
        CALL EB.READ.HISTORY.REC(F.ACCOUNT,LD.ACC.HIS,R.LDAC,LDACHIS.ERR)       ;*Read History records

    END

    REC.ID1= LD.ACC
    W.REC.ID = "LDAC.":LD.ACC
    PGM.TYPE ="H"
    APPL.ID.LIST = "ACCOUNT"
    REC.ID = REC.ID1

    GOSUB T24.OUTPUT.EXTRACTION
    CALL PRINTER.OFF
    GOSUB WRITE.OUT.RECORD
    CRT "LD AC Full view Printed :"

**Check the LIQUIDATION.MODE and PRINT PD record if needed.
    IF LD.ONLY NE 'YES' THEN
        GOSUB PD.EXTRACT
    END



    RETURN


*--------------------------------------------------------------------------------*
PD.EXTRACT:
*--------------------------------------------------------------------------------*


***PD RECORD FULL VIEW;

    IF CONT.ID[1,2] EQ 'PD' THEN
        LD.ID = CONT.ID[3,14]
    END ELSE

        LD.ID = CONT.ID

    END

    APPL.ID.LIST = 'PD.PAYMENT.DUE'
    PD.ID = "PD":LD.ID
	R.PD=''
	PD.ERR=''
    CALL F.READ(FN.PD,PD.ID,R.PD,F.PD,PD.ERR)     ;* Read PD record


    REC.ID1= PD.ID
    W.REC.ID = "PDLD.":LD.ID
    PGM.TYPE ="H"

    SAVE.APPLICATION = APPLICATION
    APPLICATION = APPL.ID.LIST
    GOSUB T24.OUTPUT.EXTRACTION
    CALL PRINTER.OFF
    GOSUB WRITE.OUT.RECORD
    CRT "PD record Full view Printed :"


*****PD History record Extract:

    APPLN = APPLICATION
    Y.CURR.NO = ''
    PD.CONT.ID = "PD":LD.ID
    FN.CONTRACT$HIS = 'F.':APPLN:'$HIS'; F.CONTRACT$HIS = ''
    CALL OPF(FN.CONTRACT$HIS, F.CONTRACT$HIS)

    FN.CONTRACT = 'F.':APPLN; F.CONTRACT = ''
    CALL OPF(FN.CONTRACT, F.CONTRACT)
	R.CONT=''
	CONT.ERR=''
*    READ R.CONT FROM F.CONTRACT, PD.CONT.ID ELSE R.CONT = ''
	CALL F.READ(FN.CONTRACT,PD.CONT.ID,R.CONT,F.CONTRACT,CONT.ERR)
IF R.CONT EQ '' THEN

    PD.ID.HIS = PD.CONT.ID
    PD.HIS.ERR = ''
    CALL EB.READ.HISTORY.REC(F.PDHIS,PD.ID.HIS,R.CONT,PDHIS.ERR)    ;*Read History records

END

    Y.CURR.NO = R.CONT<PD.CURR.NO>
    HIST.NO = R.PACS<TR.TOOL.NO.OF.HISTORY>

IF Y.CURR.NO EQ '' THEN
Y.CURR.NO = 0

END
    LOOP UNTIL Y.CURR.NO EQ '0' DO   ;    *FOR LHP = 1 TO HIST.NO being changed to to LOOP

        PD.HIST.ID = PD.CONT.ID:';':Y.CURR.NO
        APPL.ID.LIST = APPLN
        REC.ID1 = PD.HIST.ID
        PGM.TYPE = 'H'
        *W.REC.ID = "PDHIS.":PD.HIST.ID
W.REC.ID = "PDHIS.":PD.CONT.ID:".":Y.CURR.NO

        GOSUB T24.OUTPUT.EXTRACTION
        CALL PRINTER.OFF
        GOSUB WRITE.OUT.RECORD
        Y.CURR.NO = Y.CURR.NO-1
        
REPEAT   ;**    NEXT LHP


***PD ECB FULL VIEW;

    REC.ID1= PD.ID
    W.REC.ID = "PD.ECB.":PD.ID
    PGM.TYPE ="L"
    APPL.ID.LIST = "EB.CONTRACT.BALANCES"
    GOSUB T24.OUTPUT.EXTRACTION
    CALL PRINTER.OFF
    GOSUB WRITE.OUT.RECORD
    CRT "PD ECB Full view Printed :"


***PD.BALANCES FULL VIEW


    IF NOT(PD.ERR) THEN

        PD.PAY.DAT.CNT = DCOUNT(R.PD<PD.PAYMENT.DTE.DUE>,@VM)
        FOR PDDC = PD.PAY.DAT.CNT TO 1 STEP -1

            PDB.ID = PD.ID:"-":R.PD<PD.PAYMENT.DTE.DUE,PDDC>

            REC.ID1= PDB.ID
            W.REC.ID = "PDB.":PDB.ID
            PGM.TYPE ="L"
            APPL.ID.LIST = "PD.BALANCES"
            GOSUB T24.OUTPUT.EXTRACTION
            CALL PRINTER.OFF
            GOSUB WRITE.OUT.RECORD

        NEXT PDDC

    END
    CRT "PD BALANCES Full view Printed :"

***PD ACCOUNT FULL VIEW ;

    PD.ACC = ''
    PD.ACC = R.PD<PD.REPAYMENT.ACCT>
    PAC.ERR = ''

    IF NOT(PD.ACC) THEN
        ORIG.STMT.AC  = ''
        ORIG.STMT.AC = DCOUNT(R.PD<PD.ORIG.STLMNT.ACT>,@VM)
        PD.ACC = R.PD<PD.ORIG.STLMNT.ACT,ORIG.STMT.AC>

    END
	R.PDAC=''
	PAC.ERR=''
	PACHIS.ERR=''
    CALL F.READ(FN.AC,PD.ACC,R.PDAC,F.AC,PAC.ERR) ;* Read AC record
    PD.ACC.HIS = PD.ACC
    IF PAC.ERR THEN
        CALL EB.READ.HISTORY.REC(F.ACCOUNT,LD.ID.HIS,R.PDAC,PACHIS.ERR)         ;*Read History records
    END

    REC.ID1= PD.ACC
    W.REC.ID = "PDAC.":PD.ACC
    PGM.TYPE ="H"
    APPL.ID.LIST = "ACCOUNT"
    GOSUB T24.OUTPUT.EXTRACTION
    CALL PRINTER.OFF
    GOSUB WRITE.OUT.RECORD
    CRT "PD Account Balances Full view Printed :"


***PD PARAMETER FULL VIEW ;

    PD.PARAM.ID = ''
    PD.PARAM.ID = R.PD<PD.PARAMETER.RECORD>
    REC.ID1= PD.PARAM.ID
    W.REC.ID = "PD.PARAM.":PD.PARAM.ID
    PGM.TYPE ="H"
    APPL.ID.LIST = "PD.PARAMETER"
    GOSUB T24.OUTPUT.EXTRACTION
    CALL PRINTER.OFF
    GOSUB WRITE.OUT.RECORD
    CRT "PD Parameter Full view Printed :"



***ASSET.CLASS.PARAMETER FULL VIEW ;

    R.COMP = ''
    COM.ERR = ''
    CALL F.READ(FN.COM,R.PD<PD.CO.CODE>,R.COMP,F.COM,COM.ERR)         ;* Read COMPANY record
    ACP.PARAM.ID = R.COMP<EB.COM.FINANCIAL.COM>

    REC.ID1= ACP.PARAM.ID
    W.REC.ID = "ACP.PARAM.":PD.PARAM.ID
    PGM.TYPE ="H"
    APPL.ID.LIST = "ASSET.CLASS.PARAMETER"
    GOSUB T24.OUTPUT.EXTRACTION
    CALL PRINTER.OFF
    GOSUB WRITE.OUT.RECORD
    CRT "ASSET Class Parameter Full view Printed :"

*-------------------------------------------------------------------------------*

    RETURN

END
