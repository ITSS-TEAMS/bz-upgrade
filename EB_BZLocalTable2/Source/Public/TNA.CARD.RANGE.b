* @ValidationCode : MjotOTc5MDEzNTc6Q3AxMjUyOjE2MDA1NjAxNDQ0NTI6QWRtaW5pc3RyYXRldXI6LTE6LTE6MDoxOmZhbHNlOk4vQTpSMjBfU1A0LjA6LTE6LTE=
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
* <Rating>-35</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable2
SUBROUTINE TNA.CARD.RANGE
*-----------------------------------------------------------------------------
*********************************************************************
*                      PROJET CHALLENGE 24
*********************************************************************
*
* @author
*
* @Mail
*
* @desc
* @desc
*
* @create    24/12/2009 11:57:43
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
* @stereotype H
*********************************************************************
*Modification History :
*ZIT-UPG-R13-R19 :  No Change
*-----------------------------------------------------------------------------
*** <region name= Header>
* $INSERT I_COMMON - Not Used anymore;N
* $INSERT I_EQUATE - Not Used anymore;E
* $INSERT I_DataTypes - Not Used anymore;s
* $INSERT I_Table - Not Used anymore;e
    $USING EB.SystemTables
    $USING EB.API
    $USING EB.Template
*** </region>
*-----------------------------------------------------------------------------
* <Main controlling section>
*----------------------------------------------------------------------

    GOSUB INITIALISATION
    GOSUB MAIN.PROCESS

RETURN
*---------------------------------------------------------------------------
INITIALISATION:
*file opening, variable set up

RETURN
*---------------------------------------------------------------------------
MAIN.PROCESS:
*main subroutine processing

    EB.Template.setTableName('TNA.CARD.RANGE');* Full application name including product prefix
    EB.Template.setTableTitle('CARD_RANGE');* Screen title
    EB.Template.setTableStereotype('H');* H, U, L, W or T
    EB.Template.setTableProduct('ST');* Must be on EB.PRODUCT
    EB.Template.setTableSubproduct('CCC');* Must be on EB.SUB.PRODUCT
    EB.Template.setTableClassification('INT');* As per FILE.CONTROL
    EB.Template.setTableSystemclearfile('Y');* As per FILE.CONTROL
    EB.Template.setTableRelatedfiles('');* As per FILE.CONTROL
    EB.Template.setTableIspostclosingfile('');* As per FILE.CONTROL
    EB.Template.setTableEquateprefix('RANGE');* Use to create I_F.EB.LOG.PARAMETER
* ----------------------------------------------------------------------------
    EB.Template.setTableIdprefix('');* Used by EB.FORMAT.ID if set
    EB.Template.setTableBlockedfunctions('');* Space delimeted list of blocked functions
    Table.trigger = ''      ;* Trigger field used for OPERATION style fields

RETURN
* ----------------------------------------------------------------------------
END
