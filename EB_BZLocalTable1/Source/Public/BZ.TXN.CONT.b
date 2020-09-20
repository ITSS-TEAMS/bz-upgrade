* @ValidationCode : Mjo0NjI1NzcyMzY6Q3AxMjUyOjE2MDA0NzkzNjc5NTQ6QWRtaW5pc3RyYXRldXI6LTE6LTE6MDoxOmZhbHNlOk4vQTpSMTlfQU1SLjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 19 Sep 2020 02:36:07
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : Administrateur
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : true
* @ValidationInfo : Bypass GateKeeper : false
* @ValidationInfo : Compiler Version  : R19_AMR.0
*---------------------------------------------------------------------------------------
* <Rating>0</Rating>
* Version 1 01/11/2017 Globus Release R13.55
*---------------------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable1
SUBROUTINE BZ.TXN.CONT
*-----------------------------------------------------------------------------
*<doc>
* @author : firasjmalt24@gmail.com
* @stereotype L
* @classification FIN
* @desc les operations de credit sur les comptes contentieux
*</doc>
*-----------------------------------------------------------------------------
*Modification History:
*ZIT-UPG-R13-R19 :  No Changes.
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
    EB.Template.setTableName('BZ.TXN.CONT');* Full application name including product prefix
    EB.Template.setTableTitle('TXNs on Contetious Accounts');* Screen title
    EB.Template.setTableStereotype('L');* H, U, L, W or T
    EB.Template.setTableProduct('AC');* Must be on EB.PRODUCT
    EB.Template.setTableSubproduct('');* Must be on EB.SUB.PRODUCT
    EB.Template.setTableClassification('FIN');* As per FILE.CONTROL
    EB.Template.setTableSystemclearfile('Y');* As per FILE.CONTROL
    EB.Template.setTableRelatedfiles('');* As per FILE.CONTROL
    EB.Template.setTableIspostclosingfile('');* As per FILE.CONTROL
    EB.Template.setTableEquateprefix('OP.CONT');* Use to create I_F.EB.LOG.PARAMETER
*-----------------------------------------------------------------------------
    EB.Template.setTableIdprefix('');* Used by EB.FORMAT.ID if set
    EB.Template.setTableBlockedfunctions('');* Space delimeted list of blocked functions
    Table.trigger = ''        ;* Trigger field used for OPERATION style fields
*-----------------------------------------------------------------------------
RETURN
END
