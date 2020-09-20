*-----------------------------------------------------------------------------
* <Rating>-1</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.BUILD.LEAS.RECLAMATION(ENQ.DATA)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*-----------------------------------------------------------------------------
* Modification History :
*----------------------------------------------                                                      
*ZIT-UPG-R09-R13  : $INSERT BP to $INCLUDE BZDEV.BP     

*ZIT-UPG-R13-R19:NO CHANGES                      
*-----------------------------------------------------------------------------
* @author BounouaraFehmi
*------------------------------------------------------------------------
$INSERT I_COMMON
$INSERT I_EQUATE
$INSERT I_ENQUIRY.COMMON
*ZIT-UPG-R09-R13/S 
*$INSERT BP I_F.BZ.MDP.OP.EFF.LEAS
$INSERT I_F.BZ.MDP.OP.EFF.LEAS
*ZIT-UPG-R09-R13/E

    CODE.CLIENT=R.NEW(OP.LEAS.CODE.CLIENT)
    CONTRAT=R.NEW(OP.LEAS.CONTRAT)
* $INSERT I_COMMON - Not Used anymore;P.LEAS.RIB.TIRE)
* $INSERT I_EQUATE - Not Used anymore;3"

    ENQ.DATA<2,1> = 'STATUT'
    ENQ.DATA<3,1> = 'EQ'
    ENQ.DATA<4,1> =  STATUT

* $INSERT I_F.BZ.COFFRE.LOYER - Not Used anymore;T'
    ENQ.DATA<3,2> = 'EQ'
    ENQ.DATA<4,2> =  CODE.CLIENT

    ENQ.DATA<2,3> = 'NUM.REM'
    ENQ.DATA<3,3> = 'EQ'
    ENQ.DATA<4,3> =  CONTRAT

    ENQ.DATA<2,4> = 'RIB.TIRE'
    ENQ.DATA<3,4> = 'EQ'
    ENQ.EB.SystemTables.getVFunction()=  RIB.TIRE
    RETURN
END
