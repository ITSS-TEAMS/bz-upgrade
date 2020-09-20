* @ValidationCode : MjotMTAyODI3MjUwMjpDcDEyNTI6MTYwMDQ3OTI3MDc1OTpBZG1pbmlzdHJhdGV1cjotMTotMTowOjE6ZmFsc2U6Ti9BOlIxOF9BTVIuMDotMTotMQ==
* @ValidationInfo : Timestamp         : 19 Sep 2020 02:34:30
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : Administrateur
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : true
* @ValidationInfo : Bypass GateKeeper : false
* @ValidationInfo : Compiler Version  : R18_AMR.0
*-----------------------------------------------------------------------------
* <Rating>-13</Rating>
*AUTEUR : YENGUI FIRAS
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable1
SUBROUTINE BZ.SED.CNP.FICHEIER.RCP
*-------------------------------------------------------
*MODIFICATION HISTORY:
*ZIT-UPG-R13-R19-NO CHANGES
********************************************************

* <region name= Inserts>
* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;
* $INSERT I_Table - Not Used anymore;
    $USING EB.SystemTables
    $USING EB.API
    $USING EB.Template

* </region>
*-----------------------------------------------------------------------------
    EB.Template.setTableName('BZ.SED.CNP.FICHEIER.RCP');* Full application name including product prefix
    EB.Template.setTableTitle('FICHIER RECPTION CNP');* Screen title
    EB.Template.setTableStereotype('H');* H, U, L, W or T
    EB.Template.setTableProduct('ST');* Must be on EB.PRODUCT
    EB.Template.setTableSubproduct('');* Must be on EB.SUB.PRODUCT
    EB.Template.setTableClassification('CUS');* As per FILE.CONTROL
    EB.Template.setTableSystemclearfile('Y');* As per FILE.CONTROL
    EB.Template.setTableRelatedfiles('');* As per FILE.CONTROL
    EB.Template.setTableIspostclosingfile('');* As per FILE.CONTROL
    EB.Template.setTableEquateprefix('CNP.RCP');* Use to create I_F.EB.LOG.PARAMETER
*-----------------------------------------------------------------------------
    EB.Template.setTableIdprefix('');* Used by EB.FORMAT.ID if set
    EB.Template.setTableBlockedfunctions('');* Space delimeted list of blocked functions
    Table.trigger = ''        ;* Trigger field used for OPERATION style fields
*-----------------------------------------------------------------------------

RETURN
END
