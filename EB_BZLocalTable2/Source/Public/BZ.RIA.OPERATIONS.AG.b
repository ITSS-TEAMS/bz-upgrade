* @ValidationCode : MjotNjQzODU2NzM3OkNwMTI1MjoxNjAwNDg0NzIwOTQ3OkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTpmYWxzZTpOL0E6UjIwX1NQNC4wOi0xOi0x
* @ValidationInfo : Timestamp         : 19 Sep 2020 04:05:20
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
* <Rating>-13</Rating>
*------------------------------------------------------------------------
*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R13-R19:NO CHANGES
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable2
SUBROUTINE BZ.RIA.OPERATIONS.AG
*-----------------------------------------------------------------------------
*<doc>
* TODO add a description of the application here.
* @author
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
    EB.Template.setTableName('BZ.RIA.OPERATIONS.AG');* Full application name including product prefix
    EB.Template.setTableTitle('OPERATIONS AGENCE');* Screen title
    EB.Template.setTableStereotype('H');* H, U, L, W or T
    EB.Template.setTableProduct('ST');* Must be on EB.PRODUCT
    EB.Template.setTableSubproduct('');* Must be on EB.SUB.PRODUCT
    EB.Template.setTableClassification('CUS');* As per FILE.CONTROL
    EB.Template.setTableSystemclearfile('Y');* As per FILE.CONTROL
    EB.Template.setTableRelatedfiles('');* As per FILE.CONTROL
    EB.Template.setTableIspostclosingfile('');* As per FILE.CONTROL
    EB.Template.setTableEquateprefix('RIA.OPER');* Use to create I_F.EB.LOG.PARAMETER
*-----------------------------------------------------------------------------
    EB.Template.setTableIdprefix('');* Used by EB.FORMAT.ID if set
    EB.Template.setTableBlockedfunctions('');* Space delimeted list of blocked functions
    Table.trigger = ''        ;* Trigger field used for OPERATION style fields
*-----------------------------------------------------------------------------

RETURN
END
