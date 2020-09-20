* @ValidationCode : MjotMTkxMTI1MTM3ODpDcDEyNTI6MTYwMDQ4NDcxOTYyODpBZG1pbmlzdHJhdGV1cjotMTotMTowOjE6ZmFsc2U6Ti9BOlIyMF9TUDQuMDotMTotMQ==
* @ValidationInfo : Timestamp         : 19 Sep 2020 04:05:19
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
*<Rating></Rating>
*---------------------------------------------
*Modification History:
*ZIT-UPG-R13-R19:NO CHANGES
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable2
SUBROUTINE BZ.GEN.RELEVES.OL.INIT
*-----------------------------------------------------------------------------
*********************************************************************
* @author    HAMZA BENALI
* @Mail      hamza.benali@gmail.com
* @desc      THIS IS AN AUTO-GENERATED ROUTINE
* @desc      BZ.GEN.RELEVES.OL.INIT TEMPLATE - (TEMPLATE GENERATOR TOOL)
* @create    13/01/2016 11:20:11
*********************************************************************
*-----------------------------------------------------------------------------
*** <region name= Header>

*ZIT-UPG-R13-R19 S

* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;
* $INSERT I_DataTypes - Not Used anymore;
* $INSERT I_Table - Not Used anymore;
    
    $USING EB.API
    $USING EB.SystemTables
    $USING EB.Template
	
*ZIT-UPG-R13-R19 E
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

    EB.Template.setTableName('BZ.GEN.RELEVES.OL.INIT');* Full application name including product prefix
    EB.Template.setTableTitle('BZ.GEN.RELEVES.OL.INIT');* Screen title
    EB.Template.setTableStereotype('W');* H, U, L, W or T
    EB.Template.setTableProduct('AC');* Must be on EB.PRODUCT
    EB.Template.setTableSubproduct('');* Must be on EB.SUB.PRODUCT
    EB.Template.setTableClassification('INT');* As per FILE.CONTROL
    EB.Template.setTableSystemclearfile('Y');* As per FILE.CONTROL
    EB.Template.setTableRelatedfiles('');* As per FILE.CONTROL
    EB.Template.setTableIspostclosingfile('');* As per FILE.CONTROL
    EB.Template.setTableEquateprefix('GEN.INIT');* Use to create I_F.EB.LOG.PARAMETER
* ----------------------------------------------------------------------------
    EB.Template.setTableIdprefix('');* Used by EB.FORMAT.ID if set
    EB.Template.setTableBlockedfunctions('');* Space delimeted list of blocked functions
    Table.trigger = ''        ;* Trigger field used for OPERATION style fields

RETURN
* ----------------------------------------------------------------------------
END
