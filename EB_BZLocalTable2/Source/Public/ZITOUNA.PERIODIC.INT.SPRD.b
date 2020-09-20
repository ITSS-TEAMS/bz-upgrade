* @ValidationCode : MjotMTMwMDQ3NjU2MzpDcDEyNTI6MTYwMDU2MDE0NTIzMjpBZG1pbmlzdHJhdGV1cjotMTotMTowOjE6ZmFsc2U6Ti9BOlIyMF9TUDQuMDotMTotMQ==
* @ValidationInfo : Timestamp         : 20 Sep 2020 01:02:25
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : Administrateur
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : true
* @ValidationInfo : Bypass GateKeeper : false
* @ValidationInfo : Compiler Version  : R20_SP4.0
*-----------------------------------------------------------------------------
* <Rating>-15</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable2
SUBROUTINE ZITOUNA.PERIODIC.INT.SPRD
*-----------------------------------------------------------------------------
*<doc>
* ZITOUNE PERIODIC INTEREST SPREAD.
* tmoursli
* </doc>
*-----------------------------------------------------------------------------
* TODO - You MUST write a .FIELDS routine for the field definitions
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------
* 22/12/2009
*ZIT-UPG-R13-R19  : NO CHANGES
* ----------------------------------------------------------------------------
* <region name= Inserts>
* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;
* $INSERT I_Table - Not Used anymore;
    $USING EB.SystemTables
    $USING EB.API
    $USING EB.Template
* </region>
*-----------------------------------------------------------------------------
    EB.Template.setTableName('ZITOUNA.PERIODIC.INT.SPRD');* Full application name including product prefix
    EB.Template.setTableTitle('Marge sur taux');* Screen title
    EB.Template.setTableStereotype('H');* H, U, L, W or T
    EB.Template.setTableProduct('ST');* Must be on EB.PRODUCT
*    Table.subProduct = 'ZITOUNA'     ;* Must be on EB.SUB.PRODUCT
    EB.Template.setTableClassification('INT');* As per FILE.CONTROL
    EB.Template.setTableSystemclearfile('Y');* As per FILE.CONTROL
*    Table.relatedFiles = 'PERIODIC.INTEREST'   ;* As per FILE.CONTROL
    EB.Template.setTableIspostclosingfile('');* As per FILE.CONTROL
    EB.Template.setTableEquateprefix('ST.ZITOUNA');* Use to create I_F.EB.LOG.PARAMETER
*-----------------------------------------------------------------------------
    EB.Template.setTableIdprefix('');* Used by EB.FORMAT.ID if set
    EB.Template.setTableBlockedfunctions('');* Space delimeted list of blocked functions
    Table.trigger = ''        ;* Trigger field used for OPERATION style fields
*-----------------------------------------------------------------------------

RETURN
END
