* @ValidationCode : MjoyMDg4ODUwNzMxOkNwMTI1MjoxNjAwNDg0NzE4ODMzOkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTpmYWxzZTpOL0E6UjIwX1NQNC4wOi0xOi0x
* @ValidationInfo : Timestamp         : 19 Sep 2020 04:05:18
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
$PACKAGE EB.BZLocalTable2
SUBROUTINE BZ.CNP.REGUL.CHQ.SIMUL
*-------------------------------------------------------------------------
*<doc>
* TODO add a description of the application here.
* @author njaafar@temenos.com
* @stereotype Application
* @package TODO define the product group and product, e.g. infra.eb
*</doc>
*-------------------------------------------------------------------------
* TODO - You MUST write a .FIELDS routine for the field definitions
*-------------------------------------------------------------------------
* Modification History :

*ZIT-UPG-R13-R19: NO CHANGES
* ------------------------------------------------------------------------
* <region name= Inserts>
* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;
* $INSERT I_Table - Not Used anymore;
    
    $USING EB.API
    $USING EB.SystemTables
    $USING EB.Template

* </region>
*-------------------------------------------------------------------------
    EB.Template.setTableName('BZ.CNP.REGUL.CHQ.SIMUL');* Full application name including pr
    EB.Template.setTableTitle('BZ.CNP.REGUL.CHQ.SIMUL');* Screen title
    EB.Template.setTableStereotype('H');* H, U, L, W or T
    EB.Template.setTableProduct('ST');* Must be on EB.PRODUCT
    EB.Template.setTableSubproduct('');* Must be on EB.SUB.PRODUCT
    EB.Template.setTableClassification('CUS');* As per FILE.CONTROL
    EB.Template.setTableSystemclearfile('Y');* As per FILE.CONTROL
    EB.Template.setTableRelatedfiles('');* As per FILE.CONTROL
    EB.Template.setTableIspostclosingfile('');* As per FILE.CONTROL
    EB.Template.setTableEquateprefix('BZ.SIM');* Use to create I_F.EB.LOG.PARAMETE
*-------------------------------------------------------------------------
    EB.Template.setTableIdprefix('');* Used by EB.FORMAT.ID if set
    EB.Template.setTableBlockedfunctions('');* Space delimeted list of blocked

    Table.trigger = ''        ;* Trigger field used for OPERATION style fi
*-------------------------------------------------------------------------

RETURN
END
