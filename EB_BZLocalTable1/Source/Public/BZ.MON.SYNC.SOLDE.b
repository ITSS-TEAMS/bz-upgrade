* @ValidationCode : MjotNzY5ODgxNjIwOkNwMTI1MjoxNjAwNDc5MjEwNDExOkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTpmYWxzZTpOL0E6UjE5X0FNUi4wOi0xOi0x
* @ValidationInfo : Timestamp         : 19 Sep 2020 02:33:30
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : Administrateur
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : true
* @ValidationInfo : Bypass GateKeeper : false
* @ValidationInfo : Compiler Version  : R19_AMR.0
*Modification History:
*----------------------
*ZIT-UPG-R13-R19  : NO CHANGE
*-----------------------------------------------------------------------------
* <Rating>0</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable1
SUBROUTINE BZ.MON.SYNC.SOLDE
*-----------------------------------------------------------------------------
* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;
* $INSERT I_Table - Not Used anymore;
    $USING EB.SystemTables
    $USING EB.API
    $USING EB.Template
*-----------------------------------------------------------------------------
    EB.Template.setTableName('BZ.MON.SYNC.SOLDE')
    EB.Template.setTableTitle('BZ.MON.SYNC.SOLDE')
    EB.Template.setTableStereotype('H')
    EB.Template.setTableProduct('ST')
    EB.Template.setTableSubproduct('')
    EB.Template.setTableClassification('CUS')
    EB.Template.setTableSystemclearfile('Y')
    EB.Template.setTableRelatedfiles('')
    EB.Template.setTableIspostclosingfile('')
    EB.Template.setTableEquateprefix('MON.SYN')
*-----------------------------------------------------------------------------
    EB.Template.setTableBlockedfunctions('')
    Table.trigger = ''
*-----------------------------------------------------------------------------
RETURN
END
