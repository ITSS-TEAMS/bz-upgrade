* @ValidationCode : Mjo0OTcxNjIzNjc6Q3AxMjUyOjE2MDA0Nzg5NTAxNTY6QWRtaW5pc3RyYXRldXI6LTE6LTE6MDoxOmZhbHNlOk4vQTpSMTlfQU1SLjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 19 Sep 2020 02:29:10
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : Administrateur
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : true
* @ValidationInfo : Bypass GateKeeper : false
* @ValidationInfo : Compiler Version  : R19_AMR.0
* Modification History :
*-----------------------
*ZIT-UPG-R13-R19    : NO CHANGES
*----------------------------------------------------------------------------
* <Rating>0</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable1
SUBROUTINE BZ.AVA.TYPE.OUVERTURE
*-----------------------------------------------------------------------------
* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;
* $INSERT I_Table - Not Used anymore;
    $USING EB.SystemTables
    $USING EB.API
    $USING EB.Template
*-----------------------------------------------------------------------------
    EB.Template.setTableName('BZ.AVA.TYPE.OUVERTURE')
    EB.Template.setTableTitle('BZ.AVA.TYPE.OUVERTURE')
    EB.Template.setTableStereotype('H')
    EB.Template.setTableProduct('ST')
    EB.Template.setTableSubproduct('')
    EB.Template.setTableClassification('CUS')
    EB.Template.setTableSystemclearfile('Y')
    EB.Template.setTableRelatedfiles('')
    EB.Template.setTableIspostclosingfile('')
    EB.Template.setTableEquateprefix('TYP.OUV')
*-----------------------------------------------------------------------------
    EB.Template.setTableBlockedfunctions('')
    Table.trigger = ''
*-----------------------------------------------------------------------------
RETURN
END
