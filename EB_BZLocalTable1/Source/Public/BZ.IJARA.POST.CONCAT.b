* @ValidationCode : MjotODQyMDUxMDI2OkNwMTI1MjoxNjAwNDc5MDk0NTM2OkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTpmYWxzZTpOL0E6UjE5X0FNUi4wOi0xOi0x
* @ValidationInfo : Timestamp         : 19 Sep 2020 02:31:34
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : Administrateur
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : true
* @ValidationInfo : Bypass GateKeeper : false
* @ValidationInfo : Compiler Version  : R19_AMR.0
* Modification History:
* ZIT-UPG-R13-R19 : Converted $INCLUDE TO $INSERT

$PACKAGE EB.BZLocalTable1
SUBROUTINE BZ.IJARA.POST.CONCAT

*--------------------------------------------------------------------------------------------------------------------------------
* Company Name        : ITSS
*--------------------------------------------------------------------------------------------------------------------------------
*
* Development by      : Imthathullah A
* Development date    : 29 Jan 2018
* Subroutine type     : Template routine
* Attached to         : N/A
* Attached as         : N/A
* Description         : To store the status of the Ijara contract while undergoing Term Assignment
*
*--------------------------------------------------------------------------------------------------------------------------------
* Modification History:
*--------------------------------------------------------------------------------------------------------------------------------
*
*--------------------------------------------------------------------------------------------------------------------------------

* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;
* $INSERT I_Table - Not Used anymore;
    $USING EB.API
    $USING EB.SystemTables
    $USING EB.Template

*-----------------------------------------------------------------------------
    EB.Template.setTableName('BZ.IJARA.POST.CONCAT');* Full application name including product prefix
    EB.Template.setTableTitle('BZ Ijara Residual Table');* Screen title
    EB.Template.setTableStereotype('L');* H, U, L, W or T
    EB.Template.setTableProduct('EB');* Must be on EB.PRODUCT
    EB.Template.setTableSubproduct('');* Must be on EB.SUB.PRODUCT
    EB.Template.setTableClassification('FIN');* As per FILE.CONTROL
    EB.Template.setTableSystemclearfile('Y');* As per FILE.CONTROL
    EB.Template.setTableRelatedfiles('');* As per FILE.CONTROL
    EB.Template.setTableIspostclosingfile('');* As per FILE.CONTROL
    EB.Template.setTableEquateprefix('BZ.RSC');* Use to create I_F.EB.LOG.PARAMETER
*-----------------------------------------------------------------------------
    EB.Template.setTableIdprefix('');* Used by EB.FORMAT.ID if set
    EB.Template.setTableBlockedfunctions('');* Space delimeted list of blocked functions
    Table.trigger = ''        ;* Trigger field used for OPERATION style fields
*-----------------------------------------------------------------------------

RETURN
END
