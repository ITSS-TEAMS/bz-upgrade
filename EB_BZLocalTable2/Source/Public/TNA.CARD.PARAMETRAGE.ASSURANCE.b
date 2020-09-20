* @ValidationCode : MjoxOTczNTkyODU2OkNwMTI1MjoxNjAwNTYwMTQ0MjgzOkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTpmYWxzZTpOL0E6UjIwX1NQNC4wOi0xOi0x
* @ValidationInfo : Timestamp         : 20 Sep 2020 01:02:24
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
$PACKAGE EB.BZLocalTable2
SUBROUTINE TNA.CARD.PARAMETRAGE.ASSURANCE
*-----------------------------------------------------------------------------
*********************************************************************
*                      PROJET CHALLENGE 24
*********************************************************************
*
* @author    :RELMEDYER@TEMENOS.COM
*
* @Mail
*
* @desc      TABLE POUR LES PARAMETRES RELATIF A L ASSURANCE L ASSURANCE
* @desc
*
* @create    25/03/2010 10:40:25
*
* @param
*
* @calls
*
* @error
*
* @change
*
* @revby
*
* @stereotype L
*********************************************************************
*-----------------------------------------------------------------------------
* Modification History :
*ZIT-UPG-R13-R19:NO CHANGES
*-----------------------------------------------------------------------------
*** <region name= Header>
* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;
* $INSERT I_DataTypes - Not Used anymore;
* $INSERT I_Table - Not Used anymore;

    $USING EB.API
    $USING EB.SystemTables
    $USING EB.Template
*** </region>

    EB.Template.setTableName('TNA.CARD.PARAMETRAGE.ASSURANCE');* Full application name including product prefix
    EB.Template.setTableTitle('');* Screen title
    EB.Template.setTableStereotype('H');* H, U, L, W or T
    EB.Template.setTableProduct('ST');* Must be on EB.PRODUCT
    EB.Template.setTableSubproduct('');* Must be on EB.SUB.PRODUCT
    EB.Template.setTableClassification('INT');* As per FILE.CONTROL
    EB.Template.setTableSystemclearfile('Y');* As per FILE.CONTROL
    EB.Template.setTableRelatedfiles('');* As per FILE.CONTROL
    EB.Template.setTableIspostclosingfile('');* As per FILE.CONTROL
    EB.Template.setTableEquateprefix('CARD');* Use to create I_F.EB.LOG.PARAMETER
* ----------------------------------------------------------------------------
    EB.Template.setTableIdprefix('');* Used by EB.FORMAT.ID if set
    EB.Template.setTableBlockedfunctions('');* Space delimeted list of blocked functions
    Table.trigger = ''      ;* Trigger field used for OPERATION style fields

RETURN
* ----------------------------------------------------------------------------
END
