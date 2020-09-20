*-----------------------------------------------------------------------------
* <Rating>63575</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE T24.PAYMENTS.INFO
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*-----------------------------------------------------------------------------
*-----------------------------------------------------------------------------
* TEAM    : PAYMENTS
* CREATED : Pradeep Dhandapani
* TESTED  : A B Civanuja
* DATE    : 10 SEP 2013
*-----------------------------------------------------------------------------
*-----------------------------------------------------------------------------
* TEAM    : PAYMENTS
* MODIFIED: R Priyadharshini, R Aswini
* TESTED  : G Vinod Kumar
* DATE    : 01-Nov-2017
*-----------------------------------------------------------------------------
*-----------------------------------------------------------------------------
*Routine modified to avoid the error "Unknown @ system constant @SUBRT specified"
* DATE    : 16-May-2018
*-----------------------------------------------------------------------------
*MODIFICATION HISTORY:
*ZIT-UPG-R13-R19  :OPERATIONS TO OPERANDS;!HUSHIT() TO HUSTIT();F.READ TO CACHE.READ;INTIALISED VARIABLES
* $INSERT I_COMMON - Not Used anymore;@FM,@VM,@SM;WRITE TO F.WRITE;EXECUTE/READLIST TO EB.READLIST;COMMENTED HUSH ON,HUSH OFF
* $INSERT I_EQUATE - Not Used anymore;AD;F.READ TO READ;ADDED JOURNAL.UPDATE;ADDED MISSING END;DISPLAY MESSAGE TO REM
* $INSERT I_ENQUIRY.COMMON - Not Used anymore;----------------------------
    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_F.DE.HEADER
    $INSERT I_F.COMPANY
    $INSERT I_F.USER
    $INSERT I_RC.COMMON
    $INSERT I_F.REPORT.CONTROL
    $INSERT I_F.DE.FORM.TYPE
    $INSERT I_F.STANDARD.SELECTION
    $INSERT I_F.CATEG.ENTRY
    $INSERT I_F.DE.CARRIER
    $INSERT I_F.DE.PARM
    $INSERT I_F.DE.INTERFACE
    $INSERT I_F.DE.MESSAGE
    $INSEB.SystemTables.getVFunction().MAPPING
    $INSERT I_F.DE.FORMAT.XML
FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusE.FORMAT.PRINT
    $INSERT I_S.COMMON
    $IFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusOMMON
    $INSERT I_GTS.COMMON
    $INSERT I_F.FUNDS.TRANSFER
    $INSERT I_F.COMPANY.CHECK
    $INSERT I_F.STANDING.ORDER
    $INSERT I_F.ACCOUNT
    $INSERT I_F.ACCOUNT.STATEMENT
    $INSERT I_F.NR.PARAMETER
    $INSERT I_F.SPF
    $INSERT I_F.AGENCY
*-----------------------------------------------------------------------------
    VAR.TAFJ = ''
    IF SYSTEM(1021)[1,4] EQ 'TAFJ' THEN
        VAR.TAFJ = 1
        OS.NAME = SYSTEM(1017)          ;* Operating System Information
        tafjHome = GETENV("tafj.home")
        GOSUB TAFJ.PROCESS
		IF NOT(PGM.VERSION) AND NOT(RUNNING.UNDER.BATCH) THEN ;* Tus Start
            CALL JOURNAL.UPDATE('')
        END	
	RETURN
    END ELSE
        GOSUB TAFC.PROCESS
		IF NOT(PGM.VERSION) AND NOT(RUNNING.UNDER.BATCH) THEN ;* Tus Start
            CALL JOURNAL.UPDATE('')
        EEB.DataAccess.OpfataAccess.Opf
		RETURN
*		END        	
*    END

*------------------------------------
TAFC.PROCESS:
*--------FT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRef------------
    GOSUBEB.DataAccess.FReadALISE
    GOSUB GET.INPUT
    ORIG.COMP = ID.COMPANY
    LOOP
        LINE = R.REC<1>

 EB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyeremTables.setE()*-----------------------------------------------------------------------------
* <Rating>63575</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE T24.PAYMENTS.INFO
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*-----------------------------------------------------------------------------
*-----------------------------------------------------------------------------
* TEAM    : PAYMENTS
* CREATED : Pradeep Dhandapani
* TESTED  : A B Civanuja
* DATE    : 10 SEP 2013
*-----------------------------------------------------------------------------
*-----------------------------------------------------------------------------
* TEAM    : PAYMENTS
* MODIFIED: R Priyadharshini, R Aswini
* TESTED  : G Vinod Kumar
* DATE    : 01-Nov-2017
*-----------------------------------------------------------------------------
*-----------------------------------------------------------------------------
*Routine modified to avoid the error "Unknown @ system constant @SUBRT specified"
* DATE    : 16-May-2018
*-----------------------------------------------------------------------------
*MODIFICATION HISTORY:
*ZIT-UPG-R13-R19  :OPERATIONS TO OPERANDS;!HUSHIT() TO HUSTIT();F.READ TO CACHE.READ;INTIALISED VARIABLES
*				  :FM,VM,SM TO @FM,@VM,@SM;WRITE TO F.WRITE;EXECUTE/READLIST TO EB.READLIST;COMMENTED HUSH ON,HUSH OFF
*				  :READ TO F.READ;F.READ TO READ;ADDED JOURNAL.UPDATE;ADDED MISSING END;DISPLAY MESSAGE TO REM
*-------------------------------------------------------
    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_F.DE.HEADER
    $INSERT I_F.COMPANY
    $INSERT I_F.USER
    $INSERT I_RC.COMMON
    $INSERT I_F.REPORT.CONTROL
    $INSERT I_F.DE.FORM.TYPE
    $INSERT I_F.STANDARD.SELECTION
    $INSERT I_F.CATEG.ENTRY
    $INSERT I_F.DE.CARRIER
    $INSERT I_F.DE.PARM
    $INSERT I_F.DE.INTERFACE
    $INSERT I_F.DE.MESSAGE
    $INSERT I_F.DE.MAPPING
    $INSERT I_F.DE.FORMAT.XML
    $INSERT I_F.DE.FORMAT.PRINT
    $INSERT I_S.COMMON
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_GTS.COMMON
    $INSERT I_F.FUNDS.TRANSFER
    $INSERT I_F.COMPANY.CHECK
    $INSERT I_F.STANDING.ORDER
    $INSERT I_F.ACCOUNT
    $INSERT I_F.ACCOUNT.STATEMENT
    $INSERT I_F.NR.PARAMETER
    $INSERT I_F.SPF
    $INSERT I_F.AGENCY
*-----------------------------------------------------------------------------
    VAR.TAFJ = ''
    IF SYSTEM(1021)[1,4] EQ 'TAFJ' THEN
        VAR.TAFJ = 1
        OS.NAME = SYSTEM(1017)          ;* Operating System Information
        tafjHome = GETENV("tafj.home")
        GOSUB TAFJ.PROCESS
		IF NOT(PGM.VERSION) AND NOT(RUNNING.UNDER.BATCH) THEN ;* Tus Start
            CALL JOURNAL.UPDATE('')
        END	
	RETURN
    END ELSE
        GOSUB TAFC.PROCESS
		IF NOT(PGM.VERSION) AND NOT(RUNNING.UNDER.BATCH) THEN ;* Tus Start
            CALL JOURNAL.UPDATE('')
        END
		RETURN
*		END        	
*    END

*------------------------------------
TAFC.PROCESS:
*-----------------------------------
    GOSUB INITIALISE
    GOSUB GET.INPUT
    ORIG.COMP = ID.COMPANY
    LOOP
        LINE = R.REC<1>

    WHILE LINE NE '' DO
        GOSUB CLEAR.COMMON    ;* Clear common for every record
        GOSUB PRE.PREB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyerF NOT(SKEB.DataAccess.FWriteESS) THEN
            DTEXT = "Processing.......":LINE:"                                               "
            CRT @(1,10):DTEXT
            IF HUSH.FLAG EQ '1' THEN
        EB.SystemTables.setAf()*-----------------------------------------------------------------------------
* <Rating>63575</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE T24.PAYMENTS.INFO
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*-----------------------------------------------------------------------------
*-----------------------------------------------------------------------------
* TEAM    : PAYMENTS
* CREATED : Pradeep Dhandapani
* TESTED  : A B Civanuja
* DATE    : 10 SEP 2013
*-----------------------------------------------------------------------------
*-----------------------------------------------------------------------------
* TEAM    : PAYMENTS
* MODIFIED: R Priyadharshini, R Aswini
* TESTED  : G Vinod Kumar
* DATE    : 01-Nov-2017
*-----------------------------------------------------------------------------
*-----------------------------------------------------------------------------
*Routine modified to avoid the error "Unknown @ system constant @SUBRT specified"
* DATE    : 16-May-2018
*-----------------------------------------------------------------------------
*MODIFICATION HISTORY:
*ZIT-UPG-R13-R19  :OPERATIONS TO OPERANDS;!HUSHIT() TO HUSTIT();F.READ TO CACHE.READ;INTIALISED VARIABLES
*				  :FM,VM,SM TO @FM,@VM,@SM;WRITE TO F.WRITE;EXECUTE/READLIST TO EB.READLIST;COMMENTED HUSH ON,HUSH OFF
*				  :READ TO F.READ;F.READ TO READ;ADDED JOURNAL.UPDATE;ADDED MISSING END;DISPLAY MESSAGE TO REM
*-------------------------------------------------------
    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_F.DE.HEADER
    $INSERT I_F.COMPANY
    $INSERT I_F.USER
    $INSERT I_RC.COMMON
    $INSERT I_F.REPORT.CONTROL
    $INSERT I_F.DE.FORM.TYPE
    $INSERT I_F.STANDARD.SELECTION
    $INSERT I_F.CATEG.ENTRY
    $INSERT I_F.DE.CARRIER
    $INSERT I_F.DE.PARM
    $INSERT I_F.DE.INTERFACE
    $INSERT I_F.DE.MESSAGE
    $INSERT I_F.DE.MAPPING
    $INSERT I_F.DE.FORMAT.XML
    $INSERT I_F.DE.FORMAT.PRINT
    $INSERT I_S.COMMON
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_GTS.COMMON
    $INSERT I_F.FUNDS.TRANSFER
    $INSERT I_F.COMPANY.CHECK
    $INSERT I_F.STANDING.ORDER
    $INSERT I_F.ACCOUNT
    $INSERT I_F.ACCOUNT.STATEMENT
    $INSERT I_F.NR.PARAMETER
    $INSERT I_F.SPF
    $INSERT I_F.AGENCY
*-----------------------------------------------------------------------------
    VAR.TAFJ = ''
    IF SYSTEM(1021)[1,4] EQ 'TAFJ' THEN
        VAR.TAFJ = 1
        OS.NAME = SYSTEM(1017)          ;* Operating System Information
        tafjHome = GETENV("tafj.home")
        GOSUB TAFJ.PROCESS
		IF NOT(PGM.VERSION) AND NOT(RUNNING.UNDER.BATCH) THEN ;* Tus Start
            CALL JOURNAL.UPDATE('')
        END	
	RETURN
    END ELSE
        GOSUB TAFC.PROCESS
		IF NOT(PGM.VERSION) AND NOT(RUNNING.UNDER.BATCH) THEN ;* Tus Start
            CALL JOURNAL.UPDATE('')
        END
		RETURN
*		END        	
*    END

*------------------------------------
TAFC.PROCESS:
*-----------------------------------
    GOSUB INITIALISE
    GOSUB GET.INPUT
    ORIG.COMP = ID.COMPANY
    LOOP
        LINE = R.REC<1>

    WHILE LINE NE '' DO
        GOSUB CLEAR.COMMON    ;* Clear common for every record
        GOSUB PRE.PROCESS

        IF NOT(SKIP.PROCESS) THEN
            DTEXT = "Processing.......":LINE:"                                               "
            CRT @(1,10):DTEXT
            IF HUSH.FLAG EQ '1' THEN
           FT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefT(1)
        EB.SystemTables.setE()*-----------------------------------------------------------------------------
* <Rating>63575</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE T24.PAYMENTS.INFO
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*-----------------------------------------------------------------------------
*-----------------------------------------------------------------------------
* TEAM    : PAYMENTS
* CREATED : Pradeep Dhandapani
* TESTED  : A B Civanuja
* DATE    : 10 SEP 2013
*-----------------------------------------------------------------------------
*-----------------------------------------------------------------------------
* TEAM    : PAYMENTS
* MODIFIED: R Priyadharshini, R Aswini
* TESTED  : G Vinod Kumar
* DATE    : 01-Nov-2017
*-----------------------------------------------------------------------------
*-----------------------------------------------------------------------------
*Routine modified to avoid the error "Unknown @ system constant @SUBRT specified"
* DATE    : 16-May-2018
*-----------------------------------------------------------------------------
*MODIFICATION HISTORY:
*ZIT-UPG-R13-R19  :OPERATIONS TO OPERANDS;!HUSHIT() TO HUSTIT();F.READ TO CACHE.READ;INTIALISED VARIABLES
*				  :FM,VM,SM TO @FM,@VM,@SM;WRITE TO F.WRITE;EXECUTE/READLIST TO EB.READLIST;COMMENTED HUSH ON,HUSH OFF
*				  :READ TO F.READ;F.READ TO READ;ADDED JOURNAL.UPDATE;ADDED MISSING END;DISPLAY MESSAGE TO REM
*-------------------------------------------------------
    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_F.DE.HEADER
    $INSERT I_F.COMPANY
    $INSERT I_F.USER
    $INSERT I_RC.COMMON
    $INSERT I_F.REPORT.CONTROL
    $INSERT I_F.DE.FORM.TYPE
    $INSERT I_F.STANDARD.SELECTION
    $INSERT I_F.CATEG.ENTRY
    $INSERT I_F.DE.CARRIER
    $INSERT I_F.DE.PARM
    $INSERT I_F.DE.INTERFACE
    $INSERT I_F.DE.MESSAGE
    $INSERT I_F.DE.MAPPING
    $INSERT I_F.DE.FORMAT.XML
    $INSERT I_F.DE.FORMAT.PRINT
    $INSERT I_S.COMMON
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_GTS.COMMON
    $INSERT I_F.FUNDS.TRANSFER
    $INSERT I_F.COMPANY.CHECK
    $INSERT I_F.STANDING.ORDER
    $INSERT I_F.ACCOUNT
    $INSERT I_F.ACCOUNT.STATEMENT
    $INSERT I_F.NR.PARAMETER
    $INSERT I_F.SPF
    $INSERT I_F.AGENCY
*-----------------------------------------------------------------------------
    VAR.TAFJ = ''
    IF SYSTEM(1021)[1,4] EQ 'TAFJ' THEN
        VAR.TAFJ = 1
        OS.NAME = SYSTEM(1017)          ;* Operating System Information
        tafjHome = GETENV("tafj.home")
        GOSUB TAFJ.PROCESS
		IF NOT(PGM.VERSION) AND NOT(RUNNING.UNDER.BATCH) THEN ;* Tus Start
            CALL JOURNAL.UPDATE('')
        END	
	RETURN
    END ELSE
        GOSUB TAFC.PROCESS
		IF NOT(PGM.VERSION) AND NOT(RUNNING.UNDER.BATCH) THEN ;* Tus Start
            CALL JOURNAL.UPDATE('')
        END
		RETURN
*		END        	
*    END

*------------------------------------
TAFC.PROCESS:
*-----------------------------------
    GOSUB INITIALISE
    GOSUB GET.INPUT
    ORIG.COMP = ID.COMPANY
    LOOP
        LINE = R.REC<1>

    WHILE LINE NE '' DO
        GOSUB CLEAR.COMMON    ;* Clear common for every record
        GOSUB PRE.PROCESS

        IF NOT(SKIP.PROCESS) THEN
            DTEXT = "Processing.......":LINE:"                                               "
            CRT @(1,10):DTEXT
            IF HUSH.FLAG EQ '1' THEN
                CALL HUSHIT(1)
            END ELSE
                CALL HUSHIT(1)  ;*CHANGED FROM !HUSHIT(1)
            END
            GOSUB PROCESS.REQUEST
            IF HUSH.FLAG EQ '1' THEN
                CALL HUSHIT(0)
            END ELSE
                CALL HUSHIT(0)   ;*CHANGED FROM !HUSHIT(0)
            END
        END
        DEL R.REC<1>
    REPEAT
*
    IF ORIG.COMP AND ORIG.COMP NE ID.COMPANY THEN
        CALL LOAD.COMPANY(ORIG.COMP)
        C$APP.STORE.DATA<1> = ORIG.COMP
    END

    DTEXT = "Formatting.........                                                            "
    CRT @(1,10):DTEXT

    GOSUB WRITE.OUT.RECORD
*
    DTEXT = "Process Completed....Check PACS.DATA.OUT - Total ":SEQE:" Record(s) Created."
    CRT @(1,10):DTEXT

    FOR REC.CNT = 1 TO SEQE
        DTEXT = "Record ":REC.CNT:" - ":RECORD.ID:".":TODAY:':':TS:'-':REC.CNT
        DISP.LINE = 11 + REC.CNT
        CRT @(1, DISP.LINE):DTEXT
    NEXT REC.CNT

* Re-store the indirectory record in PACS.DATA.IN in Standard format, for future archive.
    IF R.REC.SAVE THEN
        RECORD.NAME = ID.COMPANY:'.':TODAY:'.':RECORD.ID
        WRITE R.REC.SAVE TO F.BP.IN, RECORD.NAME  ;*Write the ammended record
    END
*
    DISP.LINE = DISP.LINE + 2
    DTEXT = "Checking OLD Records for Purging                                   "
    CRT @(1,DISP.LINE):DTEXT
    GOSUB DO.PURGE  ;* Check for Purging the old records
*
    DTEXT = ''
    DTEXT = "!!! Process Completed !!! Press Any Key To Exit........            "
    CRT @(1,DISP.LINE):DTEXT
    INPUT YYY

    PRINTER.STATUS = ""       ;* EN_20090724 S/E
    RETURN
*-----------------------------------------------------------------------------
PROGRAM.RETURN:
*-----------------------------------------------------------------------------

    RETURN TO PROGRAM.RETURN

    RETURN
*-----------------------------------------------------------------------------
INITIALISE:
*-----------------------------------------------------------------------------
      HUSH.FLAG='0'
	  FN.SPF='F.SPF'
	  R.SPF.SYSTEM=''
	  TEXT=''
*    CALL F.READ('F.SPF','SYSTEM',R.SPF.SYSTEM,F.SPF,TEXT)
	Y.SPF.ID='SYSTEM'
	CALL CACHE.READ(FN.SPF,Y.SPF.ID,R.SPF.SYSTEM,TEXT)
    CUR.REL=R.SPF.SYSTEM<SPF.CURRENT.RELEASE>
    CUR.REL.1=CUR.REL[2,1]
    CUR.REL.2=CUR.REL[3,1]
    IF CUR.REL.1 EQ '1' AND CUR.REL.2 GT '5' THEN
        HUSH.FLAG='1'
    END
    SAVE.ID.COMPANY = ''
    DEF.COM = ''
    INWARD.RTN = ''
    FORM.TYPE = ''
    BP.IN = 'PACS.DATA.IN' ; BP.OUT = 'PACS.DATA.OUT' ; RPT.CTRL.ID = "PACS"

    SEQE  = '' ; ID.WRITE = '' ; ARRAY = '' ; R.REC.SAVE = "" ; OFS.ARRAY = ""

    TIME.STAMP   = TIMEDATE()  ; TS = TIME.STAMP[1,2]:":":TIME.STAMP[4,2]

    C$RPT.IN.HOLD.ID = ''     ;* Now clear this

    DEFAULT.IFNO = "SPF, SYSTEM":@FM:"DATES, ":ID.COMPANY:@FM:"jdiag"

    PGM.TYPE1 = ''
    CURR.NO=''

    OPEN '',BP.OUT TO F.BP.OUT ELSE
        IF VAR.TAFJ EQ '1' THEN
            EXECUTE 'CREATE-FILE PACS.DATA.IN TYPE=UD' CAPTURING VAR.PRINT
        END ELSE
            EXECUTE 'CREATE.FILE PACS.DATA.OUT TYPE=UD' CAPTURING VAR.PRINT
        END
        OPEN '',BP.OUT TO F.BP.OUT ELSE
            TEXT = 'UNABLE TO OPEN ':BP.OUT
            CALL REM
            GOSUB PROGRAM.RETURN
        END
    END
*
    OPEN '',BP.IN TO F.BP.IN ELSE
        IF VAR.TAFJ EQ '1' THEN
            EXECUTE 'CREATE-FILE PACS.DATA.IN TYPE=UD' CAPTURING VAR.PRINT
        END ELSE
            EXECUTE 'CREATE.FILE PACS.DATA.IN TYPE=UD' CAPTURING VAR.PRINT
        END
        OPEN '',BP.IN TO F.BP.IN ELSE
            TEXT = 'UNABLE TO OPEN ':BP.IN
            CALL REM
            GOSUB PROGRAM.RETURN
        END
    END
*
    OPEN '','&HOLD&' TO F.HLD ELSE
        TEXT = 'UNABLE TO OPEN &HOLD&'
        CALL REM
        GOSUB PROGRAM.RETURN
    END
*
    FN.SS = 'F.STANDARD.SELECTION':@FM:'NO.FATAL.ERROR'
    FV.SS = ''
	CALL OPF(FN.SS,FV.SS);*ADDED
    IF ETEXT THEN
        TEXT = ETEXT
        CALL REM
        GOSUB PROGRAM.RETURN
    END
    R.SS = '' ; R.ERR.SS = ''
*
    FN.RPT.CTRL = 'F.REPORT.CONTROL':@FM:'NO.FATAL.ERROR'
    F.RPT.CTRL = ''
    CALL OPF(FN.RPT.CTRL,F.RPT.CTRL)
    IF ETEXT THEN
        TEXT = ETEXT
        CALL REM
        GOSUB PROGRAM.RETURN
    END
    R.RPT.CTRL = '' ; R.ERR.RPT.CTRL = ''
*
    FN.DE.FRM.TYP = 'F.DE.FORM.TYPE':@FM:'NO.FATAL.ERROR'
    F.DE.FRM.TYP = ''
    CALL OPF(FN.DE.FRM.TYP, F.DE.FRM.TYP)
    IF ETEXT THEN
        TEXT = ETEXT
        CALL REM
        GOSUB PROGRAM.RETURN
    END
    R.DE.FRM.TYP = '' ; R.ERR.DE.FRM = ''
*
    CALL F.READ(FN.RPT.CTRL, RPT.CTRL.ID, R.RPT.CTRL, F.RPT.CTRL, R.ERR.RPT.CTRL)
    IF R.ERR.RPT.CTRL THEN
        DTEXT = "!!! EB-MISS.REPORT.CTRL.REC !!! Created a NEW record With ID - PACS               "
        CRT @(1,10):DTEXT

        ARRAY<-1> = ""
        ARRAY<-1> = "!!! EB-MISS.REPORT.CTRL.REC !!! Created a NEW record With ID - PACS"
        R.RPT.CTRL<RCF.DESC>                = "PACS - STANDARD RECORD FOR P-FUNCTION OUTPUT"
        R.RPT.CTRL<RCF.SHORT.DESC>          = "PACS - P-FUNCTION SCREEN OUTPUT"
        R.RPT.CTRL<RCF.FORM.NAME>           = "PACS"
        R.RPT.CTRL<RCF.MICROFICHE.OUTPUT>   = "N"
        R.RPT.CTRL<RCF.BATCH.ONLY.RPT>      = "N"
        R.RPT.CTRL<RCF.COPIES.ONLY>         = "Y"
        SS.ID = 'REPORT.CONTROL'
        MATPARSE R.NEW FROM R.RPT.CTRL
        GOSUB POPULATE.AUDIT.FIELDS
        MATBUILD R.RPT.CTRL FROM R.NEW
*        WRITE R.RPT.CTRL TO F.RPT.CTRL, RPT.CTRL.ID         ;* Write the NEW record.
		CALL F.WRITE(FN.RPT.CTRL,RPT.CTRL.ID,R.RPT.CTRL)
	END
*
    DE.FRM.ID = R.RPT.CTRL<RCF.FORM.NAME>

    CALL F.READ(FN.DE.FRM.TYP, DE.FRM.ID, R.DE.FRM.TYP, F.DE.FRM.TYP, R.ERR.DE.FRM)

    IF R.ERR.DE.FRM THEN
        DTEXT = "!!! EB-MISS.DE.FORM.TYPE.REC !!! Created a NEW record With ID - PACS              "
        CRT @(1,10):DTEXT

        ARRAY<-1> = ""
        ARRAY<-1> = "!!! EB-MISS.DE.FORM.TYPE.REC !!! Created a NEW record With ID - PACS"
        R.DE.FRM.TYP<DE.TYP.DESCRIPTION>     = "PACS - Standard landscape form"
        R.DE.FRM.TYP<DE.TYP.FORM.DEPTH>      = 999
        R.DE.FRM.TYP<DE.TYP.TOP.MARGIN>      = 0
        R.DE.FRM.TYP<DE.TYP.BOTTOM.MARGIN>   = 0
        MATPARSE R.NEW FROM R.DE.FRM.TYP
        GOSUB POPULATE.AUDIT.FIELDS
        MATBUILD R.DE.FRM.TYP FROM R.NEW
*       	   WRITE R.DE.FRM.TYP TO F.DE.FRM.TYP,DE.FRM.ID        ;* Write the NEW record.
		CALL F.WRITE(FN.DE.FRM.TYP,DE.FRM.ID,R.DE.FRM.TYP)
    END


    FN.STMT.ENTRY='F.STMT.ENTRY'
    F.STMT.ENTRY=''
    CALL OPF(FN.STMT.ENTRY,F.STMT.ENTRY)

    FN.CATEG.ENTRY='F.CATEG.ENTRY'
    F.CATEG.ENTRY=''
    CALL OPF(FN.CATEG.ENTRY,F.CATEG.ENTRY)

    FN.STMT.ENTRY.DETAIL='F.STMT.ENTRY.DETAIL'
    F.STMT.ENTRY.DETAIL=''
    CALL OPF(FN.STMT.ENTRY.DETAIL,F.STMT.ENTRY.DETAIL)

    IF VAR.TAFJ EQ '1' THEN

        CALL PRINTER.ON('P.FUNCTION',0)
        PRINT
        PRINT "==============================================="
        PRINT "                    tDiag                      "
        PRINT "==============================================="
        PRINT

        IF OS.NAME EQ 'WINNT' OR OS.NAME EQ 'WIN95' THEN      ;* Command used in Windows
            EXE.CMD = 'DOS -c ':tafjHome:'\bin\tDiag'
        END ELSE
            EXE.CMD = 'SH -c ':tafjHome:'/bin/tDiag'
        END
        EXECUTE EXE.CMD CAPTURING RESULT ;
        PRINT RESULT

    END ELSE

        CALL PRINTER.ON('P.FUNCTION',0)
        PRINT
        PRINT "==============================================="
        PRINT "                    jdiag                      "
        PRINT "==============================================="
        PRINT
        EXECUTE 'jdiag -dv' CAPTURING VAR.PRINT.2
        IF VAR.PRINT.2 THEN
            PRINT
            PRINT VAR.PRINT.2
            PRINT
        END
    END

    APPL.ID.LIST="SPF"
    REC.ID1="SYSTEM"
    GOSUB T24.OUTPUT.EXTRACTION
    CALL PRINTER.OFF

    RETURN

*-----------------------------------------------------------------------------
POPULATE.AUDIT.FIELDS:
*-----------------------------------------------------------------------------

    CALL F.READ(FN.SS, SS.ID, R.SS, FV.SS, SS.R.ERR)

    FINDSTR 'AUDIT.DATE.TIME' IN R.SS<SSL.SYS.FIELD.NAME> SETTING SS.FM, SS.VM, SS.SM THEN
        V = R.SS<SSL.SYS.FIELD.NO, SS.VM, 1>
    END

    R.NEW(V-7) = "1"
    R.NEW(V-6) = TNO:'_':OPERATOR:'_I'
    X = OCONV(DATE(),"D-")
    X = X[9,2]:X[1,2]:X[4,2]:TIME.STAMP[1,2]:TIME.STAMP[4,2]
    R.NEW(V-5) = X
    R.NEW(V-4) = TNO:'_':OPERATOR
    R.NEW(V-3) = ID.COMPANY
    R.NEW(V-2) = R.USER<EB.USE.DEPARTMENT.CODE>

    RETURN

*-----------------------------------------------------------------------------
GET.INPUT:
*-----------------------------------------------------------------------------
*
    LOCATE C.U IN T.CONTROLWORD<1> SETTING X ELSE
        T.CONTROLWORD<X> = C.U
    END
*
    DTEXT = "Input the Record Name...."
    CRT @(1,10):DTEXT
    INPUT RECORD.ID

    IF TRIM(RECORD.ID) EQ '' OR RECORD.ID EQ C.U THEN
        GOSUB PROGRAM.RETURN
    END
*
* Check whether Application wagon is complied.
    IF RECORD.ID[1,6] EQ "POSTSC" THEN  ;* Some Special Case
        APPL.RTN = "T24.PAYMENTS.INFO.SC"
    END ELSE
        APPL.RTN = "T24.PAYMENTS.INFO.":RECORD.ID[1,2]
    END

    CALL CHECK.ROUTINE.EXIST(APPL.RTN, COMPILED.OR.NOT, RETURN.INFO)

    IF COMPILED.OR.NOT THEN
        CALL @APPL.RTN(RECORD.ID, R.REC)
    END ELSE
        OPEN '',BP.IN TO F.BP.IN ELSE
            TEXT = 'UNABLE TO OPEN ':BP.IN
            CALL REM
            GOSUB PROGRAM.RETURN
        END

        READ R.REC FROM F.BP.IN, RECORD.ID ELSE
            TEXT = 'EB-MISS.REC or APP.RTN &':@FM:RECORD.ID
            CALL REM
            GOSUB PROGRAM.RETURN
        END
        R.REC.SAVE = R.REC    ;* Save this as of now
        DELETE F.BP.IN,RECORD.ID        ;* Delete the existing one
    END

    IF NOT(R.REC.SAVE) THEN R.REC = DEFAULT.IFNO:@FM:R.REC

    RETURN


*-----------------------------------------------------------------------------
PRE.PROCESS:
*-----------------------------------------------------------------------------
    APP = TRIM(LINE[',',1,1]) ;* EN_20080415 <Start>
    REC.ID = TRIM(LINE[',',2,1])

    BEGIN CASE
    CASE LINE['-',1,1] EQ "R.ERR"
        ARRAY<-1> = ' ':@FM:' ':@FM:LINE
        SKIP.PROCESS = 1

    CASE LINE['-',1,1] EQ "OFS"
        OFS.ARRAY<-1> = LINE['-',2,999]
        SKIP.PROCESS  = 1

    CASE NOT(INDEX(LINE,',',1))
        TEXT = 'INVALID FORMAT ':LINE:' L.no ':LINE
        ARRAY<-1> = ' ':@FM:' ':@FM:TEXT
        SKIP.PROCESS = 1

    CASE APP EQ "STMT.ENTRY"
        GETSTMTE = 1

    CASE APP EQ "CATEG.ENTRY"
        GETCATEGE = 1

    CASE APP EQ "DE"
        GETDELIVERY = 1

    CASE APP EQ "FT"
        GETFT = 1

    CASE APP EQ "STO"
        GETSTO = 1

    CASE APP EQ "NR"
        GETNR  = 1

    CASE APP EQ "VERSION"
        APP.ID = TRIM(LINE[',',2,1])
        VER.ID = TRIM(LINE[',',3,1])

        REC.ID = APP.ID:",":VER.ID
        IF TRIM(LINE[',',4,1]) EQ 'HIS' THEN
            HIS.MARKER = 1
        END ELSE
            HIS.MARKER = 0
        END
        JSHOW.1 = ''
        TSHOW.1 = ''
        GOSUB PRE.APP.CHECK


    CASE 1
        IF VAR.TAFJ EQ '1' THEN
            IF TRIM(LINE[',',3,1]) EQ 'HIS' THEN
                HIS.MARKER = 1
            END ELSE
                HIS.MARKER = 0
            END

            IF APP EQ 'tShow' OR APP EQ 'tDiag' THEN        ;* EN_20090428 <Start>
                TSHOW.1 = 1
            END ELSE
                TSHOW.1 = ''
                GOSUB PRE.APP.CHECK
            END     ;* EN_20080415 <End>

        END ELSE
            IF TRIM(LINE[',',3,1]) EQ 'HIS' THEN
                HIS.MARKER = 1
            END ELSE
                HIS.MARKER = 0
            END

            IF APP EQ 'jshow' OR APP EQ 'jdiag' THEN        ;* EN_20090428 <Start>
                JSHOW.1 = 1
            END ELSE
                JSHOW.1 = ''
                GOSUB PRE.APP.CHECK
            END     ;* EN_20080415 <End>

        END

    END CASE

    RETURN

*-----------------------------------------------------------------------------
PRE.APP.CHECK:
*-----------------------------------------------------------------------------

    COMI = APP      ;* Application
    ETEXT = '' ; PLAIN.RECORD = 0       ;* Reset this for every cycle

    CALL VALIDATE.APPLICATION

    IF ETEXT THEN
* EN_20080415 <Start>
        GOSUB CHECK.FILE.CONTROL        ;* Check for Table Type files
        IF ETEXT THEN
            ARRAY<-1> = ' ':@FM:' ':@FM:ETEXT:' - ':LINE:' L.no ':LINE
        END
        RETURN      ;* Return here as this is flat file, not T24 Application
* EN_20080415 <End>
    END

    IF PGM.VERSION NE '' THEN
        ETEXT = 'ERROR'
        ARRAY<-1> = ' ':@FM:' ':@FM:'VERIONS NOT ALLOWDED L.no ':LINE
        RETURN
    END

    IF NOT(PGM.TYPE[1,1] MATCHES 'H':@VM:'U':@VM:'L':@VM:'T':@VM:'W':@VM:'D') THEN
        ETEXT = 'ERROR'
        ARRAY<-1> = ' ':@FM:' ':@FM:'APPLICATION NOT ALLOWDED L.no ':LINE
        RETURN
    END

    APP = COMI      ;* Valid Application
    RETURN

*-----------------------------------------------------------------------------
PROCESS.REQUEST:
*-----------------------------------------------------------------------------
* BG_20090122 <Start>
    BEGIN CASE
    CASE JSHOW.1    ;* EN_20090428 S
        GOSUB PRINT.JSHOW     ;* EN_20090428 E
        JSHOW.1 =''
    CASE GETSTMTE
        GOSUB GETSTMT
        GETSTMTE=''
    CASE GETCATEGE
        GOSUB GETCATEG
        GETCATEGE=''
    CASE PLAIN.RECORD
        GOSUB PRINT.PLAIN.RECORD
    CASE GETDELIVERY
        GOSUB DELIVERY.PROCESS
        GETDELIVERY=''
    CASE GETFT
        APPLICATION = 'FUNDS.TRANSFER'
        GOSUB DETERMINE.TRANSACTION.COMPANY
        GOSUB FT.PROCESSING
        GETFT = ''
    CASE GETSTO
        APPLICATION = 'STANDING.ORDER'
        GOSUB DETERMINE.TRANSACTION.COMPANY
        GOSUB STO.PROCESSING
        GETSTO = ''
    CASE GETNR
        APPLICATION = 'ACCOUNT.STATEMENT'
        GOSUB DETERMINE.TRANSACTION.COMPANY
        GOSUB NR.PROCESSING
        GETNR = ''

    CASE 1
        GOSUB DO.T24.PROCESS
    END CASE
* BG_20090122 <End>
    RETURN

*-----------------------------------------------------------------------------
DO.T24.PROCESS:
*-----------------------------------------------------------------------------

    V$FUNCTION = 'GET.PARAM'
    CALL EB.EXECUTE.APPLICATION(APPLICATION)

    CALL MATRIX.UPDATE
*
    IF PGM.TYPE[1,1] EQ 'H' AND HIS.MARKER THEN   ;* Only for 'H' type files and 'HIS' marker
        GOSUB DO.INTREM.PROCESS
        REC.ID = REC.ID.LIST
    END

    LOOP
        V$FUNCTION = 'P'      ;* Set it to NULL
        REMOVE INPUT.BUFFER FROM REC.ID SETTING ID.R.ERR      ;* Record ID
    WHILE INPUT.BUFFER:ID.R.ERR
*
        CALL RECORDID.INPUT
*
        IF E THEN
            ETEXT = E
            ARRAY<-1> = ' ':@FM:' ':@FM:'ERROR - "':E:'" - ':LINE:' L.no ':LINE
            RETURN
        END
        HUSH ON ; CALL RECORD.READ ; HUSH OFF
*
        IF MESSAGE EQ 'REPEAT' THEN
            ETEXT = 'ERROR'
            ARRAY<-1> = ' ':@FM:' ':@FM:'ERROR - "RECORD MISSING" ':LINE:' L.no ':LINE
            RETURN
        END

        CALL MATRIX.ALTER

        GOSUB PRINT.RECORD
    REPEAT

    RETURN

*-----------------------------------------------------------------------------
DO.INTREM.PROCESS:
*-----------------------------------------------------------------------------

* EN_20080415 <Start>

    HIS.ST.CURR = "" ; HIS.ED.CURR = ""
    REC.ID.LIST = ""
    FN.APP = FULL.FNAME:"$HIS"          ;* FULL.FNAME, F.FILE$HIS are common
    FV.APP = F.FILE$HIS       ;* got assigned in MATRIX.UPDATE
    HIS.REC.ID = REC.ID
	R.VAR.PRINT=''
	HIS.R.ERR=''
    CALL F.READ.HISTORY(FN.APP, HIS.REC.ID, R.VAR.PRINT, FV.APP, HIS.R.ERR)
    IF NOT(HIS.R.ERR) THEN
        LAST.HIS.CURR = HIS.REC.ID[';',2,1]
        IF APP EQ 'VERSION' THEN
            HIS.NOS = TRIM(LINE[',',5,1])
        END ELSE
            HIS.NOS = TRIM(LINE[',',4,1])
        END
        BEGIN CASE
        CASE INDEX(HIS.NOS, "-", 1)
            HIS.ST.CURR = FIELD(HIS.NOS, "-", 1)
            IF HIS.ST.CURR GT LAST.HIS.CURR THEN HIS.ST.CURR = LAST.HIS.CURR
            HIS.ED.CURR = FIELD(HIS.NOS, "-", 2)
            IF HIS.ED.CURR GT LAST.HIS.CURR THEN HIS.ED.CURR = LAST.HIS.CURR

        CASE HIS.NOS[1,1] EQ "F"
            HIS.ST.CURR = 1
            HIS.ED.CURR = TRIM(HIS.NOS[2, 999])
            IF HIS.ED.CURR GT LAST.HIS.CURR THEN HIS.ED.CURR = LAST.HIS.CURR

        CASE HIS.NOS[1,1] EQ "L"
            HIS.ST.CURR = LAST.HIS.CURR - TRIM(HIS.NOS[2, 999])
            IF HIS.ST.CURR LT 1 THEN HIS.ST.CURR = 1
            HIS.ED.CURR = LAST.HIS.CURR

        CASE ISDIGIT(HIS.NOS)
            IF HIS.NOS LE LAST.HIS.CURR THEN
                HIS.ST.CURR = HIS.NOS
                HIS.ED.CURR = HIS.NOS
            END
        END CASE

        IF (HIS.ST.CURR AND HIS.ED.CURR) AND (HIS.ST.CURR LE HIS.ED.CURR) THEN
            FOR INS.CNT = HIS.ST.CURR TO HIS.ED.CURR
                REC.ID.LIST<-1> = REC.ID:';':INS.CNT
            NEXT INS.CNT
        END ELSE
            ARRAY<-1> = ' ':@FM:' ':@FM:'INCORRECT HISTORY FORMAT L.no ':LINE
        END
    END
* EN_20080415 <End>

    RETURN

*-----------------------------------------------------------------------------
PRINT.RECORD:
*-----------------------------------------------------------------------------
* Now Print the record
* BG_20090122 <Start>
    IF ETEXT THEN
        RETURN
    END
* BG_20090122 <End>

    CALL PRINTER.ON('P.FUNCTION',0)
    PRINT
    PRINT "==============================================="
    PRINT APPLICATION
    PRINT "==============================================="
    CALL PRINTER.OFF

* BG_20080604 <Start>
    IF PGM.TYPE[1,1] EQ 'T' THEN
        CALL TABLE.DISPLAY
    END ELSE
        CALL FIELD.DISPLAY
    END
* BG_20080604 <End>
    ID.NEW = ''
    RETURN

*-----------------------------------------------------------------------------
CLEAR.COMMON:
*-----------------------------------------------------------------------------
* Don't know whether this is required ??? but let's have

    MAT R.NEW    = "" ; MAT R.OLD  = "" ; MAT R.NEW.LAST = ""
    T.AUTH.PAGE  = "" ; T.ENRI     = "" ; T.ETEXT        = ""
    T.FUNCTION   = "" ; T.LOCREF   = "" ; T.MULTI.PAGE   = ""
    PGM.VERSION  = "" ; V$FUNCTION = "" ; T.FIELDNO      = ""
    COMI.DEFAULT = "" ; COMI.ENRI  = "" ; MESSAGE        = ""
    ID.NEW       = "" ; ID.OLD     = "" ; SKIP.PROCESS  = ""
    ETEXT        = "" ; TEXT       = "" ; E = ''

    RETURN

*-----------------------------------------------------------------------------
WRITE.OUT.RECORD:
*-----------------------------------------------------------------------------
* Collect and write down the details
* BG_20090122 <Start>
*
    SLEEP 2         ;* Sleep couple of sec before extracting the data
* BG_20090122 <End>
*
    HLD.ID = C$RPT.IN.HOLD.ID<1>        ;* HOLD ID Generated
*
    CALL PRINTER.CLOSE('P.FUNCTION',0,OPERATOR)

    IF TRIM(HLD.ID) EQ '' THEN
        RETURN      ;* Nothing to do
    END
*
    READ R.HOLD FROM F.HLD,HLD.ID ELSE
        RETURN      ;* Nothing to do
    END
*
    ARRAY<-1> = ' '
    ARRAY<-1> = ' ========================================================================'
    ARRAY<-1> = ' '
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
        IF DCOUNT(ARRAY,@FM) GE 4000 THEN
            ARRAY<-1> = ' '
            ARRAY<-1> = FMT('Page to be continued','80L')
            GOSUB FLUSH.RECORD
        END
    REPEAT

* Delete the HOLD record.
    DELETE F.HLD, HLD.ID
* Pring OFS Strings:

    ARRAY<-1> = ' '
    ARRAY<-1> = ' ======================OFS Strings======================================='
    ARRAY<-1> = ' '
    LOOP
        REMOVE CONT FROM OFS.ARRAY SETTING CONT.POS
    WHILE CONT:CONT.POS
        ARRAY<-1> = CONT
        IF DCOUNT(ARRAY,@FM) GE 4000 THEN
            ARRAY<-1> = ' '
            ARRAY<-1> = FMT('Page to be continued','80L')
            GOSUB FLUSH.RECORD
        END
    REPEAT

    ARRAY<-1> = ' '
    ARRAY<-1> = ' ========================================================================'
    ARRAY<-1> = ' '
*
    IF ARRAY THEN
        GOSUB FLUSH.RECORD
    END
*
    RETURN

*-----------------------------------------------------------------------------
FLUSH.RECORD:
*-----------------------------------------------------------------------------

    SEQE = SEQE + 1

    ID.WRITE = RECORD.ID:'.':TODAY:':':TS:'-':SEQE
    WRITE ARRAY TO F.BP.OUT, ID.WRITE
    ARRAY = ''

    RETURN

*-----------------------------------------------------------------------------
DO.PURGE:
*-----------------------------------------------------------------------------
* Do this process once in a day

*
    READ PRG.DATE FROM F.LOCKING,'PRG.T24.PAYMENTS.INFO' ELSE
        PRG.DATE = ''
    END
*
    IF PRG.DATE NE '' AND PRG.DATE EQ TODAY THEN
        RETURN      ;* Already purged
    END
*
*    CALL DISPLAY.MESSAGE('PURGING',2)
	TEXT='PURGING'
	CALL REM
*
* Purge data with age LE 5 Working days
*
    CNRG = R.COMPANY(EB.COM.LOCAL.COUNTRY):R.COMPANY(EB.COM.LOCAL.REGION)[1,2]
    CALL WORKING.DAY('S',TODAY,'-','5W','B',CNRG,'',FIVE.DAYS.BFR,'','')

    SEL.CMD = 'SELECT PACS.DATA.IN WITH EVAL':DQUOTE("@ID['.',2,1]"):' LE ':DQUOTE(FIVE.DAYS.BFR)
	BP.IN.LIST=''
	NO.OF.REC=''
	SEL.ERR=''
*    EXECUTE SEL.CMD CAPTURING NOTHING
*    READLIST BP.IN.LIST ELSE
*        BP.IN.LIST = ''
*    END
	CALL EB.READLIST(SEL.CMD,BP.IN.LIST,'',NO.OF.REC,SEL.ERR)
*
    SEL.CMD = 'SELECT PACS.DATA.OUT WITH EVAL':DQUOTE("@ID['.',2,1]"):' LE ':DQUOTE(FIVE.DAYS.BFR)
	BP.OUT.LIST=''
*    EXECUTE SEL.CMD CAPTURING NOTHING
*    READLIST BP.OUT.LIST ELSE
*        BP.OUT.LIST = ''
*    END
	CALL EB.READLIST(SEL.CMD,BP.OUT.LIST,'',NO.OF.REC,SEL.ERR)
*
    LOOP
        REMOVE BP.IN.ID FROM BP.IN.LIST SETTING IN.POS
        REMOVE BP.OUT.ID FROM BP.OUT.LIST SETTING OUT.POS
    WHILE BP.IN.ID:IN.POS OR BP.OUT.ID:OUT.POS DO
*
        IF BP.IN.ID:IN.POS THEN
            DELETE F.BP.IN, BP.IN.ID
        END
*
        IF BP.OUT.ID:OUT.POS THEN
            DELETE F.BP.OUT, BP.OUT.ID
        END
*
    REPEAT
*
* Update to TODAY as we need not to do the same process again
*
    WRITE TODAY TO F.LOCKING,'PRG.T24.PAYMENTS.INFO'

    RETURN

*-----------------------------------------------------------------------------
CHECK.FILE.CONTROL:
*-----------------------------------------------------------------------------
*
* New Para to check File Control exist for the Mentioned File, if so
* signal to print the record.
*
* EN_20080415 <Start>

    FN.FILE = 'F.':APP:@FM:'NO.FATAL.ERROR'
    F.FILE = ''
    ETEXT = ''      ;* Set to NULL
*
    CALL OPF(FN.FILE,F.FILE)
    IF ETEXT EQ '' THEN
        PLAIN.RECORD = 1
    END
*
    IF PLAIN.RECORD AND (HIS.MARKER OR HIS.NOS) THEN
        ETEXT = 'HISTORY RECORDS CANNOT BE FETCHED AUTOMATICALLY'
        PLAIN.RECORD = 0      ;* Reset
    END
*
    RETURN

*-----------------------------------------------------------------------------
PRINT.PLAIN.RECORD:
*-----------------------------------------------------------------------------
* First set the printer
*
    CALL PRINTER.ON('P.FUNCTION',0)
*
* Now start Printing
*
	R.RECORD=''
	FILE.ERR=''
*    READ R.RECORD FROM F.FILE,REC.ID ELSE
	CALL F.READ(FN.FILE,REC.ID,R.RECORD,F.FILE,FILE.ERR)
        ARRAY<-1> = 'RECORD MISSING - FILE ':FN.FILE:' CONTRACT ': REC.ID
        RETURN
    END
*
    PRINT ; PRINT
    PRINT STR('=',80)
    PRINT SPACE(10):'APPLICATION':SPACE(5):APP
    PRINT SPACE(10):'ID.........':SPACE(5):REC.ID
    PRINT STR('=',80)
    NO.LINES = DCOUNT(R.RECORD,@FM)
    FOR I = 1 TO NO.LINES
        NO.VM = DCOUNT(R.RECORD<I>,@VM)
        IF NO.VM THEN
            FOR J = 1 TO NO.VM
                NO.SM = DCOUNT(R.RECORD<I,J>,@SM)
                IF NO.SM THEN
                    FOR K = 1 TO NO.SM
                        Line.Narr = 'LINE.':I:'.':J:'.':K
                        PRINT FMT(Line.Narr,'25.L'):SPACE(4):R.RECORD<I,J,K>
                    NEXT K
                END ELSE
                    Line.Narr = 'LINE.':I:'.':J
                    PRINT FMT(Line.Narr,'25.L'):SPACE(4):R.RECORD<I,J>
                END
            NEXT J
        END ELSE
            Line.Narr = 'LINE.':I
            PRINT FMT(Line.Narr,'25.L'):SPACE(4):R.RECORD<I>
        END
    NEXT I

    CALL PRINTER.OFF          ;* Switch off the printer

    RETURN


*-----------------------------------------------------------------------------
PRINT.JSHOW:
*-----------------------------------------------------------------------------

    CALL PRINTER.ON('P.FUNCTION',0)     ;* EN_20090428 <Start>

    BEGIN CASE
    CASE APP EQ 'jshow'
        PRINT
        PRINT "==============================================="
        PRINT "                    jshow                      "
        PRINT "==============================================="
        PRINT
        EXC.CMD2 = "jshow -c ":REC.ID
        EXECUTE EXC.CMD2 CAPTURING VAR.PRINT

        PRINT EXC.CMD2
        PRINT VAR.PRINT
        PRINT

    CASE APP EQ 'jdiag'
        PRINT
        PRINT "==============================================="
        PRINT "                    jdiag                      "
        PRINT "==============================================="
        PRINT
        EXECUTE 'jdiag -dv' CAPTURING VAR.PRINT.2
        IF VAR.PRINT.2 THEN
            PRINT
            PRINT VAR.PRINT.2
            PRINT
        END
    END CASE

    CALL PRINTER.OFF          ;* Switch off the printer EN_20090428 <End>

    RETURN

*-----------------------------------------------------------------------------
GETSTMT:
*-----------------------------------------------------------------------------

    CALL PRINTER.ON('P.FUNCTION',0)     ;* EN_20090428 <Start>
    PRINT
    PRINT "==============================================="
    PRINT "   STMT.ENTRY & STMT.ENTRY.DETAIL              "
    PRINT "==============================================="
    PRINT
    EXC.CMD2 = "TERM 500"
    EXECUTE EXC.CMD2
    EXC.CMD2=''
    EXC.CMD2 = "LIST " : FN.STMT.ENTRY : " WITH TRANS.REFERENCE LIKE ..." : REC.ID : "... BY @ID STMT.ENTRY.ID ACCOUNT.NUMBER AMOUNT.LCY PRODUCT.CATEGORY VALUE.DATE CURRENCY AMOUNT.FCY TRANS.REFERENCE SYSTEM.ID BOOKING.DATE NO.PAGE"

    EXECUTE EXC.CMD2 CAPTURING VAR.PRINT

    IF VAR.PRINT THEN
        PRINT EXC.CMD2
        PRINT VAR.PRINT
        PRINT
    END
    EXC.CMD2=''
    EXC.CMD2 = "LIST " : FN.STMT.ENTRY.DETAIL : " WITH TRANS.REFERENCE LIKE ..." : REC.ID : "... BY @ID STMT.ENTRY.ID ACCOUNT.NUMBER AMOUNT.LCY PRODUCT.CATEGORY VALUE.DATE CURRENCY AMOUNT.FCY TRANS.REFERENCE SYSTEM.ID BOOKING.DATE NO.PAGE"

    EXECUTE EXC.CMD2 CAPTURING VAR.PRINT

    IF VAR.PRINT THEN
        PRINT EXC.CMD2
        PRINT VAR.PRINT
        PRINT
    END
    EXC.CMD2=''

    CALL PRINTER.OFF          ;* Switch off the printer EN_20090428 <End>

    RETURN

*-----------------------------------------------------------------------------
GETCATEG:
*-----------------------------------------------------------------------------

    CALL PRINTER.ON('P.FUNCTION',0)     ;* EN_20090428 <Start>

    PRINT
    PRINT "==============================================="
    PRINT "              CATEG.ENTRY                      "
    PRINT "==============================================="
    PRINT
    EXC.CMD2 = "TERM 500"
    EXECUTE EXC.CMD2
    EXC.CMD2=''
    EXC.CMD2 = "LIST " : FN.CATEG.ENTRY : " WITH TRANS.REFERENCE LIKE ..." : REC.ID : "... BY @ID PL.CATEGORY AMOUNT.LCY PRODUCT.CATEGORY VALUE.DATE CURRENCY AMOUNT.FCY TRANS.REFERENCE SYSTEM.ID BOOKING.DATE NO.PAGE"

    EXECUTE EXC.CMD2 CAPTURING VAR.PRINT

    IF VAR.PRINT THEN
        PRINT EXC.CMD2
        PRINT VAR.PRINT
        PRINT
    END
    EXC.CMD2=''
    CALL PRINTER.OFF          ;* Switch off the printer EN_20090428 <End>

    RETURN

*-----------------------------------------------------------------------------
DELIVERY.PROCESS:
*-----------------------------------------------------------------------------

    IF NOT (NUM(REC.ID[2,99])) THEN
        CALL PRINTER.ON('P.FUNCTION',0)
        PRINT
        PRINT "==============================================="
        PRINT "   DELIVERY HEADER ":REC.ID:" ID NOT VALID     "
        PRINT "==============================================="
        CALL PRINTER.OFF
    END ELSE
        GOSUB DELIVERY.INITIALISATION
		DEL.REC=''
		R.R.ERR=''
        IF FILE.VALUE EQ 'INWARD' THEN
            CALL F.READ(FN.DE.I.HEADER,REC.ID,DEL.REC,F.DE.I.HEADER,R.R.ERR)
            APPL.ID.LIST = "DE.I.HEADER"
            ADDTN = APPL.ID.LIST
        END ELSE
            CALL F.READ(FN.DE.O.HEADER,REC.ID,DEL.REC,F.DE.O.HEADER,R.R.ERR)
            APPL.ID.LIST = "DE.O.HEADER"
            ADDTN = APPL.ID.LIST
        END
        IF R.R.ERR THEN
            CALL PRINTER.ON('P.FUNCTION',0)
            PRINT
            PRINT "==============================================="
            PRINT "  THE HEADER RECORD ":REC.ID:" DOES NOT EXIST   "
            PRINT "==============================================="
            CALL PRINTER.OFF
        END ELSE
            MESSAGE.TYPE = DEL.REC<DE.HDR.MESSAGE.TYPE>
            CUSTOMER.NO = DEL.REC<DE.HDR.CUSTOMER.NO>
            ACCOUNT.NO = DEL.REC<DE.HDR.AC.NO.>
            HDR.APPL = DEL.REC<DE.HDR.APPLICATION>
            APPLICATION.FORMAT = DEL.REC<DE.HDR.APP.FORMAT>

            IF APPLICATION.FORMAT EQ '' THEN
                APPLICATION.FORMAT = '1'
            END

            REC.ID1 = REC.ID
            GOSUB T24.OUTPUT.EXTRACTION

            IF MESSAGE.TYPE EQ '' THEN
                CALL PRINTER.ON('P.FUNCTION',0)
                PRINT
                PRINT "==============================================="
                PRINT " THE MESSAGE TYPE IS MISSING IN HEADER RECORD  "
                PRINT "==============================================="
                CALL PRINTER.OFF
            END

            IF HDR.APPL EQ '' AND FILE.VALUE EQ 'OUTWARD' THEN
                CALL PRINTER.ON('P.FUNCTION',0)
                PRINT
                PRINT "==============================================="
                PRINT "                                               "
                PRINT " THE APPLICATION IS MISSING IN HEADER RECORD   "
                PRINT "                                               "

                PRINT "==============================================="
                CALL PRINTER.OFF
            END
            IF MESSAGE.TYPE NE '' AND NOT(HDR.APPL EQ '' AND FILE.VALUE EQ 'OUTWARD') THEN
			R.MESSAGE=''
			ERR5=''
                CALL F.READ(FN.DE.MESSAGE,MESSAGE.TYPE,R.MESSAGE,F.DE.MESSAGE,ERR5)

                APPL.ID.LIST = "DE.MESSAGE"
                REC.ID1 = MESSAGE.TYPE
                GOSUB T24.OUTPUT.EXTRACTION

                IF FILE.VALUE EQ 'INWARD' THEN

                    APPL.ID.LIST = "DE.I.FT.TXN.TYPES"
                    REC.ID1 = MESSAGE.TYPE
                    GOSUB T24.OUTPUT.EXTRACTION

                    IF R.MESSAGE THEN

                        VERSION = R.MESSAGE<DE.MSG.IN.OFS.VERSION>
                        OFS.SOURCE = R.MESSAGE<DE.MSG.OFS.SOURCE>
                        INWARD.OFS.RTN = R.MESSAGE<DE.MSG.INWARD.OFS.RTN>
                    END

                    IF VERSION THEN
					R.VERSION.REC=''
					ERR2=''
                        CALL F.READ(FN.VERSION, VERSION, R.VERSION.REC, F.VERSION, ERR2)
                        APPL.ID.LIST = "VERSION"
                        REC.ID1 = VERSION
                        GOSUB T24.OUTPUT.EXTRACTION
                    END

                    IF OFS.SOURCE THEN
					R.SOURCE=''
					R.R.ERR=''
                        CALL F.READ(FN.OFS.SOURCE,OFS.SOURCE,R.SOURCE,F.OFS.SOURCE,R.R.ERR)
                        APPL.ID.LIST = "OFS.SOURCE"
                        REC.ID1 = OFS.SOURCE
                        GOSUB T24.OUTPUT.EXTRACTION
                    END

                    IF INWARD.OFS.RTN THEN
                        IF INWARD.OFS.RTN[1,1] EQ '@' THEN
                            INWARD.OFS.RTN = INWARD.OFS.RTN[2,99]
                        END
                        CALL PRINTER.ON('P.FUNCTION',0)
                        PRINT
                        PRINT "==============================================="
                        PRINT "                    jshow                      "
                        PRINT "==============================================="
                        PRINT
                        EXC.CMD2 = "jshow -c ":INWARD.OFS.RTN
                        EXECUTE EXC.CMD2 CAPTURING VAR.PRINT
                        IF VAR.PRINT THEN
                            PRINT EXC.CMD2
                            PRINT VAR.PRINT
                            PRINT
                        END
                        EXC.CMD2 = ''
                        CALL PRINTER.OFF

                    END
			
                        SS.REC1 = ''
                        CALL GET.STANDARD.SELECTION.DETS(ADDTN,SS.REC1)

                        OFS.REQ.POS1 = ''
                        T24.INW.TRANS.REF1 = ''
			OFS.REQ.NO1= ''
			T24.INW.NO1= ''

                        LOCATE 'OFS.REQ.DET.KEY' IN SS.REC1<SSL.SYS.FIELD.NAME,1> SETTING OFS.REQ.POS1 THEN
                            OFS.REQ.NO1 = SS.REC1<SSL.SYS.FIELD.NO,OFS.REQ.POS1>
                        END
                        LOCATE 'T24.INW.TRANS.REF' IN SS.REC1<SSL.SYS.FIELD.NAME,1> SETTING T24.INW.TRANS.REF1 THEN
                            T24.INW.NO1= SS.REC1<SSL.SYS.FIELD.NO,T24.INW.TRANS.REF1>
                        END

                    TOT.CNT = DCOUNT(DEL.REC,@FM)
                    IF TOT.CNT GT 60 THEN
                        DEL.CUS.COM = DEL.REC<DE.HDR.CUS.COMPANY>
                        IF DEL.CUS.COM EQ '' THEN
                            DEL.CUS.COM = DEL.REC<DE.HDR.DIM + 6>
                        END

                        FT.ID = DEL.REC<T24.INW.NO1>


                        IF FT.ID NE '' THEN
                            CALL LOAD.COMPANY(DEL.CUS.COM)
                            GOSUB FT.INITIALIZE
                            CALL F.READ(FN.FUNDS.TRANSFER,FT.ID,FUNDS.REC,F.FUNDS.TRANSFER,R.R.ERR)
                            D.RANGE.AND.VALUE<1> = FT.ID
                            IF NOT(FUNDS.REC) THEN
                                CALL F.READ(FN.FUNDS.TRANSFER$NAU,FT.ID,FUNDS.REC,F.FUNDS.TRANSFER$NAU,R.R.ERR)
                                D.RANGE.AND.VALUE = FT.ID
                            END
                            IF NOT(FUNDS.REC) THEN
                                FT.ID1 = FT.ID:';1'
                                CALL F.READ(FN.FUNDS.TRANSFER$HIS,FT.ID1,FUNDS.REC,F.FUNDS.TRANSFER$HIS,R.R.ERR)
                                D.RANGE.AND.VALUE = FT.ID1
                            END
                            IF NOT(FUNDS.REC) THEN
                                CALL PRINTER.ON('P.FUNCTION',0)
                                PRINT
                                PRINT "==============================================="
                                PRINT "      FT RECORD ":FT.ID:" DOES NOT EXIST       "
                                PRINT "==============================================="
                                CALL PRINTER.OFF
                            END ELSE
                                SAVE.APP = APP
                                APP = 'FT'
                                APPL.ID.LIST = 'FT'
                                REC.ID1 = FT.ID
                                DEF.COM = DEL.CUS.COM
                                GOSUB T24.OUTPUT.EXTRACTION
                                APP = SAVE.APP
                            END
                        END
                        
                        ORD.ID = DEL.REC<OFS.REQ.NO1>

                        IF ORD.ID NE '' THEN
                            EXC.CMD1<-1> = "LIST F.OFS.REQUEST.DETAIL WITH @ID EQ ":ORD.ID
                        END
                    END

                    CARRIER.ADDR = DEL.REC<DE.HDR.CARRIER.ADDRESS.NO,1>
                    CARRIER.ID = FIELD(CARRIER.ADDR, '.', 1)

                    IF CARRIER.ID THEN
                        CALL F.READ(FN.DE.CARRIER,CARRIER.ID,R.CARRIER,F.DE.CARRIER,ERR2)
                        INTERFACE = R.CARRIER<DE.CARR.INTERFACE>
                        FORMAT.MODULE = R.CARRIER<DE.CARR.FORMAT.MODULE>
                        IF FORMAT.MODULE NE '' THEN

                            FN.DE.FORMAT = 'F.DE.FORMAT.'
                            FN.DE.FORMAT:=FORMAT.MODULE
                            F.DE.FORMAT = ''

                            CALL OPF(FN.DE.FORMAT,F.DE.FORMAT)

                            FORMAT.ID = MESSAGE.TYPE:'.':'1':'.':'1'
                            CALL F.READ(FN.DE.FORMAT,FORMAT.ID,R.FORMAT,F.DE.FORMAT,ERR3)

                            APPL = FN.DE.FORMAT[3,99]
                            APPL.ID.LIST = APPL
                            REC.ID1 = FORMAT.ID
                            GOSUB T24.OUTPUT.EXTRACTION
                        END
                        IF EXC.CMD1 EQ '' THEN
                            EXC.CMD1 = "LIST F.DE.CARRIER WITH @ID LIKE ...":CARRIER.ID:"..."
                        END ELSE
                            EXC.CMD1<-1> = "LIST F.DE.CARRIER WITH @ID LIKE ...":CARRIER.ID:"..."
                        END

                        IF INTERFACE THEN
                            EXC.CMD1<-1> = "LIST F.DE.INTERFACE WITH @ID LIKE ...":INTERFACE:"..."
                            CALL F.READ(FN.DE.INTERFACE,INTERFACE,R.INTERFACE,F.DE.INTERFACE,R.R.ERR)
                            INWARD.RTN = R.INTERFACE<DE.ITF.IN.IF.ROUTINE>
                        END

                        ACTIVATION.LIST = "F.":CARRIER.ID:".IN.LIST"
                        EXC.CMD1<-1> = "LIST ":ACTIVATION.LIST :" WITH @ID LIKE ":REC.ID:"..."

*                        INWARD.RTN = R.INTERFACE<DE.ITF.IN.IF.ROUTINE>
                        IF INWARD.RTN  THEN
                            CALL PRINTER.ON('P.FUNCTION',0)
                            PRINT
                            PRINT "==============================================="
                            PRINT "                    jshow                      "
                            PRINT "==============================================="
                            PRINT
                            EXC.CMD2 = "jshow -c ":INWARD.RTN
                            EXECUTE EXC.CMD2 CAPTURING VAR.PRINT
                            IF VAR.PRINT THEN
                                PRINT EXC.CMD2
                                PRINT VAR.PRINT
                                PRINT
                            END
                            EXC.CMD2 = ''
                            CALL PRINTER.OFF
                        END

                    END ELSE

                        CALL PRINTER.ON('P.FUNCTION',0)
                        PRINT
                        PRINT "========================================================="
                        PRINT " THE CARRIER ID IS MISSING IN HEADER RECORD ":REC.ID:"   "
                        PRINT "========================================================="
                        CALL PRINTER.OFF
                    END
                END

                IF FILE.VALUE EQ 'OUTWARD' THEN

                    MAPPING.KEY = MESSAGE.TYPE:".":HDR.APPL[1,2]:".":APPLICATION.FORMAT

                    CALL F.READ(FN.DE.MAPPING,MAPPING.KEY,R.MAPPING,F.DE.MAPPING,ERR1)

                    IF ERR1 THEN
                        MAPPING.KEY = MESSAGE.TYPE:'.':HDR.APPL[1,2]:'.':'1'
                    END

                    APPL.ID.LIST = "DE.MAPPING"
                    REC.ID1 = MAPPING.KEY
                    GOSUB T24.OUTPUT.EXTRACTION

                    MAP.ROUTINE = R.MAPPING<DE.MAP.ROUTINE>

                    IF MAP.ROUTINE THEN
                        IF MAP.ROUTINE[1,1] EQ '@' THEN
                            MAP.ROUTINE = MAP.ROUTINE[2,99]
                        END
                        CALL PRINTER.ON('P.FUNCTION',0)
                        PRINT
                        PRINT "==============================================="
                        PRINT "                    jshow                      "
                        PRINT "==============================================="
                        PRINT
                        EXC.CMD2 = "jshow -c ":MAP.ROUTINE
                        EXECUTE EXC.CMD2 CAPTURING VAR.PRINT
                        IF VAR.PRINT THEN
                            PRINT EXC.CMD2
                            PRINT VAR.PRINT
                            PRINT
                        END
                        EXC.CMD2 = ''
                        CALL PRINTER.OFF
                    END

                    MAX.CARRIERS = COUNT(DEL.REC<DE.HDR.CARRIER.ADDRESS.NO>,@VM) + 1

                    FOR CARRIER.NO = 1 TO MAX.CARRIERS

                        CARRIER.ADDR = DEL.REC<DE.HDR.CARRIER.ADDRESS.NO,CARRIER.NO>
                        CARRIER.ID = FIELD(CARRIER.ADDR, '.', 1)
                        CARRIER.COUNT = CARRIER.COUNT + 1

                        IF MAX.CARRIERS EQ '1' THEN
                            NOT.REPEATED = '1'
                        END ELSE
                            IF CARRIER.SET<CARRIER.COUNT-1> NE CARRIER.ID THEN
                                NOT.REPEATED = '1'
                                CARRIER.SET<-1> = CARRIER.ID
                            END ELSE
                                CARRIER.SET<-1> = CARRIER.ID
                            END
                        END

                        IF NOT.REPEATED THEN

                            CALL F.READ(FN.DE.CARRIER,CARRIER.ID,R.CARRIER,F.DE.CARRIER,ERR2)
                            INTERFACE = R.CARRIER<DE.CARR.INTERFACE>
                            FORMAT.MODULE = R.CARRIER<DE.CARR.FORMAT.MODULE>

                            IF EXC.CMD1 EQ '' THEN
                                EXC.CMD1 = "LIST F.DE.CARRIER WITH @ID LIKE ...":CARRIER.ID:"..."
                            END ELSE
                                EXC.CMD1<-1> = "LIST F.DE.CARRIER WITH @ID LIKE ...":CARRIER.ID:"..."
                            END

                            ACTIVATION.LIST = "F.":CARRIER.ID:".OUT.LIST"
                            EXC.CMD1<-1> = "LIST ":ACTIVATION.LIST :" WITH @ID LIKE ":REC.ID:"..."
                            EXC.CMD1<-1> = "LIST.ITEM F.DE.O.MSG.":CARRIER.ID:" WITH @ID LIKE ":REC.ID:"..."

                            IF INTERFACE THEN

                                CALL F.READ(FN.DE.INTERFACE,INTERFACE,R.INTERFACE,F.DE.INTERFACE,R.R.ERR)
                                EXC.CMD1<-1> = "LIST F.DE.INTERFACE WITH @ID LIKE ...":INTERFACE:"..."

                                OUTWARD.RTN = R.INTERFACE<DE.ITF.OUT.IF.ROUTINE>

                                IF OUTWARD.RTN THEN
                                    CALL PRINTER.ON('P.FUNCTION',0)
                                    PRINT
                                    PRINT "==============================================="
                                    PRINT "                    jshow                      "
                                    PRINT "==============================================="
                                    PRINT
                                    EXC.CMD2 = "jshow -c ":OUTWARD.RTN
                                    EXECUTE EXC.CMD2 CAPTURING VAR.PRINT
                                    IF VAR.PRINT THEN
                                        PRINT EXC.CMD2
                                        PRINT VAR.PRINT
                                        PRINT
                                    END
                                    EXC.CMD2 = ''
                                END
                                CALL PRINTER.OFF

                            END

                            IF FORMAT.MODULE NE '' THEN

                                FN.DE.FORMAT = 'F.DE.FORMAT.'
                                FN.DE.FORMAT:=FORMAT.MODULE
                                F.DE.FORMAT = ''
								R.FORMAT=''
								ERR3=''
                                CALL OPF(FN.DE.FORMAT,F.DE.FORMAT)

                                FORMAT.ID = MESSAGE.TYPE:'.':APPLICATION.FORMAT:'.':DEL.REC<DE.HDR.FORMAT,CARRIER.NO>


                                IF FORMAT.MODULE EQ "PRINT" OR FORMAT.MODULE EQ "XML" THEN
                                    FORMAT.ID := '.':DEL.REC<DE.HDR.TRANSLATION,CARRIER.NO>
                                END

                                IF FORMAT.MODULE EQ 'SWIFT' THEN
                                    FORMAT.ID = MESSAGE.TYPE:'.':'1':'.':'1'
                                END

                                CALL F.READ(FN.DE.FORMAT,FORMAT.ID,R.FORMAT,F.DE.FORMAT,ERR3)

                                APPL = FN.DE.FORMAT[3,99]
                                APPL.ID.LIST = APPL
                                REC.ID1 = FORMAT.ID
                                GOSUB T24.OUTPUT.EXTRACTION


                                IF FORMAT.MODULE EQ "PRINT" THEN
                                    FORM.TYPE = R.FORMAT<DE.PRT.FORM.TYPE>
                                END

                                IF FORMAT.MODULE EQ "XML" THEN
                                    FORM.TYPE = R.FORMAT<DE.XML.FORM.TYPE>
                                END

                                IF FORM.TYPE THEN

                                    CALL F.READ(FN.DE.FORM.TYPE,FORM.TYPE,R.FORM,F.DE.FORM.TYPE,ERR4)

                                    APPL.ID.LIST = "DE.FORM.TYPE"
                                    REC.ID1 = FORM.TYPE
                                    GOSUB T24.OUTPUT.EXTRACTION
                                    EXC.CMD1<-1> = "LIST.ITEM F.DE.O.MSG.":FORM.TYPE:" WITH @ID LIKE ":REC.ID:"..."
                                END

                                IF FORMAT.MODULE EQ 'XML' THEN

                                    TRANSFORM.ID = 'DE':'.':FORMAT.ID
                                    TRANSFORM.ID:= '.':CARRIER.ID
                                    EXC.CMD1<-1>="LIST.ITEM F.EB.TRANSFORM '":TRANSFORM.ID:"'"
                                END

                            END
                        END
                        NOT.REPEATED = ''
                        INWARD.RTN = ''
                        OUTWARD.RTN = ''
                        FORM.TYPE = ''
                        TRANSFORM.ID = ''
                        FORMAT.ID = ''
                    NEXT CARRIER.NO

                END
            END
            IF CUSTOMER.NO NE '' THEN
                EXC.CMD1<-1> = "LIST F.DE.PRODUCT WITH @ID LIKE ...C-":CUSTOMER.NO:"..."
                EXC.CMD1<-1> = "LIST F.DE.ADDRESS WITH @ID LIKE ...C-":CUSTOMER.NO:"..."
            END

            IF ACCOUNT.NO NE '' THEN
                EXC.CMD1<-1> = "LIST F.DE.PRODUCT WITH @ID LIKE ...A-":ACCOUNT.NO:"..."
            END

            EXC.CMD1<-1> = "LIST F.DE.PRODUCT WITH @ID LIKE ...":MESSAGE.TYPE:"..."

            IF FILE.VALUE EQ 'OUTWARD' THEN

                EXC.CMD1<-1> = "LIST.ITEM F.DE.O.HISTORY WITH @ID LIKE ":REC.ID:"..."
                EXC.CMD1<-1> = "LIST.ITEM F.DE.O.MSG WITH @ID LIKE ":REC.ID:"..."

                CALL PRINTER.ON('P.FUNCTION',0)
                PRINT
                PRINT "==============================================="
                PRINT "DELIVERY HANDOFF DETAILS FOR  ":REC.ID:"       "
                PRINT "==============================================="
                CALL PRINTER.OFF

                SAVE.SCREEN.TITLE = "PRINTING HANDOFF DETAILS"
                ENQ = 'DE.HANDOFF.DETS'
                ENQ<2,1> = 'DELIVERY.REF'
                ENQ<3,1> = 'EQ'
                ENQ<4,1> = REC.ID
                ENQ<10,1> = 'OUTPUT'
                CALL ENQUIRY.DISPLAY(ENQ)

                IF FORMAT.MODULE EQ 'XML' THEN

                    CALL PRINTER.ON('P.FUNCTION',0)
                    CLASSPATH = GETENV("CLASSPATH")
                    IF CLASSPATH THEN
                        PRINT "==============================================="
                        PRINT
                        PRINT "CLASSPATH VARIABLE VALUE IS "
                        PRINT CLASSPATH
                        PRINT "==============================================="
                        PRINT
                    END
                    CALL PRINTER.OFF

                    EXC.CMD1<-1> = "LIST.ITEM F.DE.XML.SCHEMA 'T24Sms.xsd'"
                    EXC.CMD1<-1> = "LIST.ITEM F.DE.XML.SCHEMA 'T24Email.xsd'"
                    EXC.CMD1<-1> = "LIST.ITEM F.DE.XML.SCHEMA WITH @ID LIKE ...":MESSAGE.TYPE:"..."

                END

            END ELSE
                EXC.CMD1<-1> = "LIST.ITEM F.DE.I.HISTORY WITH @ID LIKE ":REC.ID:"..."
                EXC.CMD1<-1> = "LIST.ITEM F.DE.I.MSG WITH @ID LIKE ":REC.ID:"..."

            END

            GOSUB LISTING.DETAILS
        END
    END
    RETURN
*-----------------------------------------------------------------------------
DELIVERY.INITIALISATION:
*-----------------------------------------------------------------------------

    FN.DE.PARM = 'F.DE.PARM' ; F.DE.PARM = ''
    CALL OPF(FN.DE.PARM,F.DE.PARM)

    FN.DE.CARRIER = 'F.DE.CARRIER' ; F.DE.CARRIER = '' ; R.CARRIER='' ;ERR2=''
    CALL OPF(FN.DE.CARRIER,F.DE.CARRIER)

    FN.DE.INTERFACE = 'F.DE.INTERFACE' ; F.DE.INTERFACE = '' ;R.INTERFACE='' 
    CALL OPF(FN.DE.INTERFACE,F.DE.INTERFACE)

    FN.DE.MESSAGE = 'F.DE.MESSAGE' ; F.DE.MESSAGE = ''
    CALL OPF(FN.DE.MESSAGE,F.DE.MESSAGE)

    FN.DE.MAPPING = 'F.DE.MAPPING' ; F.DE.MAPPING = ''
	R.MAPPING=''
	ERR1=''
    CALL OPF(FN.DE.MAPPING,F.DE.MAPPING)

    FN.DE.ADDRESS = 'F.DE.ADDRESS' ; F.DE.ADDRESS = ''
    CALL OPF(FN.DE.ADDRESS,F.DE.ADDRESS)

    FN.DE.FORM.TYPE = 'F.DE.FORM.TYPE' ; F.DE.FORM.TYPE = ''
	R.FORM=''
	ERR4=''
    CALL OPF(FN.DE.FORM.TYPE,F.DE.FORM.TYPE)

    FN.DE.O.HEADER = 'F.DE.O.HEADER' ;     F.DE.O.HEADER = ''
    CALL OPF(FN.DE.O.HEADER,F.DE.O.HEADER)

    FN.DE.I.HEADER = 'F.DE.I.HEADER' ; F.DE.I.HEADER = ''
    CALL OPF(FN.DE.I.HEADER,F.DE.I.HEADER)

    FN.DE.O.HANDOFF.FILE = 'F.DE.O.HANDOFF'   ; F.DE.O.HANDOFF.FILE = ''
    CALL OPF(FN.DE.O.HANDOFF.FILE, F.DE.O.HANDOFF.FILE)

    FN.DE.O.MSG = 'F.DE.O.MSG' ; F.DE.O.MSG = ''
    CALL OPF(FN.DE.O.MSG,F.DE.O.MSG)

    FN.DE.I.MSG = 'F.DE.I.MSG' ; F.DE.I.MSG = ''
    CALL OPF(FN.DE.I.MSG,F.DE.I.MSG)

    FN.DE.O.HISTORY = 'F.DE.O.HISTORY' ; F.DE.O.HISTORY = ''
    CALL OPF(FN.DE.O.HISTORY,F.DE.O.HISTORY)

    FN.DE.I.HISTORY = 'F.DE.I.HISTORY' ; F.DE.I.HISTORY = ''
    CALL OPF(FN.DE.I.HISTORY,F.DE.I.HISTORY)

    FN.DE.I.FT.TXN.TYPES = 'F.DE.I.FT.TXN.TYPES' ; F.DE.I.FT.TXN.TYPES = ''
    CALL OPF(FN.DE.I.FT.TXN.TYPES,F.DE.I.FT.TXN.TYPES)

    FN.VERSION = 'F.VERSION' ; F.VERSION = ''
    CALL OPF(FN.VERSION,F.VERSION)

    FN.EB.TRANSFORM = 'F.EB.TRANSFORM' ; F.EB.TRANSFORM = ''
    CALL OPF(FN.EB.TRANSFORM,F.EB.TRANSFORM)

    FN.OFS.SOURCE = 'F.OFS.SOURCE' ; F.OFS.SOURCE = ''
    CALL OPF(FN.OFS.SOURCE,F.OFS.SOURCE)

    CARRIER.COUNT = '0'
    CARRIER.SET = ''
    CARRIER.ADDR = ''
    CARRIER.ID = ''
    NOT.REPEATED = ''
    EXC.CMD1 = ''

    DIM DEL.REC(65)
    IF REC.ID[1,1] EQ 'R' THEN
        FILE.VALUE = 'INWARD'
    END ELSE
        FILE.VALUE = 'OUTWARD'
    END

    CALL PRINTER.ON('P.FUNCTION',0)
    PRINT
    PRINT "==============================================="
    PRINT " DELIVERY PROCESSING  ":REC.ID:"               "
    PRINT "==============================================="
    CALL PRINTER.OFF

    RETURN
*-----------------------------------------------------------
FT.PROCESSING:
*-----------------------------------------------------------
    GOSUB FT.INITIALIZE
    D.FIELDS = 'TRANSACTION.REF'
    CALL F.READ(FN.FUNDS.TRANSFER,REC.ID,FUNDS.REC,F.FUNDS.TRANSFER,R.R.ERR)
    D.RANGE.AND.VALUE<1> = REC.ID

    IF NOT(FUNDS.REC) THEN
        REC.ID2 = REC.ID
        CALL F.READ(FN.FUNDS.TRANSFER$NAU,REC.ID2,FUNDS.REC1,F.FUNDS.TRANSFER$NAU,ERR1)
        D.RANGE.AND.VALUE = REC.ID1
        FUNDS.REC = FUNDS.REC1
    END
    IF NOT(FUNDS.REC) THEN
        REC.ID1 = REC.ID:';1'
        CALL F.READ(FN.FUNDS.TRANSFER$HIS,REC.ID1,FUNDS.REC,F.FUNDS.TRANSFER$HIS,ERR1)
        D.RANGE.AND.VALUE = REC.ID1
    END
    IF NOT(FUNDS.REC) THEN
        CALL PRINTER.ON('P.FUNCTION',0)
        PRINT
        PRINT "==============================================="
        PRINT "       THE FT ID ":REC.ID:" IS NOT VALID       "
        PRINT "==============================================="
        CALL PRINTER.OFF
    END ELSE

        APPL.ID.LIST = 'FT'
        REC.ID1 = REC.ID
        GOSUB T24.OUTPUT.EXTRACTION

        TRANSACTION.TYPE = FUNDS.REC<FT.TRANSACTION.TYPE>
        GROUP.COND.ID = FUNDS.REC<FT.CUST.GROUP.LEVEL>
        DEBIT.ACCOUNT = FUNDS.REC<FT.DEBIT.ACCT.NO>
        CREDIT.ACCOUNT = FUNDS.REC<FT.CREDIT.ACCT.NO>
        DEBIT.CCY = FUNDS.REC<FT.DEBIT.CURRENCY>
        CREDIT.CCY = FUNDS.REC<FT.CREDIT.CURRENCY>
        DEBIT.COMPANY = FUNDS.REC<FT.DEBIT.COMP.CODE>
        CREDIT.COMPANY = FUNDS.REC<FT.CREDIT.COMP.CODE>
        TRANS.COMPANY = FUNDS.REC<FT.CO.CODE>
        DEBIT.CUSTOMER = FUNDS.REC<FT.DEBIT.CUSTOMER>
        CREDIT.CUSTOMER = FUNDS.REC<FT.CREDIT.CUSTOMER>

        IF DEBIT.ACCOUNT[1,2] NE 'PL' THEN
            APPL.ID.LIST = 'ACCOUNT'
            REC.ID1 = DEBIT.ACCOUNT
            GOSUB T24.OUTPUT.EXTRACTION
        END

        IF CREDIT.ACCOUNT[1,2] NE 'PL' THEN
            APPL.ID.LIST = 'ACCOUNT'
            REC.ID1 = CREDIT.ACCOUNT
            GOSUB T24.OUTPUT.EXTRACTION
        END
		R.DEBIT.CO=''
		R.CREDIT.CO=''
		R.TRANS.CO=''
        CALL F.READ(FN.COMPANY,DEBIT.COMPANY,R.DEBIT.CO,F.COMPANY,R.R.ERR)
        CALL F.READ(FN.COMPANY,CREDIT.COMPANY,R.CREDIT.CO,F.COMPANY,ERR1)
        CALL F.READ(FN.COMPANY,TRANS.COMPANY,R.TRANS.CO,F.COMPANY,ERR2)

        DEBIT.COM.MNE = R.DEBIT.CO<EB.COM.MNEMONIC>
        CREDIT.COM.MNE = R.CREDIT.CO<EB.COM.MNEMONIC>
        TRANS.FIN.MNE = R.TRANS.CO<EB.COM.DEFAULT.FINAN.MNE>
        NOSTRO.COM.MNE = R.TRANS.CO<EB.COM.NOSTRO.MNEMONIC>
        DEBIT.CUS.COM = R.DEBIT.CO<EB.COM.CUSTOMER.COMPANY>
        CREDIT.CUS.COM = R.CREDIT.CO<EB.COM.CUSTOMER.COMPANY>

        IF R.TRANS.CO<EB.COM.FINANCIAL.MNE> EQ R.TRANS.CO<EB.COM.MNEMONIC> THEN
            TRANS.COM.MNE = R.TRANS.CO<EB.COM.MNEMONIC>
            TRANS.LEAD.COM = R.TRANS.CO<EB.COM.FINANCIAL.COM>
        END ELSE
            TRANS.COM.MNE = R.TRANS.CO<EB.COM.FINANCIAL.MNE>
            TRANS.LEAD.COM = R.TRANS.CO<EB.COM.FINANCIAL.COM>
        END

        APPL.ID.LIST = 'FT.TXN.TYPE.CONDITION'
        REC.ID1 = TRANSACTION.TYPE
        GOSUB T24.OUTPUT.EXTRACTION

        APPL.ID.LIST = 'CURRENCY'
        REC.ID1 = DEBIT.CCY
        GOSUB T24.OUTPUT.EXTRACTION

        IF DEBIT.CCY NE CREDIT.CCY THEN
            APPL.ID.LIST = 'CURRENCY'
            REC.ID1 = CREDIT.CCY
            GOSUB T24.OUTPUT.EXTRACTION
        END

        EXC.CMD1<-1> = 'LIST F.COMPANY "':DEBIT.COMPANY:'"'
        IF CREDIT.COMPANY NE DEBIT.COMPANY THEN
            EXC.CMD1<-1> = 'LIST F.COMPANY "':CREDIT.COMPANY:'"'
        END
        IF TRANS.COMPANY NE DEBIT.COMPANY AND TRANS.COMPANY NE CREDIT.COMPANY THEN
            EXC.CMD1<-1> = 'LIST F.COMPANY "':TRANS.COMPANY:'"'
        END

        NO.OF.CHG = COUNT(FUNDS.REC<FT.CHARGE.TYPE>,@VM) + 1
        FOR CHG.NO = 1 TO NO.OF.CHG
            CHG.TYPE.ID = FUNDS.REC<FT.CHARGE.TYPE,CHG.NO>
            IF CHG.TYPE.ID THEN
                APPL.ID.LIST = 'FT.CHARGE.TYPE'
                REC.ID1 = CHG.TYPE.ID
                GOSUB T24.OUTPUT.EXTRACTION
                CHG.TYPE.ID = ''
            END
        NEXT CHG.NO

        NO.OF.COMM = COUNT(FUNDS.REC<FT.COMMISSION.TYPE>,@VM) + 1
        FOR COMM.NO = 1 TO NO.OF.COMM
            COMM.TYPE.ID = FUNDS.REC<FT.COMMISSION.TYPE,COMM.NO>
            IF COMM.TYPE.ID THEN
                APPL.ID.LIST = 'FT.COMMISSION.TYPE'
                REC.ID1 = COMM.TYPE.ID
                GOSUB T24.OUTPUT.EXTRACTION
                COMM.TYPE.ID = ''
            END
        NEXT COMM.NO

        EXC.CMD1<-1> = 'LIST F':TRANS.FIN.MNE:'.FT.GEN.CONDITION'

        IF DEBIT.CUSTOMER THEN
            FT.GROUP.DEBIT = 'C-':DEBIT.CUSTOMER
            APPL.ID.LIST = 'FT.GROUP.CONDITION'
            DEF.COM = DEBIT.CUS.COM
            REC.ID1 = FT.GROUP.DEBIT
            GOSUB T24.OUTPUT.EXTRACTION

            APPL.ID.LIST = 'CUSTOMER.CHARGE'
            REC.ID1 = DEBIT.CUSTOMER
            DEF.COM = DEBIT.CUS.COM
            GOSUB T24.OUTPUT.EXTRACTION
        END

        IF CREDIT.CUSTOMER THEN
            FT.GROUP.CREDIT = 'C-':CREDIT.CUSTOMER
            APPL.ID.LIST = 'FT.GROUP.CONDITION'
            REC.ID1 = FT.GROUP.CREDIT
            DEF.COM = CREDIT.CUS.COM
            GOSUB T24.OUTPUT.EXTRACTION

            APPL.ID.LIST = 'CUSTOMER.CHARGE'
            REC.ID1 = CREDIT.CUSTOMER
            DEF.COM = CREDIT.CUS.COM
            GOSUB T24.OUTPUT.EXTRACTION
        END

        IF GROUP.COND.ID THEN
            APPL.ID.LIST = 'FT.GROUP.CONDITION'
            REC.ID1 = GROUP.COND.ID
            GOSUB T24.OUTPUT.EXTRACTION
        END

        EXC.CMD1<-1> = 'LIST F.FT.APPL.DEFAULT "':TRANS.LEAD.COM:'"  "':TRANS.COMPANY:'"'
        EXC.CMD1<-1> = 'LIST F':NOSTRO.COM.MNE:'.FT.LOCAL.CLEARING'
        EXC.CMD1<-1> =  'LIST F.FT.BC.PARAMETER'

        NO.OF.IN.MSG = COUNT(FUNDS.REC<FT.DELIVERY.INREF>,@VM) + 1
        FOR MSG.NO = 1 TO NO.OF.IN.MSG
            DELIVERY.ID = FUNDS.REC<FT.DELIVERY.INREF,MSG.NO>
            IF DELIVERY.ID THEN
                DELIVERY.REF = FIELD(DELIVERY.ID, "-", 1)
                EXC.CMD1<-1> = 'LIST F.DE.I.HEADER "':DELIVERY.REF:'"'
                DELIVERY.ID = ''
            END
        NEXT MSG.NO

        NO.OF.OUT.MSG = COUNT(FUNDS.REC<FT.DELIVERY.OUTREF>,@VM) + 1
        FOR MSG.NO = 1 TO NO.OF.OUT.MSG
            DELIVERY.ID = FUNDS.REC<FT.DELIVERY.OUTREF,MSG.NO>
            IF DELIVERY.ID THEN
                DELIVERY.REF = FIELD(DELIVERY.ID, "-", 1)
                EXC.CMD1<-1> = 'LIST F.DE.O.HEADER "':DELIVERY.REF:'"'
                DELIVERY.ID = ''
            END
        NEXT MSG.NO

        CALL PRINTER.ON('P.FUNCTION',0)
        PRINT
        PRINT "==============================================="
        PRINT " TRANSACTION ENTRY DETAILS FOR   ":REC.ID:"    "
        PRINT "==============================================="
        CALL PRINTER.OFF

        SAVE.SCREEN.TITLE = "PRINTING TXN ENTRY DETAILS"
        ENQ = 'TXN.ENTRY'
        ENQ<2,1> = 'TRANSACTION.REF'
        ENQ<3,1> = 'EQ'
        ENQ<4,1> = REC.ID
        ENQ<10,1> = 'OUTPUT'
        CALL ENQUIRY.DISPLAY(ENQ)

        IF FUNDS.REC1 EQ '' THEN
            CALL E.TXN.ENTRY(STMT.LIST)
        END

        TOTAL.STMT.NO = DCOUNT(STMT.LIST,@FM)
        FOR STMT.NO = 1 TO TOTAL.STMT.NO
            STMT.ID.VALUE = STMT.LIST<STMT.NO>
            STMT.ID.COM =  FIELD(STMT.ID.VALUE,'*',2)
            STMT.ID.VALUE = FIELD(STMT.ID.VALUE,'*',1)
            STMT.ID = STMT.ID.VALUE[2,99]

            IF STMT.ID.VALUE[1,1] EQ 'S' THEN
                APPL.ID.LIST = 'STMT.ENTRY'
            END ELSE
                APPL.ID.LIST = 'CATEG.ENTRY'
            END
            REC.ID1 = STMT.ID
            PGM.TYPE1 = 'L'
            DEF.COM = STMT.ID.COM
            GOSUB T24.OUTPUT.EXTRACTION

        NEXT STMT.NO

        PROCESSING.DATE = FUNDS.REC<FT.PROCESSING.DATE>
        PROCESSING.MONTH = PROCESSING.DATE[1,6]
        STMT.NOS = FUNDS.REC<FT.STMT.NOS>
        EXC.CMD1<-1> =  'LIST F':TRANS.COM.MNE:'.ENTRY.HOLD LIKE ...':REC.ID:'...'

        APPL.ID.LIST = 'ACCT.ACTIVITY'
        REC.ID1 = DEBIT.ACCOUNT:'-':PROCESSING.MONTH
        PGM.TYPE1 = 'L'
        DEF.COM = DEBIT.COMPANY
        GOSUB T24.OUTPUT.EXTRACTION

        APPL.ID.LIST = 'ACCT.ACTIVITY'
        REC.ID1 = CREDIT.ACCOUNT:'-':PROCESSING.MONTH
        PGM.TYPE1 = 'L'
        DEF.COM = CREDIT.COMPANY
        GOSUB T24.OUTPUT.EXTRACTION

        GOSUB LISTING.DETAILS
    END
    RETURN

FT.INITIALIZE:

    FN.FUNDS.TRANSFER = 'F.FUNDS.TRANSFER'
    F.FUNDS.TRANSFER = ''
	FUNDS.REC=''
	R.R.ERR=''
    CALL OPF(FN.FUNDS.TRANSFER,F.FUNDS.TRANSFER)

    FN.FUNDS.TRANSFER$NAU = 'F.FUNDS.TRANSFER$NAU'
    F.FUNDS.TRANSFER$NAU = ''
	ERR1=''
    CALL OPF(FN.FUNDS.TRANSFER$NAU,F.FUNDS.TRANSFER$NAU)

    FN.FUNDS.TRANSFER$HIS = 'F.FUNDS.TRANSFER$HIS'
    F.FUNDS.TRANSFER$HIS = ''
    CALL OPF(FN.FUNDS.TRANSFER$HIS,F.FUNDS.TRANSFER$HIS)

    FN.COMPANY = 'F.COMPANY'
    F.COMPANY = ''
    CALL OPF(FN.COMPANY,F.COMPANY)
    EXC.CMD1 = ''
    EXC.CMD = ''
    FUNDS.REC1 = ''
    STMT.LIST = ''

    CALL PRINTER.ON('P.FUNCTION',0)
    PRINT
    PRINT "==============================================="
    PRINT " FT PROCESSING  ":REC.ID:"                     "
    PRINT "==============================================="
    CALL PRINTER.OFF

    RETURN
*-----------------------------------------------------------
STO.PROCESSING:
*-----------------------------------------------------------
    GOSUB STO.INITIALIZE

    CALL F.READ(FN.STANDING.ORDER,REC.ID,R.STANDING.ORDER,F.STANDING.ORDER,R.R.ERR)

    IF NOT(R.STANDING.ORDER) THEN
        CALL PRINTER.ON('P.FUNCTION',0)
        PRINT
        PRINT "==============================================="
        PRINT "    STO RECORD ":REC.ID:"DOES NOT EXIST        "
        PRINT "==============================================="
        CALL PRINTER.OFF
    END ELSE

        ID.ACCOUNT = FIELD(REC.ID,'.',1)
        TYPE = R.STANDING.ORDER<STO.TYPE>
        SEQ.NO = FIELD(REC.ID,'.',2)

        CPTY.ACCT = R.STANDING.ORDER<STO.CPTY.ACCT.NO>
        TRANS.COMPANY = R.STANDING.ORDER<STO.CO.CODE>
        FREQ = R.STANDING.ORDER<STO.CURRENT.FREQUENCY>
        YEAR1 = FREQ[1,4]
        ACTIVITY.MONTH = FREQ[1,6]
        ACTIVITY.MONTH1 = ACTIVITY.MONTH - 1
		
		R.TRANS.CO=''
        CALL F.READ(FN.COMPANY,TRANS.COMPANY,R.TRANS.CO,F.COMPANY,ERR2)

        IF R.TRANS.CO<EB.COM.FINANCIAL.MNE> EQ R.TRANS.CO<EB.COM.MNEMONIC> THEN
            TRANS.COM.MNE = R.TRANS.CO<EB.COM.MNEMONIC>
            TRANS.LEAD.COM = R.TRANS.CO<EB.COM.FINANCIAL.COM>
        END ELSE
            TRANS.COM.MNE = R.TRANS.CO<EB.COM.FINANCIAL.MNE>
            TRANS.LEAD.COM = R.TRANS.CO<EB.COM.FINANCIAL.COM>
        END

        APPL.ID.LIST = 'STANDING.ORDER'
        REC.ID1 = REC.ID
        GOSUB T24.OUTPUT.EXTRACTION
        CALL F.READ(FN.STANDING.ORDER,REC.ID,R.STANDING,F.STANDING.ORDER,ERR2)
        SS.REC = ''
        CALL GET.STANDARD.SELECTION.DETS("STANDING.ORDER",SS.REC)

        LAST.FLD.POS = ''
	LAST.FLD.NO = ''
        LOCATE 'FT.VERSION' IN SS.REC<SSL.SYS.FIELD.NAME,1> SETTING LAST.FLD.POS THEN
            LAST.FLD.NO = SS.REC<SSL.SYS.FIELD.NO,LAST.FLD.POS>
        END

        VERSN.ID = R.STANDING<LAST.FLD.NO>
        APPL.ID.LIST = 'VERSION'
        REC.ID1 = VERSN.ID
        GOSUB T24.OUTPUT.EXTRACTION

        TYPE.ID = R.STANDING.ORDER<STO.TYPE>
        APPL.ID.LIST = 'STO.TYPE'
        REC.ID1 = TYPE.ID
        GOSUB T24.OUTPUT.EXTRACTION

        APPL.ID.LIST = 'ACCOUNT'
        REC.ID1 = ID.ACCOUNT
        GOSUB T24.OUTPUT.EXTRACTION
        ID.CO.MNE = R.NEW(AC.CO.CODE)

        APPL.ID.LIST = 'ACCOUNT'
        REC.ID1 = CPTY.ACCT
        GOSUB T24.OUTPUT.EXTRACTION
        CPTY.CO.MNE = R.NEW(AC.CO.CODE)

        APPL.ID.LIST = 'ACCT.ACTIVITY'
        PGM.TYPE1 = 'L'
        DEF.COM = ID.CO.MNE
        REC.ID1 = ID.ACCOUNT:'-': ACTIVITY.MONTH
        GOSUB T24.OUTPUT.EXTRACTION

        APPL.ID.LIST = 'ACCT.ACTIVITY'
        PGM.TYPE1 = 'L'
        DEF.COM = ID.CO.MNE
        REC.ID1 = ID.ACCOUNT:'-':ACTIVITY.MONTH1
        GOSUB T24.OUTPUT.EXTRACTION

        APPL.ID.LIST = 'ACCT.ACTIVITY'
        PGM.TYPE1 = 'L'
        DEF.COM = CPTY.CO.MNE
        REC.ID1 = CPTY.ACCT:'-':ACTIVITY.MONTH
        GOSUB T24.OUTPUT.EXTRACTION

        APPL.ID.LIST = 'ACCT.ACTIVITY'
        PGM.TYPE1 = 'L'
        DEF.COM = CPTY.CO.MNE
        REC.ID1 = CPTY.ACCT:'-':ACTIVITY.MONTH1
        GOSUB T24.OUTPUT.EXTRACTION

        NO.OF.CHG = COUNT(R.STANDING.ORDER<STO.CHARGE.TYPE>,@VM) + 1

        FOR CHG.NO = 1 TO NO.OF.CHG
            CHG.TYPE.ID = R.STANDING.ORDER<STO.CHARGE.TYPE,CHG.NO>
            IF CHG.TYPE.ID THEN
                EXC.CMD1<-1> = 'LIST F':TRANS.COM.MNE:'.FT.CHARGE.TYPE  "':CHG.TYPE.ID:'"'
                CHG.TYPE.ID = ''
            END
        NEXT CHG.NO

        NO.OF.COMM = COUNT(R.STANDING.ORDER<STO.COMMISSION.TYPE>,@VM) + 1

        FOR COMM.NO = 1 TO NO.OF.COMM
            COMM.TYPE.ID = R.STANDING.ORDER<STO.COMMISSION.TYPE,COMM.NO>
            IF COMM.TYPE.ID THEN
                EXC.CMD1<-1> = 'LIST F':TRANS.COM.MNE:'.FT.COMMISSION.TYPE "':COMM.TYPE.ID:'"'
                COMM.TYPE.ID = ''
            END
        NEXT COMM.NO

        STO.ID = "STO-":TYPE:"-":ID.ACCOUNT:"-":SEQ.NO

        EXC.CMD1<-1>='LIST F':TRANS.COM.MNE:'.STO.FREQ.DATE LIKE ...':REC.ID:'...'
        EXC.CMD1<-1>='LIST F':TRANS.COM.MNE:'.STANDING.ORDER WITH RETRY.ORIG.ID EQ ':REC.ID
        EXC.CMD1<-1>='LIST F':TRANS.COM.MNE:'.STANDING.ORDER$HIS WITH RETRY.ORIG.ID EQ ':REC.ID
        EXC.CMD1<-1>='LIST F':TRANS.COM.MNE:'.FUNDS.TRANSFER WITH INWARD.PAY.TYPE EQ ':STO.ID
        EXC.CMD1<-1>='LIST F':TRANS.COM.MNE:'.FUNDS.TRANSFER$NAU WITH INWARD.PAY.TYPE EQ ':STO.ID

        OFFICIAL.REGION = R.TRANS.CO<EB.COM.OFFICIAL.HOLIDAY>
        BATCH.REGION = R.TRANS.CO<EB.COM.BATCH.HOLIDAY>
        OFFICIAL.HOLIDAY = OFFICIAL.REGION:YEAR1
        BATCH.HOLIDAY = BATCH.REGION:YEAR1

        EXC.CMD1<-1> = 'LIST F.FT.APPL.DEFAULT "':TRANS.LEAD.COM:'"  "':TRANS.COMPANY:'"'
        EXC.CMD1<-1>='LIST F.COMPANY "':TRANS.COMPANY:'"'
        EXC.CMD1<-1>='LIST F.HOLIDAY "':OFFICIAL.HOLIDAY:'"'

        IF OFFICIAL.HOLIDAY NE BATCH.HOLIDAY THEN
            EXC.CMD1<-1>='LIST F.HOLIDAY "':OFFICIAL.HOLIDAY:'"'
        END

        GOSUB LISTING.DETAILS
    END
    RETURN

STO.INITIALIZE:

    FN.STANDING.ORDER = 'F.STANDING.ORDER'
    F.STANDING.ORDER = ''
	R.STANDING.ORDER=''
    CALL OPF(FN.STANDING.ORDER,F.STANDING.ORDER)

    FN.COMPANY = 'F.COMPANY'
    F.COMPANY = ''
    CALL OPF(FN.COMPANY,F.COMPANY)

    FN.STO.TYPE = 'F.STO.TYPE'
    F.STO.TYPE = ''
	REC.ID=''
    CALL OPF(FN.STO.TYPE,F.STO.TYPE)

    FN.VERSION = 'F.VERSION'
    F.VERSION= ''
    CALL OPF(FN.VERSION,F.VERSION)


    ID.ACCOUNT  = ''
    CPTY.ACCOUNT = ''
    EXC.CMD1 = ''

    CALL PRINTER.ON('P.FUNCTION',0)
    PRINT
    PRINT "==============================================="
    PRINT " STO PROCESSING FOR ":REC.ID:"                 "
    PRINT "==============================================="
    CALL PRINTER.OFF

    RETURN
*----------------------------------------------------------
LISTING.DETAILS:
*----------------------------------------------------------

    VALUE.COUNT = COUNT(EXC.CMD1,@FM) + (EXC.CMD1 <> '')

    CALL PRINTER.ON('P.FUNCTION',0)

    FOR VAL.COUNT = 1 TO VALUE.COUNT
        EXC.CMD = EXC.CMD1<VAL.COUNT>
        EXECUTE EXC.CMD CAPTURING VAR.PRINT
        PRINT "==============================================="
        PRINT
        PRINT EXC.CMD
        PRINT VAR.PRINT
        PRINT "==============================================="
        PRINT

    NEXT VAL.COUNT
    CALL PRINTER.OFF

    RETURN

*-----------------------------------------------------------------------------
T24.OUTPUT.EXTRACTION:
*-----------------------------------------------------------------------------
  SAVE.APPLICATION = APPLICATION
    APPLICATION = APPL.ID.LIST
    SAVE.REC.ID = REC.ID
    SAVE.PGM.TYPE = PGM.TYPE
    IF PGM.TYPE1 THEN
        PGM.TYPE = PGM.TYPE1
    END
    REC.ID = REC.ID1

    IF APPLICATION EQ 'FT' THEN
        COMI = APP
        CALL VALIDATE.APPLICATION
        COMI = APP
    END

    V$FUNCTION = 'GET.PARAM'
    CALL EB.EXECUTE.APPLICATION(APPLICATION)

    CALL MATRIX.UPDATE

    LOOP
        V$FUNCTION = 'P'      ;* Set it to NULL
        REMOVE INPUT.BUFFER FROM REC.ID SETTING ID.R.ERR      ;* Record ID
    WHILE INPUT.BUFFER:ID.R.ERR

        CALL RECORDID.INPUT

        IF E THEN
            ETEXT = E
            ARRAY<-1> = ' ':@FM:' ':@FM:'ERROR - "':E:'" - ':LINE:' L.no ':LINE
            APPLICATION = SAVE.APPLICATION
            REC.ID = SAVE.REC.ID
            PGM.TYPE = SAVE.PGM.TYPE
            RETURN
        END

        IF DEF.COM THEN
            SAVE.ID.COMPANY = ID.COMPANY
            CALL LOAD.COMPANY(DEF.COM)
        END
        HUSH ON ; CALL RECORD.READ ; HUSH OFF

        IF MESSAGE EQ 'REPEAT' THEN
            IF APPLICATION EQ 'STMT.ENTRY' OR APPLICATION EQ 'CATEG.ENTRY' THEN
                GOSUB CHECK.STMT.ENTRY.DETAIL
                APPLICATION = SAVE.APPLICATION
                REC.ID = SAVE.REC.ID
                PGM.TYPE = SAVE.PGM.TYPE
                IF SAVE.ID.COMPANY THEN
                    CALL LOAD.COMPANY(SAVE.ID.COMPANY)
                    DEF.COM = ''
                    SAVE.ID.COMPANY = ''
                END
                RETURN

            END ELSE
                ETEXT = 'ERROR'
                ARRAY<-1> = REC.ID:'  - RECORD MISSING IN ':APPLICATION:' FOR GIVEN LINE ':LINE
                APPLICATION = SAVE.APPLICATION
                REC.ID = SAVE.REC.ID
                PGM.TYPE = SAVE.PGM.TYPE
                IF SAVE.ID.COMPANY THEN
                    CALL LOAD.COMPANY(SAVE.ID.COMPANY)
                    DEF.COM = ''
                    SAVE.ID.COMPANY = ''
                END
                RETURN
            END
        END

        CALL MATRIX.ALTER

        GOSUB PRINT.RECORD
    REPEAT

    APPLICATION = SAVE.APPLICATION
    REC.ID = SAVE.REC.ID
    PGM.TYPE = SAVE.PGM.TYPE
    IF SAVE.ID.COMPANY THEN
        CALL LOAD.COMPANY(SAVE.ID.COMPANY)
        DEF.COM = ''
        SAVE.ID.COMPANY = ''
    END
    RETURN

*-----------------------------------------------------------------------------
CHECK.STMT.ENTRY.DETAIL:
*-----------------------------------------------------------------------------
    APPLICATION = 'STMT.ENTRY.DETAIL'
    INPUT.BUFFER = REC.ID
    V$FUNCTION = 'GET.PARAM'
    CALL EB.EXECUTE.APPLICATION(APPLICATION)

    CALL MATRIX.UPDATE

    V$FUNCTION = 'P'          ;* Set it to NULL

    CALL RECORDID.INPUT

    IF E THEN
        ETEXT = E
        ARRAY<-1> = ' ':@FM:' ':@FM:'ERROR - "':E:'" - ':LINE:' L.no ':LINE
        RETURN
    END

    IF DEF.COM THEN
        CALL LOAD.COMPANY(DEF.COM)
    END

*    HUSH ON
CALL RECORD.READ
*  	HUSH OFF

    IF MESSAGE EQ 'REPEAT' THEN
        ETEXT = 'ERROR'
        ARRAY<-1> = REC.ID:'  - RECORD MISSING IN ':APPLICATION:' FOR GIVEN LINE ':LINE
        RETURN
    END

    CALL MATRIX.ALTER

    GOSUB PRINT.RECORD
    RETURN

*-----------------------------------------------------------------------------
DETERMINE.TRANSACTION.COMPANY:
*-----------------------------------------------------------------------------

    FN.COMPANY.CHECK = 'F.COMPANY.CHECK'
    F.COMPANY.CHECK = ''
	R.COMPANY.CHECK=''
    CALL OPF(FN.COMPANY.CHECK,F.COMPANY.CHECK)
	Y.CC.ID='FIN.FILE'
    CALL F.READ(FN.COMPANY.CHECK,Y.CC.ID,R.COMPANY.CHECK,F.COMPANY.CHECK,R.R.ERR)

    TOT.LEAD.COM = DCOUNT(R.COMPANY.CHECK<EB.COC.COMPANY.CODE>,@VM)

    IF APP EQ 'FT' THEN
        COMI = APP
        CALL VALIDATE.APPLICATION
        COMI = APP
    END

    V$FUNCTION = 'GET.PARAM'
    CALL EB.EXECUTE.APPLICATION(APPLICATION)
    CALL MATRIX.UPDATE

    FOR I = 1 TO TOT.LEAD.COM
        COMP.TO.LOAD = R.COMPANY.CHECK<EB.COC.COMPANY.CODE,I>
        V$FUNCTION = 'P'      ;* Set it to NULL
        INPUT.BUFFER = REC.ID
        CALL RECORDID.INPUT
        CALL LOAD.COMPANY(COMP.TO.LOAD)
        IF E THEN
            ETEXT = E
            ARRAY<-1> = ' ':@FM:' ':@FM:'ERROR - "':E:'" - ':LINE:' L.no ':LINE
            RETURN
        END

*        HUSH ON  
		CALL RECORD.READ
*		HUSH OFF

        IF MESSAGE NE 'REPEAT' THEN
            C$APP.STORE.DATA<1> = ID.COMPANY
            RETURN
        END

    NEXT I

    RETURN
*-------------------------------------------------------------
NR.PROCESSING:
*-------------------------------------------------------------
    GOSUB NR.INITIALIZE
    CALL F.READ(FN.ACCOUNT,REC.ID,R.ACCOUNT,F.ACCOUNT,R.R.ERR)

    IF NOT(R.ACCOUNT) THEN
        CALL PRINTER.ON('P.FUNCTION',0)
        PRINT
        PRINT "==============================================="
        PRINT "    ACCOUNT.STATEMENT RECORD ":REC.ID:"DOES NOT EXIST        "
        PRINT "==============================================="
        CALL PRINTER.OFF

    END ELSE

        CALL F.READ(FN.ACCOUNT.STATEMENT,REC.ID,R.ACCOUNT.STATEMENT,F.ACCOUNT.STATEMENT,R.R.ERR)
        APPL.ID.LIST = 'ACCOUNT.STATEMENT'
        REC.ID1 = REC.ID
        GOSUB T24.OUTPUT.EXTRACTION

        DELV.ID = R.ACCOUNT.STATEMENT<AC.STA.DELIVERY.REF>
        MSG.TYPE = R.ACCOUNT.STATEMENT<AC.STA.SWIFT.STMT.TYPE>
        IF MSG.TYPE EQ '' THEN
            MSG.TYPE = '950'
        END
        APPL.ID.LIST = 'ACCOUNT'
        REC.ID1 = REC.ID
        GOSUB T24.OUTPUT.EXTRACTION

        ACCT.COMP.ID = R.ACCOUNT<AC.CO.CODE>
        ACCT.CUST.ID = R.ACCOUNT<AC.CUSTOMER>

        APPL.ID.LIST = 'COMPANY'
        REC.ID1 = ACCT.COMP.ID
        GOSUB T24.OUTPUT.EXTRACTION

        IF ACCT.CUST.ID NE '' THEN
            APPL.ID.LIST = 'CUSTOMER'
            REC.ID1 = ACCT.CUST.ID
            GOSUB T24.OUTPUT.EXTRACTION
        END
        CALL F.READ(FN.AGENCY,ACCT.CUST.ID,R.AGENCY,F.AGENCY,R.R.ERR)
        EXT.REC.ID = R.AGENCY<EB.AG.OUR.EXT.ACCT.NO>
        IF ACCT.CUST.ID NE '' THEN
            APPL.ID.LIST = 'AGENCY'
            REC.ID1 = ACCT.CUST.ID
            GOSUB T24.OUTPUT.EXTRACTION
        END

        APPL.ID.LIST = 'DE.PARM'
        REC.ID1 = 'SYSTEM.STATUS'
        GOSUB T24.OUTPUT.EXTRACTION
		Y.DE.CARRIER.ID='RECS'
        CALL F.READ(FN.DE.CARRIER,Y.DE.CARRIER.ID,R.DE.CARRIER,F.DE.CARRIER,R.R.ERR)

        APPL.ID.LIST = 'DE.CARRIER'
        REC.ID1 = 'RECS'
        GOSUB T24.OUTPUT.EXTRACTION

        INTERFACE.ID = R.DE.CARRIER<DE.CARR.INTERFACE>

        APPL.ID.LIST = 'DE.INTERFACE'
        REC.ID1 = INTERFACE.ID
        GOSUB T24.OUTPUT.EXTRACTION

		R.ACCT.COMP=''
        CALL F.READ(FN.COMPANY,ACCT.COMP.ID,R.ACCT.COMP,F.COMPANY,ERR2)

        IF R.ACCT.COMP<EB.COM.FINANCIAL.MNE> EQ R.ACCT.COMP<EB.COM.MNEMONIC> THEN
            ACCT.COMP.MNE = R.ACCT.COMP<EB.COM.MNEMONIC>
            ACCT.LEAD.COM = R.ACCT.COMP<EB.COM.FINANCIAL.COM>
        END ELSE
            ACCT.COMP.MNE = R.ACCT.COMP<EB.COM.FINANCIAL.MNE>
            ACCT.LEAD.COM = R.ACCT.COMP<EB.COM.FINANCIAL.COM>
        END

        EXC.CMD1<-1> = 'LIST F.COMPANY "':ACCT.COMP.ID:'"'

        PRD.COMP.SPEC.ID = ACCT.COMP.ID:'.950.ALL'
        PRD.CUST.SPEC.ID = ACCT.COMP.ID:'.C-':ACCT.CUST.ID:'.950.ALL'
        PRD.ACCT.SPEC.ID = ACCT.COMP.ID:'.A-':REC.ID:'.950.ALL'
        PRD.SPEC.ID = ACCT.COMP.ID:'.ALL.ALL'

        EXC.CMD1<-1> = 'LIST F.DE.PRODUCT EQ ':PRD.COMP.SPEC.ID
        EXC.CMD1<-1> = 'LIST F.DE.PRODUCT EQ ':PRD.CUST.SPEC.ID
        EXC.CMD1<-1> = 'LIST F.DE.PRODUCT EQ ':PRD.ACCT.SPEC.ID
        EXC.CMD1<-1> = 'LIST F.DE.PRODUCT EQ ':PRD.SPEC.ID

        ADDR.CUST.SPEC.ID = ACCT.COMP.ID:'.C-':ACCT.CUST.ID:'.RECS'
        ADDR.COMP.SPEC.ID = ACCT.COMP.ID:'.RECS'

        EXC.CMD1<-1> = 'LIST F.DE.ADDRESS LIKE ...':ADDR.COMP.SPEC.ID:'...'
        EXC.CMD1<-1> = 'LIST F.DE.ADDRESS LIKE ...':ADDR.CUST.SPEC.ID:'...'

        FN.BP = "PACS.DATA.OUT"
        F.BP = ""
        CALL OPF(FN.BP,F.BP)

*DE.O.HEADER EXTRACTION IN .CSV
        FN.DE.O.HEADER= 'F.DE.O.HEADER'
        F.DE.O.HEADER = ''
		R.REC=''
		DE.O.ERR=''
        CALL OPF(FN.DE.O.HEADER,F.DE.O.HEADER)

        A = 0; B= 1 ; C = 4 ; D = 5 ; E = 10 ; Z = 11 ; G = 12 ; H = 13 ; I = 17 ; J = 19 ; K = 21 ; L = 25 ; M = 31;W =32 ;O = 33 ;P = 41; Q = 54;
        WRITE.HDR.XL =  '@ID|MESSAGE.TYPE|DISPOSITION|ERROR.CODE|ACCOUNT.NUMBER|CUSTOMER.NUMBER|CUS..COMPANY|COMPANY.CODE|VALUE.DATE|AMOUNT|TRANSACTION.REF|CARRIER.ADDR.NO|MSG.STATUS|MSG.DISPOSITION|MSG.R.ERR.CDE|CARRIER.SEQ.NO|MSG.CLASSIFICATION|'

        SEL.LIST = DELV.ID
        LOOP
            REMOVE DEL.ID FROM SEL.LIST SETTING DEL.POS

        WHILE DEL.ID:DEL.POS

*            READ R.REC FROM F.DE.O.HEADER, DEL.ID THEN
			CALL F.READ(FN.DE.O.HEADER,DEL.ID,R.REC,F.DE.O.HEADER,DE.O.ERR)
			IF R.REC THEN
                WRITE.HDR.XL<-1> = DEL.ID :'|': R.REC<B> :'|': R.REC<C> :'|': R.REC<D> :'|': R.REC<E> :'|': R.REC<Z> :'|': R.REC<G> :'|': R.REC<H> :'|': R.REC<I> :'|': R.REC<J> :'|': R.REC<K> :'|': R.REC<L>:'|': R.REC<M> '|':R.REC<W>:'|':R.REC<O>:'|':R.REC<P>:'|':R.REC<Q>
            END
        REPEAT

        IF WRITE.HDR.XL<2> THEN
            WRITE WRITE.HDR.XL TO F.BP,"DE.O.HEADER-":FIELD(SYSTEM(12),'.',1):'.csv'
            WRITE.HDR.XL = '' ;

            CRT @(-1)
            PRINT @(10,8) : "DE.O.HEADER -EXTRACTION COMPLETED..."
            SLEEP(2)
        END ELSE
            CRT @(-1)
            PRINT @(10,8) : " Warning : DE.O.HEADER-EXTRACTOR Completed. But NO Data available for the given input. "
            SLEEP(2)
        END

*DE.O.HISTORY EXTRACTION IN .CSV
WRITE.HIS.XL = ''
        HIST.LIST = DELV.ID

        LOOP
            REMOVE DEL.ID FROM HIST.LIST SETTING DEL.POS

        WHILE DEL.ID:DEL.POS
            SEL.CMD = 'LIST.ITEM F.DE.O.HISTORY LIKE ':DEL.ID:'...'
            EXECUTE SEL.CMD CAPTURING OUTPUT
            WRITE.HIS.XL<-1> = DEL.ID :'<----->':OUTPUT

        REPEAT

        IF WRITE.HIS.XL<1> THEN
            WRITE WRITE.HIS.XL TO F.BP,"DE.O.HISTORY-":FIELD(SYSTEM(12),'.',1):'.csv'
            WRITE.HIS.XL = '' ;
            CRT @(-1)
            PRINT @(10,8) : "DE.O.HISTORY -EXTRACTION COMPLETED..."
            SLEEP(2)
        END ELSE
            CRT @(-1)
            PRINT @(10,8) : " Warning : DE.O.HISTORY EXTRACTOR Completed. But NO Data available for the given input. "
            SLEEP(2)
        END

*CONCAT FILE -F.DE.O.MSG<CARRIER/CARRIER.INTERFACE> IN .CSV
WRITE.MSG.XL = ''
        CALL PRINTER.ON('P.FUNCTION',0)
        PRINT
        PRINT "==============================================="
        PRINT "F.DE.O.MSG<CARRIER/INTERFACE>  FOR   ":REC.ID:"    "
        PRINT "==============================================="
        CALL PRINTER.OFF

        IF INTERFACE.ID NE '' THEN
            FN.DE.O.MSG = 'F.DE.O.MSG.':INTERFACE.ID
            F.DE.O.MSG = ''
            CALL OPF(FN.DE.O.MSG,F.DE.O.MSG)
            SEL.CMD = 'SELECT F.DE.O.MSG.':INTERFACE.ID
        END ELSE
            FN.DE.O.MSG = 'F.DE.O.MSG.RECS'
            F.DE.O.MSG = ''
            CALL OPF (FN.DE.O.MSG,F.DE.O.MSG)
            SEL.CMD = 'SELECT F.DE.O.MSG.RECS'
        END

*        EXECUTE SEL.CMD CAPTURING OUTPUT
*        READLIST SEL.LIST  ELSE SEL.LIST = ''
		CALL EB.READLIST(SEL.CMD,SEL.LIST,'',NO.OF.REC,SEL.ERR)
        LOOP
            FINAL.FIND = 0
            REMOVE MSG.ID FROM SEL.LIST SETTING MSG.POS
        WHILE MSG.ID:MSG.POS
            READ R.REC FROM F.DE.O.MSG,  MSG.ID THEN

                FINDSTR REC.ID IN R.REC SETTING F.POS, POS THEN

                    FINDSTR '{2:I950' IN R.REC SETTING F1.POS, POS1 THEN

                        FINAL.FIND=1
                    END

                END

                IF FINAL.FIND EQ '1' THEN
                    WRITE.MSG.XL<-1> = MSG.ID:'--':R.REC
                END
            END
        REPEAT
        IF WRITE.MSG.XL<2> THEN
            WRITE WRITE.MSG.XL TO F.BP,"DE.O.MSG<CARRIER/INTERFACE>-":FIELD(SYSTEM(12),'.',1):'.csv'
            WRITE.MSG.XL = '' ;

            CRT @(-1)
            PRINT @(10,8) : "DE.O.MSG<CARRIER/INTERFACE> -EXTRACTION COMPLETED..."
            SLEEP(2)
        END ELSE
            CRT @(-1)
            PRINT @(10,8) : " Warning : DE.O.MSG EXTRACTOR Completed. But NO Data available for the given input. "
            SLEEP(2)
        END

*NT.STATEMENT EXTRACTION IN .CSV
        FN.NR.STATEMENTS= 'F.NR.STATEMENTS'
        F.NR.STATEMENTS = ''
		R.REC=''
		NR.ERR=''
        CALL OPF(FN.NR.STATEMENTS,F.NR.STATEMENTS)

        A = 0; B= 18 ; C = 19 ; D = 5 ; E = 7 ; Z = 8 ; G = 10 ; H = 6 ; I = 9 ; J = 39 ; K = 36 ; L = 24 ; M = 25;
        WRITE.STMT.XL =  '@ID|ACC.OWNER.REF|ACC.INST.REF|OPEN.BAL.IND|OPEN.BAL.AMOUNT|CLOSE.BAL.IND||CLOSE.BAL.AMOUNT|OPEN.BAL.DATE|CLOSE.BAL.DATE|STATEMENT.COMPLETE|ITEMS.GENERATED'

        SEL.CMD = 'SELECT ':FN.NR.STATEMENTS: " WITH ACCOUNT.ID EQ ": REC.ID
*        EXECUTE SEL.CMD CAPTURING SEL.OUT
*        READLIST SEL.LIST ELSE SEL.LIST = ''
		CALL EB.READLIST(SEL.CMD,SEL.LIST,'',NO.OF.REC,SEL.ERR)

        LOOP
            REMOVE STMT.ID FROM SEL.LIST SETTING STMT.POS

        WHILE STMT.ID:STMT.POS

*            READ R.REC FROM F.NR.STATEMENTS, STMT.ID THEN
			CALL F.READ(FN.NR.STATEMENTS,STMT.ID,R.REC,F.NR.STATEMENTS,NR.ERR)
			IF R.REC THEN
                WRITE.STMT.XL<-1> = STMT.ID :'|': R.REC<B> :'|': R.REC<C> :'|': R.REC<D> :'|': R.REC<E> :'|': R.REC<Z> :'|': R.REC<G> :'|': R.REC<H> :'|': R.REC<I> :'|': R.REC<J> :'|': R.REC<K> :'|': R.REC<L>:'|': R.REC<M>
            END
        REPEAT

        IF WRITE.STMT.XL<2> THEN
            WRITE WRITE.STMT.XL TO F.BP,"NR.STATEMENTS-":FIELD(SYSTEM(12),'.',1):'.csv'
            WRITE.STMT.XL = '' ;
            CRT @(-1)
            PRINT @(10,8) : "NR.STATEMENTS EXTRACTION COMPLETED..."
            SLEEP(2)
        END ELSE
            CRT @(-1)
            PRINT @(10,8) : " Warning : EXTRACTOR Completed. But NO Data available for the given input. "
            SLEEP(2)
        END

*NT.ITEMS EXTRACTION IN .CSV
        A = 0; B = 14 ; C = 15 ; D = 1 ; E = 2 ; Z = 5 ; G = 8 ; H = 23 ; I = 3 ; J = 6 ; K = 9 ; L = 12 ; M = 7; W = 24; O = 4; P = 10; Q = 25
        WRITE.ITEM.XL =  '@ID|ACC.OWNER.REF|ACC.INST.REF|STATEMENT.NUMBER|PAGE.NUMBER|ORIGINAL.REF|VALUE.DATE|DATE.MATCHED|STMT.OR.LEDGER|ACCOUNT.CURRENCY|ENTRY.DATE|AMOUNT|MATCHED.TO|ORIGINAL.AMOUNT|MATCHED.ID|DEBIT.OR.CREDIT|UNAUTH.MATCH.ID'
        FN.NR.ITEMS= 'F.NR.ITEMS'
        F.NR.ITEMS = ''
		R.REC=''
		NR1.ERR=''
        CALL OPF(FN.NR.ITEMS,F.NR.ITEMS)

        SEL.CMD = 'SELECT ':FN.NR.ITEMS: ' WITH @ID LIKE ':REC.ID:'...'
*        EXECUTE SEL.CMD CAPTURING SEL.OUT
*        READLIST SEL.LIST ELSE SEL.LIST = ''
		CALL EB.READLIST(SEL.CMD,SEL.LIST,'',NO.OF.REC,SEL.ERR)
        LOOP
            REMOVE ITEM.ID FROM SEL.LIST SETTING ITEM.POS
        WHILE ITEM.ID:ITEM.POS

*            READ R.REC FROM F.NR.ITEMS, ITEM.ID THEN
			CALL F.READ(FN.NR.ITEMS,ITEM.ID,R.REC,F.NR.ITEMS,NR1.ERR)
			IF R.REC THEN
                WRITE.ITEM.XL<-1> = ITEM.ID :'|': R.REC<B> :'|': R.REC<C> :'|': R.REC<D> :'|': R.REC<E> :'|': R.REC<Z> :'|': R.REC<G> :'|': R.REC<H> :'|': R.REC<I> :'|': R.REC<J> :'|': R.REC<K> :'|': R.REC<L>:'|': R.REC<M>:'|':R.REC<W>:'|':R.REC<O>:'|':R.REC<P>:'|':R.REC<Q>
            END
        REPEAT

        IF WRITE.ITEM.XL<2> THEN
            WRITE WRITE.ITEM.XL TO F.BP,"NR.ITEMS-":FIELD(SYSTEM(12),'.',1):'.csv'
            WRITE.ITEM.XL = '' ;
            CRT @(-1)
            PRINT @(10,8) : "NR.ITEMS EXTRACTION COMPLETED..."
            SLEEP(2)
        END ELSE
            CRT @(-1)
            PRINT @(10,8) : " Warning : EXTRACTOR Completed. But NO Data available for the given input. "
            SLEEP(2)
        END

*NR.INDEX
        EXC.CMD1<-1> = 'LIST F':ACCT.COMP.MNE:'.NR.INDEX WITH @ID  LIKE ':REC.ID:'...'

*CONCAT FILE -F.NR.STMT.INDEX IN .CSV
        EXC.CMD1<-1> = 'LIST F':ACCT.COMP.MNE:'.NR.STMT.INDEX WITH @ID  LIKE ':REC.ID:'...'

        GOSUB LISTING.DETAILS

*ENQUIRY -  NR.TOT.SUMMARY
        CALL PRINTER.ON('P.FUNCTION',0)
        PRINT
        PRINT "==============================================="
        PRINT " NR.TOT.SUMMARY DETAILS FOR   ":REC.ID:"    "
        PRINT "==============================================="
        CALL PRINTER.OFF

        SAVE.SCREEN.TITLE = "PRINTING NR.TOT.SUMMARY DETAILS"
        ENQ = 'NR.TOT.SUMMARY'
        ENQ<2,1> = 'NR.ITEM'
        ENQ<3,1> = 'EQ'
        ENQ<4,1> = REC.ID
        CALL E.MB.BUILD.NR.ACCT.NO(ENQ)
        ENQ<10,1> = 'OUTPUT'
        CALL ENQUIRY.DISPLAY(ENQ)

    END

*ENQUIRY - NR.ITEM.LEDGER
    CALL PRINTER.ON('P.FUNCTION',0)
    PRINT
    PRINT "==============================================="
    PRINT " NR.ITEM.LEDGER DETAILS FOR   ":REC.ID:"    "
    PRINT "==============================================="
    CALL PRINTER.OFF

    SAVE.SCREEN.TITLE = "PRINTING NR.ITEM.LEDGER DETAILS"
    ENQ = 'NR.ITEMS.LEDGER'
    ENQ<2,1> = 'NR.ITEM'
    ENQ<3,1> = 'EQ'
    ENQ<4,1> = REC.ID
    CALL E.MB.BUILD.NR.ACCT.NO(ENQ)
    ENQ<10,1> = 'OUTPUT'
    CALL ENQUIRY.DISPLAY(ENQ)

*ENQUIRY - NR.ITEM.STATEMENT
    CALL PRINTER.ON('P.FUNCTION',0)
    PRINT
    PRINT "==============================================="
    PRINT " NR.ITEM.STATEMENT DETAILS FOR   ":REC.ID:"    "
    PRINT "==============================================="
    CALL PRINTER.OFF

    SAVE.SCREEN.TITLE = "PRINTING NR.ITEM.STATEMENT DETAILS"
    ENQ = 'NR.ITEMS.STATEMENT'
    ENQ<2,1> = 'NR.ITEM'
    ENQ<3,1> = 'EQ'
    ENQ<4,1> = REC.ID
    CALL E.MB.BUILD.NR.ACCT.NO(ENQ)
    ENQ<10,1> = 'OUTPUT'
    CALL ENQUIRY.DISPLAY(ENQ)

*ENQUIRY - NR.MATCHED.ITEMS
    CALL PRINTER.ON('P.FUNCTION',0)
    PRINT
    PRINT "==============================================="
    PRINT " NR.MATCHED.ITEMS DETAILS FOR   ":REC.ID:"    "
    PRINT "==============================================="
    CALL PRINTER.OFF

    SAVE.SCREEN.TITLE = "PRINTING NR.MATCHED.ITEMS DETAILS"
    ENQ = 'NR.MATCHED.ITEMS'
    ENQ<2,1> = 'NR.ITEM'
    ENQ<3,1> = 'EQ'
    ENQ<4,1> = REC.ID
    CALL E.MB.BUILD.NR.ACCT.NO(ENQ)
    ENQ<10,1> = 'OUTPUT'
    CALL ENQUIRY.DISPLAY(ENQ)

*ENQUIRY - NR.STMT.TOTALS
    CALL PRINTER.ON('P.FUNCTION',0)
    PRINT
    PRINT "==============================================="
    PRINT " NR.STMT.TOTALS DETAILS FOR   ":REC.ID:"    "
    PRINT "==============================================="
    CALL PRINTER.OFF

    SAVE.SCREEN.TITLE = "PRINTING NR.STMT.TOTALS DETAILS"
    ENQ = 'NR.STMT.TOTALS'
    ENQ<2,1> = 'NR.STMT'
    ENQ<3,1> = 'EQ'
    ENQ<4,1> = REC.ID
    CALL E.MB.BUILD.NR.ACCT.NO(ENQ)
    ENQ<10,1> = 'OUTPUT'
    CALL ENQUIRY.DISPLAY(ENQ)

    RETURN

*------------------------------------------------------
NR.INITIALIZE:
*------------------------------------------------------

    FN.ACCOUNT.STATEMENT = 'F.ACCOUNT.STATEMENT'
    F.ACCOUNT.STATEEMNT = ''
    CALL OPF(FN.ACCOUNT.STATEMENT,F.ACCOUNT.STATEMENT)

    FN.COMPANY = 'F.COMPANY'
    F.COMPANY = ''
    CALL OPF(FN.COMPANY,F.COMPANY)

    FN.NR.PARAMETER = 'F.NR.PARAMETER'
    F.NR.PARAMETER = ''
    CALL OPF (FN.NR.PARAMETER,F.NR.PARAMETER)

    FN.DE.CARRIER = 'F.DE.CARRIER'
    F.DE.CARRIER = ''
    CALL OPF (FN.DE.CARRIER,F.DE.CARRIER)

    FN.DE.INTERFACE = 'F.DE.INTERFACE'
    F.DE.INTERFACE = ''
    CALL OPF (FN.DE.INTERFACE,F.DE.INTERFACE)

    FN.DE.ADDRESS = 'F.DE.ADDRESS'
    F.DE.ADDRESS = ''
    CALL OPF (FN.DE.ADDRESS,F.DE.ADDRESS)

    FN.DE.PARM = 'F.DE.PARM'
    F.DE.PARM = ''
    CALL OPF (FN.DE.PARM,F.DE.PARM)

    FN.ACCOUNT = 'F.ACCOUNT'
    F.ACCOUNT = ''
	R.ACCOUNT=''
    CALL OPF (FN.ACCOUNT,F.ACCOUNT)

    FN.CUSTOMER = 'F.CUSTOMER'
    F.CUSTOMER = ''
    CALL OPF (FN.CUSTOMER,F.CUSTOMER)

    FN.AGENCY = 'F.AGENCY'
    F.AGENCY = ''
	R.AGENCY=''
    CALL OPF (FN.AGENCY,F.AGENCY)

    FN.DE.O.HEADER = 'F.DE.O.HEADER'
    F.DE.O.HEADER = ''
    CALL OPF (FN.DE.O.HEADER,F.DE.O.HEADER)

    FN.DE.O.HISTORY = 'F.DE.O.HISTORY'
    F.DE.O.HISTORY = ''
    CALL OPF (FN.DE.O.HISTORY,F.DE.O.HISTORY)

    EXC.CMD1 = ''
    EXC.CMD = ''
    FUNDS.REC1 = ''
    STMT.LIST = ''

    CALL PRINTER.ON('P.FUNCTION',0)
    PRINT
    PRINT "==============================================="
    PRINT " NR PROCESSING  ":REC.ID:"                     "
    PRINT "==============================================="
    CALL PRINTER.OFF
    RETURN
*----------------------------------------
TAFJ.PROCESS:
*------------------------------------------
    GOSUB INITIALISE
    GOSUB GET.INPUT

    ORIG.COMP = ID.COMPANY
    LOOP
        LINE = R.REC<1>

    WHILE LINE NE '' DO
        GOSUB CLEAR.COMMON    ;* Clear common for every record
        GOSUB PRE.PROCESS
        IF NOT(SKIP.PROCESS) THEN
            DTEXT = "Processing.......":LINE:"                                               "
            CRT @(1,10):DTEXT
            IF HUSH.FLAG EQ '1' THEN
                CALL HUSHIT(1)
            END ELSE
*                CALL !HUSHIT(1)
				CALL HUSHIT(1)
            END
            GOSUB PROCESS.REQUEST.TAFJ
            IF HUSH.FLAG EQ '1' THEN
                CALL HUSHIT(0)
            END ELSE
*                CALL !HUSHIT(0)
				CALL HUSHIT(0)
            END
        END
        DEL R.REC<1>
    REPEAT
*
    IF ORIG.COMP AND ORIG.COMP NE ID.COMPANY THEN
        CALL LOAD.COMPANY(ORIG.COMP)
        C$APP.STORE.DATA<1> = ORIG.COMP
    END

    DTEXT = "Formatting.........                                                            "
    CRT @(1,10):DTEXT

    GOSUB WRITE.OUT.RECORD
*
    DTEXT = "Process Completed....Check PACS.DATA.OUT - Total ":SEQE:" Record(s) Created."
    CRT @(1,10):DTEXT

    FOR REC.CNT = 1 TO SEQE
        DTEXT = "Record ":REC.CNT:" - ":RECORD.ID:".":TODAY:':':TS:'-':REC.CNT
        DISP.LINE = 11 + REC.CNT
        CRT @(1, DISP.LINE):DTEXT
    NEXT REC.CNT

* Re-store the indirectory record in PACS.DATA.IN in Standard format, for future archive.
    IF R.REC.SAVE THEN
        RECORD.NAME = ID.COMPANY:'.':TODAY:'.':RECORD.ID
        WRITE R.REC.SAVE TO F.BP.IN, RECORD.NAME  ;*Write the ammended record
    END
*
    DISP.LINE = DISP.LINE + 2
    DTEXT = "Checking OLD Records for Purging                                   "
    CRT @(1,DISP.LINE):DTEXT
    GOSUB DO.PURGE  ;* Check for Purging the old records
*
    DTEXT = ''
    DTEXT = "!!! Process Completed !!! Press Any Key To Exit........            "
    CRT @(1,DISP.LINE):DTEXT
    INPUT YYY

    PRINTER.STATUS = ""       ;* EN_20090724 S/E
    RETURN
*-----------------------------------------------------------------------------
PROCESS.REQUEST.TAFJ:
*-----------------------------------------------------------------------------

    BEGIN CASE
    CASE TSHOW.1    ;* EN_20090428 S
        GOSUB PRINT.TSHOW.TAFJ          ;* EN_20090428 E
        TSHOW.1 =''
    CASE GETSTMTE
        GOSUB GETSTMT.TAFJ
        GETSTMTE=''
    CASE GETCATEGE
        GOSUB GETCATEG.TAFJ
        GETCATEGE=''
    CASE PLAIN.RECORD
        GOSUB PRINT.PLAIN.RECORD
    CASE GETDELIVERY
        GOSUB DELIVERY.PROCESS.TAFJ
        GETDELIVERY=''
    CASE GETFT
        APPLICATION = 'FUNDS.TRANSFER'
        GOSUB DETERMINE.TRANSACTION.COMPANY
        GOSUB FT.PROCESSING.TAFJ
        GETFT = ''
    CASE GETSTO
        APPLICATION = 'STANDING.ORDER'
        GOSUB DETERMINE.TRANSACTION.COMPANY
        GOSUB STO.PROCESSING.TAFJ
        GETSTO = ''
    CASE GETNR
        APPLICATION = 'ACCOUNT.STATEMENT'
        GOSUB DETERMINE.TRANSACTION.COMPANY
        GOSUB NR.PROCESSING.TAFJ
        GETNR = ''
    CASE 1
        GOSUB DO.T24.PROCESS
    END CASE

    RETURN


*-----------------------------------------------------------------------------
PRINT.TSHOW.TAFJ:
*-----------------------------------------------------------------------------
    CALL PRINTER.ON('P.FUNCTION',0)     ;* EN_20090428 <Start>

    BEGIN CASE
    CASE APP EQ 'tShow'
        PRINT
        PRINT "==============================================="
        PRINT "                    tShow                      "
        PRINT "==============================================="
        PRINT

        IF OS.NAME EQ 'WINNT' OR OS.NAME EQ 'WIN95' THEN      ;* Command used in Windows
            EXE.CMD = 'DOS -c ':tafjHome:'\bin\tShow ':REC.ID
        END ELSE
            EXE.CMD = 'SH -c ':tafjHome:'/bin/tShow ':REC.ID
        END
        EXECUTE EXE.CMD CAPTURING RESULT          ;*Execute tShow
        PRINT RESULT

    CASE APP EQ 'tDiag'
        PRINT
        PRINT "==============================================="
        PRINT "                    tDiag                      "
        PRINT "==============================================="
        PRINT

        IF OS.NAME EQ 'WINNT' OR OS.NAME EQ 'WIN95' THEN      ;* Command used in Windows
            EXE.CMD = 'DOS -c ':tafjHome:'\bin\tDiag'
        END ELSE
            EXE.CMD = 'SH -c ':tafjHome:'/bin/tDiag'
        END
        EXECUTE EXE.CMD CAPTURING RESULT ;
        PRINT RESULT
    END CASE

    CALL PRINTER.OFF          ;* Switch off the printer EN_20090428 <End>

    RETURN

*-----------------------------------------------------------------------------
GETSTMT.TAFJ:
*-----------------------------------------------------------------------------
    CALL PRINTER.ON('P.FUNCTION',0)     ;* EN_20090428 <Start>
    PRINT
    PRINT "==============================================="
    PRINT "   STMT.ENTRY & STMT.ENTRY.DETAIL              "
    PRINT "==============================================="
    PRINT
    EXC.CMD2 = "TERM 500"
    EXECUTE EXC.CMD2
    EXC.CMD2=''
	
	COM.LIST=''
	NO.OF.REC=''
	R.ERR=''
    SEL.CMD = "SELECT F":TRANS.FIN.MNE:".STMT.ENTRY  WITH TRANS.REFERENCE LIKE ...":REC.ID:"..."
    CALL EB.READLIST(SEL.CMD, COM.LIST, '', NO.OF.REC, R.ERR)
    FOR INS.CNT = 1 TO NO.OF.REC
        APPL.ID.LIST = 'STMT.ENTRY'
        REC.ID1 = COM.LIST<INS.CNT>
        GOSUB T24.OUTPUT.EXTRACTION
    NEXT INS.CNT

    IF VAR.PRINT THEN
        PRINT EXC.CMD2
        PRINT VAR.PRINT
        PRINT
    END
    EXC.CMD2=''
    SEL.CMD = "SELECT F":TRANS.FIN.MNE:".STMT.ENTRY.DETAIL  WITH TRANS.REFERENCE LIKE ...":REC.ID:"..."
    CALL EB.READLIST(SEL.CMD, COM.LIST, '', NO.OF.REC, R.ERR)
    FOR INS.CNT = 1 TO NO.OF.REC
        APPL.ID.LIST = 'STMT.ENTRY.DETAIL'
        REC.ID1 = COM.LIST<INS.CNT>
        GOSUB T24.OUTPUT.EXTRACTION
    NEXT INS.CNT
    IF VAR.PRINT THEN
        PRINT EXC.CMD2
        PRINT VAR.PRINT
        PRINT
    END
    EXC.CMD2=''

    CALL PRINTER.OFF          ;* Switch off the printer EN_20090428 <End>
    RETURN

*-----------------------------------------------------------------------------
GETCATEG.TAFJ:
*-----------------------------------------------------------------------------

    CALL PRINTER.ON('P.FUNCTION',0)     ;* EN_20090428 <Start>
    PRINT
    PRINT "==============================================="
    PRINT "              CATEG.ENTRY                      "
    PRINT "==============================================="
    PRINT
    EXC.CMD2 = "TERM 500"
    EXECUTE EXC.CMD2
    EXC.CMD2=''

    SEL.CMD = "SELECT F":TRANS.FIN.MNE:".CATEG.ENTRY  WITH TRANS.REFERENCE LIKE ...":REC.ID:"..."
    CALL EB.READLIST(SEL.CMD, COM.LIST, '', NO.OF.REC, R.ERR)
    FOR INS.CNT = 1 TO NO.OF.REC
        APPL.ID.LIST = 'CATEG.ENTRY'
        REC.ID1 = COM.LIST<INS.CNT>
        GOSUB T24.OUTPUT.EXTRACTION
    NEXT INS.CNT


    IF VAR.PRINT THEN
        PRINT EXC.CMD2
        PRINT VAR.PRINT
        PRINT
    END
    EXC.CMD2=''
    CALL PRINTER.OFF          ;* Switch off the printer EN_20090428 <End>

    RETURN
*-----------------------------------------------------------------------------
DELIVERY.PROCESS.TAFJ:
*-----------------------------------------------------------------------------
    IF NOT (NUM(REC.ID[2,99])) THEN
        CALL PRINTER.ON('P.FUNCTION',0)
        PRINT
        PRINT "==============================================="
        PRINT "   DELIVERY HEADER ":REC.ID:" ID NOT VALID     "
        PRINT "==============================================="
        CALL PRINTER.OFF
    END ELSE
        GOSUB DELIVERY.INITIALISATION
		REC.ID=''
		R.R.ERR=''
        IF FILE.VALUE EQ 'INWARD' THEN
            CALL F.READ(FN.DE.I.HEADER,REC.ID,R.DEL.REC,F.DE.I.HEADER,R.R.ERR)
            APPL.ID.LIST = "DE.I.HEADER"
	    ADDTN = APPL.ID.LIST
        END ELSE
            CALL F.READ(FN.DE.O.HEADER,REC.ID,R.DEL.REC,F.DE.O.HEADER,R.R.ERR)
            APPL.ID.LIST = "DE.O.HEADER"
	    ADDTN = APPL.ID.LIST
        END
        IF R.R.ERR THEN
            CALL PRINTER.ON('P.FUNCTION',0)
            PRINT
            PRINT "==============================================="
            PRINT "  THE HEADER RECORD ":REC.ID:" DOES NOT EXIST   "
            PRINT "==============================================="
            CALL PRINTER.OFF
        END ELSE
            MESSAGE.TYPE = R.DEL.REC<DE.HDR.MESSAGE.TYPE>
            CUSTOMER.NO = R.DEL.REC<DE.HDR.CUSTOMER.NO>
            ACCOUNT.NO = R.DEL.REC<DE.HDR.AC.NO.>
            HDR.APPL =R.DEL.REC<DE.HDR.APPLICATION>
            APPLICATION.FORMAT = R.DEL.REC<DE.HDR.APP.FORMAT>

            IF APPLICATION.FORMAT EQ '' THEN
                APPLICATION.FORMAT = '1'
            END

            REC.ID1 = REC.ID
            GOSUB T24.OUTPUT.EXTRACTION

            IF MESSAGE.TYPE EQ '' THEN
                CALL PRINTER.ON('P.FUNCTION',0)
                PRINT
                PRINT "==============================================="
                PRINT " THE MESSAGE TYPE IS MISSING IN HEADER RECORD  "
                PRINT "==============================================="
                CALL PRINTER.OFF
            END

            IF HDR.APPL EQ '' AND FILE.VALUE EQ 'OUTWARD' THEN
                CALL PRINTER.ON('P.FUNCTION',0)
                PRINT
                PRINT "==============================================="
                PRINT "                                               "
                PRINT " THE APPLICATION IS MISSING IN HEADER RECORD   "
                PRINT "                                               "
                PRINT "==============================================="
                CALL PRINTER.OFF
            END
            IF MESSAGE.TYPE NE '' AND NOT(HDR.APPL EQ '' AND FILE.VALUE EQ 'OUTWARD') THEN

                CALL F.READ(FN.DE.MESSAGE,MESSAGE.TYPE,R.MESSAGE,F.DE.MESSAGE,ERR5)

                APPL.ID.LIST = "DE.MESSAGE"
                REC.ID1 = MESSAGE.TYPE
                GOSUB T24.OUTPUT.EXTRACTION

                IF FILE.VALUE EQ 'INWARD' THEN

                    APPL.ID.LIST = "DE.I.FT.TXN.TYPES"
                    REC.ID1 = MESSAGE.TYPE
                    GOSUB T24.OUTPUT.EXTRACTION

                    IF R.MESSAGE THEN

                        VERSION = R.MESSAGE<DE.MSG.IN.OFS.VERSION>
                        OFS.SOURCE = R.MESSAGE<DE.MSG.OFS.SOURCE>
                        INWARD.OFS.RTN = R.MESSAGE<DE.MSG.INWARD.OFS.RTN>
                    END

                    IF VERSION THEN
						R.VERSION.REC=''
						ERR2=''
                        CALL F.READ(FN.VERSION, VERSION, R.VERSION.REC, F.VERSION, ERR2)
                        APPL.ID.LIST = "VERSION"
                        REC.ID1 = VERSION
                        GOSUB T24.OUTPUT.EXTRACTION
                    END

                    IF OFS.SOURCE THEN
						R.SOURCE=''
						R.R.ERR=''
                        CALL F.READ(FN.OFS.SOURCE,OFS.SOURCE,R.SOURCE,F.OFS.SOURCE,R.R.ERR)
                        APPL.ID.LIST = "OFS.SOURCE"
                        REC.ID1 = OFS.SOURCE
                        GOSUB T24.OUTPUT.EXTRACTION
                    END

                    IF INWARD.OFS.RTN THEN
                        IF INWARD.OFS.RTN[1,1] EQ '@' THEN
                            INWARD.OFS.RTN = INWARD.OFS.RTN[2,99]
                        END
                        CALL PRINTER.ON('P.FUNCTION',0)
                        PRINT
                        PRINT "==============================================="
                        PRINT "                    tShow                      "
                        PRINT "==============================================="
                        PRINT

                        IF OS.NAME EQ 'WINNT' OR OS.NAME EQ 'WIN95' THEN          ;* Command used in Windows
                            EXE.CMD = 'DOS -c ':tafjHome:'\bin\tShow ':INWARD.OFS.RTN
                        END ELSE
                            EXE.CMD = 'SH -c ':tafjHome:'/bin/tShow ':INWARD.OFS.RTN
                        END
                        EXECUTE EXE.CMD CAPTURING RESULT    ;*Execute tShow
                        PRINT RESULT
                        CALL PRINTER.OFF
                    END

                        SS.REC2 = ''
                        CALL GET.STANDARD.SELECTION.DETS(ADDTN,SS.REC2)

                        OFS.REQ.POS2 = ''
                        T24.INW.TRANS.REF2 = ''
			OFS.REQ.NO2 = ''
			T24.INW.NO2 = ''
                        LOCATE 'OFS.REQ.DET.KEY' IN SS.REC2<SSL.SYS.FIELD.NAME,1> SETTING OFS.REQ.POS2 THEN
                            OFS.REQ.NO2 = SS.REC<SSL.SYS.FIELD.NO,OFS.REQ.POS2>
                        END
                        LOCATE 'T24.INW.TRANS.REF' IN SS.REC2<SSL.SYS.FIELD.NAME,1> SETTING T24.INW.TRANS.REF2 THEN
                            T24.INW.NO2 = SS.REC<SSL.SYS.FIELD.NO,T24.INW.TRANS.REF2>
                        END

                    TOT.CNT = DCOUNT(R.DEL.REC,@FM)
                    IF TOT.CNT GT 60 THEN
                        DEL.CUS.COM = R.DEL.REC<DE.HDR.CUS.COMPANY>
                        IF DEL.CUS.COM EQ '' THEN
                            DEL.CUS.COM = R.DEL.REC<DE.HDR.DIM + 6>
                        END

                        FT.ID =R.DEL.REC<T24.INW.NO2>

                        IF FT.ID NE '' THEN
                            CALL LOAD.COMPANY(DEL.CUS.COM)
                            GOSUB FT.INITIALIZE
                            CALL F.READ(FN.FUNDS.TRANSFER,FT.ID,FUNDS.REC,F.FUNDS.TRANSFER,R.R.ERR)
                            D.RANGE.AND.VALUE<1> = FT.ID
                            IF NOT(FUNDS.REC) THEN
                                CALL F.READ(FN.FUNDS.TRANSFER$NAU,FT.ID,FUNDS.REC,F.FUNDS.TRANSFER$NAU,R.R.ERR)
                                D.RANGE.AND.VALUE = FT.ID
                            END
                            IF NOT(FUNDS.REC) THEN
                                FT.ID1 = FT.ID:';1'
                                CALL F.READ(FN.FUNDS.TRANSFER$HIS,FT.ID1,FUNDS.REC,F.FUNDS.TRANSFER$HIS,R.R.ERR)
                                D.RANGE.AND.VALUE = FT.ID1
                            END
                            IF NOT(FUNDS.REC) THEN
                                CALL PRINTER.ON('P.FUNCTION',0)
                                PRINT
                                PRINT "==============================================="
                                PRINT "      FT RECORD ":FT.ID:" DOES NOT EXIST       "
                                PRINT "==============================================="
                                CALL PRINTER.OFF
                            END ELSE
                                SAVE.APP = APP
                                APP = 'FT'
                                APPL.ID.LIST = 'FT'
                                REC.ID1 = FT.ID
                                DEF.COM = DEL.CUS.COM
                                GOSUB T24.OUTPUT.EXTRACTION
                                APP = SAVE.APP
                            END
                        END
                        
                        ORD.ID = R.DEL.REC<OFS.REQ.NO2>


                        IF ORD.ID NE '' THEN
                            SEL.CMD = "SELECT F.OFS.REQUEST.DETAIL WITH @ID LIKE ...":ORD.ID:"..."
                            CALL EB.READLIST(SEL.CMD, COM.LIST, '', NO.OF.REC, R.ERR)
                            FOR INS.CNT = 1 TO NO.OF.REC
                                APPL.ID.LIST = 'OFS.REQUEST.DETAIL'
                                REC.ID1 = COM.LIST<INS.CNT>
                                GOSUB T24.OUTPUT.EXTRACTION
                            NEXT INS.CNT

                        END
                    END

                    CARRIER.ADDR = R.DEL.REC<DE.HDR.CARRIER.ADDRESS.NO,1>
                    CARRIER.ID = FIELD(CARRIER.ADDR, '.', 1)

                    IF CARRIER.ID THEN
                        CALL F.READ(FN.DE.CARRIER,CARRIER.ID,R.CARRIER,F.DE.CARRIER,ERR2)
                        INTERFACE = R.CARRIER<DE.CARR.INTERFACE>
                        FORMAT.MODULE = R.CARRIER<DE.CARR.FORMAT.MODULE>
                        IF FORMAT.MODULE NE '' THEN

                            FN.DE.FORMAT = 'F.DE.FORMAT.'
                            FN.DE.FORMAT:=FORMAT.MODULE
                            F.DE.FORMAT = ''

                            CALL OPF(FN.DE.FORMAT,F.DE.FORMAT)

                            FORMAT.ID = MESSAGE.TYPE:'.':'1':'.':'1'
							R.FORMAT=''
							ERR3=''
                            CALL F.READ(FN.DE.FORMAT,FORMAT.ID,R.FORMAT,F.DE.FORMAT,ERR3)

                            APPL = FN.DE.FORMAT[3,99]
                            APPL.ID.LIST = APPL
                            REC.ID1 = FORMAT.ID
                            GOSUB T24.OUTPUT.EXTRACTION
                        END
                        IF EXC.CMD1 EQ '' THEN

                            SEL.CMD = "SELECT F.DE.CARRIER WITH @ID LIKE ...":CARRIER.ID:"..."
                            CALL EB.READLIST(SEL.CMD, COM.LIST, '', NO.OF.REC, R.ERR)
                            FOR INS.CNT = 1 TO NO.OF.REC
                                APPL.ID.LIST = 'DE.CARRIER'
                                REC.ID1 = COM.LIST<INS.CNT>
                                GOSUB T24.OUTPUT.EXTRACTION
                            NEXT INS.CNT

                        END ELSE
                            SEL.CMD = "SELECT F.DE.CARRIER WITH @ID LIKE ...":CARRIER.ID:"..."
                            CALL EB.READLIST(SEL.CMD, COM.LIST, '', NO.OF.REC, R.ERR)
                            FOR INS.CNT = 1 TO NO.OF.REC
                                APPL.ID.LIST = 'DE.CARRIER'
                                REC.ID1 = COM.LIST<INS.CNT>
                                GOSUB T24.OUTPUT.EXTRACTION
                            NEXT INS.CNT
                        END

                        IF INTERFACE THEN
                            SEL.CMD = "SELECT F.DE.INTERFACE WITH @ID LIKE ...":INTERFACE:"..."
                            CALL EB.READLIST(SEL.CMD, COM.LIST, '', NO.OF.REC, R.ERR)
                            FOR INS.CNT = 1 TO NO.OF.REC
                                APPL.ID.LIST = 'DE.INTERFACE'
                                REC.ID1 = COM.LIST<INS.CNT>
                                GOSUB T24.OUTPUT.EXTRACTION
                            NEXT INS.CNT
							
							R.INTERFACE=''
							R.R.ERR=''
                            CALL F.READ(FN.DE.INTERFACE,INTERFACE,R.INTERFACE,F.DE.INTERFACE,R.R.ERR)
                            INWARD.RTN = R.INTERFACE<DE.ITF.IN.IF.ROUTINE>
                        END

                        ACTIVATION.LIST = "F.":CARRIER.ID:".IN.LIST"
                        IF OS.NAME EQ 'WINNT' OR OS.NAME EQ 'WIN95' THEN          ;* Command used in Windows
                            EXE.CMD = 'DOS -c ':tafjHome:'\bin\DBTools ':'-s JQL LIST-ITEM ':ACTIVATION.LIST:' WITH @ID LIKE ':REC.ID:'...'
                        END ELSE
                            EXE.CMD = 'SH -c ':tafjHome:'/bin/DBTools ':'-s JQL LIST-ITEM ':ACTIVATION.LIST:' WITH @ID LIKE ':REC.ID:'...'
                        END
                        EXECUTE EXE.CMD CAPTURING RESULT
                        CALL PRINTER.ON('P.FUNCTION',0)

                        PRINT "==============================================="
                        PRINT
                        PRINT RESULT
                        PRINT "==============================================="
                        CALL PRINTER.OFF

                        IF INWARD.RTN  THEN
                            CALL PRINTER.ON('P.FUNCTION',0)
                            PRINT
                            PRINT "==============================================="
                            PRINT "                    tShow                      "
                            PRINT "==============================================="
                            PRINT

                            IF OS.NAME EQ 'WINNT' OR OS.NAME EQ 'WIN95' THEN      ;* Command used in Windows
                                EXE.CMD = 'DOS -c ':tafjHome:'\bin\tShow ':INWARD.RTN
                            END ELSE
                                EXE.CMD = 'SH -c ':tafjHome:'/bin/tShow ':INWARD.RTN
                            END
                            EXECUTE EXE.CMD CAPTURING RESULT          ;*Execute tShow
                            PRINT RESULT
                            CALL PRINTER.OFF
                        END

                    END ELSE

                        CALL PRINTER.ON('P.FUNCTION',0)
                        PRINT
                        PRINT "========================================================="
                        PRINT " THE CARRIER ID IS MISSING IN HEADER RECORD ":REC.ID:"   "
                        PRINT "========================================================="
                        CALL PRINTER.OFF
                    END
                END

                IF FILE.VALUE EQ 'OUTWARD' THEN

                    MAPPING.KEY = MESSAGE.TYPE:".":HDR.APPL[1,2]:".":APPLICATION.FORMAT
					R.MAPPING=''
					ERR1=''
                    CALL F.READ(FN.DE.MAPPING,MAPPING.KEY,R.MAPPING,F.DE.MAPPING,ERR1)

                    IF ERR1 THEN
                        MAPPING.KEY = MESSAGE.TYPE:'.':HDR.APPL[1,2]:'.':'1'
                    END

                    APPL.ID.LIST = "DE.MAPPING"
                    REC.ID1 = MAPPING.KEY
                    GOSUB T24.OUTPUT.EXTRACTION

                    MAP.ROUTINE = R.MAPPING<DE.MAP.ROUTINE>

                    IF MAP.ROUTINE THEN
                        IF MAP.ROUTINE[1,1] EQ '@' THEN
                            MAP.ROUTINE = MAP.ROUTINE[2,99]
                        END
                        CALL PRINTER.ON('P.FUNCTION',0)
                        PRINT
                        PRINT "==============================================="
                        PRINT "                    tShow                      "
                        PRINT "==============================================="
                        PRINT

                        IF OS.NAME EQ 'WINNT' OR OS.NAME EQ 'WIN95' THEN          ;* Command used in Windows
                            EXE.CMD = 'DOS -c ':tafjHome:'\bin\tShow ':MAP.ROUTINE
                        END ELSE
                            EXE.CMD = 'SH -c ':tafjHome:'/bin/tShow ':MAP.ROUTINE
                        END
                        EXECUTE EXE.CMD CAPTURING RESULT    ;*Execute tShow
                        PRINT RESULT
                        CALL PRINTER.OFF
                    END

                    MAX.CARRIERS = COUNT(R.DEL.REC<DE.HDR.CARRIER.ADDRESS.NO>,@VM) + 1

                    FOR CARRIER.NO = 1 TO MAX.CARRIERS

                        CARRIER.ADDR = R.DEL.REC<DE.HDR.CARRIER.ADDRESS.NO,CARRIER.NO>
                        CARRIER.ID = FIELD(CARRIER.ADDR, '.', 1)
                        CARRIER.COUNT = CARRIER.COUNT + 1

                        IF MAX.CARRIERS EQ '1' THEN
                            NOT.REPEATED = '1'
                        END ELSE
                            IF CARRIER.SET<CARRIER.COUNT-1> NE CARRIER.ID THEN
                                NOT.REPEATED = '1'
                                CARRIER.SET<-1> = CARRIER.ID
                            END ELSE
                                CARRIER.SET<-1> = CARRIER.ID
                            END
                        END

                        IF NOT.REPEATED THEN
							R.CARRIER=''
							ERR2=''
                            CALL F.READ(FN.DE.CARRIER,CARRIER.ID,R.CARRIER,F.DE.CARRIER,ERR2)
                            INTERFACE = R.CARRIER<DE.CARR.INTERFACE>
                            FORMAT.MODULE = R.CARRIER<DE.CARR.FORMAT.MODULE>

                            IF EXC.CMD1 EQ '' THEN

                                SEL.CMD = "SELECT F.DE.CARRIER WITH @ID LIKE ...":CARRIER.ID:"..."
                                CALL EB.READLIST(SEL.CMD, COM.LIST, '', NO.OF.REC, R.ERR)
                                FOR INS.CNT = 1 TO NO.OF.REC
                                    APPL.ID.LIST = 'DE.CARRIER'
                                    REC.ID1 = COM.LIST<INS.CNT>
                                    GOSUB T24.OUTPUT.EXTRACTION
                                NEXT INS.CNT

                            END ELSE
                                SEL.CMD = "SELECT F.DE.CARRIER WITH @ID LIKE ...":CARRIER.ID:"..."
                                CALL EB.READLIST(SEL.CMD, COM.LIST, '', NO.OF.REC, R.ERR)
                                FOR INS.CNT = 1 TO NO.OF.REC
                                    APPL.ID.LIST = 'DE.CARRIER'
                                    REC.ID1 = COM.LIST<INS.CNT>
                                    GOSUB T24.OUTPUT.EXTRACTION
                                NEXT INS.CNT

                            END

                            ACTIVATION.LIST = "F.":CARRIER.ID:".OUT.LIST"

                            IF OS.NAME EQ 'WINNT' OR OS.NAME EQ 'WIN95' THEN      ;* Command used in Windows
                                EXE.CMD = 'DOS -c ':tafjHome:'\bin\DBTools ':'-s JQL LIST-ITEM ':ACTIVATION.LIST:' WITH @ID LIKE ':REC.ID:'...'
                            END ELSE
                                EXE.CMD = 'SH -c ':tafjHome:'/bin/DBTools ':'-s JQL LIST-ITEM ':ACTIVATION.LIST:' WITH @ID LIKE ':REC.ID:'...'
                            END
                            EXECUTE EXE.CMD CAPTURING RESULT
                            CALL PRINTER.ON('P.FUNCTION',0)

                            PRINT "==============================================="
                            PRINT
                            PRINT RESULT
                            PRINT "==============================================="
                            CALL PRINTER.OFF

                            IF OS.NAME EQ 'WINNT' OR OS.NAME EQ 'WIN95' THEN      ;* Command used in Windows
                                EXE.CMD = 'DOS -c ':tafjHome:'\bin\DBTools ':'-s JQL LIST-ITEM F.DE.O.MSG.':CARRIER.ID:' WITH @ID LIKE ':REC.ID:'...'
                            END ELSE
                                EXE.CMD = 'SH -c ':tafjHome:'/bin/DBTools ':'-s JQL LIST-ITEM F.DE.O.MSG.':CARRIER.ID:' WITH @ID LIKE ':REC.ID:'...'
                            END
                            EXECUTE EXE.CMD CAPTURING RESULT
                            CALL PRINTER.ON('P.FUNCTION',0)

                            PRINT "==============================================="
                            PRINT
                            PRINT RESULT
                            PRINT "==============================================="

                            CALL PRINTER.OFF

                            IF INTERFACE THEN
							R.INTERFACE=''
							R.R.ERR=''
                                CALL F.READ(FN.DE.INTERFACE,INTERFACE,R.INTERFACE,F.DE.INTERFACE,R.R.ERR)
                                SEL.CMD = "SELECT F.DE.INTERFACE WITH @ID LIKE ...":INTERFACE:"..."
                                CALL EB.READLIST(SEL.CMD, COM.LIST, '', NO.OF.REC, R.ERR)
                                FOR INS.CNT = 1 TO NO.OF.REC
                                    APPL.ID.LIST = 'DE.INTERFACE'
                                    REC.ID1 = COM.LIST<INS.CNT>
                                    GOSUB T24.OUTPUT.EXTRACTION
                                NEXT INS.CNT

                                OUTWARD.RTN = R.INTERFACE<DE.ITF.OUT.IF.ROUTINE>

                                IF OUTWARD.RTN THEN
                                    CALL PRINTER.ON('P.FUNCTION',0)
                                    PRINT
                                    PRINT "==============================================="
                                    PRINT "                    tShow                      "
                                    PRINT "==============================================="
                                    PRINT

                                    IF OS.NAME EQ 'WINNT' OR OS.NAME EQ 'WIN95' THEN        ;* Command used in Windows
                                        EXE.CMD = 'DOS -c ':tafjHome:'\bin\tShow ':OUTWARD.RTN
                                    END ELSE
                                        EXE.CMD = 'SH -c ':tafjHome:'/bin/tShow ':OUTWARD.RTN
                                    END
                                    EXECUTE EXE.CMD CAPTURING RESULT  ;*Execute tShow
                                    PRINT RESULT


                                END
                                CALL PRINTER.OFF

                            END

                            IF FORMAT.MODULE NE '' THEN

                                FN.DE.FORMAT = 'F.DE.FORMAT.'
                                FN.DE.FORMAT:=FORMAT.MODULE
                                F.DE.FORMAT = ''
								R.FORMAT=''
								ERR3=''
                                CALL OPF(FN.DE.FORMAT,F.DE.FORMAT)

                                FORMAT.ID = MESSAGE.TYPE:'.':APPLICATION.FORMAT:'.':R.DEL.REC<DE.HDR.FORMAT><1,CARRIER.NO>


                                IF FORMAT.MODULE EQ "PRINT" OR FORMAT.MODULE EQ "XML" THEN
                                    FORMAT.ID := '.':R.DEL.REC<DE.HDR.TRANSLATION><1,CARRIER.NO>
                                END

                                IF FORMAT.MODULE EQ 'SWIFT' THEN
                                    FORMAT.ID = MESSAGE.TYPE:'.':'1':'.':'1'
                                END

                                CALL F.READ(FN.DE.FORMAT,FORMAT.ID,R.FORMAT,F.DE.FORMAT,ERR3)

                                APPL = FN.DE.FORMAT[3,99]
                                APPL.ID.LIST = APPL
                                REC.ID1 = FORMAT.ID
                                GOSUB T24.OUTPUT.EXTRACTION


                                IF FORMAT.MODULE EQ "PRINT" THEN
                                    FORM.TYPE = R.FORMAT<DE.PRT.FORM.TYPE>
                                END

                                IF FORMAT.MODULE EQ "XML" THEN
                                    FORM.TYPE = R.FORMAT<DE.XML.FORM.TYPE>
                                END

                                IF FORM.TYPE THEN
								R.FORM=''
								ERR4=''
                                    CALL F.READ(FN.DE.FORM.TYPE,FORM.TYPE,R.FORM,F.DE.FORM.TYPE,ERR4)

                                    APPL.ID.LIST = "DE.FORM.TYPE"
                                    REC.ID1 = FORM.TYPE
                                    GOSUB T24.OUTPUT.EXTRACTION
                                END

                                IF FORMAT.MODULE EQ 'XML' THEN

                                    TRANSFORM.ID = 'DE':'.':FORMAT.ID
                                    TRANSFORM.ID:= '.':CARRIER.ID

                                    APPL.ID.LIST = 'EB.TRANSFORM'
                                    REC.ID1 = TRANSFORM.ID
                                    GOSUB T24.OUTPUT.EXTRACTION

                                END

                            END
                        END
                        NOT.REPEATED = ''
                        INWARD.RTN = ''
                        OUTWARD.RTN = ''
                        FORM.TYPE = ''
                        TRANSFORM.ID = ''
                        FORMAT.ID = ''
                    NEXT CARRIER.NO

                END
            END
            IF CUSTOMER.NO NE '' THEN

                SEL.CMD = "SELECT F.DE.PRODUCT WITH @ID LIKE ...C-":CUSTOMER.NO:"..."
                CALL EB.READLIST(SEL.CMD, COM.LIST, '', NO.OF.REC, R.ERR)
                FOR INS.CNT = 1 TO NO.OF.REC
                    APPL.ID.LIST = 'DE.PRODUCT'
                    REC.ID1 = COM.LIST<INS.CNT>
                    GOSUB T24.OUTPUT.EXTRACTION
                NEXT INS.CNT


                SEL.CMD = "SELECT F.DE.ADDRESS WITH @ID LIKE ...C-":CUSTOMER.NO:"..."
                CALL EB.READLIST(SEL.CMD, COM.LIST, '', NO.OF.REC, R.ERR)
                FOR INS.CNT = 1 TO NO.OF.REC
                    APPL.ID.LIST = 'DE.ADDRESS'
                    REC.ID1 = COM.LIST<INS.CNT>
                    GOSUB T24.OUTPUT.EXTRACTION
                NEXT INS.CNT

            END

            IF ACCOUNT.NO NE '' THEN
                SEL.CMD = "SELECT F.DE.PRODUCT WITH @ID LIKE ...A-":ACCOUNT.NO:"..."
                CALL EB.READLIST(SEL.CMD, COM.LIST, '', NO.OF.REC, R.ERR)
                FOR INS.CNT = 1 TO NO.OF.REC
                    APPL.ID.LIST = 'DE.PRODUCT'
                    REC.ID1 = COM.LIST<INS.CNT>
                    GOSUB T24.OUTPUT.EXTRACTION
                NEXT INS.CNT

            END

            SEL.CMD = "SELECT F.DE.PRODUCT WITH @ID LIKE ...":MESSAGE.TYPE:"..."
            CALL EB.READLIST(SEL.CMD, COM.LIST, '', NO.OF.REC, R.ERR)
            FOR INS.CNT = 1 TO NO.OF.REC
                APPL.ID.LIST = 'DE.PRODUCT'
                REC.ID1 = COM.LIST<INS.CNT>
                GOSUB T24.OUTPUT.EXTRACTION
            NEXT INS.CNT

            IF FILE.VALUE EQ 'OUTWARD' THEN

                SEL.CMD = "SELECT F.DE.O.HISTORY WITH @ID LIKE ...":REC.ID:"..."
                CALL EB.READLIST(SEL.CMD, COM.LIST, '', NO.OF.REC, R.ERR)
                FOR INS.CNT = 1 TO NO.OF.REC
                    Y.ID.LIST=COM.LIST<INS.CNT>
                    CALL F.READ(FN.DE.O.HISTORY,Y.ID.LIST,R.DE.O.HISTORY,F.DE.O.HISTORY,Y.ETEXT)
                    OUT.LIST1<-1>=R.DE.O.HISTORY
                NEXT INS.CNT

                CALL PRINTER.ON('P.FUNCTION',0)

                PRINT "==============================================="
                PRINT
                PRINT SEL.CMD
                PRINT OUT.LIST1
                PRINT "==============================================="

                CALL PRINTER.OFF
				R.DE.O.MSG=''
                SEL.CMD = "SELECT F.DE.O.MSG WITH @ID LIKE ...":REC.ID:"..."
                CALL EB.READLIST(SEL.CMD, COM.LIST, '', NO.OF.REC, R.ERR)
                FOR INS.CNT = 1 TO NO.OF.REC
                    Y.ID.LIST=COM.LIST<INS.CNT>
*                    CALL F.READ(FN.DE.O.MSG,Y.ID.LIST,R.DE.O.MSG,F.DE.O.MSG,Y.ETEXT)
					READ R.DE.O.MSG FROM F.DE.O.MSG,Y.ID.LIST ELSE R.DE.O.MSG=''
                    OUT.LIST2<-1>=R.DE.O.MSG
                NEXT INS.CNT

                CALL PRINTER.ON('P.FUNCTION',0)

                PRINT "==============================================="
                PRINT
                PRINT SEL.CMD
                PRINT OUT.LIST2
                PRINT "==============================================="

                CALL PRINTER.OFF

                CALL PRINTER.ON('P.FUNCTION',0)
                PRINT
                PRINT "==============================================="
                PRINT "DELIVERY HANDOFF DETAILS FOR  ":REC.ID:"       "
                PRINT "==============================================="
                CALL PRINTER.OFF

                SAVE.SCREEN.TITLE = "PRINTING HANDOFF DETAILS"
                ENQ = 'DE.HANDOFF.DETS'
                ENQ<2,1> = 'DELIVERY.REF'
                ENQ<3,1> = 'EQ'
                ENQ<4,1> = REC.ID
                ENQ<10,1> = 'OUTPUT'
                CALL ENQUIRY.DISPLAY(ENQ)

                IF FORMAT.MODULE EQ 'XML' THEN

                    CALL PRINTER.ON('P.FUNCTION',0)
                    CLASSPATH = GETENV("CLASSPATH")
                    IF CLASSPATH THEN
                        PRINT "==============================================="
                        PRINT
                        PRINT "CLASSPATH VARIABLE VALUE IS "
                        PRINT CLASSPATH
                        PRINT "==============================================="
                        PRINT
                    END
                    CALL PRINTER.OFF
					FN.DE.XML.SCHEMA='F.DE.XML.SCHEMA'
					F.DE.XML.SCHEMA=''
					CALL OPF(FN.DE.XML.SCHEMA, F.DE.XML.SCHEMA)
                    SEL.CMD = "SELECT F.DE.XML.SCHEMA WITH @ID EQ 'T24Sms.xsd'"
                    CALL EB.READLIST(SEL.CMD, COM.LIST, '', NO.OF.REC, R.ERR)
                    CALL F.READ(FN.DE.XML.SCHEMA,COM.LIST,R.DE.XML.SCHEMA,F.DE.XML.SCHEMA,Y.ETEXT)
					OUT.LIST5<-1>=R.DE.XML.SCHEMA

                    CALL PRINTER.ON('P.FUNCTION',0)

                    PRINT "==============================================="
                    PRINT
                    PRINT SEL.CMD
                    PRINT OUT.LIST5
                    PRINT "==============================================="

                    CALL PRINTER.OFF

                    SEL.CMD = "SELECT F.DE.XML.SCHEMA WITH @ID EQ 'T24Email.xsd'"
                    CALL EB.READLIST(SEL.CMD, COM.LIST, '', NO.OF.REC, R.ERR)
                    CALL F.READ(FN.DE.XML.SCHEMA,COM.LIST,R.DE.XML.SCHEMA,F.DE.XML.SCHEMA,Y.ETEXT)

					OUT.LIST6<-1>=R.DE.XML.SCHEMA

                    CALL PRINTER.ON('P.FUNCTION',0)

                    PRINT "==============================================="
                    PRINT
                    PRINT SEL.CMD
                    PRINT OUT.LIST6
                    PRINT "==============================================="

                    CALL PRINTER.OFF

                    SEL.CMD = "SELECT F.DE.XML.SCHEMA WITH @ID LIKE ...":MESSAGE.TYPE:"..."
                    CALL EB.READLIST(SEL.CMD, COM.LIST, '', NO.OF.REC, R.ERR)
                    FOR INS.CNT = 1 TO NO.OF.REC
                        Y.ID.LIST=COM.LIST<INS.CNT>
                        CALL F.READ(FN.DE.XML.SCHEMA,Y.ID.LIST,R.DE.XML.SCHEMA,F.DE.XML.SCHEMA,Y.ETEXT)
          
						OUT.LIST7<-1>=R.DE.XML.SCHEMA
                    NEXT INS.CNT

                    CALL PRINTER.ON('P.FUNCTION',0)

                    PRINT "==============================================="
                    PRINT
                    PRINT SEL.CMD
                    PRINT OUT.LIST7
                    PRINT "==============================================="


                    CALL PRINTER.OFF
                END

            END ELSE

                SEL.CMD = "SELECT F.DE.I.HISTORY WITH @ID LIKE ...":REC.ID:"..."
                CALL EB.READLIST(SEL.CMD, COM.LIST, '', NO.OF.REC, R.ERR)
				R.DE.I.HISTORY=''
				Y.ETEXT=''
                FOR INS.CNT = 1 TO NO.OF.REC
                    Y.ID.LIST=COM.LIST<INS.CNT>
                    CALL F.READ(FN.DE.I.HISTORY,Y.ID.LIST,R.DE.I.HISTORY,F.DE.I.HISTORY,Y.ETEXT)
                    OUT.LIST3<-1>=R.DE.I.HISTORY
                NEXT INS.CNT
                CALL PRINTER.ON('P.FUNCTION',0)

                PRINT "==============================================="
                PRINT
                PRINT SEL.CMD
                PRINT OUT.LIST3
                PRINT "==============================================="

                CALL PRINTER.OFF
				R.DE.I.MSG=''
                SEL.CMD = "SELECT F.DE.I.MSG WITH @ID LIKE ...":REC.ID:"..."
                CALL EB.READLIST(SEL.CMD, COM.LIST, '', NO.OF.REC, R.ERR)
                FOR INS.CNT = 1 TO NO.OF.REC
                    Y.ID.LIST=COM.LIST<INS.CNT>
                   CALL F.READ(FN.DE.I.MSG,Y.ID.LIST,R.DE.I.MSG,F.DE.I.MSG,Y.ETEXT)
                    OUT.LIST4<-1>=R.DE.I.MSG
                NEXT INS.CNT

                CALL PRINTER.ON('P.FUNCTION',0)

                PRINT "==============================================="
                PRINT
                PRINT SEL.CMD
                PRINT OUT.LIST4
                PRINT "==============================================="

                CALL PRINTER.OFF

            END

            GOSUB LISTING.DETAILS
        END
    END
    RETURN

******************************
FT.PROCESSING.TAFJ:
******************************
    GOSUB FT.INITIALIZE
    D.FIELDS = 'TRANSACTION.REF'
    CALL F.READ(FN.FUNDS.TRANSFER,REC.ID,FUNDS.REC,F.FUNDS.TRANSFER,R.R.ERR)
    D.RANGE.AND.VALUE<1> = REC.ID

    IF NOT(FUNDS.REC) THEN
        REC.ID2 = REC.ID
        CALL F.READ(FN.FUNDS.TRANSFER$NAU,REC.ID2,FUNDS.REC1,F.FUNDS.TRANSFER$NAU,ERR1)
        D.RANGE.AND.VALUE = REC.ID1
        FUNDS.REC = FUNDS.REC1
    END
    IF NOT(FUNDS.REC) THEN
        REC.ID1 = REC.ID:';1'
        CALL F.READ(FN.FUNDS.TRANSFER$HIS,REC.ID1,FUNDS.REC,F.FUNDS.TRANSFER$HIS,ERR1)
        D.RANGE.AND.VALUE = REC.ID1
    END
    IF NOT(FUNDS.REC) THEN
        CALL PRINTER.ON('P.FUNCTION',0)
        PRINT
        PRINT "==============================================="
        PRINT "       THE FT ID ":REC.ID:" IS NOT VALID       "
        PRINT "==============================================="
        CALL PRINTER.OFF
    END ELSE

        APPL.ID.LIST = 'FT'
        REC.ID1 = REC.ID
        GOSUB T24.OUTPUT.EXTRACTION

        TRANSACTION.TYPE = FUNDS.REC<FT.TRANSACTION.TYPE>
        GROUP.COND.ID = FUNDS.REC<FT.CUST.GROUP.LEVEL>
        DEBIT.ACCOUNT = FUNDS.REC<FT.DEBIT.ACCT.NO>
        CREDIT.ACCOUNT = FUNDS.REC<FT.CREDIT.ACCT.NO>
        DEBIT.CCY = FUNDS.REC<FT.DEBIT.CURRENCY>
        CREDIT.CCY = FUNDS.REC<FT.CREDIT.CURRENCY>
        DEBIT.COMPANY = FUNDS.REC<FT.DEBIT.COMP.CODE>
        CREDIT.COMPANY = FUNDS.REC<FT.CREDIT.COMP.CODE>
        TRANS.COMPANY = FUNDS.REC<FT.CO.CODE>
        DEBIT.CUSTOMER = FUNDS.REC<FT.DEBIT.CUSTOMER>
        CREDIT.CUSTOMER = FUNDS.REC<FT.CREDIT.CUSTOMER>

        IF DEBIT.ACCOUNT[1,2] NE 'PL' THEN
            APPL.ID.LIST = 'ACCOUNT'
            REC.ID1 = DEBIT.ACCOUNT
            GOSUB T24.OUTPUT.EXTRACTION
        END

        IF CREDIT.ACCOUNT[1,2] NE 'PL' THEN
            APPL.ID.LIST = 'ACCOUNT'
            REC.ID1 = CREDIT.ACCOUNT
            GOSUB T24.OUTPUT.EXTRACTION
        END
		R.DEBIT.CO=''
		R.CREDIT.CO=''
		R.TRANS.CO=''
        CALL F.READ(FN.COMPANY,DEBIT.COMPANY,R.DEBIT.CO,F.COMPANY,R.R.ERR)
        CALL F.READ(FN.COMPANY,CREDIT.COMPANY,R.CREDIT.CO,F.COMPANY,ERR1)
        CALL F.READ(FN.COMPANY,TRANS.COMPANY,R.TRANS.CO,F.COMPANY,ERR2)

        DEBIT.COM.MNE = R.DEBIT.CO<EB.COM.MNEMONIC>
        CREDIT.COM.MNE = R.CREDIT.CO<EB.COM.MNEMONIC>
        TRANS.FIN.MNE = R.TRANS.CO<EB.COM.DEFAULT.FINAN.MNE>
        NOSTRO.COM.MNE = R.TRANS.CO<EB.COM.NOSTRO.MNEMONIC>
        DEBIT.CUS.COM = R.DEBIT.CO<EB.COM.CUSTOMER.COMPANY>
        CREDIT.CUS.COM = R.CREDIT.CO<EB.COM.CUSTOMER.COMPANY>

        IF R.TRANS.CO<EB.COM.FINANCIAL.MNE> EQ R.TRANS.CO<EB.COM.MNEMONIC> THEN
            TRANS.COM.MNE = R.TRANS.CO<EB.COM.MNEMONIC>
            TRANS.LEAD.COM = R.TRANS.CO<EB.COM.FINANCIAL.COM>
        END ELSE
            TRANS.COM.MNE = R.TRANS.CO<EB.COM.FINANCIAL.MNE>
            TRANS.LEAD.COM = R.TRANS.CO<EB.COM.FINANCIAL.COM>
        END

        APPL.ID.LIST = 'FT.TXN.TYPE.CONDITION'
        REC.ID1 = TRANSACTION.TYPE
        GOSUB T24.OUTPUT.EXTRACTION

        APPL.ID.LIST = 'CURRENCY'
        REC.ID1 = DEBIT.CCY
        GOSUB T24.OUTPUT.EXTRACTION

        IF DEBIT.CCY NE CREDIT.CCY THEN
            APPL.ID.LIST = 'CURRENCY'
            REC.ID1 = CREDIT.CCY
            GOSUB T24.OUTPUT.EXTRACTION
        END

        APPL.ID.LIST = 'COMPANY'
        REC.ID1 = DEBIT.COMPANY
        GOSUB T24.OUTPUT.EXTRACTION

        IF CREDIT.COMPANY NE DEBIT.COMPANY THEN
            APPL.ID.LIST = 'COMPANY'
            REC.ID1 = CREDIT.COMPANY
            GOSUB T24.OUTPUT.EXTRACTION
        END

        IF TRANS.COMPANY NE DEBIT.COMPANY AND TRANS.COMPANY NE CREDIT.COMPANY THEN
            APPL.ID.LIST = 'COMPANY'
            REC.ID1 = TRANS.COMPANY
            GOSUB T24.OUTPUT.EXTRACTION
        END

        NO.OF.CHG = COUNT(FUNDS.REC<FT.CHARGE.TYPE>,@VM) + 1
        FOR CHG.NO = 1 TO NO.OF.CHG
            CHG.TYPE.ID = FUNDS.REC<FT.CHARGE.TYPE,CHG.NO>
            IF CHG.TYPE.ID THEN
                APPL.ID.LIST = 'FT.CHARGE.TYPE'
                REC.ID1 = CHG.TYPE.ID
                GOSUB T24.OUTPUT.EXTRACTION
                CHG.TYPE.ID = ''
            END
        NEXT CHG.NO

        NO.OF.COMM = COUNT(FUNDS.REC<FT.COMMISSION.TYPE>,@VM) + 1
        FOR COMM.NO = 1 TO NO.OF.COMM
            COMM.TYPE.ID = FUNDS.REC<FT.COMMISSION.TYPE,COMM.NO>
            IF COMM.TYPE.ID THEN
                APPL.ID.LIST = 'FT.COMMISSION.TYPE'
                REC.ID1 = COMM.TYPE.ID
                GOSUB T24.OUTPUT.EXTRACTION
                COMM.TYPE.ID = ''
            END
        NEXT COMM.NO

        SEL.CMD = "SELECT F":TRANS.FIN.MNE:".FT.GEN.CONDITION"
        CALL EB.READLIST(SEL.CMD, COM.LIST, '', NO.OF.REC, R.ERR)
        FOR INS.CNT = 1 TO NO.OF.REC
            APPL.ID.LIST = 'FT.GEN.CONDITION'
            REC.ID1 = COM.LIST<INS.CNT>
            GOSUB T24.OUTPUT.EXTRACTION
        NEXT INS.CNT

        IF DEBIT.CUSTOMER THEN
            FT.GROUP.DEBIT = 'C-':DEBIT.CUSTOMER
            APPL.ID.LIST = 'FT.GROUP.CONDITION'
            DEF.COM = DEBIT.CUS.COM
            REC.ID1 = FT.GROUP.DEBIT
            GOSUB T24.OUTPUT.EXTRACTION

            APPL.ID.LIST = 'CUSTOMER.CHARGE'
            REC.ID1 = DEBIT.CUSTOMER
            DEF.COM = DEBIT.CUS.COM
            GOSUB T24.OUTPUT.EXTRACTION
        END

        IF CREDIT.CUSTOMER THEN
            FT.GROUP.CREDIT = 'C-':CREDIT.CUSTOMER
            APPL.ID.LIST = 'FT.GROUP.CONDITION'
            REC.ID1 = FT.GROUP.CREDIT
            DEF.COM = CREDIT.CUS.COM
            GOSUB T24.OUTPUT.EXTRACTION

            APPL.ID.LIST = 'CUSTOMER.CHARGE'
            REC.ID1 = CREDIT.CUSTOMER
            DEF.COM = CREDIT.CUS.COM
            GOSUB T24.OUTPUT.EXTRACTION
        END

        IF GROUP.COND.ID THEN
            APPL.ID.LIST = 'FT.GROUP.CONDITION'
            REC.ID1 = GROUP.COND.ID
            GOSUB T24.OUTPUT.EXTRACTION
        END

        APPL.ID.LIST = 'FT.APPL.DEFAULT'
        REC.ID1 = TRANS.LEAD.COM
        GOSUB T24.OUTPUT.EXTRACTION

        APPL.ID.LIST = 'FT.APPL.DEFAULT'
        REC.ID1 = TRANS.COMPANY
        GOSUB T24.OUTPUT.EXTRACTION


        SEL.CMD = "SELECT F":NOSTRO.COM.MNE:".FT.LOCAL.CLEARING"
        CALL EB.READLIST(SEL.CMD, COM.LIST, '', NO.OF.REC, R.ERR)
        FOR INS.CNT = 1 TO NO.OF.REC
            APPL.ID.LIST = 'FT.LOCAL.CLEARING'
            REC.ID1 = COM.LIST<INS.CNT>
            GOSUB T24.OUTPUT.EXTRACTION
        NEXT INS.CNT


        SEL.CMD = "SELECT F.FT.BC.PARAMETER"
        CALL EB.READLIST(SEL.CMD, COM.LIST, '', NO.OF.REC, R.ERR)
        FOR INS.CNT = 1 TO NO.OF.REC
            APPL.ID.LIST = 'FT.BC.PARAMETER'
            REC.ID1 = COM.LIST<INS.CNT>
            GOSUB T24.OUTPUT.EXTRACTION
        NEXT INS.CNT

        NO.OF.IN.MSG = COUNT(FUNDS.REC<FT.DELIVERY.INREF>,@VM) + 1
        FOR MSG.NO = 1 TO NO.OF.IN.MSG
            DELIVERY.ID = FUNDS.REC<FT.DELIVERY.INREF,MSG.NO>
            IF DELIVERY.ID THEN
                DELIVERY.REF = FIELD(DELIVERY.ID, "-", 1)
                APPL.ID.LIST = 'DE.I.HEADER'
                REC.ID1 = DELIVERY.REF
                GOSUB T24.OUTPUT.EXTRACTION
                DELIVERY.ID = ''
            END
        NEXT MSG.NO

        NO.OF.OUT.MSG = COUNT(FUNDS.REC<FT.DELIVERY.OUTREF>,@VM) + 1
        FOR MSG.NO = 1 TO NO.OF.OUT.MSG
            DELIVERY.ID = FUNDS.REC<FT.DELIVERY.OUTREF,MSG.NO>
            IF DELIVERY.ID THEN
                DELIVERY.REF = FIELD(DELIVERY.ID, "-", 1)
                APPL.ID.LIST = 'DE.O.HEADER'
                REC.ID1 = DELIVERY.REF
                GOSUB T24.OUTPUT.EXTRACTION
                DELIVERY.ID = ''
            END
        NEXT MSG.NO

        CALL PRINTER.ON('P.FUNCTION',0)
        PRINT
        PRINT "==============================================="
        PRINT " TRANSACTION ENTRY DETAILS FOR   ":REC.ID:"    "
        PRINT "==============================================="
        CALL PRINTER.OFF

        SAVE.SCREEN.TITLE = "PRINTING TXN ENTRY DETAILS"
        ENQ = 'TXN.ENTRY'
        ENQ<2,1> = 'TRANSACTION.REF'
        ENQ<3,1> = 'EQ'
        ENQ<4,1> = REC.ID
        ENQ<10,1> = 'OUTPUT'
        CALL ENQUIRY.DISPLAY(ENQ)

        IF FUNDS.REC1 EQ '' THEN
            CALL E.TXN.ENTRY(STMT.LIST)
        END

        TOTAL.STMT.NO = DCOUNT(STMT.LIST,@FM)
        FOR STMT.NO = 1 TO TOTAL.STMT.NO
            STMT.ID.VALUE = STMT.LIST<STMT.NO>
            STMT.ID.COM =  FIELD(STMT.ID.VALUE,'*',2)
            STMT.ID.VALUE = FIELD(STMT.ID.VALUE,'*',1)
            STMT.ID = STMT.ID.VALUE[2,99]

            IF STMT.ID.VALUE[1,1] EQ 'S' THEN
                APPL.ID.LIST = 'STMT.ENTRY'
            END ELSE
                APPL.ID.LIST = 'CATEG.ENTRY'
            END
            REC.ID1 = STMT.ID
            PGM.TYPE1 = 'L'
            DEF.COM = STMT.ID.COM
            GOSUB T24.OUTPUT.EXTRACTION

        NEXT STMT.NO

        PROCESSING.DATE = FUNDS.REC<FT.PROCESSING.DATE>
        PROCESSING.MONTH = PROCESSING.DATE[1,6]
        STMT.NOS = FUNDS.REC<FT.STMT.NOS>

        IF OS.NAME EQ 'WINNT' OR OS.NAME EQ 'WIN95' THEN      ;* Command used in Windows
            EXE.CMD = 'DOS -c ':tafjHome:'\bin\DBTools ':'-s JQL LIST-ITEM F':TRANS.COM.MNE:'.ENTRY.HOLD LIKE ...':REC.ID:'...'
        END ELSE
            EXE.CMD = 'SH -c ':tafjHome:'/bin/DBTools ':'-s JQL LIST-ITEM F':TRANS.COM.MNE:'.ENTRY.HOLD LIKE ...':REC.ID:'...'
        END
        EXECUTE EXE.CMD CAPTURING RESULT

        CALL PRINTER.ON('P.FUNCTION',0)
        PRINT
        PRINT "==============================================="
        PRINT " ENTRY HOLD FOR CORRESPONDING FT "
        PRINT "==============================================="
        PRINT RESULT
        PRINT
        CALL PRINTER.OFF

        APPL.ID.LIST = 'ACCT.ACTIVITY'
        REC.ID1 = DEBIT.ACCOUNT:'-':PROCESSING.MONTH
        PGM.TYPE1 = 'L'
        DEF.COM = DEBIT.COMPANY
        GOSUB T24.OUTPUT.EXTRACTION

        APPL.ID.LIST = 'ACCT.ACTIVITY'
        REC.ID1 = CREDIT.ACCOUNT:'-':PROCESSING.MONTH
        PGM.TYPE1 = 'L'
        DEF.COM = CREDIT.COMPANY
        GOSUB T24.OUTPUT.EXTRACTION

        GOSUB LISTING.DETAILS
    END
    RETURN

*******************
STO.PROCESSING.TAFJ:
*******************
    GOSUB STO.INITIALIZE

    CALL F.READ(FN.STANDING.ORDER,REC.ID,R.STANDING.ORDER,F.STANDING.ORDER,R.R.ERR)

    IF NOT(R.STANDING.ORDER) THEN
        CALL PRINTER.ON('P.FUNCTION',0)
        PRINT
        PRINT "==============================================="
        PRINT "    STO RECORD ":REC.ID:"DOES NOT EXIST        "
        PRINT "==============================================="
        CALL PRINTER.OFF
    END ELSE

        ID.ACCOUNT = FIELD(REC.ID,'.',1)
        TYPE = R.STANDING.ORDER<STO.TYPE>
        SEQ.NO = FIELD(REC.ID,'.',2)

        CPTY.ACCT = R.STANDING.ORDER<STO.CPTY.ACCT.NO>
        TRANS.COMPANY = R.STANDING.ORDER<STO.CO.CODE>
        FREQ = R.STANDING.ORDER<STO.CURRENT.FREQUENCY>
        YEAR1 = FREQ[1,4]
        ACTIVITY.MONTH = FREQ[1,6]
        ACTIVITY.MONTH1 = ACTIVITY.MONTH - 1
		R.TRANS.CO=''
        CALL F.READ(FN.COMPANY,TRANS.COMPANY,R.TRANS.CO,F.COMPANY,ERR2)

        IF R.TRANS.CO<EB.COM.FINANCIAL.MNE> EQ R.TRANS.CO<EB.COM.MNEMONIC> THEN
            TRANS.COM.MNE = R.TRANS.CO<EB.COM.MNEMONIC>
            TRANS.LEAD.COM = R.TRANS.CO<EB.COM.FINANCIAL.COM>
        END ELSE
            TRANS.COM.MNE = R.TRANS.CO<EB.COM.FINANCIAL.MNE>
            TRANS.LEAD.COM = R.TRANS.CO<EB.COM.FINANCIAL.COM>
        END

        APPL.ID.LIST = 'STANDING.ORDER'
        REC.ID1 = REC.ID
        GOSUB T24.OUTPUT.EXTRACTION
		R.STANDING=''
		ERR2=''
        CALL F.READ(FN.STANDING.ORDER,REC.ID,R.STANDING,F.STANDING.ORDER,ERR2)
        SS.REC = ''
        CALL GET.STANDARD.SELECTION.DETS("STANDING.ORDER",SS.REC)

        LAST.FLD.POS = ''
	LAST.FLD.NO = ''
        LOCATE 'FT.VERSION' IN SS.REC<SSL.SYS.FIELD.NAME,1> SETTING LAST.FLD.POS THEN
            LAST.FLD.NO = SS.REC<SSL.SYS.FIELD.NO,LAST.FLD.POS>
        END

        VERSN.ID = R.STANDING<LAST.FLD.NO>

        APPL.ID.LIST = 'VERSION'
        REC.ID1 = VERSN.ID
        GOSUB T24.OUTPUT.EXTRACTION

        TYPE.ID = R.STANDING.ORDER<STO.TYPE>
        APPL.ID.LIST = 'STO.TYPE'
        REC.ID1 = TYPE.ID
        GOSUB T24.OUTPUT.EXTRACTION

        APPL.ID.LIST = 'ACCOUNT'
        REC.ID1 = ID.ACCOUNT
        GOSUB T24.OUTPUT.EXTRACTION
        ID.CO.MNE = R.NEW(AC.CO.CODE)


        APPL.ID.LIST = 'ACCOUNT'
        REC.ID1 = CPTY.ACCT
        GOSUB T24.OUTPUT.EXTRACTION
        CPTY.CO.MNE = R.NEW(AC.CO.CODE)


        APPL.ID.LIST = 'ACCT.ACTIVITY'
        PGM.TYPE1 = 'L'
        DEF.COM = ID.CO.MNE
        REC.ID1 = ID.ACCOUNT:'-': ACTIVITY.MONTH
        GOSUB T24.OUTPUT.EXTRACTION

        APPL.ID.LIST = 'ACCT.ACTIVITY'
        PGM.TYPE1 = 'L'
        DEF.COM = ID.CO.MNE
        REC.ID1 = ID.ACCOUNT:'-':ACTIVITY.MONTH1
        GOSUB T24.OUTPUT.EXTRACTION

        APPL.ID.LIST = 'ACCT.ACTIVITY'
        PGM.TYPE1 = 'L'
        DEF.COM = CPTY.CO.MNE
        REC.ID1 = CPTY.ACCT:'-':ACTIVITY.MONTH
        GOSUB T24.OUTPUT.EXTRACTION

        APPL.ID.LIST = 'ACCT.ACTIVITY'
        PGM.TYPE1 = 'L'
        DEF.COM = CPTY.CO.MNE
        REC.ID1 = CPTY.ACCT:'-':ACTIVITY.MONTH1
        GOSUB T24.OUTPUT.EXTRACTION

        NO.OF.CHG = COUNT(R.STANDING.ORDER<STO.CHARGE.TYPE>,@VM) + 1

        FOR CHG.NO = 1 TO NO.OF.CHG
            CHG.TYPE.ID = R.STANDING.ORDER<STO.CHARGE.TYPE,CHG.NO>
            IF CHG.TYPE.ID THEN
                APPL.ID.LIST = 'FT.CHARGE.TYPE'
                REC.ID1 = CHG.TYPE.ID
                GOSUB T24.OUTPUT.EXTRACTION

                CHG.TYPE.ID = ''
            END
        NEXT CHG.NO

        NO.OF.COMM = COUNT(R.STANDING.ORDER<STO.COMMISSION.TYPE>,@VM) + 1

        FOR COMM.NO = 1 TO NO.OF.COMM
            COMM.TYPE.ID = R.STANDING.ORDER<STO.COMMISSION.TYPE,COMM.NO>
            IF COMM.TYPE.ID THEN
                APPL.ID.LIST = 'FT.COMMISSION.TYPE'
                REC.ID1 = COMM.TYPE.ID
                GOSUB T24.OUTPUT.EXTRACTION

                COMM.TYPE.ID = ''
            END
        NEXT COMM.NO

        STO.ID = "STO-":TYPE:"-":ID.ACCOUNT:"-":SEQ.NO


        SEL.CMD = "SELECT F":TRANS.COM.MNE:".STO.FREQ.DATE WITH @ID LIKE ...":REC.ID:"..."
        CALL EB.READLIST(SEL.CMD, COM.LIST, '', NO.OF.REC, R.ERR)


        CALL PRINTER.ON('P.FUNCTION',0)

        PRINT "==============================================="
        PRINT
        PRINT SEL.CMD
        PRINT COM.LIST
        PRINT "==============================================="


        CALL PRINTER.OFF

        SEL.CMD = "SELECT F":TRANS.COM.MNE:".STANDING.ORDER WITH RETRY.ORIG.ID EQ ":REC.ID
        CALL EB.READLIST(SEL.CMD, COM.LIST, '', NO.OF.REC, R.ERR)
        FOR INS.CNT = 1 TO NO.OF.REC
            APPL.ID.LIST = 'STANDING.ORDER'
            REC.ID1 = COM.LIST<INS.CNT>
            GOSUB T24.OUTPUT.EXTRACTION
        NEXT INS.CNT


        SEL.CMD = "SELECT F":TRANS.COM.MNE:".STANDING.ORDER$HIS WITH RETRY.ORIG.ID EQ ":REC.ID
        CALL EB.READLIST(SEL.CMD, COM.LIST, '', NO.OF.REC, R.ERR)
        FOR INS.CNT = 1 TO NO.OF.REC
            APPL.ID.LIST = 'STANDING.ORDER'
            REC.ID1 = COM.LIST<INS.CNT>
            GOSUB T24.OUTPUT.EXTRACTION
        NEXT INS.CNT


        SEL.CMD = "SELECT F":TRANS.COM.MNE:".FUNDS.TRANSFER WITH INWARD.PAY.TYPE EQ ":STO.ID
        CALL EB.READLIST(SEL.CMD, COM.LIST, '', NO.OF.REC, R.ERR)
        FOR INS.CNT = 1 TO NO.OF.REC
            APPL.ID.LIST = 'FT'
            REC.ID1 = COM.LIST<INS.CNT>
            GOSUB T24.OUTPUT.EXTRACTION
        NEXT INS.CNT
        SEL.CMD = "SELECT F":TRANS.COM.MNE:".FUNDS.TRANSFER$NAU WITH INWARD.PAY.TYPE EQ ":STO.ID
        CALL EB.READLIST(SEL.CMD, COM.LIST, '', NO.OF.REC, R.ERR)
        FOR INS.CNT = 1 TO NO.OF.REC
            APPL.ID.LIST = 'FT'
            REC.ID1 = COM.LIST<INS.CNT>
            GOSUB T24.OUTPUT.EXTRACTION
        NEXT INS.CNT

        OFFICIAL.REGION = R.TRANS.CO<EB.COM.OFFICIAL.HOLIDAY>
        BATCH.REGION = R.TRANS.CO<EB.COM.BATCH.HOLIDAY>
        OFFICIAL.HOLIDAY = OFFICIAL.REGION:YEAR1
        BATCH.HOLIDAY = BATCH.REGION:YEAR1
        APPL.ID.LIST = 'FT.APPL.DEFAULT'
        REC.ID1 = TRANS.LEAD.COM
        GOSUB T24.OUTPUT.EXTRACTION

        APPL.ID.LIST = 'FT.APPL.DEFAULT'
        REC.ID1 = TRANS.COMPANY
        GOSUB T24.OUTPUT.EXTRACTION


        APPL.ID.LIST = 'COMPANY'
        REC.ID1 = TRANS.COMPANY
        GOSUB T24.OUTPUT.EXTRACTION

        APPL.ID.LIST = 'HOLIDAY'
        REC.ID1 = OFFICIAL.HOLIDAY
        GOSUB T24.OUTPUT.EXTRACTION

        IF OFFICIAL.HOLIDAY NE BATCH.HOLIDAY THEN

            APPL.ID.LIST = 'HOLIDAY'
            REC.ID1 = BATCH.HOLIDAY
            GOSUB T24.OUTPUT.EXTRACTION
        END

        GOSUB LISTING.DETAILS
    END
    RETURN

*-----------------------------------------------------------------------------
CHECK.STMT.ENTRY.DETAIL.TAFJ:
*-----------------------------------------------------------------------------
    APPLICATION = 'STMT.ENTRY.DETAIL'
    INPUT.BUFFER = REC.ID
    V$FUNCTION = 'GET.PARAM'
    CALL EB.EXECUTE.APPLICATION(APPLICATION)

    CALL MATRIX.UPDATE

    V$FUNCTION = 'P'          ;* Set it to NULL

    CALL RECORDID.INPUT

    IF E THEN
        ETEXT = E
        ARRAY<-1> = ' ':@FM:' ':@FM:'ERROR - "':E:'" - ':LINE:' L.no ':LINE
        RETURN
    END

    IF DEF.COM THEN
        CALL LOAD.COMPANY(DEF.COM)
    END

    HUSH ON ; CALL RECORD.READ ; HUSH OFF

    IF MESSAGE EQ 'REPEAT' THEN
        ETEXT = 'ERROR'
        ARRAY<-1> = REC.ID:'  - RECORD MISSING IN ':APPLICATION:' FOR GIVEN LINE ':LINE
        RETURN
    END

    CALL MATRIX.ALTER

    GOSUB PRINT.RECORD
    RETURN

*-------------------------------------------------------------
NR.PROCESSING.TAFJ:
*-------------------------------------------------------------
    GOSUB NR.INITIALIZE
    CALL F.READ(FN.ACCOUNT,REC.ID,R.ACCOUNT,F.ACCOUNT,R.R.ERR)

    IF NOT(R.ACCOUNT) THEN
        CALL PRINTER.ON('P.FUNCTION',0)
        PRINT
        PRINT "==============================================="
        PRINT "    ACCOUNT.STATEMENT RECORD ":REC.ID:"DOES NOT EXIST        "
        PRINT "==============================================="
        CALL PRINTER.OFF
    END ELSE

        CALL F.READ(FN.ACCOUNT.STATEMENT,REC.ID,R.ACCOUNT.STMT,F.ACCOUNT.STATEMENT,R.R.ERR)
        DELV.ID = R.ACCOUNT.STMT<AC.STA.DELIVERY.REF>
        MSG.TYPE = R.ACCOUNT.STMT<AC.STA.SWIFT.STMT.TYPE>

        APPL.ID.LIST = 'ACCOUNT.STATEMENT'
        REC.ID1 = REC.ID
        GOSUB T24.OUTPUT.EXTRACTION

        IF MSG.TYPE EQ '' THEN
            MSG.TYPE = '950'
        END
        APPL.ID.LIST = 'ACCOUNT'
        REC.ID1 = REC.ID
        GOSUB T24.OUTPUT.EXTRACTION

        ACCT.COMP.ID = R.ACCOUNT<AC.CO.CODE>
        ACCT.CUST.ID = R.ACCOUNT<AC.CUSTOMER>

        APPL.ID.LIST = 'COMPANY'
        REC.ID1 = ACCT.COMP.ID
        GOSUB T24.OUTPUT.EXTRACTION

        IF ACCT.CUST.ID NE '' THEN
            APPL.ID.LIST = 'CUSTOMER'
            REC.ID1 = ACCT.CUST.ID
            GOSUB T24.OUTPUT.EXTRACTION
        END
        CALL F.READ(FN.AGENCY,ACCT.CUST.ID,R.AGENCY,F.AGENCY,R.R.ERR)
        EXT.REC.ID = R.AGENCY<EB.AG.OUR.EXT.ACCT.NO>

        IF ACCT.CUST.ID NE '' THEN
            APPL.ID.LIST = 'AGENCY'
            REC.ID1 = ACCT.CUST.ID
            GOSUB T24.OUTPUT.EXTRACTION
        END
        APPL.ID.LIST = 'DE.PARM'
        REC.ID1 = 'SYSTEM.STATUS'
        GOSUB T24.OUTPUT.EXTRACTION
		Y.DE.CARRIER.ID='RECS'
        CALL F.READ(FN.DE.CARRIER,Y.DE.CARRIER.ID,R.DE.CARRIER,F.DE.CARRIER,R.R.ERR)

        APPL.ID.LIST = 'DE.CARRIER'
        REC.ID1 = 'RECS'
        GOSUB T24.OUTPUT.EXTRACTION

        INTERFACE.ID = R.DE.CARRIER<DE.CARR.INTERFACE>

        APPL.ID.LIST = 'DE.INTERFACE'
        REC.ID1 = INTERFACE.ID
        GOSUB T24.OUTPUT.EXTRACTION
		R.ACCT.COMP=''
        CALL F.READ(FN.COMPANY,ACCT.COMP.ID,R.ACCT.COMP,F.COMPANY,ERR2)

        IF R.ACCT.COMP<EB.COM.FINANCIAL.MNE> EQ R.ACCT.COMP<EB.COM.MNEMONIC> THEN
            ACCT.COMP.MNE = R.ACCT.COMP<EB.COM.MNEMONIC>
            ACCT.LEAD.COM = R.ACCT.COMP<EB.COM.FINANCIAL.COM>
        END ELSE
            ACCT.COMP.MNE = R.ACCT.COMP<EB.COM.FINANCIAL.MNE>
            ACCT.LEAD.COM = R.ACCT.COMP<EB.COM.FINANCIAL.COM>
        END

        PRD.COMP.SPEC.ID = ACCT.COMP.ID:'.950.ALL'
        PRD.CUST.SPEC.ID = ACCT.COMP.ID:'.C-':ACCT.CUST.ID:'.950.ALL'
        PRD.ACCT.SPEC.ID = ACCT.COMP.ID:'.A-':REC.ID:'.950.ALL'
        PRD.SPEC.ID = ACCT.COMP.ID:'.ALL.ALL'
        ADDR.CUST.SPEC.ID = ACCT.COMP.ID:'.C-':ACCT.CUST.ID:'.RECS'
        ADDR.COMP.SPEC.ID = ACCT.COMP.ID:'.RECS'

        IF OS.NAME EQ 'WINNT' OR OS.NAME EQ 'WIN95' THEN      ;* Command used in Windows
            EXE.CMD<-1> = 'DOS -c ':tafjHome:'\bin\DBTools ':'-s JQL LIST-ITEM F.COMPANY "':ACCT.COMP.ID:'"'
            EXECUTE EXE.CMD CAPTURING PRD1
            EXE.CMD<-1> = 'DOS -c ':tafjHome:'\bin\DBTools ':'-s JQL LIST-ITEM F.DE.PRODUCT EQ ':PRD.COMP.SPEC.ID
            EXECUTE EXE.CMD CAPTURING PRD2
            EXE.CMD<-1> = 'DOS -c ':tafjHome:'\bin\DBTools ':'-s JQL LIST-ITEM F.DE.PRODUCT EQ ':PRD.CUST.SPEC.ID
            EXECUTE EXE.CMD CAPTURING PRD3
            EXE.CMD<-1> = 'DOS -c ':tafjHome:'\bin\DBTools ':'-s JQL LIST-ITEM F.DE.PRODUCT EQ ':PRD.ACCT.SPEC.ID
            EXECUTE EXE.CMD CAPTURING PRD4
            EXE.CMD<-1> = 'DOS -c ':tafjHome:'\bin\DBTools ':'-s JQL LIST-ITEM F.DE.PRODUCT EQ ':PRD.SPEC.ID
            EXECUTE EXE.CMD CAPTURING PRD5
            EXE.CMD<-1> = 'DOS -c ':tafjHome:'\bin\DBTools ':'-s JQL LIST-ITEM F.DE.ADDRESS LIKE ...':ADDR.COMP.SPEC.ID:'...'
            EXECUTE EXE.CMD CAPTURING ADR1
            EXE.CMD<-1> = 'DOS -c ':tafjHome:'\bin\DBTools ':'-s JQL LIST-ITEM F.DE.ADDRESS LIKE ...':ADDR.CUST.SPEC.ID:'...'
            EXECUTE EXE.CMD CAPTURING ADR2

        END ELSE
            EXE.CMD<-1> = 'SH -c ':tafjHome:'/bin/DBTools ':'-s JQL LIST-ITEM F.COMPANY "':ACCT.COMP.ID:'"'
            EXECUTE EXE.CMD CAPTURING PRD1
            EXE.CMD<-1> = 'SH -c ':tafjHome:'/bin/DBTools ':'-s JQL LIST-ITEM F.DE.PRODUCT EQ ':PRD.COMP.SPEC.ID
            EXECUTE EXE.CMD CAPTURING PRD2
            EXE.CMD<-1> = 'SH -c ':tafjHome:'/bin/DBTools ':'-s JQL LIST-ITEM F.DE.PRODUCT EQ ':PRD.CUST.SPEC.ID
            EXECUTE EXE.CMD CAPTURING PRD3
            EXE.CMD<-1> = 'SH -c ':tafjHome:'/bin/DBTools ':'-s JQL LIST-ITEM F.DE.PRODUCT EQ ':PRD.ACCT.SPEC.ID
            EXECUTE EXE.CMD CAPTURING PRD4
            EXE.CMD<-1> = 'SH -c ':tafjHome:'/bin/DBTools ':'-s JQL LIST-ITEM F.DE.PRODUCT EQ ':PRD.SPEC.ID
            EXECUTE EXE.CMD CAPTURING PRD5
            EXE.CMD<-1> = 'SH -c ':tafjHome:'/bin/DBTools ':'-s JQL LIST-ITEM F.DE.ADDRESS LIKE ...':ADDR.COMP.SPEC.ID:'...'
            EXECUTE EXE.CMD CAPTURING ADR1
            EXE.CMD<-1> = 'SH -c ':tafjHome:'/bin/DBTools ':'-s JQL LIST-ITEM F.DE.ADDRESS LIKE ...':ADDR.CUST.SPEC.ID:'...'
            EXECUTE EXE.CMD CAPTURING ADR2

        END

        CALL PRINTER.ON('P.FUNCTION',0)
        PRINT
        PRINT "==============================================="
        PRINT "DE.PRODUCT AND DE.ADDRESS        "
        PRINT "==============================================="
        PRINT ACCT.COMP.ID
        PRINT PRD1
        PRINT PRD.COMP.SPEC.ID
        PRINT PRD2
        PRINT PRD.CUST.SPEC.ID
        PRINT PRD3
        PRINT PRD.ACCT.SPEC.ID
        PRINT PRD4
        PRINT PRD.SPEC.ID
        PRINT PRD5
        PRINT ADDR.COMP.SPEC.ID
        PRINT ADR1
        PRINT ADDR.CUST.SPEC.ID
        PRINT ADR2
        PRINT
        CALL PRINTER.OFF

        FN.BP = "PACS.DATA.OUT"
        F.BP = ""
        CALL OPF(FN.BP,F.BP)

*DE.O.HEADER EXTRACTION IN .CSV
        FN.DE.O.HEADER= 'F.DE.O.HEADER'
        F.DE.O.HEADER = ''
		R.REC=''
		DE.O.ERR=''
        CALL OPF(FN.DE.O.HEADER,F.DE.O.HEADER)

        A = 0; B= 1 ; C = 4 ; D = 5 ; E = 10 ; Z = 11 ; G = 12 ; H = 13 ; I = 17 ; J = 19 ; K = 21 ; L = 25 ; M = 31;W =32 ;O = 33 ;P = 41; Q = 54;
        WRITE.HDR.XL =  '@ID|MESSAGE.TYPE|DISPOSITION|ERROR.CODE|ACCOUNT.NUMBER|CUSTOMER.NUMBER|CUS..COMPANY|COMPANY.CODE|VALUE.DATE|AMOUNT|TRANSACTION.REF|CARRIER.ADDR.NO|MSG.STATUS|MSG.DISPOSITION|MSG.R.ERR.CDE|CARRIER.SEQ.NO|MSG.CLASSIFICATION|'

        DEL.LIST = DELV.ID
        LOOP
            REMOVE DEL.ID FROM DEL.LIST SETTING DEL.POS
        WHILE DEL.ID:DEL.POS

*            READ R.REC FROM F.DE.O.HEADER, DEL.ID THEN
			CALL F.READ(FN.DE.O.HEADER,DEL.ID,R.REC,F.DE.O.HEADER,DE.O.ERR)
			IF R.REC THEN
                WRITE.HDR.XL<-1> = DEL.ID :'|': R.REC<B> :'|': R.REC<C> :'|': R.REC<D> :'|': R.REC<E> :'|': R.REC<Z> :'|': R.REC<G> :'|': R.REC<H> :'|': R.REC<I> :'|': R.REC<J> :'|': R.REC<K> :'|': R.REC<L>:'|': R.REC<M> '|':R.REC<W>:'|':R.REC<O>:'|':R.REC<P>:'|':R.REC<Q>
            END
        REPEAT

        IF WRITE.HDR.XL<2> THEN
            WRITE WRITE.HDR.XL TO F.BP,"DE.O.HEADER-":FIELD(SYSTEM(12),'.',1):'.csv'
            WRITE.HDR.XL = '' ;
            CRT @(-1)
            PRINT @(10,8) : "DE.O.HEADER -EXTRACTION COMPLETED..."
            SLEEP(2)
        END ELSE
            CRT @(-1)
            PRINT @(10,8) : " Warning : DE.O.HEADER-EXTRACTOR Completed. But NO Data available for the given input. "
            SLEEP(2)
        END

*DE.O.HISTORY EXTRACTION IN .CSV
        HIST.LIST = DELV.ID

        LOOP
            REMOVE DEL.ID FROM HIST.LIST SETTING DEL.POS
        WHILE DEL.ID:DEL.POS

            IF OS.NAME EQ 'WINNT' OR OS.NAME EQ 'WIN95' THEN  ;* Command used in Windows
                SEL.CMD = 'DOS -c ':tafjHome:'\bin\DBTools ':'-s JQL LIST-ITEM F.DE.O.HISTORY LIKE ':DEL.ID:'...'
            END ELSE
                SEL.CMD = 'SH -c ':tafjHome:'/bin/DBTools ':'-s JQL LIST-ITEM F.DE.O.HISTORY LIKE ':DEL.ID:'...'
            END

            EXECUTE SEL.CMD CAPTURING OUTPUT
            WRITE.HIS.XL<-1> = DEL.ID :'<----->':OUTPUT
        REPEAT

        IF WRITE.HIS.XL<1> THEN
            WRITE WRITE.HIS.XL TO F.BP,"DE.O.HISTORY-":FIELD(SYSTEM(12),'.',1):'.csv'
            WRITE.HIS.XL = '' ;
            CRT @(-1)
            PRINT @(10,8) : "DE.O.HISTORY -EXTRACTION COMPLETED..."
            SLEEP(2)
        END ELSE
            CRT @(-1)
            PRINT @(10,8) : " Warning : DE.O.HISTORY EXTRACTOR Completed. But NO Data available for the given input. "
            SLEEP(2)
        END

*CONCAT FILE -F.DE.O.MSG<CARRIER/CARRIER.INTERFACE> IN .CSV
        CALL PRINTER.ON('P.FUNCTION',0)
        PRINT
        PRINT "==============================================="
        PRINT "F.DE.O.MSG<CARRIER/INTERFACE>  FOR   ":REC.ID:"    "
        PRINT "==============================================="
        CALL PRINTER.OFF
        IF INTERFACE.ID NE '' THEN
            FN.DE.O.MSG = 'F.DE.O.MSG.':INTERFACE.ID
            F.DE.O.MSG = ''
            CALL OPF(FN.DE.O.MSG,F.DE.O.MSG)
            SEL.CMD = 'SELECT F.DE.O.MSG.':INTERFACE.ID
        END ELSE
            FN.DE.O.MSG = 'F.DE.O.MSG.RECS'
            F.DE.O.MSG = ''
            CALL OPF (FN.DE.O.MSG,F.DE.O.MSG)
            SEL.CMD = 'SELECT F.DE.O.MSG.RECS'
        END

*        EXECUTE SEL.CMD CAPTURING OUTPUT
*        READLIST SEL.LIST  ELSE SEL.LIST = ''
		CALL EB.READLIST(SEL.CMD,SEL.LIST,'',NO.OF.REC,SEL.ERR)
        LOOP
            FINAL.FIND = 0
            REMOVE MSG.ID FROM SEL.LIST SETTING MSG.POS

        WHILE MSG.ID:MSG.POS
            READ R.REC FROM F.DE.O.MSG,  MSG.ID THEN

                FINDSTR REC.ID IN R.REC SETTING F.POS, POS THEN

                    FINDSTR '{2:I950' IN R.REC SETTING F1.POS, POS1 THEN

                        FINAL.FIND=1
                    END

                END

                IF FINAL.FIND EQ '1' THEN
                    WRITE.MSG.XL<-1> = MSG.ID:'--':R.REC
                END
            END
        REPEAT
        IF WRITE.MSG.XL<1> THEN
            WRITE WRITE.MSG.XL TO F.BP,'DE.O.MSG.csv' ON ERROR
                CRT " ERROR ON WRITING ":F.BP
            END
            WRITE.MSG.XL = '' ;
            CRT @(-1)
            PRINT @(10,8) : "DE.O.MSG -EXTRACTION COMPLETED..."
            SLEEP(2)
        END ELSE
            CRT @(-1)
            PRINT @(10,8) : " Warning : DE.O.MSG EXTRACTOR Completed. But NO Data available for the given input. "
            SLEEP(2)
        END

*NT.STATEMENT EXTRACTION IN .CSV
        FN.NR.STATEMENTS= 'F.NR.STATEMENTS'
        F.NR.STATEMENTS = ''
		R.REC=''
		NR.ERR=''
        CALL OPF(FN.NR.STATEMENTS,F.NR.STATEMENTS)

        A = 0; B= 18 ; C = 19 ; D = 5 ; E = 7 ; Z = 8 ; G = 10 ; H = 6 ; I = 9 ; J = 39 ; K = 36 ; L = 24 ; M = 25;
        WRITE.STMT.XL =  '@ID|ACC.OWNER.REF|ACC.INST.REF|OPEN.BAL.IND|OPEN.BAL.AMOUNT|CLOSE.BAL.IND||CLOSE.BAL.AMOUNT|OPEN.BAL.DATE|CLOSE.BAL.DATE|STATEMENT.COMPLETE|ITEMS.GENERATED'

        SEL.CMD = 'SELECT ':FN.NR.STATEMENTS: " WITH ACCOUNT.ID EQ ": REC.ID
*        EXECUTE SEL.CMD CAPTURING SEL.OUT
*        READLIST SEL.LIST ELSE SEL.LIST = ''
		CALL EB.READLIST(SEL.CMD,SEL.LIST,'',NO.OF.REC,SEL.ERR)
        LOOP
            REMOVE STMT.ID FROM SEL.LIST SETTING STMT.POS

        WHILE STMT.ID:STMT.POS

*            READ R.REC FROM F.NR.STATEMENTS, STMT.ID THEN
			CALL F.READ(FN.NR.STATEMENTS,STMT.ID,R.REC,F.NR.STATEMENTS,NR.ERR)
			IF R.REC THEN
                WRITE.STMT.XL<-1> = STMT.ID :'|': R.REC<B> :'|': R.REC<C> :'|': R.REC<D> :'|': R.REC<E> :'|': R.REC<Z> :'|': R.REC<G> :'|': R.REC<H> :'|': R.REC<I> :'|': R.REC<J> :'|': R.REC<K> :'|': R.REC<L>:'|': R.REC<M>
            END
        REPEAT

        IF WRITE.STMT.XL<2> THEN
            WRITE WRITE.STMT.XL TO F.BP,"NR.STATEMENTS-":FIELD(SYSTEM(12),'.',1):'.csv'
            WRITE.STMT.XL = '' ;
            CRT @(-1)
            PRINT @(10,8) : "NR.STATEMENTS EXTRACTION COMPLETED..."
            SLEEP(2)
        END ELSE
            CRT @(-1)
            PRINT @(10,8) : " Warning : EXTRACTOR Completed. But NO Data available for the given input. "
            SLEEP(2)
        END

*NT.ITEMS EXTRACTION IN .CSV
        A = 0; B = 14 ; C = 15 ; D = 1 ; E = 2 ; Z = 5 ; G = 8 ; H = 23 ; I = 3 ; J = 6 ; K = 9 ; L = 12 ; M = 7; W = 24; O = 4; P = 10; Q = 25
        WRITE.ITEM.XL =  '@ID|ACC.OWNER.REF|ACC.INST.REF|STATEMENT.NUMBER|PAGE.NUMBER|ORIGINAL.REF|VALUE.DATE|DATE.MATCHED|STMT.OR.LEDGER|ACCOUNT.CURRENCY|ENTRY.DATE|AMOUNT|MATCHED.TO|ORIGINAL.AMOUNT|MATCHED.ID|DEBIT.OR.CREDIT|UNAUTH.MATCH.ID'
        FN.NR.ITEMS= 'F.NR.ITEMS'
        F.NR.ITEMS = ''
		R.REC=''
		NR2.ERR=''
        CALL OPF(FN.NR.ITEMS,F.NR.ITEMS)

        SEL.CMD = 'SELECT ':FN.NR.ITEMS: ' WITH @ID LIKE ':REC.ID:'...'
*        EXECUTE SEL.CMD CAPTURING SEL.OUT
*        READLIST SEL.LIST ELSE SEL.LIST = ''
		CALL EB.READLIST(SEL.CMD,SEL.LIST,'',NO.OF.REC,SEL.ERR)
        LOOP
            REMOVE ITEM.ID FROM SEL.LIST SETTING ITEM.POS
        WHILE ITEM.ID:ITEM.POS

*            READ R.REC FROM F.NR.ITEMS, ITEM.ID THEN
			CALL F.READ(FN.NR.ITEMS,ITEM.ID,R.REC,F.NR.ITEMS,NR2.ERR)
			IF R.REC THEN
                WRITE.ITEM.XL<-1> = ITEM.ID :'|': R.REC<B> :'|': R.REC<C> :'|': R.REC<D> :'|': R.REC<E> :'|': R.REC<Z> :'|': R.REC<G> :'|': R.REC<H> :'|': R.REC<I> :'|': R.REC<J> :'|': R.REC<K> :'|': R.REC<L>:'|': R.REC<M>:'|':R.REC<W>:'|':R.REC<O>:'|':R.REC<P>:'|':R.REC<Q>
            END
        REPEAT

        IF WRITE.ITEM.XL<2> THEN
            WRITE WRITE.ITEM.XL TO F.BP,"NR.ITEMS-":FIELD(SYSTEM(12),'.',1):'.csv'
            WRITE.ITEM.XL = '' ;
            CRT @(-1)
            PRINT @(10,8) : "NR-ITEMS EXTRACTION COMPLETED..."
            SLEEP(2)
        END ELSE
            CRT @(-1)
            PRINT @(10,8) : " Warning : EXTRACTOR Completed. But NO Data available for the given input. "
            SLEEP(2)
        END

*NR.INDEX
        IF OS.NAME EQ 'WINNT' OR OS.NAME EQ 'WIN95' THEN      ;* Command used in Windows
            EXE.CMD<-1> = 'DOS -c ':tafjHome:'\bin\DBTools ':'-s JQL LIST-ITEM F':ACCT.COMP.MNE:'.NR.INDEX WITH @ID  LIKE ':REC.ID:'...'
        END ELSE
            EXE.CMD<-1> = 'SH -c ':tafjHome:'/bin/DBTools ':'-s JQL LIST-ITEM F':ACCT.COMP.MNE:'.NR.INDEX WITH @ID  LIKE ':REC.ID:'...'
        END
        EXECUTE EXE.CMD CAPTURING NR_INDEX

        CALL PRINTER.ON('P.FUNCTION',0)
        PRINT
        PRINT "==============================================="
        PRINT "NR_INDEX           "
        PRINT "==============================================="
        PRINT NR_INDEX
        PRINT
        CALL PRINTER.OFF

*CONCAT FILE -F.NR.STMT.INDEX IN .CSV
        IF OS.NAME EQ 'WINNT' OR OS.NAME EQ 'WIN95' THEN      ;* Command used in Windows
            EXE.CMD<-1> = 'DOS -c ':tafjHome:'\bin\DBTools ':'-s JQL LIST-ITEM F':ACCT.COMP.MNE:'.NR.STMT.INDEX WITH @ID  LIKE ':REC.ID:'...'
        END ELSE
            EXE.CMD<-1> = 'SH -c ':tafjHome:'/bin/DBTools ':'-s JQL LIST-ITEM F':ACCT.COMP.MNE:'.NR.STMT.INDEX WITH @ID  LIKE ':REC.ID:'...'
        END
        EXECUTE EXE.CMD CAPTURING STMT_INDEX

        CALL PRINTER.ON('P.FUNCTION',0)
        PRINT
        PRINT "==============================================="
        PRINT " NR_STMT_INDEX "
        PRINT "==============================================="
        PRINT STMT_INDEX
        PRINT
        CALL PRINTER.OFF

*ENQUIRY -  NR.TOT.SUMMARY
        CALL PRINTER.ON('P.FUNCTION',0)
        PRINT
        PRINT "==============================================="
        PRINT " NR.TOT.SUMMARY DETAILS FOR   ":REC.ID:"    "
        PRINT "==============================================="
        CALL PRINTER.OFF

        SAVE.SCREEN.TITLE = "PRINTING NR.TOT.SUMMARY DETAILS"
        ENQ = 'NR.TOT.SUMMARY'
        ENQ<2,1> = 'NR.ITEM'
        ENQ<3,1> = 'EQ'
        ENQ<4,1> = REC.ID
        CALL E.MB.BUILD.NR.ACCT.NO(ENQ)
        ENQ<10,1> = 'OUTPUT'
        CALL ENQUIRY.DISPLAY(ENQ)
    END

*ENQUIRY - NR.ITEM.LEDGER
    CALL PRINTER.ON('P.FUNCTION',0)
    PRINT
    PRINT "==============================================="
    PRINT " NR.ITEM.LEDGER DETAILS FOR   ":REC.ID:"    "
    PRINT "==============================================="
    CALL PRINTER.OFF

    SAVE.SCREEN.TITLE = "PRINTING NR.ITEM.LEDGER DETAILS"
    ENQ = 'NR.ITEMS.LEDGER'
    ENQ<2,1> = 'NR.ITEM'
    ENQ<3,1> = 'EQ'
    ENQ<4,1> = REC.ID
    CALL E.MB.BUILD.NR.ACCT.NO(ENQ)
    ENQ<10,1> = 'OUTPUT'
    CALL ENQUIRY.DISPLAY(ENQ)

*ENQUIRY - NR.ITEM.STATEMENT
    CALL PRINTER.ON('P.FUNCTION',0)
    PRINT
    PRINT "==============================================="
    PRINT " NR.ITEM.STATEMENT DETAILS FOR   ":REC.ID:"    "
    PRINT "==============================================="
    CALL PRINTER.OFF

    SAVE.SCREEN.TITLE = "PRINTING NR.ITEM.STATEMENT DETAILS"
    ENQ = 'NR.ITEMS.STATEMENT'
    ENQ<2,1> = 'NR.ITEM'
    ENQ<3,1> = 'EQ'
    ENQ<4,1> = REC.ID
    CALL E.MB.BUILD.NR.ACCT.NO(ENQ)
    ENQ<10,1> = 'OUTPUT'
    CALL ENQUIRY.DISPLAY(ENQ)

*ENQUIRY - NR.MATCHED.ITEMS
    CALL PRINTER.ON('P.FUNCTION',0)
    PRINT
    PRINT "==============================================="
    PRINT " NR.MATCHED.ITEMS DETAILS FOR   ":REC.ID:"    "
    PRINT "==============================================="
    CALL PRINTER.OFF

    SAVE.SCREEN.TITLE = "PRINTING NR.MATCHED.ITEMS DETAILS"
    ENQ = 'NR.MATCHED.ITEMS'
    ENQ<2,1> = 'NR.ITEM'
    ENQ<3,1> = 'EQ'
    ENQ<4,1> = REC.ID
    CALL E.MB.BUILD.NR.ACCT.NO(ENQ)
    ENQ<10,1> = 'OUTPUT'
    CALL ENQUIRY.DISPLAY(ENQ)

*ENQUIRY - NR.STMT.TOTALS
    CALL PRINTER.ON('P.FUNCTION',0)
    PRINT
    PRINT "==============================================="
    PRINT " NR.STMT.TOTALS DETAILS FOR   ":REC.ID:"    "
    PRINT "==============================================="
    CALL PRINTER.OFF

    SAVE.SCREEN.TITLE = "PRINTING NR.STMT.TOTALS DETAILS"
    ENQ = 'NR.STMT.TOTALS'
    ENQ<2,1> = 'NR.STMT'
    ENQ<3,1> = 'EQ'
    ENQ<4,1> = REC.ID
    CALL E.MB.BUILD.NR.ACCT.NO(ENQ)
    ENQ<10,1> = 'OUTPUT'
    CALL ENQUIRY.DISPLAY(ENQ)
    RETURN
    RETURN
END   ;*ADDED
