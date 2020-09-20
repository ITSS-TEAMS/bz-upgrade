* @ValidationCode : MjoyNDc4ODIzMTI6Q3AxMjUyOjE2MDA1NjA5MDQwMDQ6QWRtaW5pc3RyYXRldXI6LTE6LTE6MDoxOmZhbHNlOk4vQTpSMjBfU1A0LjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 20 Sep 2020 01:15:04
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
* <Rating>540</Rating>
*-----------------------------------------------------------------------------
* Version 5 02/06/00  GLOBUS Release No. G11.0.00 29/06/00
$PACKAGE EB.BZLocalTable2
SUBROUTINE LOT.PROCESS.CONCAT

*MODIFICATIONS
*************************************************************************
*18/05/00 - GB0001261
*           Jbase changes.
*          All the commented lines containing the keyword ERROR
*          has been changed to V$ERROR

*
*
*MODIFICATIONS
*****************************************************************
*18/05/00 - GB0001261
*           Jbase changes.
*           All commented lines containing the key word ERROR has been
*           changed to V$ERROR.
*ZIT-UPG-R13-R19  : OPERATIONS TO OPERANDS;DBR TO F.READ;GOTO TO GOSUB

* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;
* $INSERT I_F.COMPANY - Not Used anymore;
* $INSERT I_F.DATES - Not Used anymore;
* $INSERT I_F.LOCKING - Not Used anymore;  ;*ADDED
    $USING EB.SystemTables
    $USING EB.API
    $USING EB.Template
    $USING ST.CompanyCreation
    $USING EB.Utility
    $USING EB.Display
    $USING EB.TransactionControl
    $USING EB.ErrorProcessing
    $USING ST.Customer
    $USING EB.BZLocalDevRtns
*************************************************************************

    GOSUB DEFINE.PARAMETERS

    tmp.V$FUNCTION = EB.SystemTables.getVFunction()
    IF LEN(tmp.V$FUNCTION) GT 1 THEN
        EB.SystemTables.setVFunction(tmp.V$FUNCTION)
        GOSUB V$EXIT
    END

    EB.Display.MatrixUpdate()

REM > GOSUB INITIALISE                ;* Special Initialising

*************************************************************************

* Main Program Loop

    LOOP

        EB.TransactionControl.RecordidInput()

    UNTIL EB.SystemTables.getMessage() EQ 'RET' DO

        V$ERROR = ''

        IF EB.SystemTables.getMessage() EQ 'NEW FUNCTION' THEN

            GOSUB CHECK.FUNCTION         ; * Special Editing of Function

            IF EB.SystemTables.getVFunction() EQ 'E' OR EB.SystemTables.getVFunction() EQ 'L' THEN
                EB.Display.FunctionDisplay()
                EB.SystemTables.setVFunction('')
            END

        END ELSE

            GOSUB CHECK.ID               ; * Special Editing of ID
            IF V$ERROR THEN
                GOSUB MAIN.REPEAT
            END
            EB.TransactionControl.RecordRead()

            IF EB.SystemTables.getMessage() EQ 'REPEAT' THEN
                GOSUB MAIN.REPEAT
            END

            EB.Display.MatrixAlter()

            EB.Display.TableDisplay()           ; * For Table Files

        END

MAIN.REPEAT:
    REPEAT

V$EXIT:
RETURN                             ; * From main program

*************************************************************************
*                      Special Tailored Subroutines                     *
*************************************************************************

CHECK.ID:

* Validation and changes of the ID entered.  Set ERROR to 1 if in error.

    JUL.PROCESSDATE = EB.SystemTables.getRDates(EB.Utility.Dates.DatJulianDate)[3,5]

    LOT.ID = '' ; NB.NUM = ''
    FN.LOCKING='F.LOCKING'
    EB.SystemTables.setFLocking('')
    R.LOCKING=''
    LOCK.ERR=''
    tmp.F.LOCKING = EB.SystemTables.getFLocking()
    CALL OPF(FN.LOCKING,tmp.F.LOCKING) ;*ADDED
    EB.SystemTables.setFLocking(tmp.F.LOCKING)
    Y.LOC.ID='F':EB.SystemTables.getRCompany(ST.CompanyCreation.Company.EbComMnemonic):'.LOT.PROCESS'
    tmp.F.LOCKING = EB.SystemTables.getFLocking()
    R.LOCKING = EB.SystemTables.Locking.Read(Y.LOC.ID, LOCK.ERR)
* Before incorporation : CALL F.READ(FN.LOCKING,Y.LOC.ID,R.LOCKING,tmp.F.LOCKING,LOCK.ERR)
    EB.SystemTables.setFLocking(tmp.F.LOCKING)
*      CALL DBR('LOCKING':FM:1,'F':R.COMPANY(EB.COM.MNEMONIC):'.LOT.PROCESS',LOT.ID)
    IF R.LOCKING THEN
        LOT.ID=R.LOCKING<EB.SystemTables.Locking.LokContent>
    END
    IF LOT.ID EQ '' THEN
        NB.NUM = 5
    END ELSE
        IF LOT.ID[1,3] EQ 'LOT' THEN
            NB.NUM = LEN(LOT.ID)-8
        END ELSE
            IF LEN(LOT.ID) GT 5 THEN
                NB.NUM = LEN(LOT.ID)
            END ELSE
                NB.NUM = 5
            END
        END
    END

    LOT.DET.ID = EB.SystemTables.getIdNew()

    IF LEN(LOT.DET.ID) LE NB.NUM AND NUM(LOT.DET.ID) THEN
        EB.SystemTables.setIdNew('LOT':JUL.PROCESSDATE:FMT(LOT.DET.ID,NB.NUM:"'0'R"))
    END ELSE
        IF LEN(LOT.DET.ID) GE 10 AND NUM(LOT.DET.ID) THEN
            EB.SystemTables.setIdNew("LOT":FMT(LOT.DET.ID,NB.NUM+5:"'0'R"))
        END ELSE
            tmp.ID.NEW = EB.SystemTables.getIdNew()
            IF NOT(tmp.ID.NEW MATCH "'LOT'0N") THEN
                EB.SystemTables.setIdNew(tmp.ID.NEW)
                EB.SystemTables.setE('Cle non valide - doit commencer par "LOT"')
            END
        END
    END

    IF EB.SystemTables.getE() THEN
        EB.ErrorProcessing.Err()
        V$ERROR = '1'
    END

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
EB.SystemTables.setIdCheckfile(""); EB.SystemTables.setIdConcatfile("")
EB.SystemTables.setIdF('LOT.DETAIL.ID'); EB.SystemTables.setIdN('16'); EB.SystemTables.setIdT('A')

EB.SystemTables.setF(1,'LOT.PROCESS.ID'); EB.SystemTables.setN(1,'24'); EB.SystemTables.setT(1,'ANY'); tmp=EB.SystemTables.getT(1); tmp<3>='NOINPUT'; EB.SystemTables.setT(1, tmp)

RETURN

*************************************************************************

END
