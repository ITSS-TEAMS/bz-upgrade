*-----------------------------------------------------------------------------
* <Rating>0</Rating>
*-----------------------------------------------------------------------------
*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13  : $INSERT BP to $INCLUDE BZDEV.BP
*ZIT-UPG-R13-R19  : INTIALISED F.READ VARIABLES
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.MDP.SORTIE.EFFET.2.READ
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
*ZIT-UPG-R09-R13/S
*$INSERT BP I_F.BZ.MDP.REGISTRE.EFF
    $INSERT I_F.BZ.MDP.REGISTRE.EFF
*ZIT-UPG-R09-R13/E
    FN.REG.EFF='F.BZ.MDP.REGISTRE.EFF'
    F.REG.EFF=''
	REG.REC=''
	ERR1=''
    EFFET=O.DATA

* $INSERT I_COMMON - Not Used anymore;EFF,F.REG.EFF)

* $INSERT I_ENQUIRY.COMMON - Not Used anymore;FFET,REG.REC,F.REG.EFF,ERR1)
* $INSERT I_F.AC.CHARGE.REQUEST - Not Used anymore;ODE.VALEUR>
    R.RECORD<2>=REG.REC<REG.EFF.NUM.LCN>
    R.RECORD<3>=REG.REC<REG.EFF.MNT.LCN>
    R.RECORD<4>=REG.REC<REG.EFF.RIB.TIRE>
* $INSERT I_F.BZ.COFFRE.LOYER - Not Used anymore;.RIB.CEDANT>
    R.RECORD<6>=REG.REC<REG.EFF.NOM.CEDANT>
    R.RECORD<7>=REG.REC<REG.EFF.DATE.ECHEANCE>
    R.RECORD<8>=REG.REC<REG.EFF.DATE.CREATION>
    R.RECORD<9>=REG.REC<REG.EFF.UNITE.GESTION>
    R.RECORD<10>=REG.REC<REG.EFF.DATE.ECHEANCE.CPS>

    RETURN
END
