*-----------------------------------------------------------------------------
* <Rating>0</Rating>
*-----------------------------------------------------------------------------
*Modification History:                                                        
*-----------------------------------------------------------------------------
  
*ZIT-UPG-R13-R19 : NO CHANGES                     
*-----------------------------------------------------------------------------
*Zeki Ben Othmen <Zeki.BenOthmen@banquezitouna.com>
*-----------------------------------------------------------
* reconstitution des critres dynamiques
*-----------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.PW.FILTRE.HORSIMMO(ENQ.DATA)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3

*ZIT-UPG-R13-R19/S
    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
*ZIT-UPG-R13-R19/E
*-----------------------------------------------------------
    SELECT.ENQ  = ENQ.DATA<2>

    NB.SEL = DCOUNT(SELECT.ENQ,@VM)

* $INSERT I_EQUATE - Not Used anymore;L + 1> = 'PROCESS.DEFINITION'
* $INSERT I_ENQUIRY.COMMON - Not Used anymore; 'EQ'
* $INSERT I_F.AC.CHARGE.REQUEST - Not Used anymore;ABAHA.NEW.BZ MURABAHA.BZ'

    RETURN
END
