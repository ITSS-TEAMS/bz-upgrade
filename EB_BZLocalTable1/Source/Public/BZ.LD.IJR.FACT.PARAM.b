* @ValidationCode : Mjo0ODg5NjE4ODY6Q3AxMjUyOjE2MDA0NzkwOTc1MTc6QWRtaW5pc3RyYXRldXI6LTE6LTE6MDoxOmZhbHNlOk4vQTpSMTlfQU1SLjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 19 Sep 2020 02:31:37
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
* Version 1 02/02/2018 Globus Release R13.55
*---------------------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable1
SUBROUTINE BZ.LD.IJR.FACT.PARAM
*-----------------------------------------------------------------------------
*<doc>
* @author : firasjmalt24@gmail.com | fjmal@itssglobal.com
* @stereotype H
* @classification FIN
* @desc Parametrage : Parametrage de la cartographie entre les codes commissions et les
*      montants de la facture
*</doc>
*-----------------------------------------------------------------------------
*Modification History:
*---------------------------------------------------------------------------------------

* <region name= Inserts>
* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;
* $INSERT I_Table - Not Used anymore;
    $USING EB.API
    $USING EB.SystemTables
    $USING EB.Template
* </region>
*-----------------------------------------------------------------------------
    EB.Template.setTableName('BZ.LD.IJR.FACT.PARAM');* Full application name including product prefix
    EB.Template.setTableTitle('Parametrage : Generation des factures IJARA');* Screen title
    EB.Template.setTableStereotype('H');* H, U, L, W or T
    EB.Template.setTableProduct('LD');* Must be on EB.PRODUCT
    EB.Template.setTableSubproduct('');* Must be on EB.SUB.PRODUCT
    EB.Template.setTableClassification('FIN');* As per FILE.CONTROL
    EB.Template.setTableSystemclearfile('Y');* As per FILE.CONTROL
    EB.Template.setTableRelatedfiles('');* As per FILE.CONTROL
    EB.Template.setTableIspostclosingfile('');* As per FILE.CONTROL
    EB.Template.setTableEquateprefix('BZ.IJRF.P');* Use to create I_F.BZ.LD.IJR.FACT.PARAM
*-----------------------------------------------------------------------------
    EB.Template.setTableIdprefix('');* Used by EB.FORMAT.ID if set
    EB.Template.setTableBlockedfunctions('');* Space delimeted list of blocked functions
    Table.trigger = ''        ;* Trigger field used for OPERATION style fields
*-----------------------------------------------------------------------------
RETURN
END
