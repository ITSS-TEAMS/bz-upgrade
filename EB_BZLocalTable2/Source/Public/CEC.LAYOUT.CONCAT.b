* @ValidationCode : MjoxNjUzNzY2NjY5OkNwMTI1MjoxNjAwNTYwOTkwNjc2OkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTpmYWxzZTpOL0E6UjIwX1NQNC4wOi0xOi0x
* @ValidationInfo : Timestamp         : 20 Sep 2020 01:16:30
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : Administrateur
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : true
* @ValidationInfo : Bypass GateKeeper : false
* @ValidationInfo : Compiler Version  : R20_SP4.0
*-----------------------------------------------------------------------------
* <Rating>912</Rating>
*-----------------------------------------------------------------------------
* GLOBUS Release No. G12.2.06
$PACKAGE EB.BZLocalTable2
SUBROUTINE CEC.LAYOUT.CONCAT

*----------------------------------------------------
* 02/01/2009 - generation under R5 by E. PIGNON
*
*---- Revision History ----
*ZIT-UPG-R13-R19-REMOVED GOTO TO GOSUB,OPERATIONS TO OPERATORS,
*
*----------------------------------------------------

* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;
    $USING EB.SystemTables
    $USING EB.API
    $USING EB.Template
    $USING EB.Display
    $USING EB.TransactionControl
    $USING EB.ErrorProcessing
    $USING EB.BZLocalDevRtns

*************************************************************************

    GOSUB DEFINE.PARAMETERS

    tmp.V$FUNCTION = EB.SystemTables.getVFunction()
    IF LEN(tmp.V$FUNCTION) GT 1 THEN
        EB.SystemTables.setVFunction(tmp.V$FUNCTION)
        GOSUB V$EXIT
    END

    EB.Display.MatrixUpdate()

    GOSUB INITIALISE                   ; * Special Initialising

*************************************************************************

* Main Program Loop

    LOOP

        EB.TransactionControl.RecordidInput()

    UNTIL (EB.SystemTables.getMessage() EQ 'RET')

        V$ERROR = ''

        IF EB.SystemTables.getMessage() EQ 'NEW FUNCTION' THEN

            GOSUB CHECK.FUNCTION         ; * Special Editing of Function

            IF EB.SystemTables.getVFunction() EQ 'E' OR EB.SystemTables.getVFunction() EQ 'L' THEN
                EB.Display.FunctionDisplay()
                EB.SystemTables.setVFunction('')
            END

        END ELSE

            GOSUB CHECK.ID               ; * Special Editing of ID
            IF V$ERROR THEN GOSUB MAIN.REPEAT

            EB.TransactionControl.RecordRead()

            IF EB.SystemTables.getMessage() EQ 'REPEAT' THEN
                GOSUB MAIN.REPEAT
            END

            EB.Display.MatrixAlter()

            GOSUB CHECK.RECORD           ; * Special Editing of Record
            IF V$ERROR THEN GOSUB MAIN.REPEAT

            LOOP
                GOSUB PROCESS.FIELDS      ; * ) For Input
                GOSUB PROCESS.MESSAGE     ; * ) Applications
            WHILE (EB.SystemTables.getMessage() EQ 'ERROR') REPEAT

        END

MAIN.REPEAT:
    REPEAT

V$EXIT:
RETURN                             ; * From main program

*************************************************************************
*                      S u b r o u t i n e s                            *
*************************************************************************

PROCESS.FIELDS:

* Input or display the record fields.

    LOOP
        EB.SystemTables.getScreenMode()
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

    WHILE NOT(EB.SystemTables.getMessage())

        GOSUB CHECK.FIELDS              ; * Special Field Editing
        Y.T.SEQU=EB.SystemTables.getTSequ()
        Y.T.SEQU<-1>=EB.SystemTables.getA()+1
        IF EB.SystemTables.getTSequ() NE '' THEN
            EB.SystemTables.setTSequ(Y.T.SEQU)
        END
    REPEAT

RETURN

*************************************************************************

PROCESS.MESSAGE:

* Processing after exiting from field input (PF5)

    IF EB.SystemTables.getMessage() EQ 'DEFAULT' THEN
        EB.SystemTables.setMessage('ERROR')               ; * Force the processing back
        IF EB.SystemTables.getVFunction() NE 'D' AND EB.SystemTables.getVFunction() NE 'R' THEN
            GOSUB CROSS.VALIDATION
        END
    END

    IF EB.SystemTables.getMessage() EQ 'PREVIEW' THEN
        EB.SystemTables.setMessage('ERROR')                ; * Force the processing back
        IF EB.SystemTables.getVFunction() NE 'D' AND EB.SystemTables.getVFunction() NE 'R' THEN
            GOSUB CROSS.VALIDATION
            IF NOT(V$ERROR) THEN
REM >               GOSUB DELIVERY.PREVIEW   ; * Activate print preview
            END
        END
    END

    IF EB.SystemTables.getMessage() EQ 'VAL' THEN
        EB.SystemTables.setMessage('')
        BEGIN CASE
            CASE EB.SystemTables.getVFunction() EQ 'D'
                GOSUB CHECK.DELETE        ; * Special Deletion checks
            CASE EB.SystemTables.getVFunction() EQ 'R'
                GOSUB CHECK.REVERSAL      ; * Special Reversal checks
            CASE 1
                GOSUB CROSS.VALIDATION    ; * Special Cross Validation
                IF NOT(V$ERROR) THEN
                    GOSUB OVERRIDES
                END
        END CASE
        IF NOT(V$ERROR) THEN
            GOSUB BEFORE.UNAU.WRITE      ; * Special Processing before write
        END
        IF NOT(V$ERROR) THEN
            EB.TransactionControl.UnauthRecordWrite()
            IF EB.SystemTables.getMessage() NE "ERROR" THEN
                GOSUB AFTER.UNAU.WRITE    ; * Special Processing after write
            END
        END

    END

    IF EB.SystemTables.getMessage() EQ 'AUT' THEN
        GOSUB AUTH.CROSS.VALIDATION     ; * Special Cross Validation
        IF NOT(V$ERROR) THEN
            GOSUB BEFORE.AUTH.WRITE      ; * Special Processing before write
        END

        IF NOT(V$ERROR) THEN

            EB.TransactionControl.AuthRecordWrite()

            IF EB.SystemTables.getMessage() NE "ERROR" THEN
                GOSUB AFTER.AUTH.WRITE    ; * Special Processing after write
            END
        END

    END

RETURN

*************************************************************************
*                      Special Tailored Subroutines                     *
*************************************************************************

CHECK.ID:

* Validation and changes of the ID entered.  Set ERROR to 1 if in error.

    IF EB.SystemTables.getIdNew() NE 'INWARD' AND EB.SystemTables.getIdNew() NE 'OUTWARD' THEN
        EB.SystemTables.setE('Key is not INWARD nor OUTWARD')
    END

    IF EB.SystemTables.getE() THEN V$ERROR = 1

RETURN

*************************************************************************

CHECK.RECORD:

* Validation and changes of the Record.  Set ERROR to 1 if in error.


RETURN

*************************************************************************

CHECK.FIELDS:
REM > CALL XX.CHECK.FIELDS
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
        EB.SystemTables.setA("1")
        Y.T.ETEXT=EB.SystemTables.getTEtext()
        LOOP UNTIL Y.T.ETEXT<EB.SystemTables.getA()> NE "" DO
        EB.SystemTables.setA(EB.SystemTables.getA()+1) ; REPEAT
        EB.SystemTables.setTSequ(EB.SystemTables.getA())
        V$ERROR = 1
        EB.SystemTables.setMessage('ERROR')
    END
RETURN                             ; * Back to field input via UNAUTH.RECORD.WRITE

*************************************************************************

OVERRIDES:
*
*  Overrides should reside here.
*
    V$ERROR = ''
    EB.SystemTables.setEtext('')
    EB.SystemTables.setText('')
*    ETEXT = ''
*    TEXT = ''
REM > CALL XX.OVERRIDE
*

*
    IF EB.SystemTables.getText() EQ "NO" THEN                ; * Said NO to override
        V$ERROR = 1
*        MESSAGE = "ERROR"               ; * Back to field input
        EB.SystemTables.setMessage("ERROR")
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
*
*  Contract processing code should reside here.
*
REM > CALL XX.         ;* Accounting, Schedule processing etc etc

    IF EB.SystemTables.getText() EQ "NO" THEN                ; * Said No to override
        EB.TransactionControl.TransactionAbort()          ; * Cancel current transaction
        V$ERROR = 1
*        MESSAGE = "ERROR"               ; * Back to field input
        EB.SystemTables.setMessage("ERROR")
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
        
        CASE EB.SystemTables.reDimRNew(tmp.V-8)[1,3] EQ "INA"    ; * Record status
            EB.SystemTables.setV(tmp.V)
REM > CALL XX.AUTHORISATION
*        tmp.V = EB.SystemTables.getV()
        CASE EB.SystemTables.reDimRNew(tmp.V-8)[1,3] EQ "RNA"    ; * Record status
            EB.SystemTables.setV(tmp.V)
REM > CALL XX.REVERSAL

    END CASE

RETURN

*************************************************************************

CHECK.FUNCTION:

* Validation of function entered.  Set FUNCTION to null if in error.

    tmp.V$FUNCTION = EB.SystemTables.getVFunction()
    IF INDEX('V',tmp.V$FUNCTION,1) THEN
        EB.SystemTables.setVFunction(tmp.V$FUNCTION)
        EB.SystemTables.setE('EB-LOT.INVALID.FUNCTION')
        tmp.E = EB.SystemTables.getE()
        EB.BZLocalTable2.lotTranslateError(tmp.E,'')
        EB.SystemTables.setE(tmp.E)
        EB.ErrorProcessing.Err()
        EB.SystemTables.setVFunction('')
    END

RETURN

*************************************************************************

INITIALISE:

RETURN

*************************************************************************

DEFINE.PARAMETERS:* SEE 'I_RULES' FOR DESCRIPTIONS *

EB.SystemTables.clearF() ; EB.SystemTables.clearN() ; EB.SystemTables.clearT()
EB.SystemTables.clearCheckfile() ; EB.SystemTables.clearConcatfile()
EB.SystemTables.setIdCheckfile(''); ID.CONCATFILE = ''
EB.SystemTables.setIdF('KEY'); ID.N = '7.6' ; ID.T = 'A'

Z = 0
Z += 1 ; EB.SystemTables.setF(Z, 'XX<HEADER.ID'); EB.SystemTables.setN(Z, '50'); EB.SystemTables.setT(Z, ''); tmp=EB.SystemTables.getT(Z); tmp<3>='NOINPUT'; EB.SystemTables.setT(Z, tmp)
Z += 1 ; EB.SystemTables.setF(Z, 'XX-XX<LAYOUT.ID'); EB.SystemTables.setN(Z, '20'); EB.SystemTables.setT(Z, ''); tmp=EB.SystemTables.getT(Z); tmp<3>='NOINPUT'; EB.SystemTables.setT(Z, tmp)
Z += 1 ; EB.SystemTables.setF(Z, 'XX-XX-REC.PRIORITY'); EB.SystemTables.setN(Z, '4'); EB.SystemTables.setT(Z, 'ANY'); tmp=EB.SystemTables.getT(Z); tmp<3>='NOINPUT'; EB.SystemTables.setT(Z, tmp)
Z += 1 ; EB.SystemTables.setF(Z, 'XX-XX-REC.LENGTH'); EB.SystemTables.setN(Z, '4'); EB.SystemTables.setT(Z, ''); tmp=EB.SystemTables.getT(Z); tmp<3>='NOINPUT'; EB.SystemTables.setT(Z, tmp)
Z += 1 ; EB.SystemTables.setF(Z, 'XX-XX-REC.NATURE'); EB.SystemTables.setN(Z, '3'); EB.SystemTables.setT(Z, 'A'); tmp=EB.SystemTables.getT(Z); tmp<3>='NOINPUT'; EB.SystemTables.setT(Z, tmp)
Z += 1 ; EB.SystemTables.setF(Z, 'XX-XX-ENR.START'); EB.SystemTables.setN(Z, '4'); EB.SystemTables.setT(Z, ''); tmp=EB.SystemTables.getT(Z); tmp<3>='NOINPUT'; EB.SystemTables.setT(Z, tmp)
Z += 1 ; EB.SystemTables.setF(Z, 'XX-XX-ENR.LENGTH'); EB.SystemTables.setN(Z, '4'); EB.SystemTables.setT(Z, ''); tmp=EB.SystemTables.getT(Z); tmp<3>='NOINPUT'; EB.SystemTables.setT(Z, tmp)
Z += 1 ; EB.SystemTables.setF(Z, 'XX-XX-ENR.VALUE'); EB.SystemTables.setN(Z, '50'); EB.SystemTables.setT(Z, 'ANY'); tmp=EB.SystemTables.getT(Z); tmp<3>='NOINPUT'; EB.SystemTables.setT(Z, tmp)
Z += 1 ; EB.SystemTables.setF(Z, 'XX-XX-OPE.START'); EB.SystemTables.setN(Z, '4'); EB.SystemTables.setT(Z, ''); tmp=EB.SystemTables.getT(Z); tmp<3>='NOINPUT'; EB.SystemTables.setT(Z, tmp)
Z += 1 ; EB.SystemTables.setF(Z, 'XX-XX-OPE.LENGTH'); EB.SystemTables.setN(Z, '4'); EB.SystemTables.setT(Z, ''); tmp=EB.SystemTables.getT(Z); tmp<3>='NOINPUT'; EB.SystemTables.setT(Z, tmp)
Z += 1 ; EB.SystemTables.setF(Z, 'XX>XX>OPE.VALUE'); EB.SystemTables.setN(Z, '50'); EB.SystemTables.setT(Z, 'ANY'); tmp=EB.SystemTables.getT(Z); tmp<3>='NOINPUT'; EB.SystemTables.setT(Z, tmp)

EB.SystemTables.setV(Z); EB.SystemTables.setPrefix('CEC.LAc')

RETURN

*************************************************************************

END
