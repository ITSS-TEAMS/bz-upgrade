* @ValidationCode : MjotNTcwNTQ3Nzc3OkNwMTI1MjoxNjAwNDc5MjcwNjQyOkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTpmYWxzZTpOL0E6UjE5X0FNUi4wOi0xOi0x
* @ValidationInfo : Timestamp         : 19 Sep 2020 02:34:30
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : Administrateur
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : true
* @ValidationInfo : Bypass GateKeeper : false
* @ValidationInfo : Compiler Version  : R19_AMR.0
*-----------------------------------------------------------------------------
* <Rating>0</Rating>
* Modification History :
*ZIT-UPG-R13-R19     :  No Changes.
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable1
SUBROUTINE BZ.SED.BP.SOLDE
*-----------------------------------------------------------------------------
* $INSERT I_COMMON - Not Used anymore;N
* $INSERT I_EQUATE - Not Used anymore;E
* $INSERT I_Table - Not Used anymore;e
    $USING EB.SystemTables
    $USING EB.API
    $USING EB.Template
*-----------------------------------------------------------------------------
    EB.Template.setTableName('BZ.SED.BP.SOLDE')
    EB.Template.setTableTitle('BZ.SED.BP.SOLDE')
    EB.Template.setTableStereotype('H')
    EB.Template.setTableProduct('ST')
    EB.Template.setTableSubproduct('')
    EB.Template.setTableClassification('CUS')
    EB.Template.setTableSystemclearfile('Y')
    EB.Template.setTableRelatedfiles('')
    EB.Template.setTableIspostclosingfile('')
    EB.Template.setTableEquateprefix('SED.SOLDE')
*-----------------------------------------------------------------------------
    EB.Template.setTableBlockedfunctions('')
    Table.trigger = ''
*-----------------------------------------------------------------------------
RETURN
END
