* @ValidationCode : MjotMTYzMTQ0MzI4MjpDcDEyNTI6MTYwMDU2Mjc1MzIwOTpBZG1pbmlzdHJhdGV1cjotMTotMTowOjE6ZmFsc2U6Ti9BOlIyMF9TUDQuMDotMTotMQ==
* @ValidationInfo : Timestamp         : 20 Sep 2020 01:45:53
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : Administrateur
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : true
* @ValidationInfo : Bypass GateKeeper : false
* @ValidationInfo : Compiler Version  : R20_SP4.0
*-------------------------------------------------------------------------
* <Rating>-13</Rating>
*-------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable3
SUBROUTINE BZ.MON.REGISTRE.GAB.CHANGE
*-------------------------------------------------------------------------
*<doc>
* TODO add a description of the application here.
* @author BOUNOUARA FEHMI
* @stereotype Application
*</doc>
*-------------------------------------------------------------------------
* TODO - You MUST write a .FIELDS routine for the field definitions
*-------------------------------------------------------------------------
* Modification History :
*-----------------------
*ZIT-UPG-R13-R19     :  No Changes.
* ------------------------------------------------------------------------
* <region name= Inserts>
* $INSERT I_COMMON - Not Used anymore;N
* $INSERT I_EQUATE - Not Used anymore;TE
* $INSERT I_Table - Not Used anymore;e
    $USING EB.SystemTables
    $USING EB.API
    $USING EB.Template
* </region>
*-------------------------------------------------------------------------
    EB.Template.setTableName('BZ.MON.REGISTRE.GAB.CHANGE');* Full application name including pr
    EB.Template.setTableTitle('BZ.MON.REGISTRE.GAB.CHANGE');* Screen title
    EB.Template.setTableStereotype('H');* H, U, L, W or T
    EB.Template.setTableProduct('ST');* Must be on EB.PRODUCT
    EB.Template.setTableSubproduct('');* Must be on EB.SUB.PRODUCT
    EB.Template.setTableClassification('CUS');* As per FILE.CONTROL
    EB.Template.setTableSystemclearfile('Y');* As per FILE.CONTROL
    EB.Template.setTableRelatedfiles('');* As per FILE.CONTROL
    EB.Template.setTableIspostclosingfile('');* As per FILE.CONTROL
    EB.Template.setTableEquateprefix('MON.CHG');* Use to create I_F.EB.LOG.PARAMETE
*-------------------------------------------------------------------------
    EB.Template.setTableIdprefix('');* Used by EB.FORMAT.ID if set
    EB.Template.setTableBlockedfunctions('');* Space delimeted list of blocked
    Table.trigger = ''        ;* Trigger field used for OPERATION style fi
*-------------------------------------------------------------------------

RETURN
END
