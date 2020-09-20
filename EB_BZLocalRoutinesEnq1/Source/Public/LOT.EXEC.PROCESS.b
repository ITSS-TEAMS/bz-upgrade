*-----------------------------------------------------------------------------
* <Rating>55502</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
SUBROUTINE LOT.EXEC.PROCESS
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3

*---------------------------------------------------------------------
*
* This program is called to process the treatment of files remitted by
* customers to the bank in order to make or require payments on his
* behalf.
*
* It firstly validates the file. Any problem with the header is
* reported and the process skips it.
*
* Any broken previous treatment is reprocessed prior to any new file
* extraction from the load library.
*
*
*---- Revision History ------------------------------------------------
*
* 03/11/2005 : First design by Edgard PIGNON
*
* 11/05/2006 : Consider last detail line even without remit trailer.
*
* $INSERT I_EQUATE - Not Used anymore;g with detail records containing several annexes.
*
* $INSERT I_F.AC.CHARGE.REQUEST - Not Used anymore;gly indexed string locate.
*
* 07/07/2006 : Allows process of different files with same calc key.
*
* $INSERT I_F.BZ.COFFRE.LOYER - Not Used anymore;US.CODE with AFFECT.WHOLE.FILE = 'NO'.
*
* 02/08/2006 : Allows use of same EN code with different OP positions.
*
* 03/08/2006 : Record file info in the correct multi-value of LOT.LOG
*
* 04/08/2006 : Record more than one same type annex for one operation.
*
* 10/08/2006 : Old program LOT.BUILD.PROCESS transformed into a routine
*              allowing a post treatment of the file depending on table
*       EB.SystemTables.getVFunction().LOG.LEVEL
*
* 28/08/2006 : Prevent valFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatust on the nostro entry whenever
*             FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusTOMERS is set to 'Y'
*
* 17/09/2006 : Record the processing of a file in the log even if no
*              problem had been found on it.
*
* 29/09/2006 : Allows to kept the operation code position even if no new
*              remit header is following a trailer.
*
* 04/10/2006 : PROCESS.LEVEL of the file updated during the treatment.
*
* 06/11/2006 - Allows the use of '0' as PENDING.DAYS
*
* 10/11/2006 - Aknowledgement of VAL status as result of a 'SNP' call.
*
* 13/11/2006 - Indication of a missing file header record in LOT.FILES.
*
* 29/11/2006 - Considers the new definition of I_LOTDET and LOT.PROCESS.
*
* 10/01/2007 - Allows fees for non financial record
*
* 01/04/2007 - Considers all overrides issued by calling EB.ACCOUNTING.
*
* 16/04/2007 - Allows a variable number of annex for each given line.
*
* 07/05/2007 - Prevents an IN.REASON.OVE field to get dynamic.
*
* 16/05/2EB.DataAccess.Opf - Allows API update of DET.VALUE.DATE and PROCESSING.DATE.
*
* 16/0EB.DataAccess.Opf007 - Store of LOT.FILES and restore of LOT.WORK for recovery.
*
* 17/06/2007 - Recovery keeping the file name and all remaining remits.
*
* 08/10/2007 - No EB.SystemTables.getRNew()mFT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRef remit detail line if skipped.
*
* 09/10/2EB.DataAccess.FReadIncrement LOT.LOG MV even for an unrecognized file type.
*
* 27/10/2007 - Remove any reference to SIT.LOCAL.CLEARING.PARAMETER.
*
* 14/01/2008 - Reset the STMEB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyerlock the account if 'DEL'
*              is used as EB.ACCOUNTING argument to clean up VAL entry.
*
* 29/01/2EB.SystemTables.setE()*-----------------------------------------------------------------------------
* <Rating>55502</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
SUBROUTINE LOT.EXEC.PROCESS
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3

*---------------------------------------------------------------------
*
* This program is called to process the treatment of files remitted by
* customers to the bank in order to make or require payments on his
* behalf.
*
* It firstly validates the file. Any problem with the header is
* reported and the process skips it.
*
* Any broken previous treatment is reprocessed prior to any new file
* extraction from the load library.
*
*
*---- Revision History ------------------------------------------------
*
* 03/11/2005 : First design by Edgard PIGNON
*
* 11/05/2006 : Consider last detail line even without remit trailer.
*
* 27/06/2006 : Coping with detail records containing several annexes.
*
* 05/07/2006 : Correction of wrongly indexed string locate.
*
* 07/07/2006 : Allows process of different files with same calc key.
*
* 20/07/2006 : Allows line STATUS.CODE with AFFECT.WHOLE.FILE = 'NO'.
*
* 02/08/2006 : Allows use of same EN code with different OP positions.
*
* 03/08/2006 : Record file info in the correct multi-value of LOT.LOG
*
* 04/08/2006 : Record more than one same type annex for one operation.
*
* 10/08/2006 : Old program LOT.BUILD.PROCESS transformed into a routine
*              allowing a post treatment of the file depending on table
*              LOT.LOG.LEVEL
*
* 28/08/2006 : Prevent value date adjustment on the nostro entry whenever
*              LOT.ONLY.FOR.CUSTOMERS is set to 'Y'
*
* 17/09/2006 : Record the processing of a file in the log even if no
*              problem had been found on it.
*
* 29/09/2006 : Allows to kept the operation code position even if no new
*              remit header is following a trailer.
*
* 04/10/2006 : PROCESS.LEVEL of the file updated during the treatment.
*
* 06/11/2006 - Allows the use of '0' as PENDING.DAYS
*
* 10/11/2006 - Aknowledgement of VAL status as result of a 'SNP' call.
*
* 13/11/2006 - Indication of a missing file header record in LOT.FILES.
*
* 29/11/2006 - Considers the new definition of I_LOTDET and LOT.PROCESS.
*
* 10/01/2007 - Allows fees for non financial record
*
* 01/04/2007 - Considers all overrides issued by calling EB.ACCOUNTING.
*
* 16/04/2007 - Allows a variable number of annex for each given line.
*
* 07/05/2007 - Prevents an IN.REASON.OVE field to get dynamic.
*
* 16/05/2007 - Allows API update of DET.VALUE.DATE and PROCESSING.DATE.
*
* 16/06/2007 - Store of LOT.FILES and restore of LOT.WORK for recovery.
*
* 17/06/2007 - Recovery keeping the file name and all remaining remits.
*
* 08/10/2007 - No treatment of the last remit detail line if skipped.
*
* 09/10/2007 - Increment LOT.LOG MV even for an unrecognized file type.
*
* 27/10/2007 - Remove any reference to SIT.LOCAL.CLEARING.PARAMETER.
*
* 14/01/2008 - Reset the STMT.NOS field and unlock the account if 'DEL'
*              is used as EB.ACCOUNTING argument to clean up VAL entry.
*
* 29/01/2008 - Add the possibility of issuing a FT for a global payment
*              that EB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyerACCOUEB.SystemTables.getIdNew()LOT.PROCESS.TYPE "SFT"
*              or LOT.GLOBAL.ACCOUNTING = 'FT'.
*
* 05/02/2008 -EB.DataAccess.FWrite a remit during its process by setting the switch
*              DROP.TREATMENT to 'Y' in a load routine.
*
* 20/05/EB.SystemTables.setAf()*-----------------------------------------------------------------------------
* <Rating>55502</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
SUBROUTINE LOT.EXEC.PROCESS
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3

*---------------------------------------------------------------------
*
* This program is called to process the treatment of files remitted by
* customers to the bank in order to make or require payments on his
* behalf.
*
* It firstly validates the file. Any problem with the header is
* reported and the process skips it.
*
* Any broken previous treatment is reprocessed prior to any new file
* extraction from the load library.
*
*
*---- Revision History ------------------------------------------------
*
* 03/11/2005 : First design by Edgard PIGNON
*
* 11/05/2006 : Consider last detail line even without remit trailer.
*
* 27/06/2006 : Coping with detail records containing several annexes.
*
* 05/07/2006 : Correction of wrongly indexed string locate.
*
* 07/07/2006 : Allows process of different files with same calc key.
*
* 20/07/2006 : Allows line STATUS.CODE with AFFECT.WHOLE.FILE = 'NO'.
*
* 02/08/2006 : Allows use of same EN code with different OP positions.
*
* 03/08/2006 : Record file info in the correct multi-value of LOT.LOG
*
* 04/08/2006 : Record more than one same type annex for one operation.
*
* 10/08/2006 : Old program LOT.BUILD.PROCESS transformed into a routine
*              allowing a post treatment of the file depending on table
*              LOT.LOG.LEVEL
*
* 28/08/2006 : Prevent value date adjustment on the nostro entry whenever
*              LOT.ONLY.FOR.CUSTOMERS is set to 'Y'
*
* 17/09/2006 : Record the processing of a file in the log even if no
*              problem had been found on it.
*
* 29/09/2006 : Allows to kept the operation code position even if no new
*              remit header is following a trailer.
*
* 04/10/2006 : PROCESS.LEVEL of the file updated during the treatment.
*
* 06/11/2006 - Allows the use of '0' as PENDING.DAYS
*
* 10/11/2006 - Aknowledgement of VAL status as result of a 'SNP' call.
*
* 13/11/2006 - Indication of a missing file header record in LOT.FILES.
*
* 29/11/2006 - Considers the new definition of I_LOTDET and LOT.PROCESS.
*
* 10/01/2007 - Allows fees for non financial record
*
* 01/04/2007 - Considers all overrides issued by calling EB.ACCOUNTING.
*
* 16/04/2007 - Allows a variable number of annex for each given line.
*
* 07/05/2007 - Prevents an IN.REASON.OVE field to get dynamic.
*
* 16/05/2007 - Allows API update of DET.VALUE.DATE and PROCESSING.DATE.
*
* 16/06/2007 - Store of LOT.FILES and restore of LOT.WORK for recovery.
*
* 17/06/2007 - Recovery keeping the file name and all remaining remits.
*
* 08/10/2007 - No treatment of the last remit detail line if skipped.
*
* 09/10/2007 - Increment LOT.LOG MV even for an unrecognized file type.
*
* 27/10/2007 - Remove any reference to SIT.LOCAL.CLEARING.PARAMETER.
*
* 14/01/2008 - Reset the STMT.NOS field and unlock the account if 'DEL'
*              is used as EB.ACCOUNTING argument to clean up VAL entry.
*
* 29/01/2008 - Add the possibility of issuing a FT for a global payment
*              that was blocked on EB.ACCOUNTING LOT.PROCESS.TYPE "SFT"
*              or LOT.GLOBAL.ACCOUNTING = 'FT'.
*
* 05/02/2008 - Cancel a remit during its process by setting the switch
*              DROP.TREATMENT to 'Y' in a load routine.
*
* 20/05/200FT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefTHEA to any file recognition check.
*
* 23/EB.SystemTables.setE()*-----------------------------------------------------------------------------
* <Rating>55502</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
SUBROUTINE LOT.EXEC.PROCESS
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3

*---------------------------------------------------------------------
*
* This program is called to process the treatment of files remitted by
* customers to the bank in order to make or require payments on his
* behalf.
*
* It firstly validates the file. Any problem with the header is
* reported and the process skips it.
*
* Any broken previous treatment is reprocessed prior to any new file
* extraction from the load library.
*
*
*---- Revision History ------------------------------------------------
*
* 03/11/2005 : First design by Edgard PIGNON
*
* 11/05/2006 : Consider last detail line even without remit trailer.
*
* 27/06/2006 : Coping with detail records containing several annexes.
*
* 05/07/2006 : Correction of wrongly indexed string locate.
*
* 07/07/2006 : Allows process of different files with same calc key.
*
* 20/07/2006 : Allows line STATUS.CODE with AFFECT.WHOLE.FILE = 'NO'.
*
* 02/08/2006 : Allows use of same EN code with different OP positions.
*
* 03/08/2006 : Record file info in the correct multi-value of LOT.LOG
*
* 04/08/2006 : Record more than one same type annex for one operation.
*
* 10/08/2006 : Old program LOT.BUILD.PROCESS transformed into a routine
*              allowing a post treatment of the file depending on table
*              LOT.LOG.LEVEL
*
* 28/08/2006 : Prevent value date adjustment on the nostro entry whenever
*              LOT.ONLY.FOR.CUSTOMERS is set to 'Y'
*
* 17/09/2006 : Record the processing of a file in the log even if no
*              problem had been found on it.
*
* 29/09/2006 : Allows to kept the operation code position even if no new
*              remit header is following a trailer.
*
* 04/10/2006 : PROCESS.LEVEL of the file updated during the treatment.
*
* 06/11/2006 - Allows the use of '0' as PENDING.DAYS
*
* 10/11/2006 - Aknowledgement of VAL status as result of a 'SNP' call.
*
* 13/11/2006 - Indication of a missing file header record in LOT.FILES.
*
* 29/11/2006 - Considers the new definition of I_LOTDET and LOT.PROCESS.
*
* 10/01/2007 - Allows fees for non financial record
*
* 01/04/2007 - Considers all overrides issued by calling EB.ACCOUNTING.
*
* 16/04/2007 - Allows a variable number of annex for each given line.
*
* 07/05/2007 - Prevents an IN.REASON.OVE field to get dynamic.
*
* 16/05/2007 - Allows API update of DET.VALUE.DATE and PROCESSING.DATE.
*
* 16/06/2007 - Store of LOT.FILES and restore of LOT.WORK for recovery.
*
* 17/06/2007 - Recovery keeping the file name and all remaining remits.
*
* 08/10/2007 - No treatment of the last remit detail line if skipped.
*
* 09/10/2007 - Increment LOT.LOG MV even for an unrecognized file type.
*
* 27/10/2007 - Remove any reference to SIT.LOCAL.CLEARING.PARAMETER.
*
* 14/01/2008 - Reset the STMT.NOS field and unlock the account if 'DEL'
*              is used as EB.ACCOUNTING argument to clean up VAL entry.
*
* 29/01/2008 - Add the possibility of issuing a FT for a global payment
*              that was blocked on EB.ACCOUNTING LOT.PROCESS.TYPE "SFT"
*              or LOT.GLOBAL.ACCOUNTING = 'FT'.
*
* 05/02/2008 - Cancel a remit during its process by setting the switch
*              DROP.TREATMENT to 'Y' in a load routine.
*
* 20/05/2008 - Adjust I_LOTHEA to any file recognition check.
*
* 23/05/2008 - Reporting of a duplicate file on the next MV of LOT.LOG.
*
* 19/02/2009 - Allow global accounting cross val routines in any case.
*
* 14/05/2009 - Allow process of a file / remit  without any header.
*
* 08/06/2009 - If the OS is Unix, strip off any Windows crlf chars that might have
*              been uploaded from Windows (through TIB, for example) Ref: VU/20090608
*
* 09/06/2009 - Modification of SELECT statement with LIKE condition for improved
*              performance (Ref: VU/20090609)
*
* 22/06/2009 - Allowing the process of another file with the same header by setting
*              the first local ref of EB.ERROR records EB-LOT.ALREADY.PROCESSED.REM
*              and EB-LOT.ALREADY.PROCESSED.FILE to '1'(warning) or '0'(no report).
*
* 20/04/2010 - To avoid the shortcut of a file with a mod 1024 length.
*ZIT-UPG-R13-R19 : Arithmetic operators converted to operands.
*                : Converted CONVERT to CHANGE and FM,VM,SM to @FM,@VM,@SM.
*                : Converted !HUSHIT to HUSHIT & Assigned variable for DCOUNT for FOR loop.
*                : Commented JOURNAL.UPDATE & Converted EXECUTE to F.DELETE.
*-------------------------------------------------------------------------------------

    $INSERT  I_COMMON
    $INSERT  I_ENQUIRY.COMMON
    $INSERT  I_EQUATE
    $INSERT  I_F.SPF
    $INSERT  I_F.DATES
    $INSERT  I_F.COMPANY
    $INSERT  I_F.USER
    $INSERT  I_F.FUNDS.TRANSFER
    $INSERT  I_F.ACCOUNT.CLASS
    $INSERT  I_F.LOT.LOG.LEVEL
    $INSERT  I_F.LOT.PARAMETER
    $INSERT  I_F.LOT.STATUS.CODE
    $INSERT  I_F.LOT.DESTINATION
    $INSERT  I_F.LOT.CONTRACT
    $INSERT  I_F.LOT.PROCESS
    $INSERT  I_F.LOT.LOG
    $INSERT  I_F.LOT.FILES
    $INSERT  I_F.LOT.WORK
    $INSERT  I_F.LOT.PENDING
    $INSERT  I_F.CFONB.LAYOUT
    $INSERT  I_F.CFONB.FIELDS
    $INSERT  I_F.ACCOUNT
    $INSERT  I_F.CUSTOMER
    $INSERT  I_F.DEPT.ACCT.OFFICER
    $INSERT  I_F.FT.TXN.TYPE.CONDITION
    $INSERT  I_F.FT.GROUP.CONDITION
    $INSERT  I_F.CUSTOMER.CHARGE
    $INSERT  I_OVE.COMMON

* Contains the fields used for the accounting, delivery, dates check, fees calculation, ...

    $INSERT  I_SITCOM
    $INSERT  I_SITOVA
*$INSERT I_SITPAR ;* EPI 27 10 2007
    $INSERT  I_SITCHQ
    $INSERT  I_SITRIB
    $INSERT  I_LOTFMT
    $INSERT  I_LOTDEF
    $INSERT  I_LOTLAY
    $INSERT  I_LOTDET
    $INSERT  I_LOTHEA
    $INSERT  I_LOTSTA
    $INSERT  I_LOTCNT
    $INSERT  I_LOTDST
    $INSERT  I_LOTVAR
    $INSERT  I_LOTDIR
    $INSERT  I_LOTPAR
    $INSERT  I_LOTERR
    $INSERT  I_LOTLOC
    $INSERT  I_LOTFIL
    $INSERT  I_LOTWORK

* Equate the fields of LOT.PROCESS to generic ones for include I_SIT.ACCOUNTING

    $INSERT  I_SIT.ACCOUNTING.FIELDS
    $INSERT  I_SIT.ACCOUNTING.LOT.PROCESS

    APPLICATION = 'LOT.PROCESS'
    V = LOT.PRO.AUDIT.DATE.TIME        ; * To simulate the template of LOT.PROCESS for GLOBAL.ACCOUNTING

    TEXT = '' ; ETEXT = '' ; SW.COMMIT = ''
    SW.UNKNOWN.MESSAGE = ''
    ACT.LAYOUT.ID = ''
    LAST.LAYOUT.ID = ''
    LAST.REMIT.LAYOUT.ID = ''

    SW.RECOVERY = '' ; LOG.JUMP = ''
    LOG.MESSAGE = '' ; LOG.LEVEL = '' ; WORST.LEVEL = ''
    PINTAPE = '' ; PINTAPE.PREV = '' ; IN.FILE.ID.PREV = ''

    GOSUB INITIALISE
    IF LOG.MESSAGE THEN
        LOG.LEVEL = '2' ; GOSUB UPDATE.LOG.FILE
        IF RUNNING.UNDER.BATCH ELSE CALL JOURNAL.UPDATE(JNL.ID)
        RETURN
    END

    DEF.VAL.RTN = '' ; DEF.NB.VAL.RTN = 0
    Y.DCNT = DCOUNT(R.LOT.PARAMETER<LOT.PAR.VALIDATION.RTN>,@VM)
    FOR ILD = 1 TO  Y.DCNT
        RTN.ID = TRIM(FIELD(R.LOT.PARAMETER<LOT.PAR.VALIDATION.RTN,ILD>,"@",2))
        IF RTN.ID THEN
            DEF.NB.VAL.RTN += 1
            DEF.VAL.RTN<1,DEF.NB.VAL.RTN> = RTN.ID
        END
    NEXT ILD

*     Take over the matured remit from the SIT.INWARD.CLEARING.PENDING file

* EPI 06/11/2006 <
*     IF PENDING.DATE AND LOAD.PENDING <> 'NO' THEN
    IF LOAD.PENDING NE 'NO' THEN
        PSTATEMENT = "SELECT ":LOT.PENDING.FILE
        IF PENDING.DATE THEN PSTATEMENT := " WITH @ID LE ":PENDING.DATE:" OR BLOCK.STATUS EQ 'E'"
* EPI 06/11/2006 >
        PENDING.LIST = '' ; PINTAPE = ''
        CALL EB.READLIST(PSTATEMENT,PENDING.LIST,'','','')
        IF PENDING.LIST THEN
            SW.PENDING.USED = 'Y'
            LAST.LAYOUT.ID = '' ; LAST.SUBCODE = '' ; LAST.REMIT.LAYOUT.ID = ''
            LOOP
                REMOVE YR.LOT.PENDING.ID FROM PENDING.LIST SETTING POINT0
            WHILE YR.LOT.PENDING.ID:POINT0
                MIN.LOADING.DATE = YR.LOT.PENDING.ID
                GOSUB READ.LOT.PENDING.FILE
                R.SICP = R.LOT.PENDING
                R.SICP.NON.TREATED = ''
                NB.FILE.PENDING = DCOUNT(R.SICP<LOT.ICP.FILE.ID>,@VM)
                FOR IHU = 1 TO NB.FILE.PENDING
                    SW.UNKNOWN.MESSAGE = ''
                    YR.LOT.FILES.ID = R.SICP<LOT.ICP.FILE.ID,IHU>
                    R.LOT.FILES = '' ; ER = ''
                    CALL F.READ(LOT.FILES.FILE,YR.LOT.FILES.ID,R.LOT.FILES,F.LOT.FILES,ER)
                    IF NOT(ER) THEN
                        LOT.LOCAL.FIELDS = ''
                        Y.SI.CNT = DCOUNT(R.SICP<LOT.ICP.REMIT.NUM,IHU>,@SM)
                        FOR IJJ = 1 TO  Y.SI.CNT
                            Y.REMIT.NUM = R.SICP<LOT.ICP.REMIT.NUM,IHU,IJJ>
                            BLOCK.STATUS = R.SICP<LOT.ICP.BLOCK.STATUS,IHU,IJJ>
                            IF BLOCK.STATUS EQ 'Y' OR (BLOCK.STATUS EQ '' AND YR.LOT.PENDING.ID GT PENDING.DATE) THEN

                                GOSUB KEEP.REMIT.IN.PENDING
                            END ELSE
                                IF R.LOT.FILES<LOT.FIL.REM.STMT.NOS,Y.REMIT.NUM> NE '' AND NUM(R.LOT.FILES<LOT.FIL.REM.STMT.NOS,Y.REMIT.NUM,1>[1,1]) ELSE
                               
*                             To avoid a double treatment of an already processed remit
                               
                                    N.PROCESS.DATE = R.LOT.FILES<LOT.FIL.PROCESS.DATE>
                                    IF R.LOT.FILES<LOT.FIL.FILE.NAME> THEN
                                        PINTAPE = R.LOT.FILES<LOT.FIL.FILE.NAME>
                                    END ELSE PINTAPE = ''
                              
                                    LOT.CONTRACT.ID = R.LOT.FILES<LOT.FIL.CONTRACT.ID>
                                    R.LOT.CONTRACT = '' ; ER = ''
                                    IF LOT.CONTRACT.ID THEN
                                        CALL F.READ(LOT.CONTRACT.FILE,LOT.CONTRACT.ID,R.LOT.CONTRACT,F.LOT.CONTRACT,ER)
                                    END
                                    LOT.DETAIL.ID = R.LOT.FILES<LOT.FIL.LOT.DETAIL.ID,Y.REMIT.NUM>
                                    R.LOT.WORK = '' ; ER = ''
                                    CALL F.READ(LOT.WORK.FILE,LOT.DETAIL.ID,R.LOT.WORK,F.LOT.WORK,ER)

                                    IF R.LOT.WORK EQ '' THEN GOSUB KEEP.REMIT.IN.PENDING ; CONTINUE

                                    ACT.LAYOUT.ID = R.LOT.FILES<LOT.FIL.CFONB.LAYOUT,Y.REMIT.NUM>
                                    GOSUB READ.DATA.LAYOUT

                                    IF R.LOT.WORK<LOT.WRK.GLOBAL.ACCOUNTING> THEN
                                        LOT.GLOBAL.ACCOUNTING = R.LOT.WORK<LOT.WRK.GLOBAL.ACCOUNTING>
                                    END
                                    IF R.LOT.WORK<LOT.WRK.PROCESS.TYPE> THEN
                                        LOT.PROCESS.TYPE = R.LOT.WORK<LOT.WRK.PROCESS.TYPE>
                                    END
                                    IF R.LOT.WORK<LOT.WRK.ONE.BY.ONE.PROCESS> THEN
                                        LOT.ONE.BY.ONE.PROCESS =  R.LOT.WORK<LOT.WRK.ONE.BY.ONE.PROCESS>
                                    END

                                    COUNTER.FOR.COMMITMENT = R.LOT.FILES<LOT.FIL.FOUND.NB.OF.REC,Y.REMIT.NUM>
                                    TOTAL.FOR.COMMITMENT = ABS(R.LOT.FILES<LOT.FIL.FOUND.AMOUNT,Y.REMIT.NUM>+0)

*                             Make here the global entries in case of global accounting

                                    IF SW.UNKNOWN.MESSAGE EQ 'Y' THEN GOSUB KEEP.REMIT.IN.PENDING ; CONTINUE

                                    GOSUB POST.REMIT.GLOBAL.ENTRY
                                    IF E THEN
                                        R.LOT.FILES<LOT.FIL.REM.COMMENT,Y.REMIT.NUM> = E
                                        R.LOT.WORK<LOT.WRK.IN.REASON.OVE> = E
                                    END
                                    R.LOT.WORK<LOT.WRK.GLOBAL.ACCOUNTING> = LOT.GLOBAL.ACCOUNTING
                                    IF LOT.GLOBAL.ACCOUNTING NE 'Y' THEN MAT R.NEW = ''
                                    CALL Y.LOT.PROCESS.FROM.WORK('GEN',N.ERR)
                                    CALL F.WRITE(LOT.FILES.FILE,YR.LOT.FILES.ID,R.LOT.FILES)
                                END
                            END
                        NEXT IJJ
                    END
                NEXT IHU
                IF R.SICP.NON.TREATED<LOT.ICP.FILE.ID> NE '' THEN

                    CALL F.WRITE(LOT.PENDING.FILE,YR.LOT.PENDING.ID,R.SICP.NON.TREATED)
                END ELSE
                    CALL F.DELETE(LOT.PENDING.FILE,YR.LOT.PENDING.ID)
                END
                IF RUNNING.UNDER.BATCH ELSE CALL JOURNAL.UPDATE(JNL.ID)
            REPEAT
        END
    END

    SW.PENDING.USED = ''

*     Load and process the selected inward LOT files available

    GOSUB SELECT.WAITING.FILES

    IF RUNNING.UNDER.BATCH ELSE  CALL JOURNAL.UPDATE(JNL.ID)

RETURN

***********************************************************************
KEEP.REMIT.IN.PENDING:
***********************************************************************

    IF R.SICP.NON.TREATED<LOT.ICP.FILE.ID> EQ '' THEN
        R.SICP.NON.TREATED<LOT.ICP.FILE.ID> = R.SICP<LOT.ICP.FILE.ID,IHU>
        R.SICP.NON.TREATED<LOT.ICP.REMIT.NUM> = R.SICP<LOT.ICP.REMIT.NUM,IHU,IJJ>
        R.SICP.NON.TREATED<LOT.ICP.BLOCK.STATUS> = R.SICP<LOT.ICP.BLOCK.STATUS,IHU,IJJ>
    END ELSE
        LOCATE R.SICP<LOT.ICP.FILE.ID,IHU> IN R.SICP.NON.TREATED<LOT.ICP.FILE.ID,1> SETTING DEJA THEN
            R.SICP.NON.TREATED<LOT.ICP.REMIT.NUM,IHU> := @SM:R.SICP<LOT.ICP.REMIT.NUM,IHU,IJJ>
            R.SICP.NON.TREATED<LOT.ICP.BLOCK.STATUS,IHU> := @SM:R.SICP<LOT.ICP.BLOCK.STATUS,IHU,IJJ>
        END ELSE
            R.SICP.NON.TREATED<LOT.ICP.FILE.ID> := @VM:R.SICP<LOT.ICP.FILE.ID,IHU>
            R.SICP.NON.TREATED<LOT.ICP.REMIT.NUM> := @VM:R.SICP<LOT.ICP.REMIT.NUM,IHU,IJJ>
            R.SICP.NON.TREATED<LOT.ICP.BLOCK.STATUS> := @VM:R.SICP<LOT.ICP.BLOCK.STATUS,IHU,IJJ>
        END
    END
    R.SICP.NON.TREATED<LOT.ICP.LOCAL.REF> = R.SICP<LOT.ICP.LOCAL.REF>

RETURN

***********************************************************************
SELECT.WAITING.FILES:
***********************************************************************

    UNFORM.FILE.ID = "LOTIN"

*     Check if previous execution has crashed then reexecute it first

    PINTAPE = '' ; KEY.ADD = ''
    RSTATEMENT = "SELECT FT.IN.TAPE WITH @ID EQ ":UNFORM.FILE.ID
    CALL EB.READLIST(RSTATEMENT,KEY.ADD,'','','')

    IF KEY.ADD NE '' THEN
        IF KEY.LIST NE '' THEN
            KEY.LIST = 'Reexecution':@FM:KEY.LIST
        END ELSE
            KEY.LIST = 'Reexecution'
        END
    END
    IF KEY.LIST EQ '' THEN
        LOG.LEVEL = '2' ; LOG.MESSAGE = 'EB-LOT.NO.INWARD.FILE':@FM:'LOT'
        CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
        GOSUB UPDATE.LOG.FILE
    END ELSE
        LOOP
            REMOVE PINTAPE FROM KEY.LIST SETTING POINT1
        WHILE PINTAPE:POINT1
            WORST.LEVEL = '0'
            IF PINTAPE NE 'Reexecution' THEN
                YR.LOT.FILES.ID = ''
                EXECUTE$CMD1 = "COPY FROM ":DIR.IDENT:" TO FT.IN.TAPE ":PINTAPE:",":UNFORM.FILE.ID:" OVERWRITING DELETING"
* CALL !HUSHIT(1)
* EXECUTE EXECUTE$CMD1 RETURNING RETVAR
* CALL !HUSHIT(0)
                CALL HUSHIT(1)
                EXECUTE EXECUTE$CMD1 RETURNING RETVAR
                CALL HUSHIT(0)
* EPI 20100224 <
*              LOCATE '1' IN RETVAR<1,1> SETTING GOOD ELSE
                SW.OKAY = 0
                Y.RET.CNT = DCOUNT(RETVAR,@FM)
                FOR IIW = 1 TO Y.RET.CNT
                    LOCATE '1' IN RETVAR<IIW,1> SETTING GOOD THEN SW.OKAY = 1 ; EXIT
                NEXT IIW
                IF SW.OKAY EQ 0 THEN
* EPI 20100224 >
                    IF KEY.LIST EQ FILE.IDENT THEN
                        LOG.LEVEL = '2' ; LOG.MESSAGE = 'EB-LOT.NO.INWARD.CALLED':@FM:PINTAPE
                        CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
                    END ELSE
                        LOG.LEVEL = '2' ; LOG.MESSAGE = 'EB-LOT.NO.INWARD.LOADED':@FM:PINTAPE
                        CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
                    END
                    GOSUB UPDATE.LOG.FILE
                END
            END
            GOSUB PROCESS.INWARD.FILE

            YR.LOT.LOG.LEVEL.ID = WORST.LEVEL
            GOSUB READ.LOT.LOG.LEVEL.FILE
            IF ER THEN
                BEGIN CASE

                    CASE WORST.LEVEL EQ '0'

*                    Process normally completed, erase the copy of the file from FT.IN.TAPE

* EXECUTE$CMD2 = "DELETE FT.IN.TAPE ":UNFORM.FILE.ID
* CALL !HUSHIT(1)
* EXECUTE EXECUTE$CMD2
* CALL !HUSHIT(0)
                        CALL HUSHIT(1)
                        CALL F.DELETE(FT.IN.TAPE,UNFORM.FILE.ID)
                        CALL HUSHIT(0)

                    CASE WORST.LEVEL EQ 1

*                    In case of a unknown operation, Restore the file in its original directory for a new treatment

                        EXECUTE$CMD2 = "COPY FROM FT.IN.TAPE TO ":DIR.IDENT:" ":UNFORM.FILE.ID:",":PINTAPE:" OVERWRITING DELETING"
* CALL !HUSHIT(1)
* EXECUTE EXECUTE$CMD2 RETURNING RETVAR
* CALL !HUSHIT(0)
                        CALL HUSHIT(1)
                        EXECUTE EXECUTE$CMD2 RETURNING RETVAR
                        CALL HUSHIT(0)
* EPI 20100224 <
*                    LOCATE '1' IN RETVAR<1,1> SETTING GOOD ELSE
                        SW.OKAY = 0
                        Y.VAR.CNT = DCOUNT(RETVAR,@FM)
                        FOR IIW = 1 TO Y.VAR.CNT
                            LOCATE '1' IN RETVAR<IIW,1> SETTING GOOD THEN SW.OKAY = 1 ; EXIT
                        NEXT IIW
                        IF SW.OKAY EQ 0 THEN
* EPI 20100224 >
                            LOG.LEVEL = '2' ; LOG.MESSAGE = 'EB-LOT.NO.INWARD.RESTORE':@FM:PINTAPE
                            CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
                            GOSUB UPDATE.LOG.FILE
                        END

                    CASE WORST.LEVEL EQ 2

*                    Store the rejected file under its original name in the FT.IN.TAPE directory

                        EXECUTE$CMD2 = "COPY FROM FT.IN.TAPE TO FT.IN.TAPE ":UNFORM.FILE.ID:",":PINTAPE:" OVERWRITING DELETING"
* CALL !HUSHIT(1)
* EXECUTE EXECUTE$CMD2 RETURNING RETVAR
* CALL !HUSHIT(0)
                        CALL HUSHIT(1)
                        EXECUTE EXECUTE$CMD2 RETURNING RETVAR
                        CALL HUSHIT(0)
* EPI 20100224 <
*                    LOCATE '1' IN RETVAR<1,1> SETTING GOOD ELSE
                        SW.OKAY = 0
                        Y.IW.CNT = DCOUNT(RETVAR,@FM)
                        FOR IIW = 1 TO Y.IW.CNT
                            LOCATE '1' IN RETVAR<IIW,1> SETTING GOOD THEN SW.OKAY = 1 ; EXIT
                        NEXT IIW
                        IF SW.OKAY EQ 0 THEN
* EPI 20100224 >
                            LOG.LEVEL = '2' ; LOG.MESSAGE = 'EB-LOT.NO.INWARD.SUSPEND':@FM:PINTAPE
                            CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
                            GOSUB UPDATE.LOG.FILE
                        END

                END CASE
            END ELSE
                FINAL.DIR = ''
                IF R.LOT.LOG.LEVEL<LOT.LGL.FINAL.DIRECTORY> NE '' THEN

*                 Send the file to the given archive directory

                    FINAL.DIR = R.LOT.LOG.LEVEL<LOT.LGL.FINAL.DIRECTORY>
                END ELSE
                    IF R.LOT.LOG.LEVEL<LOT.LGL.RESTORE.FILE> EQ 'Y' THEN

*                    Put the file back to its inward library

                        FINAL.DIR = DIR.IDENT
                    END
                END
                IF R.LOT.LOG.LEVEL<LOT.LGL.FINAL.ROUTINE> THEN
                    FINAL.RTN = TRIM(FIELD(R.LOT.LOG.LEVEL<LOT.LGL.FINAL.ROUTINE>,"@",2))
                    ETEXT = '' ; SAVE.COMI = COMI ; COMI = FINAL.DIR
                    CALL @FINAL.RTN
                    IF ETEXT THEN
                        LOG.LEVEL = '2' ; LOG.MESSAGE = ETEXT
                        CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
                        GOSUB UPDATE.LOG.FILE
                    END ELSE
                        IF COMI THEN FINAL.DIR = COMI
                    END
                    ETEXT = '' ; COMI = SAVE.COMI
                END
                IF FINAL.DIR NE '' THEN
                    EXECUTE$CMD2 = "COPY FROM FT.IN.TAPE TO ":FINAL.DIR:" ":UNFORM.FILE.ID:",":PINTAPE:" OVERWRITING DELETING"
* CALL !HUSHIT(1)
* EXECUTE EXECUTE$CMD2 RETURNING RETVAR
* CALL !HUSHIT(0)
                    CALL HUSHIT(1)
                    EXECUTE EXECUTE$CMD2 RETURNING RETVAR
                    CALL HUSHIT(0)
* EPI 20100224 <
*                 LOCATE '1' IN RETVAR<1,1> SETTING GOOD ELSE
                    SW.OKAY = 0
                    Y.IW2.CNT = DCOUNT(RETVAR,@FM)
                    FOR IIW = 1 TO Y.IW2.CNT
                        LOCATE '1' IN RETVAR<IIW,1> SETTING GOOD THEN SW.OKAY = 1 ; EXIT
                    NEXT IIW
                    IF SW.OKAY EQ 0 THEN
* EPI 20100224 >
                        LOG.LEVEL = '2' ; LOG.MESSAGE = 'EB-LOT.NO.INWARD.COPY':@FM:PINTAPE
                        CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
                        GOSUB UPDATE.LOG.FILE
                    END
                END ELSE
*EXECUTE$CMD2 = "DELETE FT.IN.TAPE ":UNFORM.FILE.ID
* CALL !HUSHIT(1)
* EXECUTE EXECUTE$CMD2
* CALL !HUSHIT(0)
                    CALL HUSHIT(1)
                    CALL F.DELETE(FT.IN.TAPE,UNFORM.FILE.ID)
                    CALL HUSHIT(0)
                END
            END
        REPEAT
    END

RETURN

***********************************************************************
PROCESS.INWARD.FILE:
***********************************************************************

    Y.COUNT = ''
    Y.REMIT.NUM = 1
    LAST.LAYOUT.ID = ''

    YR.LOT.FILES.ID = ''
    LOT.DESCRIPTION = ''
    LOT.CONTRACT.ID = ''
    R.LOT.CONTRACT = ''
    SUPER.LAYOUT.ID = ''
    R.SUPER.LAYOUT = ''
    R.SUPER.RECORD = ''
    SUPER.CONTRACT.ID = ''
    R.SUPER.CONTRACT = ''
    LOT.LOCAL.FIELDS = ''
    R.DATA.RECORD = ''
    R.RED.RECORD = ''
    R.SEQ.NEXT = ''

*     To skip a batch already processed this switch sould be set to 'Y'

    SW.SKIP = ''
    DROP.TREATMENT = ''
    SW.FILE.HEADER = 'N'
    SW.FILE.TRAILER = 'N'
    SW.REMIT.HEADER = 'N'
    SW.REMIT.TRAILER = 'N'

    SW.CHECK.FILE.TRAILER = 'Y'
    CALC.FILE.REMIT = 0
    CALC.FILE.AMOUNT.CR = 0
    CALC.FILE.AMOUNT.DB = 0

    UNFORM.FILE = '' ; I.REC = '' ; IE = 0 ; SW.EOF = 0
    R.RED.RECORD = '' ;* EPI 20/04/2010
    OPENSEQ TAPE.FILE.NAME,UNFORM.FILE.ID TO UNFORM.FILE THEN
        MY.SUM.TRAILER = ""
        GOSUB INITIATE.FILE.DATA

        LOOP
*Svu start - 20070510 - Make sure lines longer than 1024 char are not truncated. ---------
*           READSEQ R.RED.RECORD FROM UNFORM.FILE ELSE R.RED.RECORD = ''
            LINE = '' ; FLAG.ERROR = 0 ; GOT.LINE   = 0
            LOOP
                BUFFER.DATA = ''
                READSEQ BUFFER.DATA FROM UNFORM.FILE ELSE SW.EOF = 1

* VU/20090608/Start
                IF R.SPF.SYSTEM<SPF.OPERATING.SYSTEM>[1,4] EQ 'UNIX' THEN
                    CHANGE CHARX(013) TO '' IN BUFFER.DATA ;* strip off any windows carriage return chars
                END
* VU/20090608/End
	       
                LINE.LEN = LEN(BUFFER.DATA) ; LINE := BUFFER.DATA
                IF LINE.LEN NE 1024 THEN GOT.LINE = 1
            UNTIL GOT.LINE
            REPEAT
            R.RED.RECORD = LINE
* Svu End - 20070510 ---------------------------------------------------------------------
*        UNTIL SW.EOF = 1 ;* EPI 20/04/2010
        UNTIL SW.EOF = 1 AND R.RED.RECORD = '' ;* EPI 20/04/2010
            IF R.RED.RECORD NE '' THEN

                REC.LENGTH = LEN(R.RED.RECORD)
                HEA = '' ; HHA = ''
                Y.RE.CNT = DCOUNT(HEA.ENR.ID,@FM)
                FOR IHE = 1 TO Y.RE.CNT
                    IF REC.LENGTH GT HEA.REC.LENGTH<IHE> THEN CONTINUE
                    GOOD.ONE.FOUND = 1
                    Y.HE.CNT = DCOUNT(HEA.ENR.START<IHE>,@VM)
                    FOR IEN = 1 TO Y.HE.CNT
                        IF HEA.ENR.START<IHE,IEN> NE '#' THEN
                            FIELD.ENR.START = HEA.ENR.START<IHE,IEN>
                            FIELD.ENR.LENGTH = HEA.ENR.LENGTH<IHE,IEN>
                            IF FIELD.ENR.START + FIELD.ENR.LENGTH - 1 LE REC.LENGTH THEN
                                IF HEA.ENR.VALUE<IHE,IEN> NE R.RED.RECORD[FIELD.ENR.START,FIELD.ENR.LENGTH] THEN
                                    GOOD.ONE.FOUND = 0 ; EXIT
                                END
                            END
                        END
                    NEXT IEN

                    IF GOOD.ONE.FOUND THEN

*                    The ENR code is compatible, now let's consider the OPE code if any
  
                        IF HEA.OPE.START<IHE> EQ '' THEN
                            HEA = IHE ; HHA = 1 ; EXIT
                        END ELSE

                            COMPARE.OPE = '' ; IEU = 0
                            Y.OP.CNT = DCOUNT(HEA.OPE.START<IHE>,@VM)
                            FOR IOP = 1 TO Y.OP.CNT
                                IF HEA.OPE.START<IHE,IOP> NE '#' THEN
                                    FIELD.OPE.START = HEA.OPE.START<IHE,IOP>
                                    FIELD.OPE.LENGTH = HEA.OPE.LENGTH<IHE,IOP>
                                    IF FIELD.OPE.START + FIELD.OPE.LENGTH - 1 LE REC.LENGTH THEN
                                        IEU += 1 ; COMPARE.OPE<1,IEU> = R.RED.RECORD[FIELD.OPE.START,FIELD.OPE.LENGTH]
                                    END
                                END
                            NEXT IOP
                            Y.PR.CNT = DCOUNT(HEA.OPE.VALUE<IHE>,@VM)
                            FOR IPE = 1 TO Y.PR.CNT
                                PRESENT.OPE = '' ; IEU = 0
                                Y.ST.CNT = DCOUNT(HEA.OPE.START<IHE>,@VM)
                                FOR IOP = 1 TO Y.ST.CNT
                                    IF HEA.OPE.START<IHE,IOP> NE '#' THEN
                                        FIELD.OPE.START = HEA.OPE.START<IHE,IOP>
                                        FIELD.OPE.LENGTH = HEA.OPE.LENGTH<IHE,IOP>
                                        IF FIELD.OPE.START + FIELD.OPE.LENGTH - 1 LE REC.LENGTH THEN
                                            IEU += 1 ; PRESENT.OPE<1,IEU> = HEA.OPE.VALUE<IHE,IPE,IOP>
                                        END
                                    END
                                NEXT IOP
                                IF COMPARE.OPE EQ PRESENT.OPE THEN HEA = IHE ; HHA = IPE ; EXIT
                            NEXT IPE
                        END
                        IF HEA NE '' AND HHA NE '' THEN EXIT
                    END
                NEXT IHE
*
                IF HEA NE '' THEN
                    ACT.LAYOUT.ID = HEA.OPE.ID<HEA,HHA>
                    BEGIN CASE
                        CASE HEA.NATURE<HEA,HHA> EQ 'SUH'
                            ACT.LAYOUT.ID = ''
                            GOSUB PROCESS.FILE.HEADER
                        CASE HEA.NATURE<HEA,HHA> EQ 'REH'
                            GOSUB PROCESS.REMIT.HEADER
                        CASE HEA.NATURE<HEA,HHA> EQ 'RET'
                            GOSUB PROCESS.REMIT.TRAILER
                        CASE HEA.NATURE<HEA,HHA> EQ 'SUT'
                            ACT.LAYOUT.ID = ''
                            GOSUB PROCESS.FILE.TRAILER
                        CASE HEA.NATURE<HEA,HHA> EQ 'DAT'
                            GOSUB PROCESS.DATA
                        CASE HEA.NATURE<HEA,HHA>[1,2] EQ 'AN'
                            GOSUB PROCESS.ANNEX
                    END CASE
                END ELSE
                    LOG.LEVEL = '1' ; LOG.MESSAGE = 'EB-LOT.UNRECOGNIZED.CODE'
                    CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
                    GOSUB UPDATE.LOG.FILE
                END
            END
        REPEAT
        GOSUB PROCESS.MISSING.REMIT.TRAILER
        GOSUB PROCESS.MISSING.FILE.TRAILER
        IF SW.SKIP EQ '' THEN
            LOG.LEVEL = '' ; LOG.MESSAGE = 'EB-LOT.NO.PROBLEM.FOUND'
            CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
            GOSUB UPDATE.LOG.FILE
        END
        CLOSESEQ UNFORM.FILE
    END

RETURN

***********************************************************************
CHECK.FILE.HEADER.EXIST:
***********************************************************************

    IF SW.FILE.HEADER NE 'Y' AND NOT(SW.SKIP) THEN
        MSG.ERR = 'EB-LOT.MISSING.FILE.HEADER'
        CALL LOT.TRANSLATE.ERROR(MSG.ERR,'')
        R.LOT.FILES<LOT.FIL.FILE.HEADER> = MSG.ERR
        SW.FILE.HEADER = 'Y'
        GOSUB INITIATE.FILE.DATA
    END

RETURN

***********************************************************************
CHECK.REMIT.HEADER.EXIST:
***********************************************************************

    IF SW.REMIT.HEADER NE 'Y' AND NOT(SW.SKIP) THEN

*        To process the remit even though its header is missing

* EPI 14/05/2009 <
        IF YR.LOT.FILES.ID EQ '' THEN
            YR.LOT.FILES.ID = Y.PROCESS.DATE
            GOSUB READ.LOT.FILES.FILE
            IF LOG.MESSAGE THEN
                CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
                IF LOG.LEVEL GT 1 THEN SW.SKIP = 'Y'
                GOSUB UPDATE.LOG.FILE
                IF SW.SKIP EQ 'Y' THEN RETURN
            END
            MIN.LOADING.DATE = ''
            LOT.DESCRIPTION = ''
            HEADER.LAYOUT.ID = ''
            R.HEADER.LAYOUT = ''
            R.HEADER.RECORD = R.RED.RECORD
            LOT.LOCAL.FIELDS = ''
            R.DATA.RECORD = ''
            HEADER.CONTRACT.ID = ''
            R.HEADER.CONTRACT = ''
        END
* EPI 14/05/2009 >

        MIN.LOADING.DATE = ''
        LAST.REMIT.LAYOUT.ID = ''
        NB.GIVEN = 0
        MNT.GIVEN = 0
        GOSUB REMIT.HEADER.UPDATE
        MSG.ERR = 'EB-LOT.MISSING.REM.HEADER'
        CALL LOT.TRANSLATE.ERROR(MSG.ERR,'')
        R.LOT.FILES<LOT.FIL.REM.HEADER,Y.REMIT.NUM> = MSG.ERR
        LOG.LEVEL = '' ; LOG.MESSAGE = 'EB-LOT.MISSING.REM.HEADER':@FM:Y.REMIT.NUM
        CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
        GOSUB UPDATE.LOG.FILE
        SW.REMIT.HEADER = 'Y'

    END

RETURN

***********************************************************************
PROCESS.MISSING.REMIT.TRAILER:
***********************************************************************
*EPI 08/10/2007 <
*     IF SW.REMIT.TRAILER = '' THEN
    IF SW.REMIT.TRAILER EQ '' AND NOT(SW.SKIP) THEN

*EPI 08/10/2007 >
        CALC.FILE.REMIT += 1
        MSG.ERR = 'EB-LOT.MISSING.REM.TRAILER'
        CALL LOT.TRANSLATE.ERROR(MSG.ERR,'')
        R.LOT.FILES<LOT.FIL.REM.TRAILER,Y.REMIT.NUM> = MSG.ERR
*EPI 11/05/2006 <
        IF SW.UNKNOWN.MESSAGE EQ '' THEN ;* AND COUNTER.FOR.COMMITMENT THEN
            IF R.DATA.RECORD EQ '' THEN
                LOG.LEVEL = '2' ; LOG.MESSAGE = 'EB-LOT.NO.DATA.LINE':@FM:Y.REMIT.NUM
                CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
                GOSUB UPDATE.LOG.FILE ; SW.SKIP = 'Y'
                R.LOT.FILES<LOT.FIL.REM.HEADER,Y.REMIT.NUM> = ''
                R.LOT.FILES<LOT.FIL.REM.TRAILER,Y.REMIT.NUM> = ''
                GOSUB REMOVE.EMPTY.LOT.FILES ; RETURN
            END ELSE
                COUNTER.FOR.COMMITMENT += 1
                GOSUB POPULATE.DETAIL.FIELDS
            END
        END
*        GOSUB REMIT.TRAILER.UPDATE ;* 03/07/2006
*EPI 11/05/2006 >
        LOG.LEVEL = '' ; LOG.MESSAGE = 'EB-LOT.MISSING.REM.TRAILER':@FM:Y.REMIT.NUM
        CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
        IF LOG.LEVEL EQ 2 THEN
            SW.SKIP = 'Y'
            R.SAVE.LOT.FILES = R.LOT.FILES
            FOR IRD = LOT.FIL.REM.HEADER TO LOT.FIL.REM.TRAILER
                R.LOT.FILES<IRD> = ''
                FOR IDR = 1 TO Y.REMIT.NUM - 1
                    R.LOT.FILES<IRD,IDR> = R.SAVE.LOT.FILES<IRD,IDR>
                NEXT IDR
            NEXT IRD
            GOSUB REMOVE.EMPTY.LOT.FILES
        END
        GOSUB UPDATE.LOG.FILE
        SW.REMIT.HEADER = ''
        GOSUB REMIT.TRAILER.UPDATE
    END

RETURN

***********************************************************************
PROCESS.MISSING.FILE.TRAILER:
***********************************************************************

    IF SW.FILE.TRAILER EQ '' THEN
        IF NOT(SW.SKIP) THEN ;*EPI 08/10/2007
            MSG.ERR = 'EB-LOT.MISSING.FILE.TRAILER'
            CALL LOT.TRANSLATE.ERROR(MSG.ERR,'')
            R.LOT.FILES<LOT.FIL.FILE.TRAILER> = MSG.ERR
            GOSUB FILE.TRAILER.UPDATE
        END ELSE
            IF SW.SKIP EQ 'Y' THEN GOSUB REMOVE.EMPTY.LOT.FILES
        END
    END

RETURN

***********************************************************************
PROCESS.FILE.HEADER:
***********************************************************************

    GOSUB PROCESS.MISSING.REMIT.TRAILER
    GOSUB PROCESS.MISSING.FILE.TRAILER
    LOT.LOCAL.FIELDS = ''
    R.DATA.RECORD = ''

    IF SW.FILE.HEADER EQ 'Y' THEN
        LOG.LEVEL = '' ; LOG.MESSAGE = 'EB-LOT.MANY.FILE.HEADER'
        CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
        GOSUB UPDATE.LOG.FILE
        RETURN
    END

    SW.FILE.HEADER = 'Y'

    GOSUB INITIATE.FILE.DATA
    R.SUPER.RECORD = R.RED.RECORD

    YR.CFONB.LAYOUT.ID = 'INWARD.':ACT.LAYOUT.ID
    GOSUB READ.CFONB.LAYOUT.FILE

    IF R.CFONB.LAYOUT THEN
        SUPER.LAYOUT.ID = YR.CFONB.LAYOUT.ID
        R.SUPER.LAYOUT = R.CFONB.LAYOUT
        LOCATE 'OUR.BANK.ID' IN R.SUPER.LAYOUT<CFB.LAY.FT.FIELD.NAME,1> SETTING FND THEN
            N.BEG = R.SUPER.LAYOUT<CFB.LAY.FIELD.START,FND>
            N.LEN = R.SUPER.LAYOUT<CFB.LAY.FIELD.LENGTH,FND>
            IF R.LOT.PARAMETER<LOT.PAR.BANK.PID.CODE> NE R.RED.RECORD[N.BEG,N.LEN] THEN
                LOG.LEVEL = '2' ; LOG.MESSAGE = 'EB-LOT.BANK.NOT.RECEIVER':@FM:R.RED.RECORD[N.BEG,N.LEN]
                CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
                IF LOG.LEVEL GT 1 THEN SW.SKIP = 'Y'
                GOSUB UPDATE.LOG.FILE
            END
        END
    END ELSE
        LOG.LEVEL = '1' ; LOG.MESSAGE = 'EB-LOT.UNKNOWN.FILE.HEADER':@FM:ACT.LAYOUT.ID
        CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
        IF LOG.LEVEL GE 1 THEN SW.SKIP = 'Y'
        GOSUB UPDATE.LOG.FILE
    END

    IF HEA.CNT.START<HEA,HHA> AND HEA.CNT.LENGTH<HEA,HHA> THEN
        NB.CNT.ELEMENTS = DCOUNT(HEA.CNT.START<HEA,HHA>,@SM)
        FOR FND = 1 TO NB.CNT.ELEMENTS
            N.BEG = HEA.CNT.START<HEA,HHA,FND>
            N.LEN = HEA.CNT.LENGTH<HEA,HHA,FND>
            IF SUPER.CONTRACT.ID EQ '' THEN
                SUPER.CONTRACT.ID = TRIM(R.RED.RECORD[N.BEG,N.LEN]," ","A")
            END ELSE
                SUPER.CONTRACT.ID := '.':TRIM(R.RED.RECORD[N.BEG,N.LEN]," ","A")
            END
        NEXT FND
        R.LOT.CONTRACT = '' ; ER = ''
        CALL F.READ(LOT.CONTRACT.FILE,SUPER.CONTRACT.ID,R.LOT.CONTRACT,F.LOT.CONTRACT,ER)
        IF ER NE '' THEN
            SUPER.CONTRACT.ID = ''
        END ELSE
            LOT.CONTRACT.ID = SUPER.CONTRACT.ID
            R.SUPER.CONTRACT = R.LOT.CONTRACT
        END
    END

    IF HEA.FILE.ID.START<HEA,HHA> NE '' AND HEA.FILE.ID.LENGTH<HEA,HHA> NE '' THEN
        NB.FILE.ID.ELEMENTS = DCOUNT(HEA.FILE.ID.START<HEA,HHA>,@SM)
        FOR FND = 1 TO NB.FILE.ID.ELEMENTS
            N.BEG = HEA.FILE.ID.START<HEA,HHA,FND>
            N.LEN = HEA.FILE.ID.LENGTH<HEA,HHA,FND>
            IF N.BEG AND N.LEN THEN
                IF YR.LOT.FILES.ID EQ '' THEN
                    YR.LOT.FILES.ID = TRIM(R.RED.RECORD[N.BEG,N.LEN]," ","A")
                END ELSE
                    YR.LOT.FILES.ID := '.':TRIM(R.RED.RECORD[N.BEG,N.LEN]," ","A")
                END
            END
        NEXT FND

        IF YR.LOT.FILES.ID NE '' THEN
            GOSUB READ.LOT.FILES.FILE
            IF LOG.MESSAGE THEN
                CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
                IF LOG.LEVEL GT 1 THEN SW.SKIP = 'Y'
                GOSUB UPDATE.LOG.FILE
            END
        END
    END

RETURN

***********************************************************************
PROCESS.REMIT.HEADER:
***********************************************************************

    GOSUB CHECK.FILE.HEADER.EXIST
    GOSUB PROCESS.MISSING.REMIT.TRAILER

    IF SW.REMIT.HEADER EQ 'Y' THEN
        LOG.LEVEL = '' ; LOG.MESSAGE = 'EB-LOT.MANY.REM.HEADER':@FM:Y.REMIT.NUM
        CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
        GOSUB UPDATE.LOG.FILE
        RETURN
    END ELSE SW.REMIT.HEADER = 'Y'

* EPI 29/09/2006 <
*     ACT.OPE.START = '' ; ACT.OPE.LENGTH = ''
* EPI 29/09/2006 >

    MIN.LOADING.DATE = ''
    LOT.DESCRIPTION = ''

    IF SW.SKIP EQ 'M' THEN SW.SKIP = ''

    HEADER.LAYOUT.ID = ''
    R.HEADER.LAYOUT = ''
    R.HEADER.RECORD = R.RED.RECORD
    LOT.LOCAL.FIELDS = ''
    R.DATA.RECORD = ''

    HEADER.CONTRACT.ID = ''
    R.HEADER.CONTRACT = ''

    YR.CFONB.LAYOUT.ID = 'INWARD.':ACT.LAYOUT.ID
    GOSUB READ.CFONB.LAYOUT.FILE
    IF R.CFONB.LAYOUT THEN

        HEADER.LAYOUT.ID = YR.CFONB.LAYOUT.ID
        R.HEADER.LAYOUT = R.CFONB.LAYOUT


        LOCATE 'OUR.BANK.ID' IN R.HEADER.LAYOUT<CFB.LAY.FT.FIELD.NAME,1> SETTING FND THEN
            N.BEG = R.HEADER.LAYOUT<CFB.LAY.FIELD.START,FND>
            N.LEN = R.HEADER.LAYOUT<CFB.LAY.FIELD.LENGTH,FND>
            IF R.LOT.PARAMETER<LOT.PAR.BANK.PID.CODE> NE R.RED.RECORD[N.BEG,N.LEN] THEN
                LOG.LEVEL = '2' ; LOG.MESSAGE = 'EB-LOT.BANK.NOT.RECEIVER':@FM:R.RED.RECORD[N.BEG,N.LEN]
                CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
                IF LOG.LEVEL GT 1 THEN SW.SKIP = 'Y'
                GOSUB UPDATE.LOG.FILE
            END
        END

*        Building up of the remit description for LOT.PROCESS

        N.DESCRIPTION = ''
        Y.LAY.CNT = DCOUNT(R.HEADER.LAYOUT<CFB.LAY.FT.FIELD.NAME>,@VM)
        FOR FND = 1 TO Y.LAY.CNT
            IF R.HEADER.LAYOUT<CFB.LAY.FT.FIELD.NAME,FND>[1,11] EQ 'DESCRIPTION' THEN
                N.BEG = R.HEADER.LAYOUT<CFB.LAY.FIELD.START,FND>
                N.LEN = R.HEADER.LAYOUT<CFB.LAY.FIELD.LENGTH,FND>
                T.DESCRIPTION = R.HEADER.LAYOUT<CFB.LAY.FT.FIELD.NAME,FND>
                L.DESCRIPTION = TRIM(R.RED.RECORD[N.BEG,N.LEN]," ","R")
                IF L.DESCRIPTION THEN
                    IF N.DESCRIPTION EQ '' THEN
                        N.DESCRIPTION<1> = T.DESCRIPTION
                        N.DESCRIPTION<2> = L.DESCRIPTION
                    END ELSE
                        LOCATE Y.FT.FIELD.NAME<I> IN N.DESCRIPTION<1,1> SETTING ITM THEN
                            N.DESCRIPTION<1,ITM> = T.DESCRIPTION:@VM:N.DESCRIPTION<1,ITM>
                            N.DESCRIPTION<2,ITM> = L.DESCRIPTION:@VM:N.DESCRIPTION<2,ITM>
                        END ELSE
                            NB.NARR = DCOUNT(N.DESCRIPTION<1>,@VM)
                            IF Y.FT.FIELD.NAME<I> GT N.DESCRIPTION<1,NB.NARR> THEN
                                N.DESCRIPTION<1,NB.NARR+1> = T.DESCRIPTION
                                N.DESCRIPTION<2,NB.NARR+1> = L.DESCRIPTION
                            END ELSE
                                FOR ITD = 1 TO NB.NARR
                                    IF Y.FT.FIELD.NAME<I> LT N.DESCRIPTION<1,ITD> THEN
                                        N.DESCRIPTION<1,ITD> = T.DESCRIPTION:@VM:N.DESCRIPTION<1,ITD>
                                        N.DESCRIPTION<2,ITD> = L.DESCRIPTION:@VM:N.DESCRIPTION<2,ITD>
                                        EXIT
                                    END
                                NEXT ITD
                            END
                        END
                    END
                END
            END
        NEXT FND

        IG = 0
        NB.DESC = DCOUNT(N.DESCRIPTION<1>,@VM)
        IF NB.DESC GT 0 THEN
            IF LEN(N.DESCRIPTION<1,1>) GT 13 THEN
                DESC.PREFIX = N.DESCRIPTION<1,1>[1,13]
            END ELSE DESC.PREFIX = N.DESCRIPTION<1,1>
            IF N.DESCRIPTION<2,1> THEN IG += 1 ; LOT.DESCRIPTION<1,IG> = N.DESCRIPTION<2,1>
            FOR IKE = 2 TO NB.DESC
                IF LEN(N.DESCRIPTION<1,IKE>) GT 13 THEN
                    NEW.DESC.PREFIX = N.DESCRIPTION<1,IKE>[1,13]
                END ELSE NEW.DESC.PREFIX = N.DESCRIPTION<1,IKE>
                IF N.DESCRIPTION<1,IKE> THEN
                    IF NEW.DESC.PREFIX NE DESC.PREFIX THEN
                        IG += 1 ; LOT.DESCRIPTION<1,IG> = N.DESCRIPTION<2,IKE>
                        DESC.PREFIX = NEW.DESC.PREFIX
                    END ELSE
                        LOT.DESCRIPTION<1,IG> := '/':N.DESCRIPTION<2,IKE>
                    END
                END
            NEXT IKE
        END

        IF R.HEADER.LAYOUT<CFB.LAY.CNT.KEY.START> NE '' AND R.HEADER.LAYOUT<CFB.LAY.CNT.KEY.LENGTH> NE '' THEN
            NB.CNT.ELEMENTS = DCOUNT(R.HEADER.LAYOUT<CFB.LAY.CNT.KEY.START>,@VM)
            FOR FND = 1 TO NB.CNT.ELEMENTS
                N.BEG = R.HEADER.LAYOUT<CFB.LAY.CNT.KEY.START,FND>
                N.LEN = R.HEADER.LAYOUT<CFB.LAY.CNT.KEY.LENGTH,FND>
                IF N.BEG AND N.LEN THEN
                    IF HEADER.CONTRACT.ID EQ '' THEN
                        HEADER.CONTRACT.ID = TRIM(R.RED.RECORD[N.BEG,N.LEN]," ","A")
                    END ELSE
                        HEADER.CONTRACT.ID := '.':TRIM(R.RED.RECORD[N.BEG,N.LEN]," ","R")
                    END
                END
            NEXT FND
            IF HEADER.CONTRACT.ID THEN
                R.LOT.CONTRACT = '' ; ER = ''
                CALL F.READ(LOT.CONTRACT.FILE,HEADER.CONTRACT.ID,R.LOT.CONTRACT,F.LOT.CONTRACT,ER)
                IF ER NE '' THEN
                    HEADER.CONTRACT.ID = ''
                END ELSE
                    LOT.CONTRACT.ID = HEADER.CONTRACT.ID
                    R.HEADER.CONTRACT = R.LOT.CONTRACT
                END
            END
        END

        IF YR.LOT.FILES.ID EQ '' THEN
            IF R.HEADER.LAYOUT<CFB.LAY.FILE.ID.START> NE '' AND R.HEADER.LAYOUT<CFB.LAY.FILE.ID.LENGTH> NE '' THEN
                NB.FILE.ID.ELEMENTS = DCOUNT(R.HEADER.LAYOUT<CFB.LAY.FILE.ID.START>,@VM)
                FOR FND = 1 TO NB.FILE.ID.ELEMENTS
                    N.BEG = R.HEADER.LAYOUT<CFB.LAY.FILE.ID.START,FND>
                    N.LEN = R.HEADER.LAYOUT<CFB.LAY.FILE.ID.LENGTH,FND>
                    IF N.BEG AND N.LEN THEN
                        IF YR.LOT.FILES.ID EQ '' THEN
                            YR.LOT.FILES.ID = TRIM(R.RED.RECORD[N.BEG,N.LEN]," ","A")
                        END ELSE
                            YR.LOT.FILES.ID := '.':TRIM(R.RED.RECORD[N.BEG,N.LEN]," ","A")
                        END
                    END
                NEXT FND
            END
            IF YR.LOT.FILES.ID EQ '' THEN YR.LOT.FILES.ID = Y.PROCESS.DATE

            GOSUB READ.LOT.FILES.FILE
            IF LOG.MESSAGE THEN
                CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
                IF LOG.LEVEL GT 1 THEN SW.SKIP = 'Y'
                GOSUB UPDATE.LOG.FILE
            END
        END

        LOCATE 'NB.OF.RECORDS' IN R.HEADER.LAYOUT<CFB.LAY.FT.FIELD.NAME,1> SETTING FND THEN
            N.BEG = R.HEADER.LAYOUT<CFB.LAY.FIELD.START,FND>
            N.LEN = R.HEADER.LAYOUT<CFB.LAY.FIELD.LENGTH,FND>
            NB.GIVEN = R.RED.RECORD[N.BEG,N.LEN]
        END

        LOCATE 'TOTAL.AMOUNT' IN R.CFONB.LAYOUT<CFB.LAY.FT.FIELD.NAME,1> SETTING FND THEN
            N.BEG = R.CFONB.LAYOUT<CFB.LAY.FIELD.START,FND>
            N.LEN = R.CFONB.LAYOUT<CFB.LAY.FIELD.LENGTH,FND>
            MNT.GIVEN = R.RED.RECORD[N.BEG,N.LEN]
            IF R.CFONB.LAYOUT<CFB.LAY.FIELD.TYPE,FND>[1,1] EQ '@' THEN
                RTN.FMT = FIELD(R.CFONB.LAYOUT<CFB.LAY.FIELD.TYPE,FND>,'@',2)
                IF RTN.FMT THEN
                    SAVE.COMI = COMI
                    COMI = MNT.GIVEN
                    CALL @RTN.FMT
                    MNT.GIVEN = COMI
                    COMI = SAVE.COMI
                END
            END
        END

    END ELSE

        LOG.LEVEL = '1' ; LOG.MESSAGE = 'EB-LOT.UNKNOWN.REM.HEADER':@FM:ACT.LAYOUT.ID
        CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
        IF LOG.LEVEL GE 1 THEN SW.SKIP = 'Y'
        GOSUB UPDATE.LOG.FILE
    END

    LAST.REMIT.LAYOUT.ID = ''

REMIT.HEADER.UPDATE:                     ; * To process the remit even though its header is missing
********************

    SW.FILE.TRAILER = ''
    SW.REMIT.TRAILER = 'N'

    TOTAL.FOR.COMMITMENT = 0
    COUNTER.FOR.COMMITMENT = 0
    COUNTER.FOR.RECOVERY = 0
    IF SW.SKIP EQ 'Y' THEN RETURN

    NB.REMIT = DCOUNT(R.LOT.FILES<LOT.FIL.REM.HEADER>,@VM)
    IF SW.RECOVERY EQ 'Y' THEN
*EPI 17/06/2007 <
        IF Y.REMIT.NUM ELSE NB.REMIT.INIT = NB.REMIT
        IF Y.REMIT.NUM LE NB.REMIT.INIT THEN
            Y.REMIT.NUM += 1
*EPI 17/06/2007 >
            IF R.LOT.FILES<LOT.FIL.REM.TRAILER,Y.REMIT.NUM> NE '' THEN

                SW.SKIP = 'R'             ; * Remit already processed to the end not to be recovered
            END ELSE
                SW.SKIP = ''              ; * Remit partially processed to be recovered
                COUNTER.FOR.RECOVERY = R.LOT.FILES<LOT.FIL.FOUND.NB.OF.REC,Y.REMIT.NUM>
                TOTAL.FOR.COMMITMENT = ABS(R.LOT.FILES<LOT.FIL.FOUND.AMOUNT,Y.REMIT.NUM,1>+0)
*EPI 16/06/2007 <
                LOT.DETAIL.ID = R.LOT.FILES<LOT.FIL.LOT.DETAIL.ID,Y.REMIT.NUM>
                R.LOT.WORK = '' ; ER = ''
                CALL F.READ(LOT.WORK.FILE,LOT.DETAIL.ID,R.LOT.WORK,F.LOT.WORK,ER)
*EPI 16/06/2007 >
            END
        END ELSE                        ; * Remit still not processed when the crash occurred
            CALL Y.FETCH.LOT.DETAIL.ID(LOT.DETAIL.ID)
            SW.SKIP = '' ; SW.RECOVERY = '' ; Y.REMIT.NUM = NB.REMIT + 1 ;*EPI 17/06/2007
        END
    END ELSE
        IF R.LOT.FILES<LOT.FIL.REM.HEADER> EQ '' THEN
            Y.REMIT.NUM = 1
        END ELSE
            Y.REMIT.NUM = NB.REMIT + 1
        END
        CALL Y.FETCH.LOT.DETAIL.ID(LOT.DETAIL.ID)
        R.LOT.DETAIL = ''
        R.LOT.WORK = ''
        R.LOT.WORK<LOT.WRK.LOT.FILES.ID> = YR.LOT.FILES.ID
        R.LOT.WORK<LOT.WRK.REM.NUMBER> = Y.REMIT.NUM
    END

    R.LOT.FILES<LOT.FIL.REM.HEADER,Y.REMIT.NUM> = R.RED.RECORD
    R.LOT.FILES<LOT.FIL.GIVEN.NB.OF.REC,Y.REMIT.NUM> = NB.GIVEN+0
    R.LOT.FILES<LOT.FIL.GIVEN.AMOUNT,Y.REMIT.NUM> = (MNT.GIVEN+0)/100

RETURN

***********************************************************************
PROCESS.REMIT.TRAILER:
***********************************************************************

    IF SW.REMIT.TRAILER EQ 'Y' THEN
        IF Y.REMIT.NUM THEN
            LOG.LEVEL = '' ; LOG.MESSAGE = 'EB-LOT.MANY.REM.TRAILER':@FM:Y.REMIT.NUM
            CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
            GOSUB UPDATE.LOG.FILE
        END
        RETURN
    END ELSE SW.REMIT.TRAILER = 'Y'

    GOSUB CHECK.REMIT.HEADER.EXIST
    GOSUB CHECK.FILE.HEADER.EXIST

    IF NOT(SW.SKIP) THEN

        IF SW.UNKNOWN.MESSAGE EQ '' THEN  ;* AND COUNTER.FOR.COMMITMENT THEN
            IF R.DATA.RECORD EQ '' THEN

                LOG.LEVEL = '2' ; LOG.MESSAGE = 'EB-LOT.NO.DATA.LINE':@FM:Y.REMIT.NUM
                CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
                GOSUB UPDATE.LOG.FILE ; SW.SKIP = 'Y'
                R.SAVE.LOT.FILES = R.LOT.FILES
                FOR IRD = LOT.FIL.REM.HEADER TO LOT.FIL.REM.TRAILER
                    R.LOT.FILES<IRD> = ''
                    FOR IDR = 1 TO Y.REMIT.NUM - 1
                        R.LOT.FILES<IRD,IDR> = R.SAVE.LOT.FILES<IRD,IDR>
                    NEXT IDR
                NEXT IRD
                GOSUB REMOVE.EMPTY.LOT.FILES ; RETURN
            END ELSE
                COUNTER.FOR.COMMITMENT += 1
                GOSUB POPULATE.DETAIL.FIELDS
            END
        END

        R.LOT.FILES<LOT.FIL.REM.TRAILER,Y.REMIT.NUM> = R.RED.RECORD

        YR.CFONB.LAYOUT.ID = 'INWARD.':ACT.LAYOUT.ID
        GOSUB READ.CFONB.LAYOUT.FILE
        IF R.CFONB.LAYOUT THEN
            LOCATE 'NB.OF.RECORDS' IN R.CFONB.LAYOUT<CFB.LAY.FT.FIELD.NAME,1> SETTING FND THEN
                N.BEG = R.CFONB.LAYOUT<CFB.LAY.FIELD.START,FND>
                N.LEN = R.CFONB.LAYOUT<CFB.LAY.FIELD.LENGTH,FND>
                NB.GIVEN = R.RED.RECORD[N.BEG,N.LEN]
                R.LOT.FILES<LOT.FIL.GIVEN.NB.OF.REC,Y.REMIT.NUM> = NB.GIVEN+0
            END

            LOCATE 'TOTAL.AMOUNT' IN R.CFONB.LAYOUT<CFB.LAY.FT.FIELD.NAME,1> SETTING FND THEN
                N.BEG = R.CFONB.LAYOUT<CFB.LAY.FIELD.START,FND>
                N.LEN = R.CFONB.LAYOUT<CFB.LAY.FIELD.LENGTH,FND>
                MNT.GIVEN = R.RED.RECORD[N.BEG,N.LEN]
                IF R.CFONB.LAYOUT<CFB.LAY.FIELD.TYPE,FND>[1,1] EQ '@' THEN
                    RTN.FMT = FIELD(R.CFONB.LAYOUT<CFB.LAY.FIELD.TYPE,FND>,'@',2)
                    IF RTN.FMT THEN
                        SAVE.COMI = COMI
                        COMI = MNT.GIVEN
                        CALL @RTN.FMT
                        MNT.GIVEN = COMI
                        COMI = SAVE.COMI
                    END
                END
                R.LOT.FILES<LOT.FIL.GIVEN.AMOUNT,Y.REMIT.NUM> = (MNT.GIVEN+0)/100
            END
        END

    END

*     CALC.FILE.REMIT += 1

*     SW.REMIT.HEADER = ''

REMIT.TRAILER.UPDATE:                    ; * To commit a remit even though its trailer is missing
*********************

    IF SW.SKIP THEN RETURN

    IF SW.COMMIT EQ '' THEN

        NB.GIVEN = FMT(R.LOT.FILES<LOT.FIL.GIVEN.NB.OF.REC,Y.REMIT.NUM>,'10"0"R')
        NB.FOUND = FMT(COUNTER.FOR.COMMITMENT,N.LEN:'10"0"R')
        IF NB.GIVEN NE NB.FOUND THEN
            LOG.LEVEL = '1' ; LOG.MESSAGE = 'EB-LOT.UNMATCH.ON.LINES':@FM:Y.REMIT.NUM:@VM:COUNTER.FOR.COMMITMENT:@VM:NB.GIVEN+0
            CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
            IF LOG.LEVEL EQ '2' THEN SW.SKIP = 'Y'
            GOSUB UPDATE.LOG.FILE
        END

        MNT.GIVEN.EDT = FMT(R.LOT.FILES<LOT.FIL.GIVEN.AMOUNT,Y.REMIT.NUM>*1000,'18"0"R')
        MNT.GIVEN = R.LOT.FILES<LOT.FIL.GIVEN.AMOUNT,Y.REMIT.NUM>*100
        MNT.FOUND = FMT(TOTAL.FOR.COMMITMENT*1000,'18"0"R')
        IF MNT.GIVEN.EDT AND MNT.FOUND AND MNT.GIVEN.EDT NE MNT.FOUND THEN
*MODIF ANAS ZDADOU POUR REJET SI MONTANTS DIFFERENTS RENDRE LOG LEVEL A DEUX AU LIEU DE UN
            LOG.LEVEL = '2' ; LOG.MESSAGE = 'EB-LOT.UNMATCH.ON.TOTAL':@FM:Y.REMIT.NUM:@VM:TOTAL.FOR.COMMITMENT:@VM:(MNT.GIVEN+0)/100
            CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
            IF LOG.LEVEL EQ '2' THEN SW.SKIP = 'Y'
            GOSUB UPDATE.LOG.FILE
        END

        IF SW.SKIP EQ 'Y' THEN

            R.SAVE.LOT.FILES = R.LOT.FILES
            FOR IRD = LOT.FIL.REM.HEADER TO LOT.FIL.REM.TRAILER
                R.LOT.FILES<IRD> = ''
                FOR IDR = 1 TO Y.REMIT.NUM - 1
                    R.LOT.FILES<IRD,IDR> = R.SAVE.LOT.FILES<IRD,IDR>
                NEXT IDR
            NEXT IRD
            GOSUB REMOVE.EMPTY.LOT.FILES ; RETURN
        END

        BEGIN CASE
            CASE R.DATA.LAYOUT<CFB.LAY.CUSTOMER.SIGN> EQ 'DB'
                R.LOT.FILES<LOT.FIL.GIVEN.AMOUNT,Y.REMIT.NUM> = -1 * (MNT.GIVEN+0)/100
            CASE R.DATA.LAYOUT<CFB.LAY.CUSTOMER.SIGN> EQ 'CR'
                R.LOT.FILES<LOT.FIL.GIVEN.AMOUNT,Y.REMIT.NUM> = (MNT.GIVEN+0)/100
            CASE 1
                R.LOT.FILES<LOT.FIL.GIVEN.AMOUNT,Y.REMIT.NUM> = ''
        END CASE

        CALC.FILE.REMIT += 1

        SW.REMIT.HEADER = ''

    END

*EPI 16/06/2007 <
    IF SW.COMMIT EQ '' THEN
        GOSUB LOT.DETAIL.UPDATE
        IF RUNNING.UNDER.BATCH ELSE CALL JOURNAL.UPDATE(LOT.DETAIL.ID)
    END
*EPI 16/06/2007 >

    R.LOT.FILES<LOT.FIL.CFONB.LAYOUT,Y.REMIT.NUM> = FIELD(DATA.LAYOUT.ID,".",2,99)
    R.LOT.FILES<LOT.FIL.FOUND.NB.OF.REC,Y.REMIT.NUM> = COUNTER.FOR.COMMITMENT
    R.LOT.FILES<LOT.FIL.LOT.DETAIL.ID,Y.REMIT.NUM> = LOT.DETAIL.ID
    BEGIN CASE
        CASE R.DATA.LAYOUT<CFB.LAY.CUSTOMER.SIGN> EQ 'DB'
            R.LOT.FILES<LOT.FIL.FOUND.AMOUNT,Y.REMIT.NUM> = -1 * TOTAL.FOR.COMMITMENT
        CASE R.DATA.LAYOUT<CFB.LAY.CUSTOMER.SIGN> EQ 'CR'
            R.LOT.FILES<LOT.FIL.FOUND.AMOUNT,Y.REMIT.NUM> = TOTAL.FOR.COMMITMENT
    END CASE

    IF SW.COMMIT EQ '' THEN

*        Check the intergity of the remit if a status ERROR affect the whole remit, send it to the LOT.PENDING

        NB.SPLIT = DCOUNT(R.LOT.WORK<LOT.WRK.SPLITTING.KEY>,@VM)
        IF NB.SPLIT EQ 0 THEN
            N.ERR = 'EB-LOT.NO.SPLIT.KEY':@FM:LOT.DETAIL.ID
            CALL LOT.TRANSLATE.ERROR(N.ERR,'')
            RETURN
        END ELSE
            FOR IKJ = 1 TO NB.SPLIT
                LOCATE FIELD(R.LOT.WORK<LOT.WRK.SPLITTING.KEY,IKJ>,I.SEP,1) IN STA.STATUS.ID<1> SETTING FND THEN
* FIXE ANAS ZDADOU     IF STA.AFFECT.WHOLE.FILE<FND> EQ 'Y' AU LIEU DE IF STA.AFFECT.WHOLE.FILE<FND>
                    IF STA.AFFECT.WHOLE.FILE<FND> EQ 'Y' THEN
                        BEGIN CASE
                            CASE STA.BLOCKAGE.LEVEL<FND> EQ 'ERROR'
                                LOG.LEVEL = ''
                                LOG.MESSAGE = 'EB-LOT.REM.IN.ERROR':@FM:Y.REMIT.NUM:@VM:STA.ISSUED.MESSAGE<FND>
                                CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
                                GOSUB UPDATE.LOG.FILE
                                SW.UNKNOWN.MESSAGE = 'Y' ; EXIT
                            CASE STA.BLOCKAGE.LEVEL<FND> EQ 'OVERRIDE'
                                LOG.LEVEL = ''
                                LOG.MESSAGE = 'EB-LOT.REM.IN.OVERRIDE':@FM:Y.REMIT.NUM:@VM:STA.ISSUED.MESSAGE<FND>
                                CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
                                GOSUB UPDATE.LOG.FILE
                        END CASE
                    END
                END
            NEXT IKJ
        END

*        If the processing date is superior to the allowed forward date the record key is stored in the pending file

        IF MIN.LOADING.DATE EQ '' THEN
            MIN.LOADING.DATE = R.DATES(EB.DAT.TODAY)
            CALL SIT.CDT(REGION,MIN.LOADING.DATE,"+000W")
        END

        IF (MIN.LOADING.DATE AND PENDING.DATE AND MIN.LOADING.DATE GT PENDING.DATE) OR SW.UNKNOWN.MESSAGE EQ 'Y' THEN

            YR.LOT.PENDING.ID = MIN.LOADING.DATE
            GOSUB READ.LOT.PENDING.FILE

*           Store the message identification in the pending file to allow further treatment

            LOCATE YR.LOT.FILES.ID IN R.LOT.PENDING<LOT.ICP.FILE.ID,1> SETTING OKF THEN
                LOCATE Y.REMIT.NUM IN R.LOT.PENDING<LOT.ICP.REMIT.NUM,OKF,1> SETTING JKF ELSE
                    R.LOT.PENDING<LOT.ICP.REMIT.NUM,OKF> := @SM:Y.REMIT.NUM
                    R.LOT.PENDING<LOT.ICP.BLOCK.STATUS,OKF> := @SM
                    CALL F.WRITE(LOT.PENDING.FILE,YR.LOT.PENDING.ID,R.LOT.PENDING)
                END
            END ELSE
                IF R.LOT.PENDING<LOT.ICP.FILE.ID> EQ '' THEN
                    R.LOT.PENDING<LOT.ICP.FILE.ID> = YR.LOT.FILES.ID
                    R.LOT.PENDING<LOT.ICP.REMIT.NUM> = Y.REMIT.NUM
                    R.LOT.PENDING<LOT.ICP.BLOCK.STATUS> = ''
                END ELSE
                    R.LOT.PENDING<LOT.ICP.FILE.ID> := @VM:YR.LOT.FILES.ID
                    R.LOT.PENDING<LOT.ICP.REMIT.NUM> := @VM:Y.REMIT.NUM
                    R.LOT.PENDING<LOT.ICP.BLOCK.STATUS> := @VM
                END
                CALL F.WRITE(LOT.PENDING.FILE,YR.LOT.PENDING.ID,R.LOT.PENDING)
            END

            SET.DATE.EDITED = OCONV(ICONV(MIN.LOADING.DATE,"D"),"D4/E")
            IF SW.UNKNOWN.MESSAGE EQ 'Y' THEN
                MSG.ERR = 'EB-LOT.REJECTED.IN.PENDING':@FM:SET.DATE.EDITED
            END ELSE
                MSG.ERR = 'EB-LOT.DELAYED.IN.PENDING':@FM:SET.DATE.EDITED
            END
            CALL LOT.TRANSLATE.ERROR(MSG.ERR,'')
            R.LOT.FILES<LOT.FIL.REM.COMMENT,Y.REMIT.NUM> = MSG.ERR
        END ELSE

*           Make here the global entries if GLOBAL.ACCOUNTING is set to 'Y'

            GOSUB POST.REMIT.GLOBAL.ENTRY
            IF E THEN
                R.LOT.FILES<LOT.FIL.REM.COMMENT,Y.REMIT.NUM> = E
                R.LOT.WORK<LOT.WRK.IN.REASON.OVE> = E
            END
            R.LOT.WORK<LOT.WRK.GLOBAL.ACCOUNTING> = LOT.GLOBAL.ACCOUNTING
            IF LOT.GLOBAL.ACCOUNTING NE 'Y' THEN MAT R.NEW = ''
            CALL Y.LOT.PROCESS.FROM.WORK('GEN',N.ERR)
        END
        LAST.LAYOUT.ID = ''
        SW.REMIT.TRAILER = 'Y'
    END

    IF SW.COMMIT EQ '' THEN LOT.LOCAL.FIELDS = '' ; R.DATA.RECORD = ''

    GOSUB WRITE.LOT.FILES.FILE

RETURN

***********************************************************************
PROCESS.FILE.TRAILER:
***********************************************************************

    IF SW.FILE.TRAILER EQ 'Y' THEN
        LOG.LEVEL = '' ; LOG.MESSAGE = 'EB-LOT.MANY.FILE.TRAILER'
        CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
        GOSUB UPDATE.LOG.FILE
        RETURN
    END ELSE SW.FILE.TRAILER = 'Y'

    GOSUB CHECK.FILE.HEADER.EXIST

    IF NOT(SW.SKIP) THEN
        R.LOT.FILES<LOT.FIL.FILE.TRAILER> = R.RED.RECORD
        YR.CFONB.LAYOUT.ID = 'INWARD.':ACT.LAYOUT.ID
        GOSUB READ.CFONB.LAYOUT.FILE
        IF R.CFONB.LAYOUT AND SW.CHECK.FILE.TRAILER EQ 'Y' THEN
            LOCATE 'NB.OF.REMITS' IN R.CFONB.LAYOUT<CFB.LAY.FT.FIELD.NAME,1> SETTING FND THEN
                N.BEG = R.CFONB.LAYOUT<CFB.LAY.FIELD.START,FND>
                N.LEN = R.CFONB.LAYOUT<CFB.LAY.FIELD.LENGTH,FND>
                NB.REMIT.GIVEN = R.RED.RECORD[N.BEG,N.LEN]
                NB.REMIT.FOUND = FMT(CALC.FILE.REMIT,N.LEN:'"0"R')
                IF NB.REMIT.GIVEN NE NB.REMIT.FOUND THEN
                    LOG.LEVEL = '1' ; LOG.MESSAGE = 'EB-LOT.UNMATCH.ON.REM.NBR':@FM:CALC.FILE.REMIT:@VM:NB.REMIT.GIVEN+0
                    CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
                    GOSUB UPDATE.LOG.FILE
                END
            END
            LOCATE 'TOTAL.AMOUNT.DB' IN R.CFONB.LAYOUT<CFB.LAY.FT.FIELD.NAME,1> SETTING FND THEN
                N.BEG = R.CFONB.LAYOUT<CFB.LAY.FIELD.START,FND>
                N.LEN = R.CFONB.LAYOUT<CFB.LAY.FIELD.LENGTH,FND>
                MNT.DB.GIVEN = R.RED.RECORD[N.BEG,N.LEN]
                IF R.CFONB.LAYOUT<CFB.LAY.FIELD.TYPE,FND>[1,1] EQ '@' THEN
                    RTN.FMT = FIELD(R.CFONB.LAYOUT<CFB.LAY.FIELD.TYPE,FND>,'@',2)
                    IF RTN.FMT THEN
                        SAVE.COMI = COMI
                        COMI = MNT.DB.GIVEN
                        CALL @RTN.FMT
                        MNT.DB.GIVEN = COMI
                        COMI = SAVE.COMI
                    END
                END
                MNT.DB.GIVEN.EDT = FMT(MNT.DB.GIVEN*1000,N.LEN:'"0"R')
                MNT.DB.FOUND = FMT(CALC.FILE.AMOUNT.DB*1000,N.LEN:'"0"R')
                IF MNT.DB.GIVEN.EDT NE MNT.DB.FOUND THEN
                    LOG.LEVEL = '1' ; LOG.MESSAGE = 'EB-LOT.UNMATCH.GLOBAL.DB':@FM:CALC.FILE.AMOUNT.DB:@VM:(MNT.DB.GIVEN+0)/100
                    CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
                    GOSUB UPDATE.LOG.FILE
                END
            END
            LOCATE 'TOTAL.AMOUNT.CR' IN R.CFONB.LAYOUT<CFB.LAY.FT.FIELD.NAME,1> SETTING FND THEN
                N.BEG = R.CFONB.LAYOUT<CFB.LAY.FIELD.START,FND>
                N.LEN = R.CFONB.LAYOUT<CFB.LAY.FIELD.LENGTH,FND>
                MNT.CR.GIVEN = R.RED.RECORD[N.BEG,N.LEN]
                IF R.CFONB.LAYOUT<CFB.LAY.FIELD.TYPE,FND>[1,1] EQ '@' THEN
                    RTN.FMT = FIELD(R.CFONB.LAYOUT<CFB.LAY.FIELD.TYPE,FND>,'@',2)
                    IF RTN.FMT THEN
                        SAVE.COMI = COMI
                        COMI = MNT.CR.GIVEN
                        CALL @RTN.FMT
                        MNT.CR.GIVEN = COMI
                        COMI = SAVE.COMI
                    END
                END
                MNT.CR.GIVEN.EDT = FMT(MNT.CR.GIVEN*1000,N.LEN:'"0"R')
                MNT.CR.FOUND = FMT(CALC.FILE.AMOUNT.CR*1000,N.LEN:'"0"R')
                IF MNT.CR.GIVEN.EDT NE MNT.CR.FOUND THEN
                    LOG.LEVEL = '1' ; LOG.MESSAGE = 'EB-LOT.UNMATCH.GLOBAL.CR':@FM:CALC.FILE.AMOUNT.CR:@VM:(MNT.CR.GIVEN+0)/100
                    CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
                    GOSUB UPDATE.LOG.FILE
                END
            END
        END
    END

FILE.TRAILER.UPDATE:                     ; * To commit a file even though its trailer is missing
********************

    SW.FILE.HEADER = ''

    IF SW.SKIP EQ 'Y' THEN GOSUB REMOVE.EMPTY.LOT.FILES

    IF SW.SKIP THEN RETURN

    GOSUB WRITE.LOT.FILES.FILE

RETURN

***********************************************************************
REMOVE.EMPTY.LOT.FILES:
***********************************************************************

    IF R.LOT.FILES NE '' THEN
        IF R.LOT.FILES<LOT.FIL.REM.TRAILER,1> THEN RETURN ; * Previous remit already processed to the end
        IF R.LOT.FILES<LOT.FIL.FILE.TRAILER> THEN RETURN ; * Previous file processed to the end
        SW.FILE.EMPTY = 'Y'
        FOR IRD = LOT.FIL.REM.HEADER TO LOT.FIL.REM.TRAILER
            IF R.LOT.FILES<IRD> NE '' THEN SW.FILE.EMPTY = 'N'
        NEXT IRD
        IF SW.FILE.EMPTY EQ 'Y' THEN
            CALL F.DELETE(LOT.FILES.FILE,YR.LOT.FILES.ID)
            R.LOT.CONCAT = '' ; ER = ''
            CALL F.READ(LOT.CONCAT.FILE,Y.PROCESS.DATE,R.LOT.CONCAT,F.LOT.CONCAT,ER)
            IF NOT(ER) THEN
                IF R.LOT.CONCAT EQ YR.LOT.FILES.ID THEN
                    CALL F.DELETE(LOT.CONCAT.FILE,Y.PROCESS.DATE)
                END ELSE
                    R.LOT.CONCAT.SAVE = R.LOT.CONCAT
                    R.LOT.CONCAT = '' ; IEC = 0
                    NB.CON.FIL = DCOUNT(R.LOT.CONCAT.SAVE,@VM)
                    FOR IRD = 1 TO NB.CON.FIL
                        IF R.LOT.CONCAT.SAVE<1,IRD> NE YR.LOT.FILES.ID THEN
                            IEC += 1 ; R.LOT.CONCAT<1,IEC> = R.LOT.CONCAT.SAVE<1,IRD>
                        END
                    NEXT IRD
                    IF IEC LT NB.CON.FIL THEN
                        CALL F.WRITE(LOT.CONCAT.FILE,Y.PROCESS.DATE,R.LOT.CONCAT)
                    END
                END
            END
        END
    END

RETURN

***********************************************************************
POST.REMIT.GLOBAL.ENTRY:
***********************************************************************

    MAT R.NEW = '' ; SW.EB.ACCOUNTING = '' ; SW.REFUSAL = ''

    CURR.NO = 0 ; E = '' ; TEXT = '' ; SW.GEN.FT = ''

    R.LOT.WORK<LOT.WRK.PROCESS.TYPE> = LOT.PROCESS.TYPE
    R.LOT.WORK<LOT.WRK.ONE.BY.ONE.PROCESS> = LOT.ONE.BY.ONE.PROCESS
    R.LOT.WORK<LOT.WRK.ONLY.FOR.CUSTOMERS> = LOT.ONLY.FOR.CUSTOMERS

    IF LOT.GLOBAL.ACCOUNTING NE 'Y' AND LOT.GLOBAL.ACCOUNTING NE 'FT' THEN RETURN

    IF LOT.PROCESS.TYPE[1,2] EQ 'NO' THEN
        MSG.ERR = 'EB-LOT.NO.ACCOUNTING'
        CALL LOT.TRANSLATE.ERROR(MSG.ERR,'') ; E = MSG.ERR
        LOT.GLOBAL.ACCOUNTING = '' ; RETURN
    END

*     IF R.LOT.FILES<LOT.FIL.FOUND.NB.OF.REC,Y.REMIT.NUM> > 1 AND LOT.ONE.BY.ONE.PROCESS THEN
*        LOT.GLOBAL.ACCOUNTING = '' ; RETURN
*     END

    CLEAR.CCY = R.LOT.PARAMETER<LOT.PAR.CLEAR.CURRENCY>
    CLEAR.CCY.MKT = R.LOT.PARAMETER<LOT.PAR.CLEAR.CCY.MARKET>
    CALL Y.CLEAR.SITCOM

*     Check and calculate the customer's fields for a global accounting

    WORK.LOT.SPLIT = ''
    WORK.LOT.KEY = ''
    DIFFERENT.LOT.KEY = ''
    WORK.FILE.BLOCKAGE.MESSAGE = ''
    SW.OTHER.APPL = 'N'

    GLO.STATUS = '.'

    NB.SPLIT = DCOUNT(R.LOT.WORK<LOT.WRK.SPLITTING.KEY>,@VM)
    FOR IJK = 1 TO NB.SPLIT
        WORK.LOT.SPLIT<IJK> = R.LOT.WORK<LOT.WRK.SPLITTING.KEY,IJK>
        WORK.LOT.KEY<IJK> = R.LOT.WORK<LOT.WRK.SPLITTING.KEY,IJK>
        CHANGE I.SEP TO @VM IN WORK.LOT.KEY<IJK>
        LOCATE WORK.LOT.KEY<IJK,2> IN DST.DESTINATION.ID<1> SETTING FNN THEN
            IF DST.APPLICATION.DEST<FNN> EQ 'EB.ACCOUNTING' OR DST.APPLICATION.DEST<FNN> EQ 'LOT.PROCESS' THEN
                IF LOT.ONE.BY.ONE.PROCESS NE 'Y' OR LOT.ONLY.FOR.CUSTOMERS NE 'Y' THEN SW.OTHER.APPL = 'Y'
            END ELSE SW.OTHER.APPL = 'Y'
        END ELSE SW.OTHER.APPL = 'Y'
        LOCATE WORK.LOT.KEY<IJK,1> IN STA.STATUS.ID<1> SETTING FND THEN
            IF GLO.STATUS EQ '.' THEN GLO.STATUS = WORK.LOT.KEY<IJK,1>
            WORK.LOT.KEY<IJK,1,1> = STA.LOT.SPLITTING<FND>
            WORK.LOT.KEY<IJK,1,2> = STA.BLOCKAGE.LEVEL<FND>
            WORK.LOT.KEY<IJK,1,3> = STA.ISSUED.MESSAGE<FND>
            IF STA.AFFECT.WHOLE.FILE<FND> EQ 'Y' AND STA.BLOCKAGE.LEVEL<FND> EQ 'ERROR' THEN
                WORK.FILE.BLOCKAGE.MESSAGE<-1> = STA.ISSUED.MESSAGE<FND>
            END
        END ELSE WORK.LOT.KEY<IJK,1> = @SM:@SM ; GLO.STATUS = ''
        LOCATE WORK.LOT.KEY<IJK,2> IN LOT.DESTINATION<1> SETTING FDN THEN
            WORK.LOT.KEY<IJK,2,1> = LOT.TECH.CATEGORY<FDN>
            WORK.LOT.KEY<IJK,2,2> = LOT.TECH.ACCT.NO<FDN>
            WORK.LOT.KEY<IJK,2,3> = LOT.FTTC.ID<FDN>
        END ELSE WORK.LOT.KEY<IJK,2> = @SM:@SM
        IF DIFFERENT.LOT.KEY EQ '' THEN
            DIFFERENT.LOT.KEY = WORK.LOT.KEY<IJK>
        END ELSE
            LOCATE WORK.LOT.KEY<IJK> IN DIFFERENT.LOT.KEY<1> SETTING DEJA ELSE
                DIFFERENT.LOT.KEY<-1> = WORK.LOT.KEY<IJK>
            END
        END
    NEXT IJK

    IF GLO.STATUS EQ '.' THEN GLO.STATUS = ''

    IF WORK.FILE.BLOCKAGE.MESSAGE THEN
        E = LOWER(WORK.FILE.BLOCKAGE.MESSAGE)
        LOT.GLOBAL.ACCOUNTING = '' ; RETURN
    END

    GLO.CONTRACT.ID = DIFFERENT.LOT.KEY<1,3>
    GLO.CUST.BANK = DIFFERENT.LOT.KEY<1,4>
    GLO.CUST.GUICHET = DIFFERENT.LOT.KEY<1,5>
    GLO.CUST.RIB.ACCOUNT = DIFFERENT.LOT.KEY<1,6>
    GLO.CUST.ACCOUNT = DIFFERENT.LOT.KEY<1,7>
    GLO.CURRENCY = DIFFERENT.LOT.KEY<1,9>
    GLO.FTTC.ID = DIFFERENT.LOT.KEY<1,2,3>
    IF DIFFERENT.LOT.KEY<1,1,3> NE '' THEN
        IF LOT.ONE.BY.ONE.PROCESS EQ 'NO' THEN
            TEXT = DIFFERENT.LOT.KEY<1,1,3>
            IF WORK.LOT.KEY<1,1,2> EQ 'ERROR' THEN E = TEXT
            GOSUB UPDATE.OVERRIDE
            IF E THEN LOT.GLOBAL.ACCOUNTING = '' ; RETURN
        END
    END
    GLO.VALUE.DATE = DIFFERENT.LOT.KEY<1,8>
    GLO.PROCESSING.DATE = DIFFERENT.LOT.KEY<1,10>
    GLO.TECH.CATEGORY = DIFFERENT.LOT.KEY<1,2,1>
    GLO.TECH.ACCT.NO = DIFFERENT.LOT.KEY<1,2,2>
    SW.SAME.GLO.TECH = ''

*     CONTRACT.ID, CUST.ACCOUNT, CURRENCY and FTTC.ID should be the same. If so, depending
*     on the sign, we take the highest or the lowest VALUE.DATE and PROCESSING.DATE
    Y.GL.CNT = DCOUNT(DIFFERENT.LOT.KEY,@FM)
    FOR IJK = 2 TO Y.GL.CNT
        IF GLO.CONTRACT.ID NE DIFFERENT.LOT.KEY<IJK,3> THEN
            MSG.ERR = 'EB-LOT.MANY.CONTRACT'
            CALL LOT.TRANSLATE.ERROR(MSG.ERR,'')
            E = MSG.ERR
            LOT.GLOBAL.ACCOUNTING = '' ; RETURN
        END
        IF GLO.CUST.BANK NE DIFFERENT.LOT.KEY<IJK,4> THEN
            MSG.ERR = 'EB-LOT.MANY.BANK'
            CALL LOT.TRANSLATE.ERROR(MSG.ERR,'')
            E = MSG.ERR
            LOT.GLOBAL.ACCOUNTING = '' ; RETURN
        END
        IF GLO.CUST.GUICHET NE DIFFERENT.LOT.KEY<IJK,5> THEN
            MSG.ERR = 'EB-LOT.MANY.BRANCH'
            CALL LOT.TRANSLATE.ERROR(MSG.ERR,'')
            E = MSG.ERR
            LOT.GLOBAL.ACCOUNTING = '' ; RETURN
        END
        IF GLO.CUST.RIB.ACCOUNT NE DIFFERENT.LOT.KEY<IJK,6> THEN
            MSG.ERR = 'EB-LOT.MANY.RIB'
            CALL LOT.TRANSLATE.ERROR(MSG.ERR,'')
            E = MSG.ERR
            LOT.GLOBAL.ACCOUNTING = '' ; RETURN
        END
        IF GLO.CUST.ACCOUNT NE DIFFERENT.LOT.KEY<IJK,7> THEN
            MSG.ERR = 'EB-LOT.MANY.ACCOUNT'
            CALL LOT.TRANSLATE.ERROR(MSG.ERR,'')
            E = MSG.ERR
            LOT.GLOBAL.ACCOUNTING = '' ; RETURN
        END
        IF GLO.CURRENCY NE DIFFERENT.LOT.KEY<IJK,9> THEN
            MSG.ERR = 'EB-LOT.MANY.CURRENCY'
            CALL LOT.TRANSLATE.ERROR(MSG.ERR,'')
            E = MSG.ERR
            LOT.GLOBAL.ACCOUNTING = '' ; RETURN
        END
        IF GLO.FTTC.ID NE DIFFERENT.LOT.KEY<IJK,2,3> THEN
            MSG.ERR = 'EB-LOT.MANY.CONDITION'
            CALL LOT.TRANSLATE.ERROR(MSG.ERR,'')
            TEXT = MSG.ERR
            E = TEXT
            GOSUB UPDATE.OVERRIDE
            IF E THEN LOT.GLOBAL.ACCOUNTING = '' ; RETURN
        END
        IF DIFFERENT.LOT.KEY<IJK,1,3> NE '' THEN
            IF LOT.ONE.BY.ONE.PROCESS EQ 'NO' THEN
                TEXT = DIFFERENT.LOT.KEY<IJK,1,3>
                IF WORK.LOT.KEY<IJK,1,2> EQ 'ERROR' THEN E = TEXT
                GOSUB UPDATE.OVERRIDE
                IF E THEN LOT.GLOBAL.ACCOUNTING = '' ; RETURN
            END
        END
        IF GLO.VALUE.DATE NE DIFFERENT.LOT.KEY<IJK,8> THEN
            MSG.ERR = 'EB-LOT.MANY.VALUE.DATE'
            CALL LOT.TRANSLATE.ERROR(MSG.ERR,'')
            TEXT = MSG.ERR
            E = TEXT
            GOSUB UPDATE.OVERRIDE
            IF E THEN LOT.GLOBAL.ACCOUNTING = '' ; RETURN
        END
        IF GLO.PROCESSING.DATE NE DIFFERENT.LOT.KEY<IJK,10> THEN
            MSG.ERR = 'EB-LOT.MANY.PROCESSING.DATE'
            CALL LOT.TRANSLATE.ERROR(MSG.ERR,'')
            TEXT = MSG.ERR
            E = TEXT
            GOSUB UPDATE.OVERRIDE
            IF E THEN LOT.GLOBAL.ACCOUNTING = '' ; RETURN
        END
        IF GLO.TECH.CATEGORY NE DIFFERENT.LOT.KEY<IJK,2,1> THEN SW.SAME.GLO.TECH = 'N'
        IF GLO.TECH.ACCT.NO NE DIFFERENT.LOT.KEY<IJK,2,2> THEN SW.SAME.GLO.TECH = 'N'
        BEGIN CASE
            CASE R.DATA.LAYOUT<CFB.LAY.CUSTOMER.SIGN> EQ 'DB'
                IF GLO.VALUE.DATE GT DIFFERENT.LOT.KEY<IJK,8> THEN GLO.VALUE.DATE = DIFFERENT.LOT.KEY<IJK,8>
                IF GLO.PROCESSING.DATE GT DIFFERENT.LOT.KEY<IJK,10> THEN GLO.PROCESSING.DATE = DIFFERENT.LOT.KEY<IJK,10>
            CASE R.DATA.LAYOUT<CFB.LAY.CUSTOMER.SIGN> EQ 'CR'
                IF GLO.VALUE.DATE LT DIFFERENT.LOT.KEY<IJK,8> THEN GLO.VALUE.DATE = DIFFERENT.LOT.KEY<IJK,8>
                IF GLO.PROCESSING.DATE LT DIFFERENT.LOT.KEY<IJK,10> THEN GLO.PROCESSING.DATE = DIFFERENT.LOT.KEY<IJK,10>
        END CASE
    NEXT IJK

    IF GLO.CUST.ACCOUNT EQ '' THEN
        MSG.ERR = 'EB-LOT.MISSING.CUST.ACCOUNT'
        CALL LOT.TRANSLATE.ERROR(MSG.ERR,'')
        E = MSG.ERR
        LOT.GLOBAL.ACCOUNTING = '' ; RETURN
    END ELSE
        ER = '' ; R.CUST.ACCOUNT = ''
        ACCT.ID = GLO.CUST.ACCOUNT
        CALL F.READ(ACCOUNT.FILE,ACCT.ID,R.CUST.ACCOUNT,FBNK.ACCOUNT,ER)
        IF ER THEN
            MSG.ERR = 'EB-LOT.UNKNOWN.CUST.ACCOUNT':@FM:ACCT.ID
            CALL LOT.TRANSLATE.ERROR(MSG.ERR,'')
            E = MSG.ERR
            LOT.GLOBAL.ACCOUNTING = '' ; RETURN
        END
    END

*     Simulation of a LOT.PROCESS for the accounting entries generation

    R.NEW(LOT.PRO.TRANSACTION.TYPE) = GLO.FTTC.ID
    R.NEW(LOT.PRO.PROCESSING.DATE) = GLO.PROCESSING.DATE

    ID.NEW = LOT.DETAIL.ID             ; *YR.LOT.FILES.ID:'-':Y.REMIT.NUM

    IF SW.SAME.GLO.TECH EQ 'N' OR (GLO.TECH.CATEGORY EQ '' AND GLO.TECH.ACCT.NO EQ '') THEN

*        If several technical accounts are to be used, we take the one from
*        LOT.PARAMETER one for GLOBAL.ACCOUNTING and use it against each of
*        the technical accounts in the generated LOT.PROCESS records.

        BEGIN CASE
            CASE R.DATA.LAYOUT<CFB.LAY.CUSTOMER.SIGN> EQ 'DB'
                GLO.TECH.CATEGORY = LOT.DEF.TECH.CATEG.DB
                GLO.TECH.ACCT.NO = LOT.DEF.TECH.ACCT.DB
            CASE R.DATA.LAYOUT<CFB.LAY.CUSTOMER.SIGN> EQ 'CR'
                GLO.TECH.CATEGORY = LOT.DEF.TECH.CATEG.CR
                GLO.TECH.ACCT.NO = LOT.DEF.TECH.ACCT.CR
        END CASE
    END

    BEGIN CASE
        CASE R.DATA.LAYOUT<CFB.LAY.CUSTOMER.SIGN> EQ 'DB'
            DEBIT.ACCT.NO = GLO.CUST.ACCOUNT
            DEBIT.THEIR.REF = ID.NEW:'.':Y.REMIT.NUM
            R.DEBIT.ACCT = R.CUST.ACCOUNT
            IF GLO.TECH.CATEGORY THEN
                N.CATEGORY = GLO.TECH.CATEGORY
                GOSUB GET.ACCOUNT.FROM.CATEGORY
                GLO.TECH.ACCT.NO = N.ACCT.NO
                CREDIT.ACCT.NO = GLO.TECH.ACCT.NO
                R.CREDIT.ACCT = N.ACCOUNT
            END ELSE
                CREDIT.ACCT.NO = GLO.TECH.ACCT.NO
                IF GLO.TECH.ACCT.NO EQ LOT.DEF.TECH.CATEG.DB THEN
                    R.CREDIT.ACCT = R.LOT.DEF.TECH.ACCT.DB
*EPI 2007/04/27 <
                END ELSE
                    ACCT.ID = GLO.TECH.ACCT.NO
                    GOSUB READ.ACCOUNT.FILE
                    R.CREDIT.ACCT = R.ACCOUNT
*EPI 2007/04/27 >
                END
            END
            ACCY.AMOUNT.CREDITED = TOTAL.FOR.COMMITMENT
            IF LCCY NE R.CREDIT.ACCT<AC.CURRENCY> THEN
                CCY1 = R.CREDIT.ACCT<AC.CURRENCY> ; AMT1 = ACCY.AMOUNT.CREDITED
                CCY2 = LCCY ; AMT2 = ""
                GOSUB CALC.EXCHRATE
                LCCY.AMOUNT.CREDITED = AMT2
            END ELSE
                LCCY.AMOUNT.CREDITED = TOTAL.FOR.COMMITMENT
            END
            CREDIT.VALUE.DATE = GLO.VALUE.DATE
            MSG.REF = 'EB-LOT.MSG.REFERENCE':@FM:ID.NEW:@VM:Y.REMIT.NUM
            CALL LOT.TRANSLATE.ERROR(MSG.REF,'')
            CREDIT.THEIR.REF = MSG.REF
        CASE R.DATA.LAYOUT<CFB.LAY.CUSTOMER.SIGN> EQ 'CR'
            CREDIT.ACCT.NO = GLO.CUST.ACCOUNT
            R.CREDIT.ACCT = R.CUST.ACCOUNT
            CREDIT.THEIR.REF = ID.NEW:'.':Y.REMIT.NUM
            IF GLO.TECH.CATEGORY THEN
                N.CATEGORY = GLO.TECH.CATEGORY
                GOSUB GET.ACCOUNT.FROM.CATEGORY
                GLO.TECH.ACCT.NO = N.ACCT.NO
                DEBIT.ACCT.NO = GLO.TECH.ACCT.NO
                R.DEBIT.ACCT = N.ACCOUNT
            END ELSE
                DEBIT.ACCT.NO = GLO.TECH.ACCT.NO
                IF GLO.TECH.ACCT.NO EQ LOT.DEF.TECH.CATEG.CR THEN
                    R.DEBIT.ACCT = R.LOT.DEF.TECH.ACCT.CR
*EPI 2007/04/27 <
                END ELSE
                    ACCT.ID = GLO.TECH.ACCT.NO
                    GOSUB READ.ACCOUNT.FILE
                    R.DEBIT.ACCT = R.ACCOUNT
*EPI 2007/04/27 >
                END
            END
            ACCY.AMOUNT.DEBITED = TOTAL.FOR.COMMITMENT
            IF LCCY NE R.DEBIT.ACCT<AC.CURRENCY> THEN
                CCY1 = R.DEBIT.ACCT<AC.CURRENCY> ; AMT1 = ACCY.AMOUNT.DEBITED
                CCY2 = LCCY ; AMT2 = ""
                GOSUB CALC.EXCHRATE
                LCCY.AMOUNT.DEBITED = AMT2
            END ELSE
                LCCY.AMOUNT.DEBITED = TOTAL.FOR.COMMITMENT
            END
            DEBIT.VALUE.DATE = GLO.VALUE.DATE
            MSG.REF = 'EB-LOT.MSG.REFERENCE':@FM:ID.NEW:@VM:Y.REMIT.NUM
            CALL LOT.TRANSLATE.ERROR(MSG.REF,'')
            DEBIT.THEIR.REF = MSG.REF
        CASE 1
            IF LOT.COMMISSION.CODE EQ 'DEBIT PLUS CHARGES' OR LOT.CHARGE.CODE EQ 'DEBIT PLUS CHARGES' THEN
                CHARGE.ACCT.NO = GLO.CUST.ACCOUNT
                R.CHARGE.ACCT.NO = R.CUST.ACCOUNT
            END
    END CASE

    R.NEW(LOT.PRO.OUR.GUICHET) = GLO.CUST.GUICHET
    R.NEW(LOT.PRO.RIB.ACCOUNT) = GLO.CUST.RIB.ACCOUNT
    R.NEW(LOT.PRO.INITIAL.ACCOUNT) = GLO.CUST.ACCOUNT
 
    R.NEW(LOT.PRO.CREDIT.ACCT.NO) = CREDIT.ACCT.NO
    R.NEW(LOT.PRO.DEBIT.ACCT.NO) = DEBIT.ACCT.NO
    R.NEW(LOT.PRO.CREDIT.VALUE.DATE) = CREDIT.VALUE.DATE
    R.NEW(LOT.PRO.DEBIT.VALUE.DATE) = DEBIT.VALUE.DATE
    R.NEW(LOT.PRO.CREDIT.THEIR.REF) = CREDIT.THEIR.REF
    R.NEW(LOT.PRO.DEBIT.THEIR.REF) = DEBIT.THEIR.REF
    R.NEW(LOT.PRO.CREDIT.AMOUNT) = ACCY.AMOUNT.CREDITED
    R.NEW(LOT.PRO.DEBIT.AMOUNT) = ACCY.AMOUNT.DEBITED
    R.NEW(LOT.PRO.CREDIT.CURRENCY) = R.CREDIT.ACCT<AC.CURRENCY>
    R.NEW(LOT.PRO.DEBIT.CURRENCY) = R.DEBIT.ACCT<AC.CURRENCY>
    R.NEW(LOT.PRO.CHARGE.ACCT.NO) = CHARGE.ACCT.NO
    R.NEW(LOT.PRO.COMMISSION.CODE) = LOT.COMMISSION.CODE
    R.NEW(LOT.PRO.CHARGE.CODE) = LOT.CHARGE.CODE
    TRAV.NARR = LAST.LAYOUT.ID
    CHANGE '*' TO '-' IN TRAV.NARR
    IF COUNTER.FOR.COMMITMENT GT 1 THEN
        MSG.REF = 'EB-LOT.MSG.NARRN':@FM:COUNTER.FOR.COMMITMENT:@VM:TRAV.NARR:@VM:ID.NEW
        CALL LOT.TRANSLATE.ERROR(MSG.REF,'')
    END ELSE
        MSG.REF = 'EB-LOT.MSG.NARR1':@FM:COUNTER.FOR.COMMITMENT:@VM:TRAV.NARR:@VM:ID.NEW
        CALL LOT.TRANSLATE.ERROR(MSG.REF,'')
    END
    PAYMENT.DETAILS = MSG.REF
    R.NEW(LOT.PRO.PAYMENT.DETAILS) = PAYMENT.DETAILS

    CUSTOMER.SIGN = R.DATA.LAYOUT<CFB.LAY.CUSTOMER.SIGN>
    IF R.DATA.LAYOUT<CFB.LAY.ONLY.FOR.CUSTOMERS> EQ 'Y' THEN
        BEGIN CASE
            CASE R.DATA.LAYOUT<CFB.LAY.CUSTOMER.SIGN> EQ 'CR'
                CUSTOMER.SIGN = 'DB'
            CASE R.DATA.LAYOUT<CFB.LAY.CUSTOMER.SIGN> EQ 'DB'
                CUSTOMER.SIGN = 'CR'
        END CASE
    END

    PROCESSING.DATE = R.NEW(LOT.PRO.PROCESSING.DATE)

*     Cross validation routines are run from here

*     IF LOT.ONE.BY.ONE.PROCESS = 'NO' THEN ;* EPI 19/02/2009
    VAL.RTN = '' ; NB.RTN = 0
    Y.LOT.CNT = DCOUNT(R.LOT.PARAMETER<LOT.PAR.CROSS.VAL.RTN>,@VM)
    FOR ILD = 1 TO Y.LOT.CNT
        RTN.ID = TRIM(FIELD(R.LOT.PARAMETER<LOT.PAR.CROSS.VAL.RTN,ILD>,"@",2))
        IF RTN.ID THEN NB.RTN += 1 ; VAL.RTN<1,NB.RTN> = RTN.ID
    NEXT ILD
    Y.TR.CNT = DCOUNT(R.DATA.LAYOUT<CFB.LAY.CROSS.VAL.RTN>,@VM)
    FOR ILD = 1 TO Y.TR.CNT
        RTN.ID = TRIM(FIELD(R.DATA.LAYOUT<CFB.LAY.CROSS.VAL.RTN,ILD>,"@",2))
        IF RTN.ID THEN NB.RTN += 1 ; VAL.RTN<1,NB.RTN> = RTN.ID
    NEXT ILD

    FOR ILD = 1 TO NB.RTN
        SAVE.COMI = COMI ; COMI = ''
        Y.VAL.RTN = VAL.RTN<1,ILD>
        CALL @Y.VAL.RTN
        IF ETEXT THEN
            E = ETEXT ; ETEXT = ''
            COMI = SAVE.COMI
            LOT.GLOBAL.ACCOUNTING = '' ; RETURN
        END ELSE
            IF COMI THEN
                TEXT = COMI
                GOSUB UPDATE.OVERRIDE
                IF E THEN LOT.GLOBAL.ACCOUNTING = '' ; RETURN
            END
            COMI = SAVE.COMI
        END
    NEXT ILD
*     END ;* EPI 19/02/2009

    PROCESSING.DATE.IN.FT = PROCESSING.DATE
    PROCESSING.DATE = R.NEW(LOT.PRO.PROCESSING.DATE)

    GOSUB CHECK.FTTC.NEEDED
    IF SW.FTTC.NEEDED EQ 1 AND R.NEW(LOT.PRO.TRANSACTION.TYPE) EQ '' THEN
        MSG.ERR = 'EB-LOT.MISSING.CONDITIONS'
        CALL LOT.TRANSLATE.ERROR(MSG.ERR,'') ; E = MSG.ERR
        LOT.GLOBAL.ACCOUNTING = '' ; RETURN
    END
    YR.FTTC.ID = R.NEW(LOT.PRO.TRANSACTION.TYPE)
    IF YR.FTTC.ID NE '' THEN
        GOSUB READ.FT.TXN.TYPE.CONDITION.FILE
        IF ER THEN
            MSG.ERR = 'EB-LOT.UNKNOWN.CONDITIONS':@FM:YR.FTTC.ID
            CALL LOT.TRANSLATE.ERROR(MSG.ERR,'') ; E = MSG.ERR
            LOT.GLOBAL.ACCOUNTING = '' ; RETURN
        END
    END

    CUSTOMER.SIGN = R.DATA.LAYOUT<CFB.LAY.CUSTOMER.SIGN>

    GOSUB CHECK.VALUE.DATES
    IF E THEN
        LOT.GLOBAL.ACCOUNTING = '' ; RETURN
    END ELSE
        IF TEXT THEN
            GOSUB UPDATE.OVERRIDE
            IF E THEN LOT.GLOBAL.ACCOUNTING = '' ; RETURN
        END
    END

    GOSUB CALCULATE.CHARGES
    IF E THEN
        LOT.GLOBAL.ACCOUNTING = '' ; RETURN
    END ELSE
        IF TEXT THEN
            GOSUB UPDATE.OVERRIDE
            IF E THEN LOT.GLOBAL.ACCOUNTING = '' ; RETURN
        END
    END

    IF ACCY.AMOUNT.CREDITED+0 LT 0 THEN
        MSG.ERR = 'EB-LOT.FEES.ABOVE.CREDIT.AMT'
        CALL LOT.TRANSLATE.ERROR(MSG.ERR,'') ; E = MSG.ERR
        LOT.GLOBAL.ACCOUNTING = '' ; RETURN
    END
    IF ACCY.AMOUNT.DEBITED+0 LT 0 THEN
        MSG.ERR = 'EB-LOT.FEES.ABOVE.DEBIT.AMT'
        CALL LOT.TRANSLATE.ERROR(MSG.ERR,''); TEXT = MSG.ERR
        GOSUB UPDATE.OVERRIDE
        IF E THEN LOT.GLOBAL.ACCOUNTING = '' ; RETURN
    END

    IF SW.OTHER.APPL EQ 'N' THEN

*        In order to suppress the second entry at LOT.FILES level

        BEGIN CASE
            CASE R.DATA.LAYOUT<CFB.LAY.CUSTOMER.SIGN> EQ 'DB'
                ACCY.AMOUNT.CREDITED = ''
            CASE R.DATA.LAYOUT<CFB.LAY.CUSTOMER.SIGN> EQ 'CR'
                ACCY.AMOUNT.DEBITED = ''
        END CASE
    END

    TRANS.ID = ID.NEW
    LOCATE 'LOT.FILES' IN R.LOT.PARAMETER<LOT.PAR.APPLICATION.ID,1> SETTING OHY THEN
        TRANS.ID := @FM:R.LOT.PARAMETER<LOT.PAR.EB.SYSTEM.ID,OHY>
    END

    BEGIN CASE
        CASE LOT.GLOBAL.ACCOUNTING EQ 'FT'
            LOT.GLOBAL.ACCOUNTING = 'Y'
            SW.GEN.FT = 'Y'
        CASE LOT.PROCESS.TYPE EQ 'REJ'
            MSG.REF = 'EB-LOT.REJECT.ENTRY'
            CALL LOT.TRANSLATE.ERROR(MSG.REF,'') ; E = MSG.REF
            LOT.GLOBAL.ACCOUNTING = '' ; RETURN
        CASE LOT.PROCESS.TYPE EQ 'MAN'
            MSG.REF = 'EB-LOT.MANUAL.ENTRY'
            CALL LOT.TRANSLATE.ERROR(MSG.REF,'') ; E = MSG.REF
            LOT.GLOBAL.ACCOUNTING = '' ; RETURN
        CASE LOT.PROCESS.TYPE[1,2] EQ 'NO'
        CASE LOT.PROCESS.TYPE EQ 'SFT' OR LOT.PROCESS.TYPE EQ 'SNP' OR LOT.PROCESS.TYPE EQ 'ALL'
            SW.EB.ACCOUNTING = ''
            CURR.NO.BEFORE.EB.ACCOUNTING = CURR.NO
            CALL SIT.FUP.ACCOUNTING(TRANS.ID,'','A','SNP')
            IF E THEN
                FIRST.TEXT = TEXT<1,1>
                SW.EB.ACCOUNTING = 'Y'
                GOSUB UPDATE.OVERRIDE
                IF E EQ '' THEN

*                 See if any other EB.ACCOUNTING override is blocking the operator

                    SAVE.RUNNING.UNDER.BATCH = RUNNING.UNDER.BATCH
                    RUNNING.UNDER.BATCH = 1
*                 SAVE.OVE$FORCE.OVERRIDES = OVE$FORCE.OVERRIDES
*                 OVE$FORCE.OVERRIDES = 1
                    CALL SIT.FUP.ACCOUNTING(TRANS.ID,'','A','VAL')
                    RUNNING.UNDER.BATCH = SAVE.RUNNING.UNDER.BATCH
*                 OVE$FORCE.OVERRIDES = SAVE.OVE$FORCE.OVERRIDES
                    E.BLOKAGE = ''
                    Y.BEF.CNT = DCOUNT(R.NEW(LOT.PRO.OVERRIDE),@VM)
                    FOR IGG = CURR.NO.BEFORE.EB.ACCOUNTING+1 TO Y.BEF.CNT
                        TEXT = R.NEW(LOT.PRO.OVERRIDE)<1,IGG>
                        CHANGE '{' TO @FM IN TEXT
                        CHANGE '}' TO @VM IN TEXT
                        IF TEXT<1,1> NE FIRST.TEXT THEN
                            GOSUB UPDATE.OVERRIDE
                            IF E AND E.BLOKAGE EQ '' THEN E.BLOKAGE = E
                        END
                    NEXT IGG
                    IF E.BLOKAGE NE '' THEN
                        E = E.BLOKAGE
* EPI 14/01/2008 <
                        SAVE.RUNNING.UNDER.BATCH = RUNNING.UNDER.BATCH
                        RUNNING.UNDER.BATCH = 1
                        CALL EB.ACCOUNTING("ACC","DEL","","")
                        RUNNING.UNDER.BATCH = SAVE.RUNNING.UNDER.BATCH
                        R.NEW(LOT.PRO.STATEMENT.NOS) = ''
* EPI 14/01/2008 >
                    END ELSE SW.EB.ACCOUNTING = ''
                END
            END
            IF E THEN
* EPI 29/01/2008 <
                IF LOT.PROCESS.TYPE EQ 'SFT' AND SW.OTHER.APPL EQ 'Y' THEN

*                 Generation of a manual FT to book the GLOBAL.ACCOUNTING later anyway

                    SW.GEN.FT = 'Y'

                END ELSE LOT.GLOBAL.ACCOUNTING = '' ; RETURN
* EPI 29/01/2008 >
            END ELSE
                IF SW.EB.ACCOUNTING EQ '' THEN
                    CALL SIT.FUP.ACCOUNTING(TRANS.ID,'','A','AUT')
                END ELSE
                    CALL SIT.FUP.ACCOUNTING(TRANS.ID,'','A','SAO')
                END
                IF SW.OTHER.APPL EQ 'N' THEN R.LOT.WORK<LOT.WRK.ONLY.ONE.ENTRY> = 'Y'
            END
            SW.EB.ACCOUNTING = '' ;* EPI 10/11/2006
        CASE 1
            CALL SIT.FUP.ACCOUNTING(TRANS.ID,'','A','SAO')
            IF SW.OTHER.APPL EQ 'N' THEN R.LOT.WORK<LOT.WRK.ONLY.ONE.ENTRY> = 'Y'
    END CASE

    R.LOT.WORK<LOT.WRK.CONTRACT.ID> = GLO.CONTRACT.ID
    R.LOT.WORK<LOT.WRK.LOT.STATUS.CODE> =  GLO.STATUS
    R.LOT.WORK<LOT.WRK.DESCRIPTION> = LOT.DESCRIPTION
    R.LOT.WORK<LOT.WRK.INWARD.CODE> = DATA.LAYOUT.ID
    R.LOT.WORK<LOT.WRK.OUR.GUICHET> = GLO.CUST.GUICHET
    R.LOT.WORK<LOT.WRK.RIB.ACCOUNT> = GLO.CUST.RIB.ACCOUNT
    R.LOT.WORK<LOT.WRK.INITIAL.ACCOUNT> = GLO.CUST.ACCOUNT
    R.LOT.WORK<LOT.WRK.TRANSACTION.TYPE> = GLO.FTTC.ID
    R.LOT.WORK<LOT.WRK.CREDIT.ACCT.NO> = R.NEW(LOT.PRO.CREDIT.ACCT.NO)
    R.LOT.WORK<LOT.WRK.DEBIT.ACCT.NO> = R.NEW(LOT.PRO.DEBIT.ACCT.NO)
    R.LOT.WORK<LOT.WRK.CREDIT.VALUE.DATE> = R.NEW(LOT.PRO.CREDIT.VALUE.DATE)
    R.LOT.WORK<LOT.WRK.DEBIT.VALUE.DATE> = R.NEW(LOT.PRO.DEBIT.VALUE.DATE)
    R.LOT.WORK<LOT.WRK.CREDIT.THEIR.REF> = R.NEW(LOT.PRO.CREDIT.THEIR.REF)
    R.LOT.WORK<LOT.WRK.DEBIT.THEIR.REF> = R.NEW(LOT.PRO.DEBIT.THEIR.REF)
    R.LOT.WORK<LOT.WRK.CREDIT.AMOUNT> = R.NEW(LOT.PRO.CREDIT.AMOUNT)
    R.LOT.WORK<LOT.WRK.DEBIT.AMOUNT> = R.NEW(LOT.PRO.DEBIT.AMOUNT)
    R.LOT.WORK<LOT.WRK.CREDIT.CURRENCY> = R.NEW(LOT.PRO.CREDIT.CURRENCY)
    R.LOT.WORK<LOT.WRK.DEBIT.CURRENCY> = R.NEW(LOT.PRO.DEBIT.CURRENCY)
    R.LOT.WORK<LOT.WRK.AMOUNT.CREDITED> = R.NEW(LOT.PRO.AMOUNT.CREDITED)
    R.LOT.WORK<LOT.WRK.AMOUNT.DEBITED> = R.NEW(LOT.PRO.AMOUNT.DEBITED)
    R.LOT.WORK<LOT.WRK.EXCHANGE.RATE> = R.NEW(LOT.PRO.EXCHANGE.RATE)
    R.LOT.WORK<LOT.WRK.PAYMENT.DETAILS> =  R.NEW(LOT.PRO.PAYMENT.DETAILS)
    R.LOT.WORK<LOT.WRK.PROCESSING.DATE> = R.NEW(LOT.PRO.PROCESSING.DATE)
    R.LOT.WORK<LOT.WRK.CHARGE.ACCT.NO> = R.NEW(LOT.PRO.CHARGE.ACCT.NO)
    R.LOT.WORK<LOT.WRK.AMOUNT.CHARGED> = R.NEW(LOT.PRO.AMOUNT.CHARGED)
    R.LOT.WORK<LOT.WRK.COMMISSION.CODE> = R.NEW(LOT.PRO.COMMISSION.CODE)
    R.LOT.WORK<LOT.WRK.COMMISSION.TYPE> = R.NEW(LOT.PRO.COMMISSION.TYPE)
    R.LOT.WORK<LOT.WRK.COMMISSION.AMT> = R.NEW(LOT.PRO.COMMISSION.AMT)
    R.LOT.WORK<LOT.WRK.CHARGE.CODE> = R.NEW(LOT.PRO.CHARGE.CODE)
    R.LOT.WORK<LOT.WRK.CHARGE.TYPE> = R.NEW(LOT.PRO.CHARGE.TYPE)
    R.LOT.WORK<LOT.WRK.CHARGE.AMT> = R.NEW(LOT.PRO.CHARGE.AMT)
    R.LOT.WORK<LOT.WRK.TAX.TYPE> = R.NEW(LOT.PRO.TAX.TYPE)
    R.LOT.WORK<LOT.WRK.TAX.AMT> = R.NEW(LOT.PRO.TAX.AMT)
    R.LOT.WORK<LOT.WRK.PROFIT.CENTRE.CUST> = R.NEW(LOT.PRO.PROFIT.CENTRE.CUST)
    R.LOT.WORK<LOT.WRK.PROFIT.CENTRE.DEPT> = R.NEW(LOT.PRO.PROFIT.CENTRE.DEPT)
    R.LOT.WORK<LOT.WRK.NUM.NAT.EMETTEUR> = R.NEW(LOT.PRO.NUM.NAT.EMETTEUR)
    R.LOT.WORK<LOT.WRK.CURR.NO> = 1
    R.LOT.WORK<LOT.WRK.CO.CODE> = ID.COMPANY
    R.LOT.WORK<LOT.WRK.DATE.TIME> = DT
    R.LOT.WORK<LOT.WRK.INPUTTER> = TNO:"_":OPERATOR
    R.LOT.WORK<LOT.WRK.AUTHORISER> = TNO:"_":OPERATOR
    R.LOT.WORK<LOT.WRK.DEPT.CODE> = R.USER<EB.USE.DEPARTMENT.CODE>

* EPI 29/01/2008 <

    IF SW.GEN.FT EQ 'Y' THEN

*        Generation of a FT in 'IHLD' to make this GLOBAL.ACCOUNTING

        R.LOT.WORK<LOT.WRK.PROCESSING.DATE> = PROCESSING.DATE.IN.FT
        FT.GEN.RTN = FIELD(R.LOT.PARAMETER<LOT.PAR.GLOBAL.FT.RTN>,"@",2)
        IF FT.GEN.RTN EQ '' THEN FT.GEN.RTN = 'Y.LOT.FT.FROM.WORK'
        SAVE.COMI = COMI
        COMI = ''
*        CALL @FT.GEN.RTN(LOT.DETAIL.ID,R.LOT.WORK,FT.REC.ID,R.FT.REC,N.ERR)
        CALL @FT.GEN.RTN(FT.REC.ID,R.FT.REC,N.ERR)
        IF FT.REC.ID NE '' THEN

*           Attempt to validate and authorize the generated FT

            IF COMI EQ '' THEN CALL Y.FT.AUTH(FT.REC.ID,R.FT.REC)
            R.LOT.WORK<LOT.WRK.LINKED.FT.ID> = FT.REC.ID
            R.LOT.WORK<LOT.WRK.STATEMENT.NOS> = R.FT.REC<FT.STMT.NOS>
            CHANGE @VM TO @SM IN R.FT.REC<FT.STMT.NOS>
            R.LOT.FILES<LOT.FIL.REM.STMT.NOS,Y.REMIT.NUM> = R.FT.REC<FT.STMT.NOS>
            R.LOT.FILES<LOT.FIL.REM.COMMENT,Y.REMIT.NUM> = FT.REC.ID
        END
        COMI = SAVE.COMI
        R.LOT.WORK<LOT.WRK.PROCESSING.DATE> = R.NEW(LOT.PRO.PROCESSING.DATE)
    END

    IF R.LOT.WORK<LOT.WRK.LINKED.FT.ID> EQ '' THEN
        R.LOT.WORK<LOT.WRK.STATEMENT.NOS> = R.NEW(V-10)
        CHANGE @VM TO @SM IN R.NEW(V-10)
        R.LOT.FILES<LOT.FIL.REM.STMT.NOS,Y.REMIT.NUM> = R.NEW(V-10)
        R.LOT.WORK<LOT.WRK.OVERRIDE> = R.NEW(LOT.PRO.OVERRIDE)
        GOSUB CREATE.DELIVERY
        R.LOT.FILES<LOT.FIL.REM.COMMENT,Y.REMIT.NUM> = R.NEW(LOT.PRO.DELIVERY.REF)
        R.LOT.WORK<LOT.WRK.DELIVERY.REF> = R.NEW(LOT.PRO.DELIVERY.REF)
    END

* EPI 29/01/2008 >

*     After authorisation routines are run from here
    Y.AA.CNT = DCOUNT(R.LOT.PARAMETER<LOT.PAR.AFTER.AUTH.RTN>,@VM)
    FOR IJI = 1 TO Y.AA.CNT
        Y.AAW.RTN = TRIM(FIELD(R.LOT.PARAMETER<LOT.PAR.AFTER.AUTH.RTN,IJI>,"@",2))
        IF Y.AAW.RTN THEN
            SAVE.COMI = COMI ; COMI = ''
            CALL @Y.AAW.RTN
            COMI = SAVE.COMI
        END
    NEXT IJI
    Y.IJ.CNT = DCOUNT(R.DATA.LAYOUT<CFB.LAY.AFTER.AUTH.RTN>,@VM)
    FOR IJI = 1 TO Y.IJ.CNT
        Y.AAW.RTN = TRIM(FIELD(R.DATA.LAYOUT<CFB.LAY.AFTER.AUTH.RTN,IJI>,"@",2))
        IF Y.AAW.RTN THEN
            SAVE.COMI = COMI ; COMI = ''
            CALL @Y.AAW.RTN
            COMI = SAVE.COMI
        END
    NEXT IJI

RETURN

***********************************************************************
UPDATE.OVERRIDE:
***********************************************************************

    SAVE.E = ''
    SAVE.TEXT = TEXT

    IF TEXT THEN
        CALL SIT.STORE.OVERRIDE(CURR.NO,'',YTEXT)
        IF TEXT EQ 'Y' OR TEXT EQ SAVE.TEXT THEN ;* User authorised to bypass the override
            IF SW.EB.ACCOUNTING THEN ;* Automatically reported by EB.ACCOUNTING
                E = ''
            END ELSE
                LOCATE YTEXT IN R.NEW(LOT.PRO.OVERRIDE)<1,1> SETTING TRO ELSE
                    CURR.NO += 1 ; R.NEW(LOT.PRO.OVERRIDE)<1,CURR.NO> = YTEXT
                END
            END
        END ELSE
            IF SW.EB.ACCOUNTING EQ 'Y' ELSE ;* Otherwise reported by EB.ACCOUNTING
                TEXT = SAVE.TEXT
                SW.REFUSAL = 'Y'
                CALL SIT.STORE.OVERRIDE(CURR.NO,'Y',YTEXT)
            END
            IF E EQ '' THEN
                TEXT = SAVE.TEXT
                IF INDEX(TEXT,@FM,1) THEN
                    OVERRIDE.ID = TEXT<1>
                    CALL EB.BUILD.OVERRIDE.TEXT
                    CALL TXT(TEXT)
                END
                E = TEXT
            END
            SAVE.E = E
        END
    END ELSE SAVE.E = E

    E = SAVE.E ; ETEXT = '' ; TEXT = '' ;

RETURN

***********************************************************************
CREATE.DELIVERY:
***********************************************************************

*     Create delivery entry

    MAPPING.KEY = R.DATA.LAYOUT<CFB.LAY.MAPPING.KEY>       ; * "1996.EB.1"
    IF MAPPING.KEY NE '' AND R.DATA.LAYOUT<CFB.LAY.APPLICATION.FORMAT> NE '' THEN
        MAPPING.KEY<1,2> = R.DATA.LAYOUT<CFB.LAY.APPLICATION.FORMAT>
    END
    IF MAPPING.KEY NE '' THEN
        FLG = '' ; DEL.REF = '' ; DEL.ERR = ''
        DEL.RTN = TRIM(FIELD(R.DATA.LAYOUT<CFB.LAY.DELIVERY.ROUTINE>,"@",2))
        IF DEL.RTN EQ '' THEN DEL.RTN = TRIM(FIELD(R.LOT.PARAMETER<LOT.PAR.DELIVERY.ROUTINE>,"@",2))
        IF DEL.RTN THEN
            CALL @DEL.RTN(MAPPING.KEY,FLG,DEL.REF,DEL.ERR)
            IF DEL.ERR EQ '' THEN R.NEW(LOT.PRO.DELIVERY.REF) = DEL.REF
        END
    END

RETURN

***********************************************************************
PROCESS.DATA:
***********************************************************************

    GOSUB CHECK.FILE.HEADER.EXIST
    GOSUB CHECK.REMIT.HEADER.EXIST

    SW.FILE.TRAILER = ''
    SW.REMIT.TRAILER = ''

IF SW.SKIP THEN SW.CHECK.FILE.TRAILER = 'N' ; RETURN

SW.ALREADY.MAPPED = ''

IF LAST.LAYOUT.ID NE '' THEN

    COUNTER.FOR.COMMITMENT += 1

*        Do not process transactions commited before the crash when recovered

    IF SW.RECOVERY AND COUNTER.FOR.COMMITMENT LE COUNTER.FOR.RECOVERY THEN RETURN

    IF SW.UNKNOWN.MESSAGE EQ '' THEN
        GOSUB POPULATE.DETAIL.FIELDS
        SW.ALREADY.MAPPED = 'Y'
    END

END

IF ACT.LAYOUT.ID NE LAST.LAYOUT.ID THEN
    IF SW.UNKNOWN.MESSAGE EQ '' AND COUNTER.FOR.COMMITMENT AND SW.ALREADY.MAPPED EQ '' THEN
        COUNTER.FOR.COMMITMENT += 1
        GOSUB POPULATE.DETAIL.FIELDS
    END

    IF LAST.REMIT.LAYOUT.ID AND LAST.REMIT.LAYOUT.ID NE ACT.LAYOUT.ID THEN

*           Generate an additional dummy remit trailer and header for each SIT code within the same remit

        MSG.REF = 'EB-LOT.GENERATED.REM.TRAILER'
        CALL LOT.TRANSLATE.ERROR(MSG.REF,'')
        R.LOT.FILES<LOT.FIL.REM.TRAILER,Y.REMIT.NUM> = MSG.REF
        IF SW.UNKNOWN.MESSAGE EQ '' AND SW.ALREADY.MAPPED EQ '' THEN
            COUNTER.FOR.COMMITMENT += 1
            GOSUB POPULATE.DETAIL.FIELDS
        END
        GOSUB REMIT.TRAILER.UPDATE
    END

*        Adjust the operation layout

    GOSUB READ.DATA.LAYOUT

    IF LAST.REMIT.LAYOUT.ID AND LAST.REMIT.LAYOUT.ID NE ACT.LAYOUT.ID THEN
        GOSUB REMIT.HEADER.UPDATE
        MSG.REF = 'EB-LOT.GENERATED.REM.HEADER'
        CALL LOT.TRANSLATE.ERROR(MSG.REF,'')
        R.LOT.FILES<LOT.FIL.REM.HEADER,Y.REMIT.NUM> = MSG.REF
        LOG.LEVEL = '' ; LOG.MESSAGE = 'EB-LOT.GENERATED.REM':@FM:Y.REMIT.NUM
        CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
        GOSUB UPDATE.LOG.FILE
        SW.REMIT.HEADER = 'Y'
        CALC.FILE.REMIT += 1
    END
END
LAST.REMIT.LAYOUT.ID = ACT.LAYOUT.ID

R.DATA.RECORD = R.RED.RECORD

RETURN

***********************************************************************
READ.DATA.LAYOUT:
***********************************************************************

    SW.UNKNOWN.MESSAGE = ''

    LAST.CUST.RIB.ACCOUNT = ''
    LAST.CUST.ACCOUNT = ''
    R.ACCOUNT = ''

    YR.CFONB.LAYOUT.ID = 'INWARD.':ACT.LAYOUT.ID
    GOSUB READ.CFONB.LAYOUT.FILE
    IF R.CFONB.LAYOUT EQ '' THEN
        SW.UNKNOWN.MESSAGE = 'Y'
        LOG.LEVEL = '1' ; LOG.MESSAGE = 'EB-LOT.UNKNOWN.TRANSACTION.CODE':@FM:Y.REMIT.NUM:@VM:ACT.LAYOUT.ID
        CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
        GOSUB UPDATE.LOG.FILE
        RETURN
    END

    DATA.LAYOUT.ID = YR.CFONB.LAYOUT.ID
    R.DATA.LAYOUT = R.CFONB.LAYOUT

*     Extraction des conditions de compabilisation actuelles

    CALL Y.LOAD.LOTLAY(CLEAR.CCY,Y.REJECT.REASON)
    IF Y.REJECT.REASON THEN
        SW.UNKNOWN.MESSAGE = 'Y'
        LOG.LEVEL = '1' ; LOG.MESSAGE = 'EB-LOT.REM.REJECT.REASON':@FM:Y.REMIT.NUM:@VM:Y.REJECT.REASON:@VM:ACT.LAYOUT.ID
        CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
        GOSUB UPDATE.LOG.FILE
        RETURN
    END

    IF R.LOT.CONTRACT<LOT.CNT.VALIDATION.RTN> THEN
        VAL.RTN = '' ; NB.VAL.RTN = 0
        Y.CON.CNT = DCOUNT(R.LOT.CONTRACT<LOT.CNT.VALIDATION.RTN>,@VM)
        FOR ILD = 1 TO  Y.CON.CNT
            RTN.ID = TRIM(FIELD(R.LOT.CONTRACT<LOT.CNT.VALIDATION.RTN,ILD>,"@",2))
            IF RTN.ID THEN
                NB.VAL.RTN += 1
                VAL.RTN<1,NB.VAL.RTN> = RTN.ID
            END
        NEXT ILD
    END ELSE
        VAL.RTN = DEF.VAL.RTN ; NB.VAL.RTN = DEF.NB.VAL.RTN
    END
    IF R.CFONB.LAYOUT<CFB.LAY.VALIDATION.RTN> NE '' THEN
		Y.LAYT.CNT = DCOUNT(R.CFONB.LAYOUT<CFB.LAY.VALIDATION.RTN>,@VM)
        FOR ILD = 1 TO Y.LAYT.CNT
            RTN.ID = TRIM(FIELD(R.CFONB.LAYOUT<CFB.LAY.VALIDATION.RTN,ILD>,"@",2))
            IF RTN.ID THEN
                NB.VAL.RTN += 1
                VAL.RTN<1,NB.VAL.RTN> = RTN.ID
            END
        NEXT ILD
    END

    LAST.LAYOUT.ID = ACT.LAYOUT.ID

    GOSUB READ.ANNEX.LAYOUT

RETURN

***********************************************************************
READ.ANNEX.LAYOUT:
***********************************************************************

    IEX = 0
    ANNEX.LAYOUT.ID = ''
    MAT R.ANNEX.LAYOUT = ''
    MAT R.ANNEX.RECORD = ''
    Y.CFB.CNT = DCOUNT(R.DATA.LAYOUT<CFB.LAY.LINKED.LAYOUT>,@VM)
    FOR IJP = 1 TO Y.CFB.CNT
        IF R.DATA.LAYOUT<CFB.LAY.LINKED.LAYOUT,IJP> NE HEADER.LAYOUT.ID THEN
            YR.CFONB.LAYOUT.ID = R.DATA.LAYOUT<CFB.LAY.LINKED.LAYOUT,IJP>
            GOSUB READ.CFONB.LAYOUT.FILE
            IF R.CFONB.LAYOUT EQ '' THEN
                SW.UNKNOWN.MESSAGE = 'Y'
                LOG.LEVEL = '1' ; LOG.MESSAGE = 'EB-LOT.UNKNOWN.ANNEX':@FM:Y.REMIT.NUM:@VM:ACT.LAYOUT.ID
                CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
                GOSUB UPDATE.LOG.FILE
            END ELSE
                IEX += 1
                ANNEX.LAYOUT.ID<1,IEX> = YR.CFONB.LAYOUT.ID
                R.ANNEX.LAYOUT(IEX) = R.CFONB.LAYOUT
            END
        END
    NEXT IJP

RETURN

***********************************************************************
PROCESS.ANNEX:
***********************************************************************

    IF SW.SKIP THEN RETURN

    SW.ANNEX.FOUND = ''
    FOR IJK = 1 TO IEX ;* DCOUNT(R.DATA.LAYOUT<CFB.LAY.LINKED.LAYOUT>,@VM)
        IF ANNEX.LAYOUT.ID<1,IJK> EQ 'INWARD.':ACT.LAYOUT.ID THEN
            IF R.ANNEX.RECORD(IJK) NE '' AND HEA.NATURE<HEA,HHA> EQ 'ANM' THEN

*              This type of annex message may be recorded several time per operation

                R.ANNEX.RECORD(IJK)<1,-1> = R.RED.RECORD
            END ELSE
                R.ANNEX.RECORD(IJK) = R.RED.RECORD
            END
            SW.ANNEX.FOUND = 'Y'
            EXIT
        END
    NEXT IJK
    IF SW.ANNEX.FOUND EQ '' THEN
        LOG.LEVEL = '1' ; LOG.MESSAGE = 'EB-LOT.UNEXPECTED.ANNEX':@FM:Y.REMIT.NUM:@VM:ACT.LAYOUT.ID
        CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
        GOSUB UPDATE.LOG.FILE
    END

RETURN

***********************************************************************
POPULATE.DETAIL.FIELDS:
***********************************************************************

    CURR.NO = 0
    Y.CUR.VALUE = CLEAR.CCY
    ACCT.ID = ''
    Y.NUM = 100

    DET.STATUS.CODE = ''
    DET.DESTINATION = ''
    DET.CONTRACT.ID = ''
    DET.CUST.BANK = ''
    DET.CUST.GUICHET = ''
    DET.CUST.RIB.ACCOUNT = ''
    DET.CUST.ACCOUNT = ''
    DET.VALUE.DATE = ''
    DET.CURRENCY = ''
    DET.SORT.FIELD = ''
    DET.AMOUNT = ''
    DET.THEIR.BANK = ''
    DET.THEIR.GUICHET = ''
    DET.THEIR.RIB.ACCOUNT = ''
    DET.THEIR.ACCOUNT = ''
    DET.ADDITIONAL = ''

    IF R.DATA.LAYOUT<CFB.LAY.CNT.KEY.START> NE '' AND R.DATA.LAYOUT<CFB.LAY.CNT.KEY.LENGTH> NE '' THEN
        NB.CNT.ELEMENTS = DCOUNT(R.DATA.LAYOUT<CFB.LAY.CNT.KEY.START>,@VM)
        FOR FND = 1 TO NB.CNT.ELEMENTS
            N.BEG = R.DATA.LAYOUT<CFB.LAY.CNT.KEY.START,FND>
            N.LEN = R.DATA.LAYOUT<CFB.LAY.CNT.KEY.LENGTH,FND>
            IF N.BEG AND N.LEN THEN
                IF DET.CONTRACT.ID EQ '' THEN
                    DET.CONTRACT.ID = R.DATA.RECORD[N.BEG,N.LEN]
                END ELSE
                    DET.CONTRACT.ID := '.':R.DATA.RECORD[N.BEG,N.LEN]
                END
            END
        NEXT FND
        IF DET.CONTRACT.ID THEN
            R.LOT.CONTRACT = '' ; ER = ''
            CALL F.READ(LOT.CONTRACT.FILE,DET.CONTRACT.ID,R.LOT.CONTRACT,F.LOT.CONTRACT,ER)
            IF ER EQ '' THEN
                CALL Y.LOAD.LOTLAY(CLEAR.CCY,Y.REJECT.REASON)
            END ELSE DET.CONTRACT.ID = ''
        END
    END
    IF DET.CONTRACT.ID EQ '' THEN
        IF HEADER.CONTRACT.ID NE '' THEN
            DET.CONTRACT.ID = HEADER.CONTRACT.ID
            R.LOT.CONTRACT = R.HEADER.CONTRACT
        END ELSE
            IF SUPER.CONTRACT.ID NE '' THEN
                DET.CONTRACT.ID = SUPER.CONTRACT.ID
                R.LOT.CONTRACT = R.SUPER.CONTRACT
            END
        END
    END

    Y.DATA.ARRAY = '' ; IVM = 0
    Y.FT.FIELD.NAME = R.LOT.PARAMETER<LOT.PAR.FT.FIELD.NAME>
    Y.FIELD.TYPE = ''
    Y.FIELD.NAME = ''
    Y.FIXED.TEXT = ''

    NB.PARAM.FIELDS = DCOUNT(R.LOT.PARAMETER<LOT.PAR.FT.FIELD.NAME>,@VM)
    FOR I = 1 TO NB.PARAM.FIELDS
        Y.FT.FIELD.NAME<I> = R.LOT.PARAMETER<LOT.PAR.FT.FIELD.NAME,I>
        Y.DATA.ARRAY<I> = ''
        Y.FIELD.TYPE<I> = ''
        Y.FIXED.TEXT<I> = ''

*        First search in the main data record

        LOCATE Y.FT.FIELD.NAME<I> IN R.DATA.LAYOUT<CFB.LAY.FT.FIELD.NAME,1> SETTING FOU THEN
            N.BEG = R.DATA.LAYOUT<CFB.LAY.FIELD.START,FOU>
            N.LEN = R.DATA.LAYOUT<CFB.LAY.FIELD.LENGTH,FOU>
            Y.DATA.ARRAY<I> = TRIM(R.DATA.RECORD[N.BEG,N.LEN]," ","R")
            Y.FIELD.NAME<I> = R.DATA.LAYOUT<CFB.LAY.FIELD.NAME,FOU>
            Y.FIELD.TYPE<I> = R.DATA.LAYOUT<CFB.LAY.FIELD.TYPE,FOU>
            Y.FIXED.TEXT<I> = R.DATA.LAYOUT<CFB.LAY.FIXED.TEXT,FOU>
        END

*        If not found, search in each annexed record

        IF Y.DATA.ARRAY<I> EQ '' THEN
            Y.LAYO.CNT = DCOUNT(ANNEX.LAYOUT.ID,@VM)
            FOR IJK = 1 TO Y.LAYO.CNT
                IF ANNEX.LAYOUT.ID<1,IJK> NE HEADER.LAYOUT.ID THEN
                    LOCATE Y.FT.FIELD.NAME<I> IN R.ANNEX.LAYOUT(IJK)<CFB.LAY.FT.FIELD.NAME,1> SETTING FOU THEN
                        N.BEG = R.ANNEX.LAYOUT(IJK)<CFB.LAY.FIELD.START,FOU>
                        N.LEN = R.ANNEX.LAYOUT(IJK)<CFB.LAY.FIELD.LENGTH,FOU>
                        Y.DATA.ARRAY<I> = TRIM(R.ANNEX.RECORD(IJK)<1,1>[N.BEG,N.LEN]," ","R")
                        Y.FIELD.NAME<I> = R.ANNEX.LAYOUT(IJK)<CFB.LAY.FIELD.NAME,FOU>
                        Y.FIELD.TYPE<I> = R.ANNEX.LAYOUT(IJK)<CFB.LAY.FIELD.TYPE,FOU>
                        Y.FIXED.TEXT<I> = R.ANNEX.LAYOUT(IJK)<CFB.LAY.FIXED.TEXT,FOU>
                        EXIT
                    END
                END
            NEXT IJK
        END

*        If not found, search in the header record

        IF Y.DATA.ARRAY<I> EQ '' THEN
            LOCATE Y.FT.FIELD.NAME<I> IN R.HEADER.LAYOUT<CFB.LAY.FT.FIELD.NAME,1> SETTING FOU THEN
                N.BEG = R.HEADER.LAYOUT<CFB.LAY.FIELD.START,FOU>
                N.LEN = R.HEADER.LAYOUT<CFB.LAY.FIELD.LENGTH,FOU>
                Y.DATA.ARRAY<I> = TRIM(R.HEADER.RECORD[N.BEG,N.LEN]," ","R")
                Y.FIELD.NAME<I> = R.HEADER.LAYOUT<CFB.LAY.FIELD.NAME,FOU>
                Y.FIELD.TYPE<I> = R.HEADER.LAYOUT<CFB.LAY.FIELD.TYPE,FOU>
                Y.FIXED.TEXT<I> = R.HEADER.LAYOUT<CFB.LAY.FIXED.TEXT,FOU>
            END
        END

*        If not found, search in the super header record

        IF Y.DATA.ARRAY<I> EQ '' THEN
            LOCATE Y.FT.FIELD.NAME<I> IN R.SUPER.LAYOUT<CFB.LAY.FT.FIELD.NAME,1> SETTING FOU THEN
                N.BEG = R.SUPER.LAYOUT<CFB.LAY.FIELD.START,FOU>
                N.LEN = R.SUPER.LAYOUT<CFB.LAY.FIELD.LENGTH,FOU>
                Y.DATA.ARRAY<I> = TRIM(R.SUPER.RECORD[N.BEG,N.LEN]," ","R")
                Y.FIELD.NAME<I> = R.SUPER.LAYOUT<CFB.LAY.FIELD.NAME,FOU>
                Y.FIELD.TYPE<I> = R.SUPER.LAYOUT<CFB.LAY.FIELD.TYPE,FOU>
                Y.FIXED.TEXT<I> = R.SUPER.LAYOUT<CFB.LAY.FIXED.TEXT,FOU>
            END
        END

*        Check the format

        IF Y.DATA.ARRAY<I> EQ '' THEN

*           Default the unfound main fields

            BEGIN CASE
                CASE Y.FT.FIELD.NAME<I> EQ 'CURRENCY'
                    Y.DATA.ARRAY<I> = CLEAR.CCY
                CASE Y.FT.FIELD.NAME<I> EQ 'VALUE.DATE'
                    Y.DATA.ARRAY<I> = R.DATES(EB.DAT.TODAY)
                CASE 1
                    IF R.LOT.PARAMETER<LOT.PAR.FT.FIELD.MAND,I>[1,1] EQ 'Y' THEN
                        MSG.ERR = 'EB-LOT.MISSING.CONTENT'
                        CALL LOT.TRANSLATE.ERROR(MSG.ERR,'')
                        Y.REJECT.REASON = R.LOT.PARAMETER<LOT.PAR.FT.FIELD.NAME,I>:' ':MSG.ERR
                        DET.STATUS.CODE = R.LOT.PARAMETER<LOT.PAR.FT.REJECT.CODE,I>
                        LOG.LEVEL = '1' ; LOG.MESSAGE = 'EB-LOT.PROBLEM.ON.LINE':@FM:Y.REMIT.NUM:@VM:COUNTER.FOR.COMMITMENT:@VM:Y.REJECT.REASON
                        CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
                        GOSUB UPDATE.LOG.FILE ; Y.REJECT.REASON = ''
                    END
            END CASE
        END ELSE
            IF Y.FIELD.TYPE<I> NE '' THEN
                GOSUB CHECK.FIELD.INTEGRITY
                IF Y.REJECT.REASON THEN
* EPI 2007.05.07 <
                    IF INDEX(Y.REJECT.REASON,@FM,1) THEN
                        TEXT = Y.REJECT.REASON
                        OVERRIDE.ID = TEXT<1>
                        CALL EB.BUILD.OVERRIDE.TEXT
                        CALL TXT(TEXT)
                        Y.REJECT.REASON = TEXT
                        TEXT = ''
                    END
* EPI 2007.05.07 >
                    DET.STATUS.CODE = R.LOT.PARAMETER<LOT.PAR.FT.REJECT.CODE,I>
                    LOG.LEVEL = '1' ; LOG.MESSAGE = 'EB-LOT.PROBLEM.ON.LINE':@FM:Y.REMIT.NUM:@VM:COUNTER.FOR.COMMITMENT:@VM:Y.REJECT.REASON
                    CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
                    GOSUB UPDATE.LOG.FILE ; Y.REJECT.REASON = ''

*                 Adjust at best the erroneous content

                    BEGIN CASE
                        CASE Y.FT.FIELD.NAME<I> EQ 'CURRENCY'
                            Y.DATA.ARRAY<I> = CLEAR.CCY
                        CASE Y.FT.FIELD.NAME<I> EQ 'AMOUNT'
                            Y.DATA.ARRAY<I> = 0
                        CASE Y.FT.FIELD.NAME<I> EQ 'VALUE.DATE'
                            Y.DATA.ARRAY<I> = R.DATES(EB.DAT.TODAY)
                    END CASE
                END
            END
        END

        BEGIN CASE

            CASE Y.FT.FIELD.NAME<I> EQ 'CURRENCY'
                DET.CURRENCY = Y.DATA.ARRAY<I>
                Y.CUR.VALUE = DET.CURRENCY

            CASE Y.FT.FIELD.NAME<I> EQ 'THEIR.BANK'
                IF LOT.ONLY.FOR.CUSTOMERS NE 'Y' THEN
                    DET.THEIR.BANK = Y.DATA.ARRAY<I>
                END

            CASE Y.FT.FIELD.NAME<I> EQ 'THEIR.GUICHET'
                IF LOT.ONLY.FOR.CUSTOMERS NE 'Y' THEN
                    DET.THEIR.GUICHET = Y.DATA.ARRAY<I>
                END

            CASE Y.FT.FIELD.NAME<I> EQ 'THEIR.ACCOUNT' OR Y.FT.FIELD.NAME<I> EQ 'THEIR.RIB.ACCOUNT'
                IF LOT.ONLY.FOR.CUSTOMERS NE 'Y' THEN
                    DET.THEIR.RIB.ACCOUNT = Y.DATA.ARRAY<I>
                    ACCT.ID = Y.DATA.ARRAY<I>
                    IF RIB.TO.ACCOUNT.RTN NE '' THEN
                        SAVE.COMI = COMI ; COMI = ACCT.ID ; ETEXT = ''
                        SAVE.COMI.ENRI = COMI.ENRI ; COMI.ENRI = 'THEIR.ACCOUNT'
                        CALL @RIB.TO.ACCOUNT.RTN
                        IF COMI THEN ACCT.ID = COMI
                        COMI = SAVE.COMI ; COMI.ENRI = SAVE.COMI.ENRI ; ETEXT = ''
                    END
                    ER = '' ; T.ACCOUNT = ''
                    CALL F.READ(ACCOUNT.FILE,ACCT.ID,T.ACCOUNT,FBNK.ACCOUNT,ER)
                    IF NOT(ER) THEN DET.THEIR.ACCOUNT = ACCT.ID
                END

            CASE Y.FT.FIELD.NAME<I> EQ 'CUST.BANK' OR Y.FT.FIELD.NAME<I> EQ 'OUR.BANK.ID'
                IF Y.DATA.ARRAY<I> NE R.LOT.PARAMETER<LOT.PAR.BANK.PID.CODE> THEN
                    DET.CUST.BANK = Y.DATA.ARRAY<I>
                END

            CASE Y.FT.FIELD.NAME<I> EQ 'CUST.GUICHET'
                DET.CUST.GUICHET = Y.DATA.ARRAY<I>

            CASE Y.FT.FIELD.NAME<I> EQ 'CUST.ACCOUNT' OR Y.FT.FIELD.NAME<I> EQ 'CUST.RIB.ACCOUNT'
                IF LOT.ONLY.FOR.CUSTOMERS EQ 'Y' THEN
                    DET.CUST.RIB.ACCOUNT = ''
                    DET.CUST.ACCOUNT = R.LOT.PARAMETER<LOT.PAR.NOSTRO.ACCT.NO>
                    IF DET.CUST.ACCOUNT NE LAST.CUST.ACCOUNT THEN
                        ACCT.ID = DET.CUST.ACCOUNT
                        GOSUB READ.ACCOUNT.FILE
                    END
                    DET.THEIR.BANK = DET.CUST.BANK
                    DET.THEIR.GUICHET = DET.CUST.GUICHET
                    DET.THEIR.RIB.ACCOUNT = Y.DATA.ARRAY<I>
                    ACCT.ID = Y.DATA.ARRAY<I>
                    IF RIB.TO.ACCOUNT.RTN NE '' THEN
                        SAVE.COMI = COMI ; COMI = ACCT.ID ; ETEXT = ''
                        SAVE.COMI.ENRI = COMI.ENRI ; COMI.ENRI = 'THEIR.ACCOUNT'
                        CALL @RIB.TO.ACCOUNT.RTN
                        IF COMI THEN ACCT.ID = COMI
                        COMI = SAVE.COMI ; COMI.ENRI = SAVE.COMI.ENRI ; ETEXT = ''
                    END
                    ER = '' ; T.ACCOUNT = ''
                    CALL F.READ(ACCOUNT.FILE,ACCT.ID,T.ACCOUNT,FBNK.ACCOUNT,ER)
                    IF NOT(ER) THEN DET.THEIR.ACCOUNT = ACCT.ID
                END ELSE
                    DET.CUST.RIB.ACCOUNT = Y.DATA.ARRAY<I>
                    IF DET.CUST.RIB.ACCOUNT NE LAST.CUST.RIB.ACCOUNT THEN
                        ACCT.ID = Y.DATA.ARRAY<I>
                        IF RIB.TO.ACCOUNT.RTN NE '' THEN
                            SAVE.COMI = COMI ; COMI = ACCT.ID ; ETEXT = ''
                            SAVE.COMI.ENRI = COMI.ENRI ; COMI.ENRI = 'CUST.ACCOUNT'
                            CALL @RIB.TO.ACCOUNT.RTN
                            IF COMI THEN ACCT.ID = COMI
                            COMI = SAVE.COMI ; COMI.ENRI = SAVE.COMI.ENRI ; ETEXT = ''
                        END
                        GOSUB READ.ACCOUNT.FILE
                        IF NOT(ER) THEN DET.CUST.ACCOUNT = ACCT.ID
                    END ELSE
                        DET.CUST.ACCOUNT = LAST.CUST.ACCOUNT
                    END
                END

            CASE Y.FT.FIELD.NAME<I> EQ 'AMOUNT'
                DET.AMOUNT = Y.DATA.ARRAY<I> / Y.NUM
                TOTAL.FOR.COMMITMENT += DET.AMOUNT
                BEGIN CASE
                    CASE R.DATA.LAYOUT<CFB.LAY.CUSTOMER.SIGN> EQ 'DB'
                        CALC.FILE.AMOUNT.DB += DET.AMOUNT
                    CASE R.DATA.LAYOUT<CFB.LAY.CUSTOMER.SIGN> EQ 'CR'
                        CALC.FILE.AMOUNT.CR += DET.AMOUNT
                END CASE

            CASE Y.FT.FIELD.NAME<I> EQ 'VALUE.DATE'

*              Required payment date

                DET.VALUE.DATE = Y.DATA.ARRAY<I>

            CASE Y.FT.FIELD.NAME<I> EQ 'CONTRACT.ID'

*              For not being done again in DET.ADDITIONAL

            CASE Y.FT.FIELD.NAME<I> EQ 'SORT.FIELD'
                DET.SORT.FIELD = Y.DATA.ARRAY<I>

            CASE 1
                IVM += 1
                DET.ADDITIONAL<1,IVM> = Y.DATA.ARRAY<I>

        END CASE
    NEXT I

    IF DET.CURRENCY EQ '' THEN DET.CURRENCY = CLEAR.CCY

*     Validation routines are run from here

    DROP.TREATMENT = ''

    DET.NEW.SORT.FIELD = ''
    FOR ILD = 1 TO NB.VAL.RTN
        SAVE.COMI = COMI ; COMI = '' ; ETEXT = ''
        Y.VAL.RTN = VAL.RTN<1,ILD>
        CALL @Y.VAL.RTN
        IF COMI THEN DET.NEW.SORT.FIELD = COMI
        COMI = SAVE.COMI
        IF ETEXT THEN
            LOG.LEVEL = '' ; LOG.MESSAGE = ETEXT ; ETEXT = ''
            CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
            GOSUB UPDATE.LOG.FILE
        END
    NEXT ILD

IF DROP.TREATMENT EQ 'Y' THEN GOSUB DROP.CURRENT.REMIT ; RETURN

*     Calculation of LOADING.DATE : Date at which a LOT.PROCESS should be authorised (Potential key to LOT.PENDING).
*     Calculation of PROCESSING.DATE : Set on LOT.PROCESS (e.g. Presentation date to SIT by the Direct Participant).
*     Adjusment of the DET.VALUE.DATE if the given one cannot be matched

*EPI 16/05/2007 <

*     CALL Y.CALC.LOADING.DATE(Y.PROCESS.DATE,Y.PROCESS.TIME,DET.VALUE.DATE,DET.DESTINATION,LOADING.DATE,PROCESSING.DATE,N.ERR)
LOADING.DATE = '' ; PROCESSING.DATE = ''
Y.DAT.RTN = TRIM(FIELD(R.LOT.PARAMETER<LOT.PAR.LOADING.DATE.RTN>,"@",2))
IF Y.DAT.RTN THEN
    CALL @Y.DAT.RTN(LOADING.DATE,PROCESSING.DATE,N.ERR)
    IF N.ERR THEN

*           Value date has been adjusted otherwise it was unreachable for the given destination.

        LOG.LEVEL = '' ; LOG.MESSAGE = 'EB-LOT.PROBLEM.ON.LINE':@FM:Y.REMIT.NUM:@VM:COUNTER.FOR.COMMITMENT:@VM:N.ERR
        CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
        GOSUB UPDATE.LOG.FILE ; N.ERR = ''
    END
END ELSE LOADING.DATE = DET.VALUE.DATE ; PROCESSING.DATE = DET.VALUE.DATE

*EPI 16/05/2007 >

IF MIN.LOADING.DATE EQ '' THEN
    MIN.LOADING.DATE = LOADING.DATE
END ELSE
    IF MIN.LOADING.DATE GT LOADING.DATE THEN MIN.LOADING.DATE = LOADING.DATE
END

IF LAST.CUST.ACCOUNT NE DET.CUST.ACCOUNT OR LAST.CUST.RIB.ACCOUNT NE DET.CUST.RIB.ACCOUNT THEN
    IF LOT.CUST.ACCT.NO NE '' OR LOT.CUST.CATEGORY NE '' THEN

*           A generic account is to be subtituted to the customer one

        IF LOT.CUST.CATEGORY THEN
            N.CATEGORY = LOT.CUST.CATEGORY
            GOSUB GET.ACCOUNT.FROM.CATEGORY
            PROCESS.ACCOUNT = N.ACCT.NO
            R.ACCOUNT = N.ACCOUNT
        END ELSE
            PROCESS.ACCOUNT = LOT.CUST.ACCT.NO
            R.ACCOUNT = LOT.CUST.ACCOUNT
        END
* EPI 20100424 DET.CUST.RIB.ACCOUNT = ''
    END ELSE PROCESS.ACCOUNT = DET.CUST.ACCOUNT
END ELSE PROCESS.ACCOUNT = DET.CUST.ACCOUNT

*     IF LOT.ONE.BY.ONE.PROCESS = 'Y' AND LOT.ONLY.FOR.CUSTOMERS <> 'Y' THEN DET.NEW.SORT.FIELD = COUNTER.FOR.COMMITMENT

IF LOT.PROCESS.TYPE[1,2] EQ 'NO' THEN

*        To avoid any entry posting at that level

    SPLIT.VALUE.DATE = ''
    SPLIT.PROCESSING.DATE = ''
END ELSE
    SPLIT.VALUE.DATE = DET.VALUE.DATE
    SPLIT.PROCESSING.DATE = PROCESSING.DATE
END
SPLITTING.KEY = DET.STATUS.CODE:I.SEP:DET.DESTINATION:I.SEP:DET.CONTRACT.ID:I.SEP:DET.CUST.BANK:I.SEP
SPLITTING.KEY := DET.CUST.GUICHET:I.SEP:DET.CUST.RIB.ACCOUNT:I.SEP:PROCESS.ACCOUNT:I.SEP:SPLIT.VALUE.DATE:I.SEP
SPLITTING.KEY := DET.CURRENCY:I.SEP:SPLIT.PROCESSING.DATE:I.SEP:DET.SORT.FIELD:I.SEP:DET.NEW.SORT.FIELD
IF R.LOT.WORK<LOT.WRK.SPLITTING.KEY> EQ '' THEN
    R.LOT.WORK<LOT.WRK.SPLITTING.KEY> = SPLITTING.KEY
    R.LOT.WORK<LOT.WRK.RANGE.BEG> = COUNTER.FOR.COMMITMENT
    R.LOT.WORK<LOT.WRK.RANGE.END> = COUNTER.FOR.COMMITMENT
    R.LOT.WORK<LOT.WRK.FOUND.NB.OF.REC> = 1
    R.LOT.WORK<LOT.WRK.FOUND.AMOUNT> = DET.AMOUNT
END ELSE
    LOCATE SPLITTING.KEY IN R.LOT.WORK<LOT.WRK.SPLITTING.KEY,1> SETTING FNN THEN
        NB.RANGES = DCOUNT(R.LOT.WORK<LOT.WRK.RANGE.BEG,FNN>,@SM)
        IF R.LOT.WORK<LOT.WRK.RANGE.END,FNN,NB.RANGES> EQ COUNTER.FOR.COMMITMENT - 1 THEN
            R.LOT.WORK<LOT.WRK.RANGE.END,FNN,NB.RANGES> = COUNTER.FOR.COMMITMENT
        END ELSE
            R.LOT.WORK<LOT.WRK.RANGE.BEG,FNN,NB.RANGES+1> = COUNTER.FOR.COMMITMENT
            R.LOT.WORK<LOT.WRK.RANGE.END,FNN,NB.RANGES+1> = COUNTER.FOR.COMMITMENT
        END
        R.LOT.WORK<LOT.WRK.FOUND.NB.OF.REC,FNN> += 1
        R.LOT.WORK<LOT.WRK.FOUND.AMOUNT,FNN> += DET.AMOUNT
    END ELSE
        NB.SPLIT = DCOUNT(R.LOT.WORK<LOT.WRK.SPLITTING.KEY>,@VM)
        IF SPLITTING.KEY GT R.LOT.WORK<LOT.WRK.SPLITTING.KEY,NB.SPLIT> THEN
            R.LOT.WORK<LOT.WRK.SPLITTING.KEY,NB.SPLIT+1> = SPLITTING.KEY
            R.LOT.WORK<LOT.WRK.RANGE.BEG,NB.SPLIT+1> = COUNTER.FOR.COMMITMENT
            R.LOT.WORK<LOT.WRK.RANGE.END,NB.SPLIT+1> = COUNTER.FOR.COMMITMENT
            R.LOT.WORK<LOT.WRK.FOUND.NB.OF.REC,NB.SPLIT+1> = 1
            R.LOT.WORK<LOT.WRK.FOUND.AMOUNT,NB.SPLIT+1> = DET.AMOUNT
        END ELSE
            FOR IJX = 1 TO NB.SPLIT
                IF SPLITTING.KEY LT R.LOT.WORK<LOT.WRK.SPLITTING.KEY,IJX> THEN
                    R.LOT.WORK<LOT.WRK.SPLITTING.KEY,IJX> = SPLITTING.KEY:@VM:R.LOT.WORK<LOT.WRK.SPLITTING.KEY,IJX>
                    R.LOT.WORK<LOT.WRK.RANGE.BEG,IJX> = COUNTER.FOR.COMMITMENT:@VM:R.LOT.WORK<LOT.WRK.RANGE.BEG,IJX>
                    R.LOT.WORK<LOT.WRK.RANGE.END,IJX> = COUNTER.FOR.COMMITMENT:@VM:R.LOT.WORK<LOT.WRK.RANGE.END,IJX>
                    R.LOT.WORK<LOT.WRK.FOUND.NB.OF.REC,IJX> = 1:@VM:R.LOT.WORK<LOT.WRK.FOUND.NB.OF.REC,IJX>
                    R.LOT.WORK<LOT.WRK.FOUND.AMOUNT,IJX> = DET.AMOUNT:@VM:R.LOT.WORK<LOT.WRK.FOUND.AMOUNT,IJX>
                    EXIT
                END
            NEXT IJX
        END
    END
END

R.LOT.WORK<LOT.WRK.PROCESS.TYPE> = LOT.PROCESS.TYPE
R.LOT.WORK<LOT.WRK.GLOBAL.ACCOUNTING> = LOT.GLOBAL.ACCOUNTING
R.LOT.WORK<LOT.WRK.ONE.BY.ONE.PROCESS> = LOT.ONE.BY.ONE.PROCESS

I.DET = MOD(COUNTER.FOR.COMMITMENT,R.LOT.PARAMETER<LOT.PAR.DETAIL.LENGTH>)
IF I.DET EQ 0 THEN I.DET = R.LOT.PARAMETER<LOT.PAR.DETAIL.LENGTH>
FIRST.LINE = DET.STATUS.CODE:I.SEP:DET.DESTINATION:I.SEP:DET.CONTRACT.ID:I.SEP
FIRST.LINE := DET.CUST.BANK:I.SEP:DET.CUST.GUICHET:I.SEP:DET.CUST.RIB.ACCOUNT:I.SEP
FIRST.LINE := DET.CUST.ACCOUNT:I.SEP:DET.VALUE.DATE:I.SEP:DET.CURRENCY:I.SEP
FIRST.LINE := DET.SORT.FIELD:I.SEP:DET.AMOUNT:I.SEP:DET.THEIR.BANK:I.SEP
FIRST.LINE := DET.THEIR.GUICHET:I.SEP:DET.THEIR.RIB.ACCOUNT:I.SEP:DET.THEIR.ACCOUNT
FOR IJF = 1 TO IVM
    FIRST.LINE := I.SEP:DET.ADDITIONAL<1,IJF>
NEXT IJF

R.LOT.DETAIL<3*I.DET-2> = FIRST.LINE
R.LOT.DETAIL<3*I.DET-1> = R.DATA.RECORD
Y.DET.CNT = DCOUNT(ANNEX.LAYOUT.ID,@VM)
FOR IJP = 1 TO Y.DET.CNT
    R.LOT.DETAIL<3*I.DET-1,-1> = R.ANNEX.RECORD(IJP)
NEXT IJP
R.LOT.DETAIL<3*I.DET> = ''

IF MOD(COUNTER.FOR.COMMITMENT,R.LOT.PARAMETER<LOT.PAR.DETAIL.LENGTH>) EQ 0 THEN
    GOSUB LOT.DETAIL.UPDATE
    IF RUNNING.UNDER.BATCH ELSE
        IF SW.PENDING.USED EQ '' THEN
            SW.COMMIT = 'Y'
            GOSUB REMIT.TRAILER.UPDATE
            SW.COMMIT = ''
        END
* CALL JOURNAL.UPDATE(LOT.DETAIL.ID)
    END
    R.LOT.DETAIL = ''
END

LAST.CUST.ACCOUNT = DET.CUST.ACCOUNT
LAST.CUST.RIB.ACCOUNT = DET.CUST.RIB.ACCOUNT

MAT R.ANNEX.RECORD = ''

RETURN

***********************************************************************
LOT.DETAIL.UPDATE:
***********************************************************************

    IF R.LOT.DETAIL EQ '' THEN RETURN

    LOT.DETAIL.NUM = COUNTER.FOR.COMMITMENT/R.LOT.PARAMETER<LOT.PAR.DETAIL.LENGTH>
    LOT.DETAIL.NUM = ICONV(LOT.DETAIL.NUM+0.4999,"MD0T")
    IF LOT.DETAIL.NUM LE 1 THEN LOT.DETAIL.KEY = LOT.DETAIL.ID ELSE LOT.DETAIL.KEY = LOT.DETAIL.ID:'.':LOT.DETAIL.NUM
    CALL F.WRITE(LOT.DETAIL.FILE,LOT.DETAIL.KEY,R.LOT.DETAIL)
    CALL F.WRITE(LOT.WORK.FILE,LOT.DETAIL.ID,R.LOT.WORK)

RETURN

***********************************************************************
DROP.CURRENT.REMIT:
***********************************************************************

    SW.SKIP = 'Y'
    LOG.LEVEL = '2' ; LOG.MESSAGE = 'EB-LOT.DROP.TREATMENT':@FM:Y.REMIT.NUM
    CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
    GOSUB UPDATE.LOG.FILE

    IF Y.REMIT.NUM EQ 1 THEN
        FOR IRD = LOT.FIL.REM.HEADER TO LOT.FIL.REM.TRAILER
            R.LOT.FILES<IRD> = ''
        NEXT IRD
    END ELSE
        FOR IRD = LOT.FIL.REM.HEADER TO LOT.FIL.REM.TRAILER
            SAVE.FIELD = R.LOT.FILES<IRD>
            R.LOT.FILES<IRD> = ''
            FOR IRR = 1 TO Y.REMIT.NUM
                R.LOT.FILES<IRD,IRR> = SAVE.FIELD<1,IRR>
            NEXT IRR
        NEXT IRD
    END

    LOT.DETAIL.NUM = COUNTER.FOR.COMMITMENT/R.LOT.PARAMETER<LOT.PAR.DETAIL.LENGTH>
    LOT.DETAIL.NUM = ICONV(LOT.DETAIL.NUM+0.4999,"MD0T")
    CALL F.DELETE(LOT.DETAIL.FILE,LOT.DETAIL.ID)
    FOR IRD = 2 TO LOT.DETAIL.NUM
 *      CALL F.DELETE(LOT.DETAIL.FILE,LOT.DETAIL.ID:'.':IRD)
        LOT.DETAIL.IDD=LOT.DETAIL.ID:'.':IRD
		CALL F.DELETE(LOT.DETAIL.FILE,LOT.DETAIL.IDD)   ;*Used Variable instead of Hardcoding the value in IDVAR
    NEXT IRD

    GOSUB WRITE.LOT.FILES.FILE

RETURN

***********************************************************************
CHECK.FIELD.INTEGRITY:
***********************************************************************

    Y.REJECT.REASON = ''
    IF Y.FIELD.TYPE<I> NE '' THEN
        BEGIN CASE

            CASE Y.FIELD.TYPE<I> MATCH '"IN2"0X'
                COMI.SAVE = COMI ; COMI = Y.DATA.ARRAY<I> ; ETEXT = ''
                BEGIN CASE
                    CASE Y.FIELD.TYPE<I> EQ 'IN2'
                        CALL IN2(N.LEN,'')
                    CASE Y.FIELD.TYPE<I> EQ 'IN2D'
                        IF LEN(COMI) EQ 6 THEN
                            IF COMI[3,2] EQ '00' OR COMI[3,2] GT '12' THEN
                                MSG.ERR = 'EB-LOT.INVALID.DATE':@FM:COMI
                                CALL LOT.TRANSLATE.ERROR(MSG.ERR,'')
                                ETEXT = MSG.ERR
                            END ELSE
                                IF COMI[5,2] EQ '00' OR COMI[5,2] GT '31' THEN
                                    MSG.ERR = 'EB-LOT.INVALID.DATE':@FM:COMI
                                    CALL LOT.TRANSLATE.ERROR(MSG.ERR,'')
                                    ETEXT = MSG.ERR
                                END ELSE
                                    WORK.DATE = COMI
                                    GOSUB WORK.DATE.EDITION
                                    Y.DATA.ARRAY<I> = WORK.DATE.EDITED
                                END
                            END
*                       CALL IN2D(N.LEN,'D')
                        END
                    CASE Y.FIELD.TYPE<I> EQ 'IN2ACC'
                        IF NUM(COMI) THEN COMI = ABS(COMI)
                        CALL IN2ACC(N.LEN,'ACC')
                    CASE Y.FIELD.TYPE<I> EQ 'IN2ALL'
                        IF NUM(COMI) THEN COMI = ABS(COMI)
                        CALL IN2ALL(N.LEN,'ALL')
                END CASE
                COMI = COMI.SAVE
                IF ETEXT THEN Y.REJECT.REASON = Y.FIELD.NAME<I>:' ':ETEXT

            CASE Y.FIELD.TYPE<I>[1,1] EQ "@"
                Y.CHECK.RTN = TRIM(FIELD(Y.FIELD.TYPE<I>,"@",2))
                IF Y.CHECK.RTN THEN
                    SAVE.COMI = COMI ; COMI = Y.DATA.ARRAY<I> ; ETEXT = ''
                    CALL @Y.CHECK.RTN
                    Y.DATA.ARRAY<I> = COMI ; COMI = SAVE.COMI
                    IF ETEXT THEN Y.REJECT.REASON = Y.FIELD.NAME<I>:' ':ETEXT
                END

            CASE 1
                IF Y.DATA.ARRAY<I> NE Y.FIELD.TYPE<I> THEN
                    Y.REJECT.REASON = Y.FIELD.NAME<I>:' (':Y.DATA.ARRAY<I>:') <> ':Y.FIELD.TYPE<I>
                END
        END CASE
    END
    ETEXT = ''

RETURN

***********************************************************************
INITIALISE:
***********************************************************************

    REGION = R.COMPANY(EB.COM.LOCAL.COUNTRY):R.COMPANY(EB.COM.LOCAL.REGION)
    IF LEN(REGION) EQ 2 THEN REGION = REGION:'00'

    JNL.ID = Y.PROCESS.DATE

    TAPE.FILE.NAME = "FT.IN.TAPE" ; FT.IN.TAPE = ''

    IF R.SPF.SYSTEM<SPF.OPERATING.SYSTEM>[1,4] EQ 'UNIX' THEN SW.UNIX = 'Y' ELSE SW.UNIX = 'N'

    TIME.STAMP = TIMEDATE()
    X = OCONV(DATE(),"D-")
    DT = X[9,2]:X[1,2]:X[4,2]:TIME.STAMP[1,2]:TIME.STAMP[4,2]

    LOT.LOG.FILE = 'F.LOT.LOG'
    F.LOT.LOG = ''
    CALL OPF(LOT.LOG.FILE, F.LOT.LOG)

    CALL Y.LOAD.LOTPAR(LOG.MESSAGE)
    IF LOG.MESSAGE THEN RETURN

* EPI 27/10/2007 <
*     CALL Y.LOAD.SITPAR(LOG.MESSAGE)
*     IF LOG.MESSAGE THEN RETURN
* EPI 27/10/2007 >

    CALL Y.LOAD.SITCHQ

    I.SEP = R.LOT.PARAMETER<LOT.PAR.SEPARATOR>

*     Calculate the date that decides on the pending of a LOT.PROCESS

    NB.PENDING.DAYS = R.LOT.PARAMETER<LOT.PAR.PENDING.DAYS>
    ADV.DAYS = ''
    IF NB.PENDING.DAYS NE '' THEN
        PENDING.DATE = R.DATES(EB.DAT.TODAY)
        BEGIN CASE
            CASE NB.PENDING.DAYS MATCH "0N'W'"
                ADV.DAYS = FIELD(NB.PENDING.DAYS,"W",1)
                ADV.DAYS = FMT(ADV.DAYS,'3"0"R'):'W'
            CASE NB.PENDING.DAYS MATCH "0N'C'"
                ADV.DAYS = FIELD(NB.PENDING.DAYS,"C",1)
                ADV.DAYS = FMT(ADV.DAYS,'3"0"R'):'C'
            CASE NB.PENDING.DAYS MATCH "0N"
                ADV.DAYS = NB.PENDING.DAYS
                ADV.DAYS = FMT(ADV.DAYS,'3"0"R'):'C'
        END CASE
        IF ADV.DAYS THEN CALL SIT.CDT(REGION,PENDING.DATE,ADV.DAYS)
    END ELSE
        PENDING.DATE = ''
    END

    CALL Y.LOAD.LOTDEF

    CLEAR.CCY = R.LOT.PARAMETER<LOT.PAR.CLEAR.CURRENCY>
    CLEAR.CCY.MKT = R.LOT.PARAMETER<LOT.PAR.CLEAR.CCY.MARKET>
    CALL Y.CLEAR.SITCOM

    CALL Y.LOAD.LOTHEA
    CALL Y.LOAD.LOTDST
    CALL Y.LOAD.LOTSTA(CLEAR.CCY,N.ERR)

*     Set up the valid record types...

    N.PROTOCOL = 'CFONB'

    CFONB.LAYOUT.FILE = 'F.CFONB.LAYOUT'
    F.CFONB.LAYOUT = ''
    CALL OPF(CFONB.LAYOUT.FILE, F.CFONB.LAYOUT)
    YR.CFONB.LAYOUT.ID = '' ; R.CFONB.LAYOUT = ''

    LOT.CONTRACT.FILE = 'F.LOT.CONTRACT'
    F.LOT.CONTRACT = ''
    CALL OPF(LOT.CONTRACT.FILE, F.LOT.CONTRACT)
    YR.LOT.CONTRACT.ID = '' ; R.LOT.CONTRACT = ''

    LOT.FILES.FILE = 'F.LOT.FILES'
    F.LOT.FILES = ''
    CALL OPF(LOT.FILES.FILE, F.LOT.FILES)
    YR.LOT.FILES.ID = '' ; R.LOT.FILES = ''

    LOT.CONCAT.FILE = 'F.LOT.CONCAT'
    F.LOT.CONCAT = ''
    CALL OPF(LOT.CONCAT.FILE, F.LOT.CONCAT)
    YR.LOT.CONCAT.ID = '' ; R.LOT.CONCAT = ''

    LOT.PENDING.FILE = 'F.LOT.PENDING'
    F.LOT.PENDING = ''
    CALL OPF(LOT.PENDING.FILE, F.LOT.PENDING)
    YR.LOT.PENDING.ID = '' ; R.LOT.PENDING = ''

    LOT.PROCESS.FILE = 'F.LOT.PROCESS'
    F.LOT.PROCESS = ''
    CALL OPF(LOT.PROCESS.FILE, F.LOT.PROCESS)
    YR.LOT.PROCESS.ID = '' ; R.LOT.PROCESS = ''

    LOT.DETAIL.FILE = 'F.LOT.DETAIL'
    F.LOT.DETAIL = ''
    CALL OPF(LOT.DETAIL.FILE, F.LOT.DETAIL)
    R.LOT.DETAIL = ''

    LOT.WORK.FILE = 'F.LOT.WORK'
    F.LOT.WORK = ''
    CALL OPF(LOT.WORK.FILE, F.LOT.WORK)
    R.LOT.WORK = ''

    LOT.LOG.LEVEL.FILE = 'F.LOT.LOG.LEVEL'
    F.LOT.LOG.LEVEL = ''
    CALL OPF(LOT.LOG.LEVEL.FILE, F.LOT.LOG.LEVEL)
    R.LOT.LOG.LEVEL = ''

    ACCOUNT.FILE = 'F.ACCOUNT' ; FBNK.ACCOUNT = ''
    CALL OPF(ACCOUNT.FILE, FBNK.ACCOUNT)

    ACCOUNT.CLASS.FILE = 'F.ACCOUNT.CLASS'
    F.ACCOUNT.CLASS = ''
    CALL OPF(ACCOUNT.CLASS.FILE, F.ACCOUNT.CLASS)
    YR.ACCOUNT.CLASS.ID = '' ; R.ACCOUNT.CLASS = ''

    CUSTOMER.FILE = 'F.CUSTOMER' ; F.CUSTOMER = ""
    CALL OPF(CUSTOMER.FILE, F.CUSTOMER)
    YR.CUSTOMER.ID = '' ; R.CUSTOMER = ''

    DEPT.ACCT.OFFICER.FILE = 'F.DEPT.ACCT.OFFICER'
    F.DEPT.ACCT.OFFICER = ""
    CALL OPF(DEPT.ACCT.OFFICER.FILE, F.DEPT.ACCT.OFFICER)
    YR.DAO.ID = '' ; R.DAO = ''

    FT.TXN.TYPE.CONDITION.FILE = 'F.FT.TXN.TYPE.CONDITION'
    F.FT.TXN.TYPE.CONDITION = ''
    CALL OPF(FT.TXN.TYPE.CONDITION.FILE, F.FT.TXN.TYPE.CONDITION)
    YR.FTTC.ID = '' ; R.FTTC = ''

*     Seting up of a concatenate override class with these applications

    OVERRIDE.APPL = APPLICATION:@VM:'ACCOUNT':@VM:'FUNDS.TRANSFER'
    CALL SIT.T.OV.CLASS

*     Routine that calculates the ACCOUNT from the RIB (if blank, ACCOUNT = RIB)

    CALL Y.LOAD.LOTRIB

RETURN

************************************************************************
GET.ACCOUNT.FROM.CATEGORY:
************************************************************************

    ACCT.OFFICER = R.ACCOUNT<AC.ACCOUNT.OFFICER,1>
    IF ACCT.OFFICER EQ '' THEN ACCT.OFFICER = R.LOT.PARAMETER<LOT.PAR.SUFFIX.BY.DEFAULT>
    IF ACCT.OFFICER EQ '' THEN ACCT.OFFICER = 1
    N.ACCT.NO = Y.CUR.VALUE:N.CATEGORY:STR('0',4-LEN(ACCT.OFFICER)):ACCT.OFFICER
    N.ACCOUNT = '' ; ER = ''
    CALL F.READ(ACCOUNT.FILE,N.ACCT.NO,N.ACCOUNT,FBNK.ACCOUNT,ER)
    IF ER THEN

*        If the account to be created from account class does not yet exist, take the model

        N.ACCT.MODEL = LCCY:N.CATEGORY:'0001'
        N.ACCOUNT = '' ; ER = ''
        CALL F.READ(ACCOUNT.FILE,N.ACCT.MODEL,N.ACCOUNT,FBNK.ACCOUNT,ER)
        IF NOT(ER) THEN
            N.ACCOUNT<AC.ACCOUNT.OFFICER> = ACCT.OFFICER
            N.ACCOUNT<AC.CURRENCY> = Y.CUR.VALUE
        END
    END

RETURN

***********************************************************************
READ.LOT.PENDING.FILE:
***********************************************************************

    ER = ''
    CALL F.READ(LOT.PENDING.FILE,YR.LOT.PENDING.ID,R.LOT.PENDING,F.LOT.PENDING,ER)

RETURN

***********************************************************************
READ.CUSTOMER.FILE:
***********************************************************************

    ER = ''
    CALL F.READ(CUSTOMER.FILE,YR.CUSTOMER.ID,R.CUSTOMER,F.CUSTOMER,ER)

RETURN

***********************************************************************
READ.DEPT.ACCT.OFFICER.FILE:
***********************************************************************

    ER = ''
    CALL F.READ(DEPT.ACCT.OFFICER.FILE,YR.DAO.ID,R.DAO,F.DEPT.ACCT.OFFICER,ER)

RETURN

***********************************************************************
READ.CFONB.LAYOUT.FILE:
***********************************************************************

    ER = ''
    CALL F.READ(CFONB.LAYOUT.FILE,YR.CFONB.LAYOUT.ID,R.CFONB.LAYOUT,F.CFONB.LAYOUT,ER)

RETURN

***********************************************************************
READ.LOT.PROCESS.FILE:
***********************************************************************

    ER = ''
    CALL F.READ(LOT.PROCESS.FILE,YR.LOT.PROCESS.ID,R.LOT.PROCESS,F.LOT.PROCESS,ER)

RETURN

***********************************************************************
READ.LOT.LOG.LEVEL.FILE:
***********************************************************************

    ER = ''
    CALL F.READ(LOT.LOG.LEVEL.FILE,YR.LOT.LOG.LEVEL.ID,R.LOT.LOG.LEVEL,F.LOT.LOG.LEVEL,ER)

RETURN

***********************************************************************
READ.LOT.FILES.FILE:
***********************************************************************

*     Check if a file with a similar header already exist
*     Preference goes to an identical header, otherwise, the last one is incremented by 1

    SW.RECOVERY = ''
    R.LOT.FILES = ''
    NB.DOTS = COUNT(YR.LOT.FILES.ID,".")

* VU/20090609/Modify SELECT statement below for better performance
*     SELECT.COMMAND = 'SELECT ':LOT.FILES.FILE:' WITH @ID LIKE ':YR.LOT.FILES.ID:'... BY @ID'
    SELECT.COMMAND = 'SELECT ':LOT.FILES.FILE:' WITH @ID LIKE ':DQUOTE(SQUOTE(YR.LOT.FILES.ID):'...'): ' BY @ID'

    AE.ID.LIST = '' ; NO.SELECTED = ''
    CALL EB.READLIST(SELECT.COMMAND,AE.ID.LIST,'',NO.SELECTED,'')
    YR.SICF.ID = YR.LOT.FILES.ID
    IF AE.ID.LIST THEN
        GOSUB SORT.AE.ID.LIST
        YR.SICF.ID.CALC = ''
        GO.ON = ''
        LOOP
            REMOVE YR.SICF.ID FROM AE.ID.LIST SETTING GO.ON
            R.SICF = '' ; ER = ''
            CALL F.READ(LOT.FILES.FILE,YR.SICF.ID,R.SICF,F.LOT.FILES,ER)
            IF NOT(ER) THEN
                LAST.PROCESS.DATE = OCONV(ICONV(R.SICF<LOT.FIL.PROCESS.DATE>,"D"),"D4/E")
                IF R.SUPER.RECORD EQ '' THEN         ; * No file header required
                    IF R.RED.RECORD EQ R.SICF<LOT.FIL.REM.HEADER,1> THEN  ; * Same Remit being treated again
                        IF R.SICF<LOT.FIL.REM.TRAILER,1> THEN   ; * Already processed to the end
                            LOG.LEVEL = '2' ; LOG.MESSAGE = 'EB-LOT.ALREADY.PROCESSED.REM':@FM:LAST.PROCESS.DATE
* EPI 22/06/2009 <
*                       LOG.JUMP = 'Y' ; RETURN
                            CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
                            IF LOG.LEVEL GT '0'
                            THEN LOG.MESSAGE = 'EB-LOT.ALREADY.PROCESSED.REM':@FM:LAST.PROCESS.DATE
                            ELSE LOG.MESSAGE = ''
                            LOG.JUMP = 'Y'
                            IF LOG.LEVEL EQ '2' THEN RETURN
                            IF YR.SICF.ID EQ YR.LOT.FILES.ID THEN
                                YR.SICF.ID.CALC = YR.SICF.ID:'.0'
                            END ELSE
                                YR.SICF.ID.CALC = YR.SICF.ID
                            END
* EPI 22/06/2009 >
                        END ELSE            ; * Recovery from a crash
                            SW.RECOVERY = 'Y'
                            LOG.LEVEL = '' ; LOG.MESSAGE = 'EB-LOT.CRASH.RECOVERY'
                            IF R.SICF<LOT.FIL.FILE.NAME> THEN PINTAPE = R.SICF<LOT.FIL.FILE.NAME>
                            R.LOT.FILES = R.SICF
                            YR.LOT.FILES.ID = YR.SICF.ID
                            YR.SICF.ID.CALC = YR.SICF.ID ; GO.ON = '' ;* EPI 22/06/2009
                        END
* EPI 22/06/2009 <
*                    YR.SICF.ID.CALC = YR.SICF.ID
*                    GO.ON = ''
* EPI 22/06/2009 >
                    END ELSE
                        MSG.ERR = 'EB-LOT.MISSING.FILE.HEADER'
                        CALL LOT.TRANSLATE.ERROR(MSG.ERR,'')
                        R.LOT.FILES<LOT.FIL.FILE.HEADER> = MSG.ERR
                        IF YR.SICF.ID.CALC EQ '' THEN
                            LOG.LEVEL = '' ; LOG.MESSAGE = 'EB-LOT.ALREADY.SIMILAR.REM':@FM:LAST.PROCESS.DATE
* EPI 22/06/2009 <
                            CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
                            LOG.MESSAGE = 'EB-LOT.ALREADY.SIMILAR.REM':@FM:LAST.PROCESS.DATE
                            IF LOG.LEVEL EQ '2' THEN RETURN
* EPI 22/06/2009 >
                        END
                        IF YR.SICF.ID EQ YR.LOT.FILES.ID THEN
                            YR.SICF.ID.CALC = YR.SICF.ID:'.0'
                        END ELSE
                            YR.SICF.ID.CALC = YR.SICF.ID
                        END
                    END
                END ELSE
                    IF R.RED.RECORD EQ R.SICF<LOT.FIL.FILE.HEADER> THEN   ; * Same File being treated again
                        IF R.SICF<LOT.FIL.FILE.TRAILER> THEN    ; * Already processed to the end
                            LOG.LEVEL = '2' ; LOG.MESSAGE = 'EB-LOT.ALREADY.PROCESSED.FILE':@FM:LAST.PROCESS.DATE
* EPI 22/06/2009 <
*                       LOG.JUMP = 'Y' ; RETURN
                            CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
                            IF LOG.LEVEL GT '0'
                            THEN LOG.MESSAGE = 'EB-LOT.ALREADY.PROCESSED.FILE':@FM:LAST.PROCESS.DATE
                            ELSE LOG.MESSAGE = ''
                            LOG.JUMP = 'Y'
                            IF LOG.LEVEL EQ 2 THEN RETURN
                            IF YR.SICF.ID EQ YR.LOT.FILES.ID THEN
                                YR.SICF.ID.CALC = YR.SICF.ID:'.0'
                            END ELSE
                                YR.SICF.ID.CALC = YR.SICF.ID
                            END
* EPI 22/06/2009 >
                        END ELSE

*                       Recovery from a crash

                            SW.RECOVERY = 'Y'
                            LOG.LEVEL = '' ; LOG.MESSAGE = 'EB-LOT.CRASH.RECOVERY'
                            IF R.SICF<LOT.FIL.FILE.NAME> THEN PINTAPE = R.SICF<LOT.FIL.FILE.NAME>
                            R.LOT.FILES = R.SICF
                            YR.LOT.FILES.ID = YR.SICF.ID
                            YR.SICF.ID.CALC = YR.SICF.ID ; GO.ON = '' ;* EPI 22/06/2009
                        END
* EPI 22/06/2009 <
*                    YR.SICF.ID.CALC = YR.SICF.ID
*                    GO.ON = ''
* EPI 22/06/2009 >
                    END ELSE
                        IF YR.SICF.ID.CALC EQ '' THEN
                            LOG.LEVEL = '' ; LOG.MESSAGE = 'EB-LOT.ALREADY.SIMILAR.FILE':@FM:LAST.PROCESS.DATE
* EPI 22/06/2009 <
                            CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
                            LOG.MESSAGE = 'EB-LOT.ALREADY.SIMILAR.FILE':@FM:LAST.PROCESS.DATE
                            IF LOG.LEVEL EQ '2' THEN RETURN
* EPI 22/06/2009 >
                        END
                        IF YR.SICF.ID EQ YR.LOT.FILES.ID THEN
                            YR.SICF.ID.CALC = YR.SICF.ID:'.0'
                        END ELSE
                            YR.SICF.ID.CALC = YR.SICF.ID
                        END
                    END
                END
            END
        UNTIL NOT(GO.ON)
        REPEAT
        YR.SICF.ID = YR.SICF.ID.CALC
    END

    IF YR.SICF.ID:'+' NE YR.LOT.FILES.ID:'+' THEN
        LAST.NUM = FIELD(YR.SICF.ID,".",NB.DOTS+2)+0
        LAST.NUM += 1
        YR.LOT.FILES.ID := '.':LAST.NUM
    END

    IF R.SUPER.RECORD EQ '' AND R.LOT.FILES<LOT.FIL.FILE.HEADER> EQ '' THEN
        MSG.REF = 'EB-LOT.MISSING.FILE.HEADER'
        CALL LOT.TRANSLATE.ERROR(MSG.REF,'')
        R.LOT.FILES<LOT.FIL.FILE.HEADER> = MSG.REF
    END

*EPI 16/06/2007 <

*     Will not be considered by Jbase unlike the first LOT.DETAIL write

    GOSUB WRITE.LOT.FILES.FILE

*EPI 16/06/2007 >

RETURN

***********************************************************************
SORT.AE.ID.LIST:
***********************************************************************

*     Ascending sort on the key suffix number

    NB.AE.ID.LIST = DCOUNT(AE.ID.LIST,@FM)
    SORTED.KEY3 = ""
    SORTED.LIST = ""
    FOR ITR = 1 TO NB.AE.ID.LIST
        SICF.KEY3 = FIELD(AE.ID.LIST<ITR>,".",NB.DOTS+2)
        IF SICF.KEY3 EQ '' THEN SICF.KEY3 = 0
        IF SORTED.LIST EQ '' THEN
            SORTED.KEY3 = SICF.KEY3<ITR>
            SORTED.LIST = AE.ID.LIST<ITR>
        END ELSE
            LOCATE SICF.KEY3 IN SORTED.KEY3<1> SETTING FOUN ELSE
                NB.SORTED.LIST = DCOUNT(SORTED.LIST,@FM)
                IF SICF.KEY3 GT SORTED.KEY3<NB.SORTED.LIST> THEN
                    SORTED.KEY3 := @FM:SICF.KEY3
                    SORTED.LIST := @FM:AE.ID.LIST<ITR>
                END ELSE
                    FOR ITZ = 1 TO NB.SORTED.LIST
                        IF SICF.KEY3 LT SORTED.KEY3<ITZ> THEN
                            SORTED.KEY3<ITZ> = SICF.KEY3:@FM:SORTED.KEY3<ITZ>
                            SORTED.LIST<ITZ> = AE.ID.LIST<ITR>:@FM:SORTED.LIST<ITZ>
                            EXIT
                        END
                    NEXT ITZ
                END
            END
        END
    NEXT ITR
    AE.ID.LIST = SORTED.LIST

RETURN

***********************************************************************
WORK.DATE.EDITION:
***********************************************************************

    Y.RETURN.DATE = OCONV(ICONV(WORK.DATE,'D'),'D/E')
    WORK.DATE.EDITED = Y.RETURN.DATE[7,4]:Y.RETURN.DATE[4,2]:Y.RETURN.DATE[1,2]

RETURN

***********************************************************************
WRITE.LOT.FILES.FILE:
***********************************************************************

    R.LOT.FILES<LOT.FIL.PROCESS.DATE> = Y.PROCESS.DATE
    R.LOT.FILES<LOT.FIL.PROCESS.TIME> = Y.PROCESS.TIME
    R.LOT.FILES<LOT.FIL.FILE.NAME> = PINTAPE
    CALL F.WRITE(LOT.FILES.FILE,YR.LOT.FILES.ID,R.LOT.FILES)

*     Creation of the concat file that links the processed files for a given date

    CALL F.READ(LOT.CONCAT.FILE,Y.PROCESS.DATE,R.LOT.CONCAT,F.LOT.CONCAT,ER)
    IF ER THEN
        R.LOT.CONCAT = YR.LOT.FILES.ID
    END ELSE
        LOCATE YR.LOT.FILES.ID IN R.LOT.CONCAT<1,1> BY "AL" SETTING DEJA ELSE
            INS YR.LOT.FILES.ID BEFORE R.LOT.CONCAT<1,DEJA>
        END
    END
    CALL F.WRITE(LOT.CONCAT.FILE,Y.PROCESS.DATE,R.LOT.CONCAT)

    IF RUNNING.UNDER.BATCH ELSE CALL JOURNAL.UPDATE(YR.LOT.FILES.ID)

RETURN

***********************************************************************
EXTRACT.ACCOUNT.CLASS.OR.ACCOUNT:
***********************************************************************

    GOSUB READ.ACCOUNT.CLASS
    IF ACC.CLASS.REC<AC.CLS.CATEGORY,1> THEN
        N.CATEGORY = ACC.CLASS.REC<AC.CLS.CATEGORY,1>
        N.ACCT.NO = ''
        R.ACCOUNT = ''
    END ELSE
        N.CATEGORY = ''
        ACCT.ID = ACCL.ID
        GOSUB READ.ACCOUNT.FILE
        IF ER THEN N.ACCT.NO = '' ELSE N.ACCT.NO = ACCL.ID
    END

RETURN

***********************************************************************
READ.ACCOUNT.CLASS:
***********************************************************************

    ER = ''
    ACC.CLASS.REC = ''
    CALL F.READ(ACCOUNT.CLASS.FILE,ACCL.ID,ACC.CLASS.REC,F.ACCOUNT.CLASS,ER)

RETURN

***********************************************************************
INITIATE.FILE.DATA:
***********************************************************************

    SW.CHECK.FILE.TRAILER = 'Y'
    CALC.FILE.REMIT = 0
    CALC.FILE.AMOUNT.CR = 0
    CALC.FILE.AMOUNT.DB = 0
    Y.REMIT.NUM = 0
    SW.FILE.TRAILER = 'N'
    SW.REMIT.TRAILER = 'N'

    LOT.DESCRIPTION = ''
    LOT.CONTRACT.ID = ''
    R.LOT.CONTRACT = ''

    YR.LOT.FILES.ID = ''

    SUPER.LAYOUT.ID = ''
    R.SUPER.LAYOUT = ''
    R.SUPER.RECORD = ''
    SUPER.CONTRACT.ID = ''
    R.SUPER.CONTRACT = ''

RETURN

***********************************************************************
UPDATE.LOG.FILE:
***********************************************************************

    IF LOG.LEVEL EQ '' THEN LOG.LEVEL = 0

    IF LOG.LEVEL GT WORST.LEVEL THEN WORST.LEVEL = LOG.LEVEL

    IF PINTAPE EQ '' THEN

*        General problem not linked to a given file

        NB.LOG.PROBLEMS = DCOUNT(R.LOT.LOG<LOT.LOG.PROBLEM.TIME>,@VM)
        R.LOT.LOG<LOT.LOG.PROBLEM.TIME,NB.LOG.PROBLEMS+1> = OCONV(TIME(),"MTS")
        R.LOT.LOG<LOT.LOG.PROBLEM.MESS,NB.LOG.PROBLEMS+1> = LOG.MESSAGE
        R.LOT.LOG<LOT.LOG.PROBLEM.LEVEL,NB.LOG.PROBLEMS+1> = LOG.LEVEL
    END ELSE

*        Specific problem linked to a given file

        I.EVENT = 0
        NB.LOG.FILES = DCOUNT(R.LOT.LOG<LOT.LOG.FILE.NAME>,@VM)

        IF NB.LOG.FILES EQ 0 THEN
            I.LOG = 1
        END ELSE
            PINTAPE.PREV = R.LOT.LOG<LOT.LOG.FILE.NAME,NB.LOG.FILES>
            IN.FILE.ID.PREV = R.LOT.LOG<LOT.LOG.LOT.FILES.ID,NB.LOG.FILES>
* EPI 09/10/2007 <
*           IF IN.FILE.ID.PREV AND (PINTAPE <> PINTAPE.PREV OR YR.LOT.FILES.ID <> IN.FILE.ID.PREV) THEN
            IF PINTAPE NE PINTAPE.PREV OR YR.LOT.FILES.ID NE IN.FILE.ID.PREV OR LOG.JUMP THEN
* EPI 09/10/2007 >
                I.LOG = NB.LOG.FILES + 1
            END ELSE
                IF LOT.MESG.ID EQ 'EB-LOT.NO.PROBLEM.FOUND' THEN
                    LOG.MESSAGE = '' ; LOG.LEVEL = '' ; RETURN
                END ELSE
                    I.LOG = NB.LOG.FILES
                    I.EVENT = DCOUNT(R.LOT.LOG<LOT.LOG.EVENT.TIME,I.LOG>,@SM)
                END
            END
        END
        R.LOT.LOG<LOT.LOG.LOT.FILES.ID,I.LOG> = YR.LOT.FILES.ID
        R.LOT.LOG<LOT.LOG.FILE.NAME,I.LOG> = PINTAPE
        R.LOT.LOG<LOT.LOG.USER.ID,I.LOG> = OPERATOR
        R.LOT.LOG<LOT.LOG.PROCESS.LEVEL,I.LOG> = WORST.LEVEL
        IF LOG.MESSAGE OR LOG.LEVEL THEN
            I.EVENT += 1
            R.LOT.LOG<LOT.LOG.EVENT.TIME,I.LOG,I.EVENT> = OCONV(TIME(),"MTS")
            R.LOT.LOG<LOT.LOG.EVENT.MESS,I.LOG,I.EVENT> = LOG.MESSAGE
            R.LOT.LOG<LOT.LOG.EVENT.LEVEL,I.LOG,I.EVENT> = LOG.LEVEL
        END
        PINTAPE.PREV = PINTAPE
        IN.FILE.ID.PREV = YR.LOT.FILES.ID
    END
    CALL F.WRITE(LOT.LOG.FILE,Y.PROCESS.DATE,R.LOT.LOG)
    LOG.MESSAGE = '' ; LOG.LEVEL = '' ; LOG.JUMP = ''

RETURN

************************************************************************
CALCULATE.CHARGES:
************************************************************************

    $INSERT  I_LOT.ACCOUNTING

*-----------------------------------------------------------------------
END
