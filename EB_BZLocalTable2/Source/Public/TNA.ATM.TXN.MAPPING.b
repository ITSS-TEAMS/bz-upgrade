* @ValidationCode : MjoxOTg5MjYxNTQzOkNwMTI1MjoxNjAwNTYwMTQxOTc2OkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTpmYWxzZTpOL0E6UjIwX1NQNC4wOi0xOi0x
* @ValidationInfo : Timestamp         : 20 Sep 2020 01:02:21
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
*-----------------------------------------------------------------------------

*-----------------------------------------------------------------------------

*<Rating></Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable2
SUBROUTINE TNA.ATM.TXN.MAPPING
*-----------------------------------------------------------------------------

*<doc>
* TODO add a description of the application here
* @stereotype L
*
*-----------------------------------------------------------------------------
* Modification History :

*ZIT-UPG-R13-R19 : NO CHANGES
*-----------------------------------------------------------------------------

*** <region name= Header>
*** /**/
*ZIT-UPG-R13-R19/S
* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;
* $INSERT I_DataTypes - Not Used anymore;
* $INSERT I_Table - Not Used anymore;

    $USING EB.API
    $USING EB.SystemTables
    $USING EB.Template
*ZIT-UPG-R13-R19/E
*** </region>
* ----------------------------------------------------------------------------

    EB.Template.setTableName('TNA.ATM.TXN.MAPPING');* Full application name including product prefix
    EB.Template.setTableTitle('Mapping des Operations ATM');* Screen title
    EB.Template.setTableStereotype('H');* H, U, L, W or T
    EB.Template.setTableProduct('ST');* Must be on EB.PRODUCT
    EB.Template.setTableSubproduct('');* Must be on EB.SUB.PRODUCT
    EB.Template.setTableClassification('INT');* As per FILE.CONTROL
    EB.Template.setTableSystemclearfile('Y');* As per FILE.CONTROL
    EB.Template.setTableRelatedfiles('');* As per FILE.CONTROL
    EB.Template.setTableIspostclosingfile('Is Post Closing File :');* As per FILE.CONTROL
    EB.Template.setTableEquateprefix('MAP.IN');* Use to create I_F.EB.LOG.PARAMETER
* ----------------------------------------------------------------------------
    EB.Template.setTableIdprefix('');* Used by EB.FORMAT.ID if set
    EB.Template.setTableBlockedfunctions('');* Space delimeted list of blocked functions
    Table.trigger = ''        ;* Trigger field used for OPERATION style fields
* ----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
