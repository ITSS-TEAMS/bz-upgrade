* @ValidationCode : MjoxMDgyNjAzNTk0OkNwMTI1MjoxNjAwNTYyMTkyNjUzOkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTpmYWxzZTpOL0E6UjIwX1NQNC4wOi0xOi0x
* @ValidationInfo : Timestamp         : 20 Sep 2020 01:36:32
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : Administrateur
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : true
* @ValidationInfo : Bypass GateKeeper : false
* @ValidationInfo : Compiler Version  : R20_SP4.0
*---------------------------------------------------------------------------------------
* <Rating>0</Rating>
* Version 1 02/02/2018 Globus Release R13.55
*---------------------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable3
SUBROUTINE BZ.IJR.FACTURE
*-----------------------------------------------------------------------------
*<doc>
* @author : firasjmalt24@gmail.com | fjmal@itssglobal.com
* @stereotype L
* @classification FIN
* @desc Parametrage : Template local pour les factures IJARA
*</doc>
*-----------------------------------------------------------------------------
*Modification History:
*ZIT-UPG-R13-R19     :  No Changes.
*---------------------------------------------------------------------------------------
* <region name= Inserts>
* $INSERT I_COMMON - Not Used anymore;N
* $INSERT I_EQUATE - Not Used anymore;E
* $INSERT I_Table - Not Used anymore;e
    $USING EB.SystemTables
    $USING EB.API
    $USING EB.Template
* </region>
*-----------------------------------------------------------------------------
    EB.Template.setTableName('BZ.IJR.FACTURE');* Full application name including product prefix
    EB.Template.setTableTitle('Factures Ijara');* Screen title
    EB.Template.setTableStereotype('L');* H, U, L, W or T
    EB.Template.setTableProduct('LD');* Must be on EB.PRODUCT
    EB.Template.setTableSubproduct('');* Must be on EB.SUB.PRODUCT
    EB.Template.setTableClassification('FIN');* As per FILE.CONTROL
    EB.Template.setTableSystemclearfile('Y');* As per FILE.CONTROL
    EB.Template.setTableRelatedfiles('');* As per FILE.CONTROL
    EB.Template.setTableIspostclosingfile('');* As per FILE.CONTROL
    EB.Template.setTableEquateprefix('BZ.IJRF');* Use to create I_F.BZ.LD.IJR.FACT.PARAM
*-----------------------------------------------------------------------------
    EB.Template.setTableIdprefix('');* Used by EB.FORMAT.ID if set
    EB.Template.setTableBlockedfunctions('');* Space delimeted list of blocked functions
    Table.trigger = ''        ;* Trigger field used for OPERATION style fields
*-----------------------------------------------------------------------------
RETURN
END
