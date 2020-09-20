* @ValidationCode : MjotMTU1MTUzNDU2MDpDcDEyNTI6MTYwMDQ3ODk5ODU4NzpBZG1pbmlzdHJhdGV1cjotMTotMTowOjE6ZmFsc2U6Ti9BOlIxOV9BTVIuMDotMTotMQ==
* @ValidationInfo : Timestamp         : 19 Sep 2020 02:29:58
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
*-----------------------------------------------------------------------------
*Modification History:
*ZIT-UPG-R13-R19:NO CHANGES
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable1
SUBROUTINE BZ.CPT.LOT
*-----------------------------------------------------------------------------
* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;
* $INSERT I_Table - Not Used anymore;

    $USING EB.API
    $USING EB.SystemTables
    $USING EB.Template
*-----------------------------------------------------------------------------
    EB.Template.setTableName('BZ.CPT.LOT')
    EB.Template.setTableTitle('BZ.CPT.LOT')
    EB.Template.setTableStereotype('H')
    EB.Template.setTableProduct('ST')
    EB.Template.setTableSubproduct('')
    EB.Template.setTableClassification('CUS')
    EB.Template.setTableSystemclearfile('Y')
    EB.Template.setTableRelatedfiles('')
    EB.Template.setTableIspostclosingfile('')
    EB.Template.setTableEquateprefix('LOT')
*-----------------------------------------------------------------------------
    EB.Template.setTableIdprefix('LT')
    EB.Template.setTableBlockedfunctions('')
    Table.trigger = ''
*-----------------------------------------------------------------------------
RETURN
END
