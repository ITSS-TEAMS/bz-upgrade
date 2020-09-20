*-----------------------------------------------------------------------------
* <Rating>0</Rating>
*-----------------------------------------------------------------------------
*-----------------------------------------------------------
*-----------------------------------------------------------
* reconstitution des critres dynamiques
*-----------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.PW.CHECK.IS (ENQ.DATA)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3

    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.USER
*-----------------------------------------------------------


    SELECT.ENQ  = ENQ.DATA<2>

    NB.SEL = DCOUNT(SELECT.ENQ,@VM)

    ENQ.DATA<2,NB.SEL + 1> = 'PROCESS.DEFINITION'
    ENQ.DATA<3,NB.SEL + 1> = 'EQ'
    ENQ.DATA<4,NB.SEL + 1> = 'IJARA.MOED.TEBBIA IJARA.FIN.TRAVAUX IJARA.BIEN.EQUIP.PROF IJARA.LEASING.IMMO IJARA.MAT.ROULANT MURABAHA.BZ.BIEN.CARTHAGO MURABAHA.BZ.CARTHAGO MURABAHA.IMMO MURABAHA.BZ IJARA MURABAHA.IMMO.NEW MURABAHA.NEW.BZ MURABAHA.IMMO.NEW.FRANCH'


    RETURN
