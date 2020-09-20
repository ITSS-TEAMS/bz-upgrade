* @ValidationCode : MjotMTQ2MjYyMDM2NDpDcDEyNTI6MTYwMDQ3ODk1MDI2NzpBZG1pbmlzdHJhdGV1cjotMTotMTowOjE6ZmFsc2U6Ti9BOlIxOF9BTVIuMDotMTotMQ==
* @ValidationInfo : Timestamp         : 19 Sep 2020 02:29:10
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : Administrateur
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : true
* @ValidationInfo : Bypass GateKeeper : false
* @ValidationInfo : Compiler Version  : R18_AMR.0
*-----------------------------------------------------------------------------
* <Rating>0</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable1
SUBROUTINE BZ.AVA.TYPE
*-----------------------------------------------------------------------------
*MODIFICATION HISTORY:
********************************************************
* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;
* $INSERT I_Table - Not Used anymore;
    $USING EB.SystemTables
    $USING EB.API
    $USING EB.Template
*-----------------------------------------------------------------------------
    EB.Template.setTableName('BZ.AVA.TYPE')
    EB.Template.setTableTitle('BZ.AVA.TYPE')
    EB.Template.setTableStereotype('H')
    EB.Template.setTableProduct('ST')
    EB.Template.setTableSubproduct('')
    EB.Template.setTableClassification('CUS')
    EB.Template.setTableSystemclearfile('Y')
    EB.Template.setTableRelatedfiles('')
    EB.Template.setTableIspostclosingfile('')
    EB.Template.setTableEquateprefix('AVA.TYP')
*-----------------------------------------------------------------------------
    EB.Template.setTableBlockedfunctions('')
    Table.trigger = ''
*-----------------------------------------------------------------------------
RETURN
END
