* @ValidationCode : MjoxMjI3MzM2Nzg3OkNwMTI1MjoxNjAwNTYwMTM4NTA2OkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTpmYWxzZTpOL0E6UjIwX1NQNC4wOi0xOi0x
* @ValidationInfo : Timestamp         : 20 Sep 2020 01:02:18
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
*AUTEUR : FEHMI BOUNOUARA
*ZIT-UPG-R13-R19 :  No Changes.
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable2
SUBROUTINE EDITIQUE.QUIT.AMENDE


* <region name= Inserts>
* $INSERT I_COMMON - Not Used anymore;N
* $INSERT I_EQUATE - Not Used anymore;E
* $INSERT I_Table - Not Used anymore;e
    $USING EB.SystemTables
    $USING EB.API
    $USING EB.Template
* </region>
*-----------------------------------------------------------------------------
    EB.Template.setTableName('EDITIQUE.QUIT.AMENDE');* Full application name including product prefix
    EB.Template.setTableTitle('Document QUITTANCE AMENDE');* Screen title
    EB.Template.setTableStereotype('H');* H, U, L, W or T
    EB.Template.setTableProduct('ST');* Must be on EB.PRODUCT
    EB.Template.setTableSubproduct('');* Must be on EB.SUB.PRODUCT
    EB.Template.setTableClassification('CUS');* As per FILE.CONTROL
    EB.Template.setTableSystemclearfile('Y');* As per FILE.CONTROL
    EB.Template.setTableRelatedfiles('');* As per FILE.CONTROL
    EB.Template.setTableIspostclosingfile('');* As per FILE.CONTROL
    EB.Template.setTableEquateprefix('QAMED');* Use to create I_F.EB.LOG.PARAMETER
*-----------------------------------------------------------------------------
    EB.Template.setTableIdprefix('');* Used by EB.FORMAT.ID if set
    EB.Template.setTableBlockedfunctions('');* Space delimeted list of blocked functions
    Table.trigger = ''        ;* Trigger field used for OPERATION style fields
*-----------------------------------------------------------------------------

RETURN
END
