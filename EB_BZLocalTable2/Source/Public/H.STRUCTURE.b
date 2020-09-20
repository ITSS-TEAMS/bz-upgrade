* @ValidationCode : MjotMTgzMzQ1MDEwNTpDcDEyNTI6MTYwMDU2MDkwMzY1NDpBZG1pbmlzdHJhdGV1cjotMTotMTowOjE6ZmFsc2U6Ti9BOlIyMF9TUDQuMDotMTotMQ==
* @ValidationInfo : Timestamp         : 20 Sep 2020 01:15:03
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : Administrateur
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : true
* @ValidationInfo : Bypass GateKeeper : false
* @ValidationInfo : Compiler Version  : R20_SP4.0
* Version 9 15/11/00  GLOBUS Release No. R06.002 22/08/06
*-----------------------------------------------------------------------------
* <Rating>734</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable2
SUBROUTINE H.STRUCTURE
******************************************************************
* Enter Program Description Here
*-----------------------------------------------------------------------------
* Modification History:
*
* 24/09/04 - BG_100007114
*            Adding a facility for CHECK.RECORD to speicify code that is only run
*            first time in during browser stateless sessions
*
* 21/09/05 - GLOBUS_BG_100009430
*            Correct comments.
*
* 22/09/05 - EN_10002679
*            Support for DE Preview in Browser.
*            Template level changes required to support this functionality
*            SAR-2005-05-10-0002
*ZIT-UPG-R13-R19  :OPERATIONS TO OPERANDS;INITIALISED VARIABLES;VM TO @VM
*-----------------------------------------------------------------------------
* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;
* $INSERT I_GTS.COMMON - Not Used anymore;
* $INSERT I_F.OFS.STATUS.FLAG - Not Used anymore;
* $INSERT I_F.CUSTOMER - Not Used anymore;
* $INSERT I_F.STANDARD.SELECTION - Not Used anymore;
    $USING EB.SystemTables
    $USING EB.API
    $USING EB.Template
    $USING EB.Interface
    $USING ST.Customer
    $USING EB.BZLocalDevRtns
    $USING EB.Display
    $USING EB.TransactionControl
    $USING EB.ErrorProcessing

*************************************************************************

    GOSUB DEFINE.PARAMETERS

    tmp.V$FUNCTION = EB.SystemTables.getVFunction()
    IF LEN(tmp.V$FUNCTION) GT 1 THEN
        EB.SystemTables.setVFunction(tmp.V$FUNCTION)
        GOSUB V$EXIT
    END

    EB.Display.MatrixUpdate()

    GOSUB INITIALISE          ;* Special Initialising

*************************************************************************

* Main Program Loop

    LOOP

        EB.TransactionControl.RecordidInput()

    UNTIL (EB.SystemTables.getMessage() EQ 'RET')

        V$ERROR = ''

        IF EB.SystemTables.getMessage() EQ 'NEW FUNCTION' THEN

            GOSUB CHECK.FUNCTION        ;* Special Editing of Function

            IF EB.SystemTables.getVFunction() EQ 'E' OR EB.SystemTables.getVFunction() EQ 'L' THEN
                EB.Display.FunctionDisplay()
                EB.SystemTables.setVFunction('')
            END

        END ELSE

            GOSUB CHECK.ID    ;* Special Editing of ID
            IF V$ERROR THEN
                GOSUB MAIN.REPEAT
            END
            EB.TransactionControl.RecordRead()

            IF EB.SystemTables.getMessage() EQ 'REPEAT' THEN
                GOSUB MAIN.REPEAT
            END

            GOSUB CHECK.RECORD          ;* Special Editing of Record

            EB.Display.MatrixAlter()

            IF V$ERROR THEN
                GOSUB MAIN.REPEAT
            END
            LOOP
                GOSUB PROCESS.FIELDS    ;* ) For Input
                GOSUB PROCESS.MESSAGE   ;* ) Applications
            WHILE (EB.SystemTables.getMessage() EQ 'ERROR') REPEAT

        END

MAIN.REPEAT:
    REPEAT

V$EXIT:
RETURN          ;* From main program

*************************************************************************
*                      S u b r o u t i n e s                            *
*************************************************************************
PROCESS.FIELDS:
* Input or display the record fields.

    LOOP
        IF EB.SystemTables.getScreenMode() EQ 'MULTI' THEN
            IF EB.SystemTables.getFileType() EQ 'I' THEN
                EB.Display.FieldMultiInput()
            END ELSE
                EB.Display.FieldMultiDisplay()
            END
        END ELSE
            IF EB.SystemTables.getFileType() EQ 'I' THEN
                EB.Display.FieldInput()
            END ELSE
                EB.Display.FieldDisplay()
            END
        END

        tmp.MESSAGE = EB.SystemTables.getMessage()
    WHILE NOT(tmp.MESSAGE)
        EB.SystemTables.setMessage(tmp.MESSAGE)

        GOSUB CHECK.FIELDS    ;* Special Field Editing

        IF EB.SystemTables.getTSequ() NE '' THEN
            tmp=EB.SystemTables.getTSequ(); tmp<-1>=EB.SystemTables.getA() + 1; EB.SystemTables.setTSequ(tmp)
        END
    REPEAT

RETURN

*************************************************************************
PROCESS.MESSAGE:
* Processing after exiting from field input (PF5)

    IF EB.SystemTables.getMessage() EQ 'DEFAULT' THEN
        EB.SystemTables.setMessage('ERROR');* Force the processing back
        IF EB.SystemTables.getVFunction() NE 'D' AND EB.SystemTables.getVFunction() NE 'R' THEN
            GOSUB CROSS.VALIDATION
        END
    END

    IF BROWSER.PREVIEW.ON THEN          ;* EN_10002679 - s
* Clear BROWSER.PREVIEW.ON once inside the template so that after preview
* it might exit from the template, otherwise there will be looping within the template.
        EB.SystemTables.setMessage('PREVIEW')
        BROWSER.PREVIEW.ON = 0
    END   ;* EN_10002679 - e


    IF EB.SystemTables.getMessage() EQ 'PREVIEW' THEN
        EB.SystemTables.setMessage('ERROR');* Force the processing back
        IF EB.SystemTables.getVFunction() NE 'D' AND EB.SystemTables.getVFunction() NE 'R' THEN
            GOSUB CROSS.VALIDATION
            IF NOT(V$ERROR) THEN
REM >               GOSUB DELIVERY.PREVIEW   ; * Activate print preview
            END
        END
    END

    MY.MESSAGE = EB.SystemTables.getMessage()

    IF EB.SystemTables.getMessage() EQ 'VAL' THEN
        EB.SystemTables.setMessage('')
        BEGIN CASE
            CASE EB.SystemTables.getVFunction() EQ 'D'
                GOSUB CHECK.DELETE          ;* Special Deletion checks
            CASE EB.SystemTables.getVFunction() EQ 'R'
                GOSUB CHECK.REVERSAL        ;* Special Reversal checks
            CASE 1
                GOSUB CROSS.VALIDATION      ;* Special Cross Validation
                IF NOT(V$ERROR) THEN
                    GOSUB OVERRIDES
                END
        END CASE
        IF NOT(V$ERROR) THEN
            GOSUB BEFORE.UNAU.WRITE     ;* Special Processing before write
        END
        IF NOT(V$ERROR) THEN
            EB.TransactionControl.UnauthRecordWrite()
            IF EB.SystemTables.getMessage() NE "ERROR" THEN
                GOSUB AFTER.UNAU.WRITE  ;* Special Processing after write
            END
        END

    END

    IF EB.SystemTables.getMessage() EQ 'AUT' THEN
        GOSUB AUTH.CROSS.VALIDATION     ;* Special Cross Validation
        IF NOT(V$ERROR) THEN
            GOSUB BEFORE.AUTH.WRITE     ;* Special Processing before write
        END

        IF NOT(V$ERROR) THEN

            EB.TransactionControl.AuthRecordWrite()

            IF EB.SystemTables.getMessage() NE "ERROR" THEN
                GOSUB AFTER.AUTH.WRITE  ;* Special Processing after write
            END
        END

    END

RETURN

*************************************************************************
*                      Special Tailored Subroutines                     *
*************************************************************************
CHECK.ID:
* Validation and changes of the ID entered.  Sets V$ERROR to 1 if in error.

* Validation and changes of the ID entered.  Set ERROR to 1 if in error.


*  CALL EB.FORMAT.ID( "TRG" )

    IF EB.SystemTables.getE() THEN
        V$ERROR = 1
    END
    SEL.LIST=''
    NO.OF.REC=''
    ERR1=''
    SEL.COMMAND='SELECT ':'F.H.NATURE.STRUCTURE'
    CALL EB.READLIST(SEL.COMMAND,SEL.LIST,'',NO.OF.REC,ERR1)
    LOCATE EB.SystemTables.getComi()[1,2] IN SEL.LIST SETTING Var ELSE
        EB.SystemTables.setE('CODE VALEUR ERRONE')
        V$ERROR = 1
        EB.ErrorProcessing.Err()
    END


    SEL.COMMAND='SELECT ':'F.H.TYPE.STRUCTURE'
    CALL EB.READLIST(SEL.COMMAND,SEL.LIST,'',NO.OF.REC,ERR1)
    LOCATE EB.SystemTables.getComi()[4,1] IN SEL.LIST SETTING Var ELSE
        EB.SystemTables.setE('TYPE DE STRUCTURE ERRONE')
        V$ERROR = 1
        EB.ErrorProcessing.Err()
    END
    tmp.COMI = EB.SystemTables.getComi()
    V.SENS=FIELD(tmp.COMI,'.',3)
    EB.SystemTables.setComi(tmp.COMI)
    IF NOT(V.SENS MATCHES 'IN':@VM:'OUT') THEN
        EB.SystemTables.setE('Sens doit etre IN ou OUT')
        V$ERROR=1
        EB.ErrorProcessing.Err()
    END


RETURN

*************************************************************************
CHECK.RECORD:
* Validation and changes of the Record.  Set V$ERROR to 1 if in error.
*
* A application runnin in browser will enter CHECK.RECORD multiple
* times during a transaction lifecycle. Any validation that must only
* run when the user first opens the contract must be put in the following
* IF statement
*
*    IF OFS$STATUS<STAT.FLAG.FIRST.TIME> THEN      ;* BG_100007114
*
*       IF V$FUNCTION EQ 'I' THEN
*          IF ID.OLD THEN
*
*
*               E = 'RECORD ALREADY AUTHORISED'
*              V$ERROR = 1
*             CALL ERR
*
*
*           END
*
*       END
*
*
*
*
*   END

RETURN

*************************************************************************
CHECK.FIELDS:

REM > CALL XX.CHECK.FIELDS

    EB.SystemTables.setText(EB.SystemTables.getAf())

    EB.Display.Rem()

    BEGIN CASE



        CASE EB.SystemTables.getAf() EQ 9

            IF EB.SystemTables.getComi() EQ 1 THEN
                EB.SystemTables.setE("ERROR TEST1")
            END


        CASE EB.SystemTables.getAf() EQ 10
            IF EB.SystemTables.getComi() EQ 2 THEN
                EB.SystemTables.setE("ERROR TEST2")
            END
    END CASE

    IF EB.SystemTables.getE() THEN
        EB.SystemTables.setTSequ("IFLD")
        EB.ErrorProcessing.Err()
    END



RETURN

*************************************************************************
CROSS.VALIDATION:
*
    V$ERROR = ''
    EB.SystemTables.setEtext('')
    EB.SystemTables.setText('')


*
REM > CALL XX.CROSSVAL
*
* If END.ERROR has been set then a cross validation error has occurred
*
    IF EB.SystemTables.getEndError() THEN
        EB.SystemTables.setA(1)
        LOOP UNTIL EB.SystemTables.getTEtext()<EB.SystemTables.getA()> NE "" DO EB.SystemTables.setA(EB.SystemTables.getA()+1); REPEAT
        EB.SystemTables.setTSequ("D")
        tmp=EB.SystemTables.getTSequ(); tmp<-1>=EB.SystemTables.getA(); EB.SystemTables.setTSequ(tmp)
        V$ERROR = 1
        EB.SystemTables.setMessage('ERROR')
    END

RETURN          ;* Back to field input via UNAUTH.RECORD.WRITE

*************************************************************************
OVERRIDES:
*
*  Overrides should reside here.
*
    V$ERROR = ''
    EB.SystemTables.setEtext('')
    EB.SystemTables.setText('')






REM > CALL XX.OVERRIDE
*

*
    IF EB.SystemTables.getText() EQ "NO" THEN       ;* Said NO to override
        V$ERROR = 1
        EB.SystemTables.setMessage("ERROR");* Back to field input

    END



RETURN

*************************************************************************
AUTH.CROSS.VALIDATION:



RETURN

*************************************************************************
CHECK.DELETE:


RETURN

*************************************************************************
CHECK.REVERSAL:



RETURN

*************************************************************************
DELIVERY.PREVIEW:

RETURN

*************************************************************************
BEFORE.UNAU.WRITE:


*  Contract processing code should reside here.
*
REM > CALL XX.         ;* Accounting, Schedule processing etc etc



    IF EB.SystemTables.getText() EQ "NO" THEN       ;* Said No to override
        EB.TransactionControl.TransactionAbort()          ;* Cancel current transaction
        V$ERROR = 1
        EB.SystemTables.setMessage("ERROR");* Back to field input
        RETURN
    END




*
* Additional updates should be performed here
*
REM > CALL XX...

RETURN



*************************************************************************
AFTER.UNAU.WRITE:


RETURN

*************************************************************************
AFTER.AUTH.WRITE:


RETURN

*************************************************************************
BEFORE.AUTH.WRITE:

    tmp.V = EB.SystemTables.getV()

    BEGIN CASE
        CASE EB.SystemTables.getRNew(tmp.V-8)[1,3] EQ "INA"        ;* Record status
            EB.SystemTables.setV(tmp.V)
REM > CALL XX.AUTHORISATION
        CASE EB.SystemTables.getRNew(tmp.V-8)[1,3] EQ "RNA"        ;* Record status
            EB.SystemTables.setV(tmp.V)
REM > CALL XX.REVERSAL

    END CASE





RETURN

*************************************************************************
CHECK.FUNCTION:
* Validation of function entered.  Sets V$FUNCTION to null if in error.

    tmp.V$FUNCTION = EB.SystemTables.getVFunction()
    IF INDEX('V',tmp.V$FUNCTION,1) THEN
        EB.SystemTables.setVFunction(tmp.V$FUNCTION)
        EB.SystemTables.setE('EB.RTN.FUNT.NOT.ALLOWED.APP')
        EB.ErrorProcessing.Err()
        EB.SystemTables.setVFunction('')
    END

RETURN

*************************************************************************
INITIALISE:




    BROWSER.PREVIEW.ON = (EB.Interface.getOfsMessage()='PREVIEW')  ;*EN_10002679 - S/E

RETURN

*************************************************************************
DEFINE.PARAMETERS:
* SEE 'I_RULES' FOR DESCRIPTIONS *

    EB.BZLocalTable2.hStructureFld()

RETURN

*************************************************************************

END
