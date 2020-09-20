* @ValidationCode : MjotMTE5MjkxOTExNDpDcDEyNTI6MTYwMDQ3OTI1MDI4NzpBZG1pbmlzdHJhdGV1cjotMTotMTowOjE6dHJ1ZTpOL0E6UjE5X0FNUi4wOi0xOi0x
* @ValidationInfo : Timestamp         : 19 Sep 2020 02:34:10
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : Administrateur
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : true
* @ValidationInfo : Bypass GateKeeper : true
* @ValidationInfo : Compiler Version  : R19_AMR.0
*-----------------------------------------------------------------------------
* <Rating>-1</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable1
SUBROUTINE BZ.RECONCIL.NOS.PARAMETER.FIELDS
*-----------------------------------------------------------------------------
*<doc>
* TODO add a description of the application here.
* @DEVT24@BANQUEZITOUNA
*
*
*
*-----------------------------------------------------------------------------
* TODO - You MUST write a .FIELDS routine for the field definitions
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------
* 08 / 07 / 2010

*ZIT-UPG-R13-R19:FM converted to @FM
* ----------------------------------------------------------------------------
*** <region name= Header>
*** <desc>Inserts and control logic</desc>
* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;
* $INSERT I_DataTypes - Not Used anymore;

    $USING EB.API
    $USING EB.SystemTables
    $USING EB.Template
*** </region>

*-----------------------------------------------------------------------------
    EB.Template.TableDefineid("ID", "" : @FM : "50" : @FM : "A")
*-----------------------------------------------------------------------------

    EB.Template.TableAddfielddefinition("XX.CATEGORY","6", "A", "")
    EB.Template.FieldSetcheckfile("CATEGORY")

    EB.Template.TableAddfielddefinition("RESERVED.1","35", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED.2","35", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED.3","35", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED.4","35", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED.5","35", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED.6","35", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED.7","35", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED.8","35", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED.9","35", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED.10","35", "A", "")


    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
