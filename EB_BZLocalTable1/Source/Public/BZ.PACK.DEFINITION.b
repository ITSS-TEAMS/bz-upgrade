* @ValidationCode : MjoyNTEyMTUxOTY6Q3AxMjUyOjE2MDA0NzkyMjYyMDE6QWRtaW5pc3RyYXRldXI6LTE6LTE6MDoxOmZhbHNlOk4vQTpSMTlfQU1SLjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 19 Sep 2020 02:33:46
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
* <Rating>-13</Rating>
* Modification History:
* ZIT-UPG-R13-R19 : Converted $INCLUDE TO $INSERT
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable1
SUBROUTINE BZ.PACK.DEFINITION
*-----------------------------------------------------------------------------
*<doc>
* TODO add a description of the application here.
* @author BOUNOUARA Fehmi
* @stereotype H
*
*
*-----------------------------------------------------------------------------
* TODO - You MUST write a .FIELDS routine for the field definitions
*-----------------------------------------------------------------------------
* ----------------------------------------------------------------------------
* <region name= Inserts>
* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;
* $INSERT I_Table - Not Used anymore;
    $USING EB.API
    $USING EB.SystemTables
    $USING EB.Template
* </region>
*-----------------------------------------------------------------------------
    EB.Template.setTableName('BZ.PACK.DEFINITION');* Full application name including product prefix
    EB.Template.setTableTitle('DEFINITION PACK');* Screen title
    EB.Template.setTableStereotype('H');* H, U, L, W or T
    EB.Template.setTableProduct('ST');* Must be on EB.PRODUCT
    EB.Template.setTableSubproduct('');* Must be on EB.SUB.PRODUCT
    EB.Template.setTableClassification('CUS');* As per FILE.CONTROL
    EB.Template.setTableSystemclearfile('Y');* As per FILE.CONTROL
    EB.Template.setTableRelatedfiles('');* As per FILE.CONTROL
    EB.Template.setTableIspostclosingfile('');* As per FILE.CONTROL
    EB.Template.setTableEquateprefix('DEF.PK');* Use to create I_F.EB.LOG.PARAMETER
*-----------------------------------------------------------------------------
    EB.Template.setTableIdprefix('');* Used by EB.FORMAT.ID if set
    EB.Template.setTableBlockedfunctions('');* Space delimeted list of blocked functions
    Table.trigger = ''        ;* Trigger field used for OPERATION style fields
*-----------------------------------------------------------------------------

RETURN
END
