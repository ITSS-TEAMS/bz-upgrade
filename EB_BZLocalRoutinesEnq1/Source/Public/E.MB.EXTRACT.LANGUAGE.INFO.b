*-----------------------------------------------------------------------------
* <Rating>5006</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE E.MB.EXTRACT.LANGUAGE.INFO(RETURN.DATA)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*-----------------------------------------------------------------------------
* Subroutine Type : Nofile enquiry routine
* Attached To : Standard Selection
* Attached As : Nofile enquiry
* Primary Purpose : To extract language information
*
* Incoming:
* ---------
*
* Outgoing:
* ---------
* RETURN.DATA
*
* Error Files:
* ------------
*
* Basic Files:
* ------------
* &SAVEDLISTS&
*
* $INSERT I_EQUATE - Not Used anymore;
* ------------------
*
* -----------------------------------------------------------------------------
* Modification History:
*------------------------------------------------------------------------------
* Program Description
! This is A nofile enquiry routine.
! This accepts the Application, the Ids AND the file TO which the extracted language
! info must be written
! Applications must be one of
! VERSION
! ENQUIRY
! EB.COMPOSITE.SCREEN
! OVERRIDE
! DYNAMIC.TEXT * Future
! STATICEB.SystemTables.getVFunction()uture
! HELPTEXT.MENU
! HELPTEXT.MAIN.MFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusATE * Future
! CONTEXT.ENQUIRY
! DEAL.SLIP.EFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusof the above

! OUT file will be .tsv
*-----------------------------------------------------------------------------
*ZIT-UPG-R13-R19:Arithmetic operators converted to T24 Operands
*               :CONVERT converted to CHANGE
*               :FM,VM,SM converted to @FM,@VM,@SM
*               :Used variable instead of Hardcoding FNVAR
*               :Commented CRT as per browser preferences
* ---------------------------------------------------------------------------

$INSERT I_COMMON
$INSERT I_EQUATE
$INSERT I_F.LANGUAGE
$INSERT I_ENQUIRY.COMMON
$INSERT I_F.VERSION
$INSERT I_F.ENQUIRY
$INSERT I_F.EB.COMPOSITE.SCREEN
$INSERT I_F.CONTEXT.ENQUIRY
$INSERT I_F.DEAL.SLIP.FORMAT
$INSERT I_F.HELPTEXT.MENU
$INSERT I_F.HELPTEXT.MAINMENU
$INSERT I_F.EB.ERROR
$INSERT IEB.DataAccess.OpfOVERRIDE
*--------EB.DataAccess.Opf------------------------------------------------------------------

    GOSUB INITIALISE
    IF NOT(ENQ.ERROR) THEN
! OFF TO process

        LOOP
        FT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefFReadOVE PROCESS.APPLICATION FROM PROCESS.APPLICATIONS SETTING PROCESS.MORE
        WHILE PROCESS.APPLICATION:PROCESS.MORE
! Fetch the IDS TO process
            GOSUB IDS.TO.PROCESS
            BEGIN CASE
    EB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyerSS.APPLICATION EQ 'SL'
            EB.SystemTables.setE()*-----------------------------------------------------------------------------
* <Rating>5006</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE E.MB.EXTRACT.LANGUAGE.INFO(RETURN.DATA)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*-----------------------------------------------------------------------------
* Subroutine Type : Nofile enquiry routine
* Attached To : Standard Selection
* Attached As : Nofile enquiry
* Primary Purpose : To extract language information
*
* Incoming:
* ---------
*
* Outgoing:
* ---------
* RETURN.DATA
*
* Error Files:
* ------------
*
* Basic Files:
* ------------
* &SAVEDLISTS&
*
* Version No: 1.07.0
* ------------------
*
* -----------------------------------------------------------------------------
* Modification History:
*------------------------------------------------------------------------------
* Program Description
! This is A nofile enquiry routine.
! This accepts the Application, the Ids AND the file TO which the extracted language
! info must be written
! Applications must be one of
! VERSION
! ENQUIRY
! EB.COMPOSITE.SCREEN
! OVERRIDE
! DYNAMIC.TEXT * Future
! STATIC.TEXT  * Future
! HELPTEXT.MENU
! HELPTEXT.MAIN.MENU
! REPGEN.CREATE * Future
! CONTEXT.ENQUIRY
! DEAL.SLIP.ENQUIRY
! OR ALL of the above

! OUT file will be .tsv
*-----------------------------------------------------------------------------
*ZIT-UPG-R13-R19:Arithmetic operators converted to T24 Operands
*               :CONVERT converted to CHANGE
*               :FM,VM,SM converted to @FM,@VM,@SM
*               :Used variable instead of Hardcoding FNVAR
*               :Commented CRT as per browser preferences
* ---------------------------------------------------------------------------

$INSERT I_COMMON
$INSERT I_EQUATE
$INSERT I_F.LANGUAGE
$INSERT I_ENQUIRY.COMMON
$INSERT I_F.VERSION
$INSERT I_F.ENQUIRY
$INSERT I_F.EB.COMPOSITE.SCREEN
$INSERT I_F.CONTEXT.ENQUIRY
$INSERT I_F.DEAL.SLIP.FORMAT
$INSERT I_F.HELPTEXT.MENU
$INSERT I_F.HELPTEXT.MAINMENU
$INSERT I_F.EB.ERROR
$INSERT I_F.OVERRIDE
*-----------------------------------------------------------------------------

    GOSUB INITIALISE
    IF NOT(ENQ.ERROR) THEN
! OFF TO process

        LOOP
            REMOVE PROCESS.APPLICATION FROM PROCESS.APPLICATIONS SETTING PROCESS.MORE
        WHILE PROCESS.APPLICATION:PROCESS.MORE
! Fetch the IDS TO process
            GOSUB IDS.TO.PROCESS
            BEGIN CASE
            CASE PROCESS.APPLICATION EQ 'SL'
                GOSUB PROCESS.SL
                VAILD.APPLN = '1'
            CASE PROEB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyerQ 'VEEB.SystemTables.getIdNew()
                GOSUB PROCESS.VERSION
                VEB.DataAccess.FWritePLN = '1'
            CASE PROCESS.APPLICATION EQ 'ENQUIRY'
                GOSUB PROCESS.ENQUIRY
                VAILD.APPLN = '1'
        EB.SystemTables.setAf()*-----------------------------------------------------------------------------
* <Rating>5006</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE E.MB.EXTRACT.LANGUAGE.INFO(RETURN.DATA)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*-----------------------------------------------------------------------------
* Subroutine Type : Nofile enquiry routine
* Attached To : Standard Selection
* Attached As : Nofile enquiry
* Primary Purpose : To extract language information
*
* Incoming:
* ---------
*
* Outgoing:
* ---------
* RETURN.DATA
*
* Error Files:
* ------------
*
* Basic Files:
* ------------
* &SAVEDLISTS&
*
* Version No: 1.07.0
* ------------------
*
* -----------------------------------------------------------------------------
* Modification History:
*------------------------------------------------------------------------------
* Program Description
! This is A nofile enquiry routine.
! This accepts the Application, the Ids AND the file TO which the extracted language
! info must be written
! Applications must be one of
! VERSION
! ENQUIRY
! EB.COMPOSITE.SCREEN
! OVERRIDE
! DYNAMIC.TEXT * Future
! STATIC.TEXT  * Future
! HELPTEXT.MENU
! HELPTEXT.MAIN.MENU
! REPGEN.CREATE * Future
! CONTEXT.ENQUIRY
! DEAL.SLIP.ENQUIRY
! OR ALL of the above

! OUT file will be .tsv
*-----------------------------------------------------------------------------
*ZIT-UPG-R13-R19:Arithmetic operators converted to T24 Operands
*               :CONVERT converted to CHANGE
*               :FM,VM,SM converted to @FM,@VM,@SM
*               :Used variable instead of Hardcoding FNVAR
*               :Commented CRT as per browser preferences
* ---------------------------------------------------------------------------

$INSERT I_COMMON
$INSERT I_EQUATE
$INSERT I_F.LANGUAGE
$INSERT I_ENQUIRY.COMMON
$INSERT I_F.VERSION
$INSERT I_F.ENQUIRY
$INSERT I_F.EB.COMPOSITE.SCREEN
$INSERT I_F.CONTEXT.ENQUIRY
$INSERT I_F.DEAL.SLIP.FORMAT
$INSERT I_F.HELPTEXT.MENU
$INSERT I_F.HELPTEXT.MAINMENU
$INSERT I_F.EB.ERROR
$INSERT I_F.OVERRIDE
*-----------------------------------------------------------------------------

    GOSUB INITIALISE
    IF NOT(ENQ.ERROR) THEN
! OFF TO process

        LOOP
            REMOVE PROCESS.APPLICATION FROM PROCESS.APPLICATIONS SETTING PROCESS.MORE
        WHILE PROCESS.APPLICATION:PROCESS.MORE
! Fetch the IDS TO process
            GOSUB IDS.TO.PROCESS
            BEGIN CASE
            CASE PROCESS.APPLICATION EQ 'SL'
                GOSUB PROCESS.SL
                VAILD.APPLN = '1'
            CASE PROCESS.APPLICATION EQ 'VERSION'
                GOSUB PROCESS.VERSION
                VAILD.APPLN = '1'
            CASE PROCESS.APPLICATION EQ 'ENQUIRY'
                GOSUB PROCESS.ENQUIRY
                VAILD.APPLN = '1'
           FT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefPPLICATION EQ 'EB.COMPOSITE.SCREEN'
        EB.SystemTables.setE()*-----------------------------------------------------------------------------
* <Rating>5006</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE E.MB.EXTRACT.LANGUAGE.INFO(RETURN.DATA)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*-----------------------------------------------------------------------------
* Subroutine Type : Nofile enquiry routine
* Attached To : Standard Selection
* Attached As : Nofile enquiry
* Primary Purpose : To extract language information
*
* Incoming:
* ---------
*
* Outgoing:
* ---------
* RETURN.DATA
*
* Error Files:
* ------------
*
* Basic Files:
* ------------
* &SAVEDLISTS&
*
* Version No: 1.07.0
* ------------------
*
* -----------------------------------------------------------------------------
* Modification History:
*------------------------------------------------------------------------------
* Program Description
! This is A nofile enquiry routine.
! This accepts the Application, the Ids AND the file TO which the extracted language
! info must be written
! Applications must be one of
! VERSION
! ENQUIRY
! EB.COMPOSITE.SCREEN
! OVERRIDE
! DYNAMIC.TEXT * Future
! STATIC.TEXT  * Future
! HELPTEXT.MENU
! HELPTEXT.MAIN.MENU
! REPGEN.CREATE * Future
! CONTEXT.ENQUIRY
! DEAL.SLIP.ENQUIRY
! OR ALL of the above

! OUT file will be .tsv
*-----------------------------------------------------------------------------
*ZIT-UPG-R13-R19:Arithmetic operators converted to T24 Operands
*               :CONVERT converted to CHANGE
*               :FM,VM,SM converted to @FM,@VM,@SM
*               :Used variable instead of Hardcoding FNVAR
*               :Commented CRT as per browser preferences
* ---------------------------------------------------------------------------

$INSERT I_COMMON
$INSERT I_EQUATE
$INSERT I_F.LANGUAGE
$INSERT I_ENQUIRY.COMMON
$INSERT I_F.VERSION
$INSERT I_F.ENQUIRY
$INSERT I_F.EB.COMPOSITE.SCREEN
$INSERT I_F.CONTEXT.ENQUIRY
$INSERT I_F.DEAL.SLIP.FORMAT
$INSERT I_F.HELPTEXT.MENU
$INSERT I_F.HELPTEXT.MAINMENU
$INSERT I_F.EB.ERROR
$INSERT I_F.OVERRIDE
*-----------------------------------------------------------------------------

    GOSUB INITIALISE
    IF NOT(ENQ.ERROR) THEN
! OFF TO process

        LOOP
            REMOVE PROCESS.APPLICATION FROM PROCESS.APPLICATIONS SETTING PROCESS.MORE
        WHILE PROCESS.APPLICATION:PROCESS.MORE
! Fetch the IDS TO process
            GOSUB IDS.TO.PROCESS
            BEGIN CASE
            CASE PROCESS.APPLICATION EQ 'SL'
                GOSUB PROCESS.SL
                VAILD.APPLN = '1'
            CASE PROCESS.APPLICATION EQ 'VERSION'
                GOSUB PROCESS.VERSION
                VAILD.APPLN = '1'
            CASE PROCESS.APPLICATION EQ 'ENQUIRY'
                GOSUB PROCESS.ENQUIRY
                VAILD.APPLN = '1'
            CASE PROCESS.APPLICATION EQ 'EB.COMPOSITE.SCREEN'
                GOSUB PROCESS.ECS
                VAILD.APPLN = '1'
            CASE PROCESS.APPLICATION EQ 'OVERRIDE'
                GOSUB PROCESS.OVERRIDE
                VAILD.APPLN = '1'
! Too much TO WRITE - DO we really need it :)
!               CASE PROCESS.APPLICATION EQ 'DYNAMIC.TEXT'
!                  GOSUB PROCESS.DYNAMIC.TEXT
                VAILD.APPLN = '1'
!               CASE PROCESS.APPLICATION EQ 'STATIC.TEXT'
!                  GOSUB PROCESS.STATIC.TEXT
                VAILD.APPLN = '1'
            CASE PROCESS.APPLICATION EQ 'HELPTEXT.MENU'
                GOSUB PROCESS.HELPTEXT.MENU
                VAILD.APPLN = '1'
            CASE PROCESS.APPLICATION EQ 'HELPTEXT.MAINMENU'
                GOSUB PROCESS.HMM
                VAILD.APPLN = '1'
            CASE PROCESS.APPLICATION EQ 'REPGEN.CREATE'
! Too much TO WRITE - DO we really need it :)
!                  GOSUB PROCESS.REPGEN.CREATE
                VAILD.APPLN = '1'
            CASE PROCESS.APPLICATION EQ 'CONTEXT.ENQUIRY'
                GOSUB PROCESS.CONTEXT.ENQUIRY
                VAILD.APPLN = '1'
            CASE PROCESS.APPLICATION EQ 'DEAL.SLIP.FORMAT'
                GOSUB PROCESS.DSF
                VAILD.APPLN = '1'
            CASE PROCESS.APPLICATION EQ 'EB.ERROR'
                GOSUB PROCESS.EB.ERROR
                VAILD.APPLN = '1'
            CASE 1
                VAILD.APPLN = '2'

            END CASE
        REPEAT
    END

    IF VAILD.APPLN EQ '1' THEN
        RETURN.DATA='PROCESS COMPLETED'
        RETURN.DATA<-1> = 'Out Dir Name : ' :OUTPUT.DIRECTORY
        FILE.NAME.CNT = DCOUNT(DISPLAY.FILE,@FM)
        RETURN.DATA<-1> = 'File(s) Generated '
        FOR FILE.NAME.LOOP = 1 TO FILE.NAME.CNT
            FILE.NAME.DISPLAY = DISPLAY.FILE<FILE.NAME.LOOP>
            RETURN.DATA<-1> = " -  ":FILE.NAME.DISPLAY
        NEXT FILE.NAME.LOOP
    END ELSE
        RETURN.DATA='INVALID APPLICATION - ':PROCESS.APPLICATIONS
    END

    RETURN
*-----------------------------------------------------------------------------
INITIALISE:
    DISPLAY.FILE = ''
    VAILD.APPLN = ''
    SEL.CRITERIA = ''
! First fetch the languages
    FN.LANGUAGE='F.LANGUAGE'
    F.LANGUAGE=''
    CALL OPF(FN.LANGUAGE,F.LANGUAGE)

    SEL.LANG='SSELECT ':FN.LANGUAGE

    CALL EB.READLIST(SEL.LANG,LANG.LIST,'',LANG.CNT,LANG.ERR)
    IF NOT(LANG.ERR) THEN LANG.ERR=''
    DELIM.CHAR='~'
    HEADER.REC='Application Name':DELIM.CHAR:'Record Id':DELIM.CHAR:'Field Name':DELIM.CHAR
    HEADER.REC:='Reference Value '
! I have the list of Languages

    LANG.ARRAY=''
    LOOP
        REMOVE LANG.ID FROM LANG.LIST SETTING LANG.MORE
    WHILE LANG.ID:LANG.MORE
        CALL F.READ(FN.LANGUAGE,LANG.ID,LANG.REC,F.LANGUAGE,LANG.ERR)
        LANG.ARRAY<-1>=LANG.REC<EB.LAN.DESCRIPTION>
        HEADER.REC:=DELIM.CHAR:LANG.REC<EB.LAN.DESCRIPTION>
    REPEAT

! OPEN the required files

    FN.ENQUIRY = 'F.ENQUIRY'
    F.ENQUIRY = ''
    CALL OPF(FN.ENQUIRY,F.ENQUIRY)

    FN.VERSION='F.VERSION'
    F.VERSION=''
    CALL OPF(FN.VERSION,F.VERSION)

    FN.EB.COMPOSITE.SCREEN = 'F.EB.COMPOSITE.SCREEN'
    F.EB.COMPOSITE.SCREEN = ''
    CALL OPF(FN.EB.COMPOSITE.SCREEN,F.EB.COMPOSITE.SCREEN)

    FN.OVERRIDE = 'F.OVERRIDE'
    F.OVERRIDE = ''
    CALL OPF(FN.OVERRIDE,F.OVERRIDE)

    FN.DYNAMIC.TEXT = 'F.DYNAMIC.TEXT'
    F.DYNAMIC.TEXT = ''
    CALL OPF(FN.DYNAMIC.TEXT,F.DYNAMIC.TEXT)

    FN.STATIC.TEXT = 'F.STATIC.TEXT'
    F.STATIC.TEXT = ''
    CALL OPF(FN.STATIC.TEXT,F.STATIC.TEXT)

    FN.HELPTEXT.MENU = 'F.HELPTEXT.MENU'
    F.HELPTEXT.MENU = ''
    CALL OPF(FN.HELPTEXT.MENU,F.HELPTEXT.MENU)

    FN.HELPTEXT.MAINMENU = 'F.HELPTEXT.MAINMENU'
    F.HELPTEXT.MAINMENU = ''
    CALL OPF(FN.HELPTEXT.MAINMENU,F.HELPTEXT.MAINMENU)

    FN.REPGEN.CREATE = 'F.REPGEN.CREATE'
    F.REPGEN.CREATE = ''
    CALL OPF(FN.REPGEN.CREATE,F.REPGEN.CREATE)

    FN.CONTEXT.ENQUIRY = 'F.CONTEXT.ENQUIRY'
    F.CONTEXT.ENQUIRY = ''
    CALL OPF(FN.CONTEXT.ENQUIRY,F.CONTEXT.ENQUIRY)

    FN.DEAL.SLIP.FORMAT = 'F.DEAL.SLIP.FORMAT'
    F.DEAL.SLIP.FORMAT = ''
    CALL OPF(FN.DEAL.SLIP.FORMAT,F.DEAL.SLIP.FORMAT)

    FN.EB.ERROR = 'F.EB.ERROR'
    F.EB.ERROR = ''
    CALL OPF(FN.EB.ERROR,F.EB.ERROR)

    FN.SL = "&SAVEDLISTS&"
	F.SL=''
*   OPEN "&SAVEDLISTS&" TO F.SL ELSE *CRT 'Missing SAVEDLISTS file'  ;*CRT commented as per browser preferences
    OPEN FN.SL TO F.SL ELSE ;*CRT 'Missing SAVEDLISTS file'  ;*Used Variable instead of Hardcoding FNVAR
	END
    ENQ.ERROR=''
    OUTPUT.DIRECTORY='MB.LANG.DATA'
    OUTPUT.FILE.REC=''

! Valid applications
    VALID.APPLICATIONS=''
    VALID.APPLICATIONS<-1>='VERSION'
    VALID.APPLICATIONS<-1>='ENQUIRY'
    VALID.APPLICATIONS<-1>='EB.COMPOSITE.SCREEN'
    VALID.APPLICATIONS<-1>='OVERRIDE'
    VALID.APPLICATIONS<-1>='DYNAMIC.TEXT'
    VALID.APPLICATIONS<-1>='STATIC.TEXT'
    VALID.APPLICATIONS<-1>='HELPTEXT.MENU'
    VALID.APPLICATIONS<-1>='HELPTEXT.MAINMENU'
    VALID.APPLICATIONS<-1>='REPGEN.CREATE'
    VALID.APPLICATIONS<-1>='CONTEXT.ENQUIRY'
    VALID.APPLICATIONS<-1>='DEAL.SLIP.FORMAT'
    VALID.APPLICATIONS<-1>='EB.ERROR'
    VALID.APPLICATIONS<-1>='SL'
    DELIM.CHAR='~'

    PROCESS.ALL=''
    LOCATE 'PROCESS.APPL' IN D.FIELDS<1> SETTING APPL.POS ELSE APPL.POS=''

    IF APPL.POS EQ '' OR D.RANGE.AND.VALUE<APPL.POS> EQ 'ALL' THEN
! IF APPLICATION is all THEN just GO ahead AND process all the files.
        PROCESS.APPLICATIONS=VALID.APPLICATIONS
        SEL.CRITERIA=''
        OUT.FILE=''
        PROCESS.ALL=1
        VAILD.APPLN = '1'
    END ELSE
        PROCESS.APPLICATIONS=D.RANGE.AND.VALUE<APPL.POS>
! Check IF it is A valid APPLICATION
        LOCATE PROCESS.APPLICATIONS IN VALID.APPLICATIONS<1> SETTING VALID.APPL ELSE VALID.APPL=0
        IF NOT(VALID.APPL) THEN
            ENQ.ERROR<-1>='Invalid Language Application'
        END ELSE
            LOCATE 'ID.SEL.CRITERIA' IN D.FIELDS<1> SETTING SEL.POS ELSE SEL.POS=''
            IF SEL.POS THEN
                SEL.CRITERIA=D.RANGE.AND.VALUE<SEL.POS>
            END
            LOCATE 'OUTFILE' IN D.FIELDS<1> SETTING OUTFILE.POS ELSE OUTFILE.POS=''
            IF OUTFILE.POS THEN
                OUT.FILE=D.RANGE.AND.VALUE<OUTFILE.POS>
            END ELSE
                OUT.FILE=''
            END
        END
    END

    RETURN

***************
IDS.TO.PROCESS:
***************
    IDS.TO.PROCESS=''

    IF SEL.CRITERIA[1,2] EQ 'SL' THEN
        SL.ID=FIELD(SEL.CRITERIA,'-',2)
        READ IDS.TO.PROCESS FROM F.SL,SL.ID ELSE ;*CRT 'SL ID FOR ':PROCESS.APPLICATION:'DOES NOT EXIST'
        END
    END ELSE
        IF SEL.CRITERIA THEN

            SEL.CMD = "SELECT ":"F.":PROCESS.APPLICATION :" LIKE ":SEL.CRITERIA
            CALL EB.READLIST(SEL.CMD,SEL.LIST,'',NO.OF.IDS,IDS.ERR)
            IDS.TO.PROCESS=SEL.LIST
        END ELSE
            SEL.CRITERIA='ALL'          ;* Let be selected at each application level
        END
    END
    RETURN

***********
PROCESS.SL:
***********
    OUT.FILE=''
    PROCESS.ALL=1
    VERSION.LIST = ''
    ENQUIRY.LIST = ''
    ECS.LIST = ''
    OVERRIDE.LIST = ''
    HM.LIST = ''
    HMM.LIST = ''
    CONTEXT.ENQUIRY.LIST = ''
    DSF.LIST = ''
    EB.ERROR.LIST = ''
    IDS.TO.PROCESS.SL = ''

    IF SEL.CRITERIA[1,2] EQ 'SL' THEN
        SL.ID=FIELD(SEL.CRITERIA,'-',2)
        READ IDS.TO.PROCESS.SL FROM F.SL,SL.ID ELSE ;*CRT 'SL ID FOR ':PROCESS.APPLICATION:'DOES NOT EXIST'
        END
	END

    LOOP
        REMOVE ID.TO.PROCESS.SL FROM IDS.TO.PROCESS.SL SETTING MORE.IDS.SL
    WHILE ID.TO.PROCESS.SL:MORE.IDS.SL
        SL.APPLN = '';SL.FILE.NAME ='';IDS.TO.PROCESS = ''
        SL.APPLN=FIELD(ID.TO.PROCESS.SL,'>',1)
        SL.FILE.NAME=FIELD(ID.TO.PROCESS.SL,'>',2)


        IF SL.APPLN EQ 'VERSION' THEN
            VERSION.LIST<-1>=SL.FILE.NAME
        END
        IF SL.APPLN EQ 'ENQUIRY' THEN
            ENQUIRY.LIST<-1>=SL.FILE.NAME
        END
        IF SL.APPLN EQ 'EB.COMPOSITE.SCREEN' THEN
            ECS.LIST<-1>=SL.FILE.NAME
        END
        IF SL.APPLN EQ 'OVERRIDE' THEN
            OVERRIDE.LIST<-1>=SL.FILE.NAME
        END
        IF SL.APPLN EQ 'HELPTEXT.MENU' THEN
            HM.LIST<-1>=SL.FILE.NAME
        END
        IF SL.APPLN EQ 'HELPTEXT.MAINMENU' THEN
            HMM.LIST<-1>=SL.FILE.NAME
        END
        IF SL.APPLN EQ 'CONTEXT.ENQUIRY' THEN
            CONTEXT.ENQUIRY.LIST<-1>=SL.FILE.NAME
        END
        IF SL.APPLN EQ 'DEAL.SLIP.FORMAT' THEN
            DSF.LIST<-1>=SL.FILE.NAME
        END
        IF SL.APPLN EQ 'EB.ERROR' THEN
            EB.ERROR.LIST<-1>=SL.FILE.NAME
        END

    REPEAT
! count in array

    VERSION.LIST.CNT = DCOUNT(VERSION.LIST,@FM)
    ENQUIRY.LIST.CNT = DCOUNT(ENQUIRY.LIST,@FM)
    ECS.LIST.CNT = DCOUNT(ECS.LIST,@FM)
    OVERRIDE.LIST.CNT = DCOUNT(OVERRIDE.LIST,@FM)
    HM.LIST.CNT = DCOUNT(HM.LIST,@FM)
    HMM.LIST.CNT = DCOUNT(HMM.LIST,@FM)
    CONTEXT.ENQUIRY.LIST.CNT = DCOUNT(CONTEXT.ENQUIRY.LIST,@FM)
    DSF.LIST.CNT = DCOUNT(DSF.LIST,@FM)
    EB.ERROR.LIST.CNT = DCOUNT(EB.ERROR.LIST,@FM)

! calling the applications according to the list formed

    IF VERSION.LIST.CNT NE '0' THEN
        IDS.TO.PROCESS = ''
        IDS.TO.PROCESS = VERSION.LIST
        GOSUB PROCESS.VERSION
    END
    IF ENQUIRY.LIST.CNT NE '0' THEN
        IDS.TO.PROCESS = ''
        IDS.TO.PROCESS = ENQUIRY.LIST
        GOSUB PROCESS.ENQUIRY
    END
    IF ECS.LIST.CNT NE '0' THEN
        IDS.TO.PROCESS = ''
        IDS.TO.PROCESS = ECS.LIST
        GOSUB PROCESS.ECS
    END
    IF OVERRIDE.LIST.CNT NE '0' THEN
        IDS.TO.PROCESS = ''
        IDS.TO.PROCESS = OVERRIDE.LIST
        GOSUB PROCESS.OVERRIDE
    END
    IF HM.LIST.CNT NE '0' THEN
        IDS.TO.PROCESS = ''
        IDS.TO.PROCESS = HM.LIST
        GOSUB PROCESS.HELPTEXT.MENU
    END
    IF HMM.LIST.CNT NE '0' THEN
        IDS.TO.PROCESS = ''
        IDS.TO.PROCESS = HMM.LIST
        GOSUB PROCESS.HMM
    END
    IF CONTEXT.ENQUIRY.LIST.CNT NE '0' THEN
        IDS.TO.PROCESS = ''
        IDS.TO.PROCESS = CONTEXT.ENQUIRY.LIST
        GOSUB PROCESS.CONTEXT.ENQUIRY
    END
    IF DSF.LIST.CNT NE '0' THEN
        IDS.TO.PROCESS = ''
        IDS.TO.PROCESS = DSF.LIST
        GOSUB PROCESS.DSF
    END
    IF EB.ERROR.LIST.CNT NE '0' THEN
        IDS.TO.PROCESS = ''
        IDS.TO.PROCESS = EB.ERROR.LIST
        GOSUB PROCESS.EB.ERROR
    END

    RETURN

****************
PROCESS.VERSION:
****************
    IF SEL.CRITERIA EQ 'ALL' THEN
        SEL.CMD='SSELECT ':FN.VERSION
        CALL EB.READLIST(SEL.CMD,IDS.TO.PROCESS,'',NO.OF.IDS,IDS.ERR)
    END
    IF NOT(OUT.FILE) OR PROCESS.ALL THEN OUT.FILE='VERSION.LANG.tsv'
    OPENSEQ OUTPUT.DIRECTORY,OUT.FILE TO F.OUT.FILE ELSE ;*CRT 'Opening ':OUT.FILE:' for processing'
	END
    DISPLAY.FILE<-1> = OUT.FILE
    IF IDS.TO.PROCESS THEN
! Ok there is something TO process
        HEADER.LINE.WRITTEN='HEADER'
        OUT.REC=HEADER.REC
        GOSUB WRITE.TO.FILE
    END

    LOOP
        REMOVE ID.TO.PROCESS FROM IDS.TO.PROCESS SETTING MORE.IDS
    WHILE ID.TO.PROCESS:MORE.IDS
! The first line should contain the APPLICATION AND record id...
        HEADER.LINE.WRITTEN=0
        OUTPUT.WITH.INFO='VERSION':DELIM.CHAR:ID.TO.PROCESS ;*Output WITH Info
        OUTPUT.WITHOUT.INFO=DELIM.CHAR  ;*Output without Info

        CALL F.READ(FN.VERSION,ID.TO.PROCESS,VERSION.REC,F.VERSION,VERSION.ERR)


! First the HEADER SECTION

! Header FIELDS

        FIELDS.TO.PROCESS=''

        FIELDS.TO.PROCESS<-1>=EB.VER.HDR.1.001..039
        FIELDS.TO.PROCESS<-1>=EB.VER.HDR.1.040..078
        FIELDS.TO.PROCESS<-1>=EB.VER.HDR.1.079..117
        FIELDS.TO.PROCESS<-1>=EB.VER.HDR.1.118..132

        FIELDS.TO.PROCESS<-1>=EB.VER.HDR.2.001..039
        FIELDS.TO.PROCESS<-1>=EB.VER.HDR.2.040..078
        FIELDS.TO.PROCESS<-1>=EB.VER.HDR.2.079..117
        FIELDS.TO.PROCESS<-1>=EB.VER.HDR.2.118..132

        FIELD.NAMES=''

        FIELD.NAMES<-1>="HDR.1.001..039"
        FIELD.NAMES<-1>="HDR.1.040..078"
        FIELD.NAMES<-1>="HDR.1.079..117"
        FIELD.NAMES<-1>="HDR.1.118..132"

        FIELD.NAMES<-1>="HDR.2.001..039"
        FIELD.NAMES<-1>="HDR.2.040..078"
        FIELD.NAMES<-1>="HDR.2.079..117"
        FIELD.NAMES<-1>="HDR.2.118..132"

        NO.OF.FIELDS=DCOUNT(FIELDS.TO.PROCESS,@FM)

        FOR I = 1 TO NO.OF.FIELDS
            REC.TO.PROCESS=VERSION.REC<FIELDS.TO.PROCESS<I>>
            IF REC.TO.PROCESS THEN
                OUT.REC=''
                OUT.REC=FIELD.NAMES<I>:DELIM.CHAR
                GOSUB MULTI.VALUE.FIELD.PROCESS
                GOSUB WRITE.TO.FILE
            END
        NEXT I

! TEXT FIELDS SECTION

        FIELDS.TO.PROCESS=''

        FIELDS.TO.PROCESS<-1>=EB.VER.TEXT
        FIELDS.TO.PROCESS<-1>=EB.VER.TXT.040..078
        FIELDS.TO.PROCESS<-1>=EB.VER.TXT.079..117
        FIELDS.TO.PROCESS<-1>=EB.VER.TXT.118..132

        FIELD.NAMES=''

        FIELD.NAMES<-1>="TEXT"
        FIELD.NAMES<-1>="TXT.040..078"
        FIELD.NAMES<-1>="TXT.079..117"
        FIELD.NAMES<-1>="TXT.118..132"

        NO.OF.FIELDS=DCOUNT(FIELDS.TO.PROCESS,@FM)

        FIELDS.COUNT=DCOUNT(VERSION.REC<EB.VER.FIELD.NO>,@VM)
! FOR each FIELD DO all the processing
        FOR J = 1 TO FIELDS.COUNT

! Multiple TEXT FIELDS are allowed only when A * is INPUT
! ELSE only one TEXT is allowed

            IF VERSION.REC<EB.VER.FIELD.NO,J> EQ '*' THEN
                TEXT.FIELDS=NO.OF.FIELDS
            END ELSE
                TEXT.FIELDS=1
            END
            FOR I = 1 TO TEXT.FIELDS

                REC.TO.PROCESS=VERSION.REC<FIELDS.TO.PROCESS<I>,J>
                IF REC.TO.PROCESS THEN
*ZIT-UPG-R13-R19 S 
*                   CONVERT SM TO VM IN REC.TO.PROCESS
					CHANGE @SM TO @VM IN REC.TO.PROCESS
*ZIT-UPG-R13-R19 E
                    OUT.REC=''
                    OUT.REC=FIELD.NAMES<I>:'-':J:DELIM.CHAR:VERSION.REC<EB.VER.FIELD.NO,J>
                    GOSUB MULTI.VALUE.FIELD.PROCESS
                    GOSUB WRITE.TO.FILE
                END
            NEXT I
        NEXT J

! PROMPT AND TOOLTIP FIELDS SECTION

        FIELDS.TO.PROCESS=''

        FIELDS.TO.PROCESS<-1>=EB.VER.PROMPT.TEXT
        FIELDS.TO.PROCESS<-1>=EB.VER.TOOL.TIP

        FIELD.NAMES=''

        FIELD.NAMES<-1>="PROMPT.TEXT"
        FIELD.NAMES<-1>="TOOL.TIP"

        NO.OF.FIELDS=DCOUNT(FIELDS.TO.PROCESS,@FM)

        FIELDS.COUNT=DCOUNT(VERSION.REC<EB.VER.FIELD.NO>,@VM)
! FOR each FIELD DO all the processing
        FOR I = 1 TO NO.OF.FIELDS
            FOR J = 1 TO FIELDS.COUNT

                REC.TO.PROCESS=VERSION.REC<FIELDS.TO.PROCESS<I>,J>
                IF REC.TO.PROCESS THEN
*ZIT-UPG-R13-R19 S 
*                   CONVERT SM TO VM IN REC.TO.PROCESS
					CHANGE @SM TO @VM IN REC.TO.PROCESS
*ZIT-UPG-R13-R19 E
                   
                    OUT.REC=''
                    OUT.REC=FIELD.NAMES<I>:'-':J:DELIM.CHAR:VERSION.REC<EB.VER.FIELD.NO,J>
                    GOSUB MULTI.VALUE.FIELD.PROCESS
                    GOSUB WRITE.TO.FILE
                END
            NEXT J
        NEXT I

! Finally the trailer
        FIELDS.TO.PROCESS=''
        FIELDS.TO.PROCESS<-1>=EB.VER.DESCRIPTION

        FIELD.NAMES=''
        FIELD.NAMES<-1>="DESCRIPTION"

        NO.OF.FIELDS=DCOUNT(FIELDS.TO.PROCESS,@FM)

        FOR I = 1 TO NO.OF.FIELDS
            REC.TO.PROCESS=VERSION.REC<FIELDS.TO.PROCESS<I>>
            IF REC.TO.PROCESS THEN
                OUT.REC=''
                OUT.REC=FIELD.NAMES<I>:DELIM.CHAR

                GOSUB MULTI.VALUE.FIELD.PROCESS
                GOSUB WRITE.TO.FILE
            END
        NEXT I
    REPEAT

    RETURN

****************
PROCESS.ENQUIRY:
****************

    IF SEL.CRITERIA EQ 'ALL' THEN
        SEL.CMD='SSELECT ':FN.ENQUIRY
        CALL EB.READLIST(SEL.CMD,IDS.TO.PROCESS,'',NO.OF.IDS,IDS.ERR)
    END
    IF NOT(OUT.FILE) OR PROCESS.ALL THEN OUT.FILE='ENQUIRY.LANG.tsv'

    OPENSEQ OUTPUT.DIRECTORY,OUT.FILE TO F.OUT.FILE ELSE ;*CRT 'Opening ':OUT.FILE:' for processing'
	END
    DISPLAY.FILE<-1> = OUT.FILE
    IF IDS.TO.PROCESS THEN
! Ok there is something TO process
        HEADER.LINE.WRITTEN='HEADER'
        OUT.REC=HEADER.REC
        GOSUB WRITE.TO.FILE
    END

    LOOP
        REMOVE ID.TO.PROCESS FROM IDS.TO.PROCESS SETTING MORE.IDS
    WHILE ID.TO.PROCESS:MORE.IDS

! The first line should contain the APPLICATION AND record id...
        HEADER.LINE.WRITTEN=0
        OUTPUT.WITH.INFO='ENQUIRY':DELIM.CHAR:ID.TO.PROCESS ;*Output WITH Info
        OUTPUT.WITHOUT.INFO=DELIM.CHAR  ;*Output without Info

        CALL F.READ(FN.ENQUIRY,ID.TO.PROCESS,ENQUIRY.REC,F.ENQUIRY,ENQUIRY.ERR)

! First the HEADER SECTION

! Header FIELDS

        FIELDS.TO.PROCESS=''

        FIELDS.TO.PROCESS<-1>=ENQ.SEL.LABEL
        FIELDS.TO.PROCESS<-1>=ENQ.HEADER

        FIELD.NAMES=''

        FIELD.NAMES<-1>="SEL.LABEL"
        FIELD.NAMES<-1>="HEADER"

        NO.OF.FIELDS=DCOUNT(FIELDS.TO.PROCESS,@FM)

        FOR I = 1 TO NO.OF.FIELDS

! Selection Label TO process... Similar TO A FIELD IN Version.
            IF FIELD.NAMES<I> EQ 'SEL.LABEL' THEN
                NO.OF.J=DCOUNT(ENQUIRY.REC<FIELDS.TO.PROCESS<I>>,@VM)
                FOR J = 1 TO NO.OF.J
                    OUT.REC=''
                    OUT.REC=FIELD.NAMES<I>:'-':J:DELIM.CHAR
                    REC.TO.PROCESS=ENQUIRY.REC<FIELDS.TO.PROCESS<I>,J>
                    
*ZIT-UPG-R13-R19 S 
*                   CONVERT SM TO VM IN REC.TO.PROCESS
					CHANGE @SM TO @VM IN REC.TO.PROCESS
*ZIT-UPG-R13-R19 E
                    GOSUB MULTI.VALUE.FIELD.PROCESS
                    GOSUB WRITE.TO.FILE
                NEXT J
            END ELSE
! Now TO handle the Header section... Similar TO the Header portion IN version
! except that there is one more level FOR each of the column positions... CONVERT those
! USING A delimiter.
                MY.REC.TO.PROCESS=ENQUIRY.REC<FIELDS.TO.PROCESS<I>>
                IF MY.REC.TO.PROCESS THEN
                    CNT.J=DCOUNT(MY.REC.TO.PROCESS<1>,@SM)  ;* Get the number of Sub values
! Re arrange the enquiry array AS A set of Language Seperated Multi Values
                    FOR J = 1 TO CNT.J
                        REC.TO.PROCESS=''

                        FOR VALUE.COUNT = 1 TO LANG.CNT
                            REC.TO.PROCESS<1,VALUE.COUNT>=MY.REC.TO.PROCESS<1,VALUE.COUNT,J>
                        NEXT VALUE.COUNT

                        OUT.REC=''

                        OUT.REC=FIELD.NAMES<I>:'-':J:DELIM.CHAR

!                     CONVERT SM TO '?' IN REC.TO.PROCESS     ;* Sub values for Column Positions
                        GOSUB MULTI.VALUE.FIELD.PROCESS
                        GOSUB WRITE.TO.FILE
                    NEXT J
                END
            END
        NEXT I

! FIELDS SECTION

        FIELDS.TO.PROCESS=''

        FIELDS.TO.PROCESS<-1>=ENQ.FIELD.LBL

        FIELD.NAMES=''

        FIELD.NAMES<-1>="FIELD.LBL"

        NO.OF.FIELDS=DCOUNT(FIELDS.TO.PROCESS,@FM)

        FIELDS.COUNT=DCOUNT(ENQUIRY.REC<ENQ.FIELD.NAME>,@VM)

! FOR each FIELD DO all the processing
        FOR I = 1 TO NO.OF.FIELDS
            FOR J = 1 TO FIELDS.COUNT
			
                REC.TO.PROCESS=ENQUIRY.REC<FIELDS.TO.PROCESS<I>,J>
                IF REC.TO.PROCESS THEN
                    
*ZIT-UPG-R13-R19 S 
*                   CONVERT SM TO VM IN REC.TO.PROCESS
					CHANGE @SM TO @VM IN REC.TO.PROCESS
*ZIT-UPG-R13-R19 E

                    OUT.REC=''
                    OUT.REC=FIELD.NAMES<I>:'-':J:DELIM.CHAR:ENQUIRY.REC<ENQ.FIELD.NAME,J>

                    GOSUB MULTI.VALUE.FIELD.PROCESS
                    GOSUB WRITE.TO.FILE
                END
            NEXT J
        NEXT I


! Enquiry NEXT Level

        FIELDS.TO.PROCESS=''
        FIELDS.TO.PROCESS<-1>=ENQ.NXT.DESC

        FIELD.NAMES=''
        FIELD.NAMES<-1>="NXT.DESC"

        NO.OF.FIELDS=DCOUNT(FIELDS.TO.PROCESS,@FM)

        FIELDS.COUNT=DCOUNT(ENQUIRY.REC<ENQ.ENQUIRY.NAME>,@VM)

! FOR each FIELD DO all the processing
        FOR I = 1 TO NO.OF.FIELDS
            FOR J = 1 TO FIELDS.COUNT


                REC.TO.PROCESS=ENQUIRY.REC<FIELDS.TO.PROCESS<I>,J>
                IF REC.TO.PROCESS THEN

                    
*ZIT-UPG-R13-R19 S 
*                   CONVERT SM TO VM IN REC.TO.PROCESS
					CHANGE @SM TO @VM IN REC.TO.PROCESS
*ZIT-UPG-R13-R19 E

                    OUT.REC=''
                    OUT.REC=FIELD.NAMES<I>:'-':J:DELIM.CHAR

                    GOSUB MULTI.VALUE.FIELD.PROCESS
                    GOSUB WRITE.TO.FILE
                END
            NEXT J
        NEXT I


! Finally the trailer
        FIELDS.TO.PROCESS=''
        FIELDS.TO.PROCESS<-1>=ENQ.SHORT.DESC

        FIELD.NAMES=''
        FIELD.NAMES<-1>="SHORT.DESC"

        NO.OF.FIELDS=DCOUNT(FIELDS.TO.PROCESS,@FM)

        FOR I = 1 TO NO.OF.FIELDS
            REC.TO.PROCESS=ENQUIRY.REC<FIELDS.TO.PROCESS<I>>
            IF REC.TO.PROCESS THEN
                OUT.REC=''
                OUT.REC=FIELD.NAMES<I>:DELIM.CHAR

                GOSUB MULTI.VALUE.FIELD.PROCESS
                GOSUB WRITE.TO.FILE
            END
        NEXT I

    REPEAT


    RETURN

************
PROCESS.ECS:
************
! Process EB.COMPOSITE.SCREEN

    IF SEL.CRITERIA EQ 'ALL' THEN
        SEL.CMD='SSELECT ':FN.EB.COMPOSITE.SCREEN
        CALL EB.READLIST(SEL.CMD,IDS.TO.PROCESS,'',NO.OF.IDS,IDS.ERR)
    END
    IF NOT(OUT.FILE) OR PROCESS.ALL THEN OUT.FILE='EB.COMP.SCR.tsv'

    OPENSEQ OUTPUT.DIRECTORY,OUT.FILE TO F.OUT.FILE ELSE ;*CRT 'Opening ':OUT.FILE:' for processing'
	END
    DISPLAY.FILE<-1> = OUT.FILE
    IF IDS.TO.PROCESS THEN
! Ok there is something TO process
        HEADER.LINE.WRITTEN='HEADER'
        OUT.REC=HEADER.REC
        GOSUB WRITE.TO.FILE
    END

    LOOP
        REMOVE ID.TO.PROCESS FROM IDS.TO.PROCESS SETTING MORE.IDS
    WHILE ID.TO.PROCESS:MORE.IDS

! The first line should contain the APPLICATION AND record id...
        HEADER.LINE.WRITTEN=0
        OUTPUT.WITH.INFO='EB.COMPOSITE.SCREEN':DELIM.CHAR:ID.TO.PROCESS         ;*Output WITH Info
        OUTPUT.WITHOUT.INFO=DELIM.CHAR  ;*Output without Info

        CALL F.READ(FN.EB.COMPOSITE.SCREEN,ID.TO.PROCESS,ECS.REC,F.EB.COMPOSITE.SCREEN,ECS.ERR)

! Component FIELDS
        FIELDS.TO.PROCESS=''

        FIELDS.TO.PROCESS<-1>=EB.CS.TITLE

        FIELD.NAMES=''

        FIELD.NAMES<-1>="TITLE"

        NO.OF.FIELDS=DCOUNT(FIELDS.TO.PROCESS,@FM)

        FOR I = 1 TO NO.OF.FIELDS
            REC.TO.PROCESS=ECS.REC<FIELDS.TO.PROCESS<I>>
            IF REC.TO.PROCESS THEN
                OUT.REC=''
                OUT.REC=FIELD.NAMES<I>:DELIM.CHAR
                GOSUB MULTI.VALUE.FIELD.PROCESS
                GOSUB WRITE.TO.FILE
            END
        NEXT I

    REPEAT

    RETURN
************
PROCESS.OVERRIDE:
************
! Process Override

    IF SEL.CRITERIA EQ 'ALL' THEN
        SEL.CMD='SSELECT ':FN.OVERRIDE
        CALL EB.READLIST(SEL.CMD,IDS.TO.PROCESS,'',NO.OF.IDS,IDS.ERR)
    END
    IF NOT(OUT.FILE) OR PROCESS.ALL THEN OUT.FILE='OVERRIDE.tsv'

    OPENSEQ OUTPUT.DIRECTORY,OUT.FILE TO F.OUT.FILE ELSE ;*CRT 'Opening ':OUT.FILE:' for processing'
	END
    DISPLAY.FILE<-1> = OUT.FILE
    IF IDS.TO.PROCESS THEN
! Ok there is something TO process
        HEADER.LINE.WRITTEN='HEADER'
        OUT.REC=HEADER.REC
        GOSUB WRITE.TO.FILE
    END

    LOOP
        REMOVE ID.TO.PROCESS FROM IDS.TO.PROCESS SETTING MORE.IDS
    WHILE ID.TO.PROCESS:MORE.IDS

! The first line should contain the APPLICATION AND record id...
        HEADER.LINE.WRITTEN=0
        OUTPUT.WITH.INFO='OVERRIDE':DELIM.CHAR:ID.TO.PROCESS          ;*Output WITH Info
        OUTPUT.WITHOUT.INFO=DELIM.CHAR  ;*Output without Info

        CALL F.READ(FN.OVERRIDE,ID.TO.PROCESS,OVE.REC,F.OVERRIDE,OVE.ERR)

! Component FIELDS
        FIELDS.TO.PROCESS=''

        FIELDS.TO.PROCESS<-1>=EB.OR.MESSAGE

        FIELD.NAMES=''

        FIELD.NAMES<-1>="MESSAGE"

        NO.OF.FIELDS=DCOUNT(FIELDS.TO.PROCESS,@FM)

        FOR I = 1 TO NO.OF.FIELDS
            REC.TO.PROCESS=OVE.REC<FIELDS.TO.PROCESS<I>>
            IF REC.TO.PROCESS THEN
                OUT.REC=''
                OUT.REC=FIELD.NAMES<I>:DELIM.CHAR
                GOSUB MULTI.VALUE.FIELD.PROCESS
                GOSUB WRITE.TO.FILE
            END
        NEXT I

    REPEAT

    RETURN

**********************
PROCESS.HELPTEXT.MENU:
**********************
! Process Override

    IF SEL.CRITERIA EQ 'ALL' THEN
        SEL.CMD='SSELECT ':FN.HELPTEXT.MENU
        CALL EB.READLIST(SEL.CMD,IDS.TO.PROCESS,'',NO.OF.IDS,IDS.ERR)
    END
    IF NOT(OUT.FILE) OR PROCESS.ALL THEN OUT.FILE='HM.tsv'

    OPENSEQ OUTPUT.DIRECTORY,OUT.FILE TO F.OUT.FILE ELSE ;*CRT 'Opening ':OUT.FILE:' for processing'
	END
    DISPLAY.FILE<-1> = OUT.FILE
    IF IDS.TO.PROCESS THEN
! Ok there is something TO process
        HEADER.LINE.WRITTEN='HEADER'
        OUT.REC=HEADER.REC
        GOSUB WRITE.TO.FILE
    END

    LOOP
        REMOVE ID.TO.PROCESS FROM IDS.TO.PROCESS SETTING MORE.IDS
    WHILE ID.TO.PROCESS:MORE.IDS

! The first line should contain the APPLICATION AND record id...
        HEADER.LINE.WRITTEN=0
        OUTPUT.WITH.INFO='HELPTEXT.MENU':DELIM.CHAR:ID.TO.PROCESS     ;*Output WITH Info
        OUTPUT.WITHOUT.INFO=DELIM.CHAR  ;*Output without Info

        CALL F.READ(FN.HELPTEXT.MENU,ID.TO.PROCESS,HM.REC,F.HELPTEXT.MENU,HM.ERR)

! Component FIELDS
        FIELDS.TO.PROCESS=''

        FIELDS.TO.PROCESS<-1>=EB.MEN.DESCRIPT

        FIELD.NAMES=''

        FIELD.NAMES<-1>="DESCRIPT"

        NO.OF.FIELDS=DCOUNT(FIELDS.TO.PROCESS,@FM)

        FOR I = 1 TO NO.OF.FIELDS
            NO.OF.J=DCOUNT(HM.REC<FIELDS.TO.PROCESS<I>>,@VM)
            FOR J = 1 TO NO.OF.J
                REC.TO.PROCESS=HM.REC<FIELDS.TO.PROCESS<I>,J>
                
*ZIT-UPG-R13-R19 S 
*                   CONVERT SM TO VM IN REC.TO.PROCESS
					CHANGE @SM TO @VM IN REC.TO.PROCESS
*ZIT-UPG-R13-R19 E
                IF REC.TO.PROCESS THEN
                    OUT.REC=''
                    OUT.REC=FIELD.NAMES<I>:'-':J:DELIM.CHAR
                    GOSUB MULTI.VALUE.FIELD.PROCESS
                    GOSUB WRITE.TO.FILE
                END
            NEXT J
        NEXT I

    REPEAT

    RETURN

************
PROCESS.HMM:
************
! Process Helptext Main Menu

    IF SEL.CRITERIA EQ 'ALL' THEN
        SEL.CMD='SSELECT ':FN.HELPTEXT.MAINMENU
        CALL EB.READLIST(SEL.CMD,IDS.TO.PROCESS,'',NO.OF.IDS,IDS.ERR)
    END
    IF NOT(OUT.FILE) OR PROCESS.ALL THEN OUT.FILE='HMM.tsv'

    OPENSEQ OUTPUT.DIRECTORY,OUT.FILE TO F.OUT.FILE ELSE ;*CRT 'Opening ':OUT.FILE:' for processing'
	END
    DISPLAY.FILE<-1> = OUT.FILE
    IF IDS.TO.PROCESS THEN
! Ok there is something TO process
        HEADER.LINE.WRITTEN='HEADER'
        OUT.REC=HEADER.REC
        GOSUB WRITE.TO.FILE
    END

    LOOP
        REMOVE ID.TO.PROCESS FROM IDS.TO.PROCESS SETTING MORE.IDS
    WHILE ID.TO.PROCESS:MORE.IDS

! The first line should contain the APPLICATION AND record id...
        HEADER.LINE.WRITTEN=0
        OUTPUT.WITH.INFO='HELPTEXT.MAINMENU':DELIM.CHAR:ID.TO.PROCESS ;*Output WITH Info
        OUTPUT.WITHOUT.INFO=DELIM.CHAR  ;*Output without Info

        CALL F.READ(FN.HELPTEXT.MAINMENU,ID.TO.PROCESS,HMM.REC,F.HELPTEXT.MAINMENU,HMM.ERR)

! Header FIELDS
        FIELDS.TO.PROCESS=''

        FIELDS.TO.PROCESS<-1>=EB.MME.TITLE

        FIELD.NAMES=''

        FIELD.NAMES<-1>="TITLE"

        NO.OF.FIELDS=DCOUNT(FIELDS.TO.PROCESS,@FM)

        FOR I = 1 TO NO.OF.FIELDS
            REC.TO.PROCESS=HMM.REC<FIELDS.TO.PROCESS<I>>
            IF REC.TO.PROCESS THEN
                OUT.REC=''
                OUT.REC=FIELD.NAMES<I>:DELIM.CHAR
                GOSUB MULTI.VALUE.FIELD.PROCESS
                GOSUB WRITE.TO.FILE
            END
        NEXT I

! FIELDS
! Description

        FIELDS.TO.PROCESS=''
        FIELDS.TO.PROCESS<-1>=EB.MME.DESCRIPT

        FIELD.NAMES=''
        FIELD.NAMES<-1>="DESCRIPT"

        NO.OF.FIELDS=DCOUNT(FIELDS.TO.PROCESS,@FM)

        FIELDS.COUNT=DCOUNT(HMM.REC<EB.MME.DESCRIPT>,@VM)

! FOR each FIELD DO all the processing

        FOR I = 1 TO NO.OF.FIELDS
            FOR J = 1 TO FIELDS.COUNT

! Each SUB value must be processed
                REC.TO.PROCESS=HMM.REC<FIELDS.TO.PROCESS<I>,J>
                IF REC.TO.PROCESS THEN

                    
*ZIT-UPG-R13-R19 S 
*                   CONVERT SM TO VM IN REC.TO.PROCESS
					CHANGE @SM TO @VM IN REC.TO.PROCESS
*ZIT-UPG-R13-R19 E

                    OUT.REC=''
                    OUT.REC=FIELD.NAMES<I>:'-':J:DELIM.CHAR:HMM.REC<EB.MME.ID.OF.HELP.MENU,J>

                    GOSUB MULTI.VALUE.FIELD.PROCESS
                    GOSUB WRITE.TO.FILE
                END

            NEXT J
        NEXT I
    REPEAT

    RETURN
************
PROCESS.DSF:
************
! Process Deal Slip format

    IF SEL.CRITERIA='ALL' THEN
        SEL.CMD='SSELECT ':FN.DEAL.SLIP.FORMAT
        CALL EB.READLIST(SEL.CMD,IDS.TO.PROCESS,'',NO.OF.IDS,IDS.ERR)
    END
    IF NOT(OUT.FILE) OR PROCESS.ALL THEN OUT.FILE='DSF.tsv'

    OPENSEQ OUTPUT.DIRECTORY,OUT.FILE TO F.OUT.FILE ELSE ;*CRT 'Opening ':OUT.FILE:' for processing'
	END
    DISPLAY.FILE<-1> = OUT.FILE
    IF IDS.TO.PROCESS THEN
! Ok there is something TO process
        HEADER.LINE.WRITTEN='HEADER'
        OUT.REC=HEADER.REC
        GOSUB WRITE.TO.FILE
    END

    LOOP
        REMOVE ID.TO.PROCESS FROM IDS.TO.PROCESS SETTING MORE.IDS
    WHILE ID.TO.PROCESS:MORE.IDS

! The first line should contain the APPLICATION AND record id...
        HEADER.LINE.WRITTEN=0
        OUTPUT.WITH.INFO='DEAL.SLIP.FORMAT':DELIM.CHAR:ID.TO.PROCESS  ;*Output WITH Info
        OUTPUT.WITHOUT.INFO=DELIM.CHAR  ;*Output without Info

        CALL F.READ(FN.DEAL.SLIP.FORMAT,ID.TO.PROCESS,DSF.REC,F.DEAL.SLIP.FORMAT,DSF.ERR)

! Header FIELDS

        FIELDS.TO.PROCESS=''

        FIELDS.TO.PROCESS<-1>=EB.DSF.DESCRIPTION
        FIELDS.TO.PROCESS<-1>=EB.DSF.PROMPT
        FIELD.NAMES=''

        FIELD.NAMES<-1>="DESCRIPTION"
        FIELD.NAMES<-1>="PROMPT"

        NO.OF.FIELDS=DCOUNT(FIELDS.TO.PROCESS,@FM)

        FOR I = 1 TO NO.OF.FIELDS
            REC.TO.PROCESS=DSF.REC<FIELDS.TO.PROCESS<I>>
            IF REC.TO.PROCESS THEN
                OUT.REC=''
                OUT.REC=FIELD.NAMES<I>:DELIM.CHAR
                GOSUB MULTI.VALUE.FIELD.PROCESS
                GOSUB WRITE.TO.FILE
            END
        NEXT I
    REPEAT
    RETURN
************************
PROCESS.CONTEXT.ENQUIRY:
************************
! Process Context Enquiry

    IF SEL.CRITERIA EQ 'ALL' THEN
        SEL.CMD='SSELECT ':FN.CONTEXT.ENQUIRY
        CALL EB.READLIST(SEL.CMD,IDS.TO.PROCESS,'',NO.OF.IDS,IDS.ERR)
    END
    IF NOT(OUT.FILE) OR PROCESS.ALL THEN OUT.FILE='CONTEXT.ENQUIRY.tsv'

    OPENSEQ OUTPUT.DIRECTORY,OUT.FILE TO F.OUT.FILE ELSE ;*CRT 'Opening ':OUT.FILE:' for processing'
	END
    DISPLAY.FILE<-1> = OUT.FILE
    IF IDS.TO.PROCESS THEN
! Ok there is something TO process
        HEADER.LINE.WRITTEN='HEADER'
        OUT.REC=HEADER.REC
        GOSUB WRITE.TO.FILE
    END

    LOOP
        REMOVE ID.TO.PROCESS FROM IDS.TO.PROCESS SETTING MORE.IDS
    WHILE ID.TO.PROCESS:MORE.IDS

! The first line should contain the APPLICATION AND record id...
        HEADER.LINE.WRITTEN=0
        OUTPUT.WITH.INFO='CONTEXT.ENQUIRY':DELIM.CHAR:ID.TO.PROCESS   ;*Output WITH Info
        OUTPUT.WITHOUT.INFO=DELIM.CHAR  ;*Output without Info

        CALL F.READ(FN.CONTEXT.ENQUIRY,ID.TO.PROCESS,CE.REC,F.CONTEXT.ENQUIRY,CE.ERR)

! Header FIELDS
        FIELDS.TO.PROCESS=''

        FIELDS.TO.PROCESS<-1>=EB.CENQ.DESCRIPTION

        FIELD.NAMES=''

        FIELD.NAMES<-1>="DESCRIPTION"

        NO.OF.FIELDS=DCOUNT(FIELDS.TO.PROCESS,@FM)

        FOR I = 1 TO NO.OF.FIELDS
            REC.TO.PROCESS=CE.REC<FIELDS.TO.PROCESS<I>>
            IF REC.TO.PROCESS THEN
                OUT.REC=''
                OUT.REC=FIELD.NAMES<I>:DELIM.CHAR
                GOSUB MULTI.VALUE.FIELD.PROCESS
                GOSUB WRITE.TO.FILE
            END
        NEXT I

! FIELDS
! ENQ.DESC
! VER.DESC
! SPT.DESC

        FIELDS.TO.PROCESS=''
        FIELDS.TO.PROCESS<-1>=EB.CENQ.ENQ.DESC
        FIELDS.TO.PROCESS<-1>=EB.CENQ.VER.DESC
        FIELDS.TO.PROCESS<-1>=EB.CENQ.SPT.DESC
        FIELD.NAMES=''
        FIELD.NAMES<-1>="ENQ.DESC"
        FIELD.NAMES<-1>="VER.DESC"
        FIELD.NAMES<-1>="SPT.DESC"
        NO.OF.FIELDS=DCOUNT(FIELDS.TO.PROCESS,@FM)

! FOR each FIELD DO all the processing

        FOR I = 1 TO NO.OF.FIELDS

            FIELDS.COUNT=DCOUNT(CE.REC<FIELDS.TO.PROCESS<I>>,@VM)
            FOR J = 1 TO FIELDS.COUNT

! Each SUB value must be processed
                REC.TO.PROCESS=CE.REC<FIELDS.TO.PROCESS<I>,J>
                IF REC.TO.PROCESS THEN

                    
*ZIT-UPG-R13-R19 S 
*                   CONVERT SM TO VM IN REC.TO.PROCESS
					CHANGE @SM TO @VM IN REC.TO.PROCESS
*ZIT-UPG-R13-R19 E
                    OUT.REC=''
                    OUT.REC=FIELD.NAMES<I>:'-':J:DELIM.CHAR
                    GOSUB MULTI.VALUE.FIELD.PROCESS
                    GOSUB WRITE.TO.FILE
                END

            NEXT J
        NEXT I
    REPEAT

    RETURN


*****************
PROCESS.EB.ERROR:
*****************
! Process EB.ERROR

    IF SEL.CRITERIA EQ 'ALL' THEN
        SEL.CMD='SSELECT ':FN.EB.ERROR
        CALL EB.READLIST(SEL.CMD,IDS.TO.PROCESS,'',NO.OF.IDS,IDS.ERR)
    END
    IF NOT(OUT.FILE) OR PROCESS.ALL THEN OUT.FILE='EB.ERROR.tsv'

    OPENSEQ OUTPUT.DIRECTORY,OUT.FILE TO F.OUT.FILE ELSE ;*CRT 'Opening ':OUT.FILE:' for processing'
	END
    DISPLAY.FILE<-1> = OUT.FILE
    IF IDS.TO.PROCESS THEN
! Ok there is something TO process
        HEADER.LINE.WRITTEN='HEADER'
        OUT.REC=HEADER.REC
        GOSUB WRITE.TO.FILE
    END

    LOOP
        REMOVE ID.TO.PROCESS FROM IDS.TO.PROCESS SETTING MORE.IDS
    WHILE ID.TO.PROCESS:MORE.IDS

! The first line should contain the APPLICATION AND record id...
        HEADER.LINE.WRITTEN=0
        OUTPUT.WITH.INFO='EB.ERROR':DELIM.CHAR:ID.TO.PROCESS          ;*Output WITH Info
        OUTPUT.WITHOUT.INFO=DELIM.CHAR  ;*Output without Info

        CALL F.READ(FN.EB.ERROR,ID.TO.PROCESS,EB.ERR.REC,F.EB.ERROR,EB.ERR)

! Multi FIELDS
        FIELDS.TO.PROCESS=''

        FIELDS.TO.PROCESS<-1>=EB.ERR.ERROR.MSG

        FIELD.NAMES=''

        FIELD.NAMES<-1>="ERROR.MSG"

        NO.OF.FIELDS=DCOUNT(FIELDS.TO.PROCESS,@FM)

        FOR I = 1 TO NO.OF.FIELDS
            REC.TO.PROCESS=EB.ERR.REC<FIELDS.TO.PROCESS<I>>
            IF REC.TO.PROCESS THEN
                OUT.REC=''
                OUT.REC=FIELD.NAMES<I>:DELIM.CHAR
                GOSUB MULTI.VALUE.FIELD.PROCESS
                GOSUB WRITE.TO.FILE
            END
        NEXT I

    REPEAT

    RETURN
**************
WRITE.TO.FILE:
**************
! WRITE TO OUT file
    IF HEADER.LINE.WRITTEN NE 'HEADER' THEN
        IF HEADER.LINE.WRITTEN THEN
            OUT.REC=OUTPUT.WITHOUT.INFO:DELIM.CHAR:OUT.REC
        END ELSE
            HEADER.LINE.WRITTEN=1
            OUT.REC=OUTPUT.WITH.INFO:DELIM.CHAR:OUT.REC
        END
    END

    WRITESEQ OUT.REC TO F.OUT.FILE ELSE ;*CRT 'Unable to write output content to ':OUT.FILE
	END
    RETURN

**************************
MULTI.VALUE.FIELD.PROCESS:
**************************

    FOR VALUE.COUNT = 1 TO LANG.CNT
        OUT.REC:=DELIM.CHAR:REC.TO.PROCESS<1,VALUE.COUNT>
    NEXT VALUE.COUNT
    RETURN

*-----------------------------------------------------------------------------
*********
PROG.END:
*********
END
