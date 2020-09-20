*-----------------------------------------------------------------------------
* <Rating>0</Rating>
*-----------------------------------------------------------------------------
*-----------------------------------------------------------
*Zeki Ben Othmen <Zeki.BenOthmen@banquezitouna.com>
*-----------------------------------------------------------
* reconstitution des critres dynamiques
*-----------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.PW.FILTRE.IMMO (ENQ.DATA)
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
*ZIT-UPG-R13-R19-ADDED MISSING END
********************************************************
    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.USER
*-----------------------------------------------------------
    SELECT.ENQ  = ENQ.DATA<2>

    NB.SEL = DCOUNT(SELECT.ENQ,@VM)

    ENQ.DATA<2,NB.SEL + 1> = 'PROCESS.DEFINITION'
* $INSERT I_COMMON - Not Used anymore;L + 1> = 'EQ'
* $INSERT I_EQUATE - Not Used anymore;L + 1> = 'MURABAHA.IMMO MURABAHA.IMMO.NEW MURABAHA.IMMO.NEW.FRANCH'

    RETURN
END
