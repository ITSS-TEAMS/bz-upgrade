* @ValidationCode : MjotMTYyNzA3Mzc5NjpDcDEyNTI6MTYwMDQ3ODkyODcyOTpBZG1pbmlzdHJhdGV1cjotMTotMTowOjE6dHJ1ZTpOL0E6UjE5X0FNUi4wOi0xOi0x
* @ValidationInfo : Timestamp         : 19 Sep 2020 02:28:48
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
SUBROUTINE BZ.AML.CUSTOMER.FIELDS
*-----------------------------------------------------------------------------
*<doc>
* TODO add a description of the application here.
* AUTHOR YENGUI FIRAS
*
*
*
*-----------------------------------------------------------------------------
* TODO - You MUST write a .FIELDS routine for the field definitions
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------
* 08 / 07 / 2010
*ZIT-UPG-R13-R19 : Converted FM TO @FM.
* ----------------------------------------------------------------------------
*** <region name= Header>
* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;
* $INSERT I_DataTypes - Not Used anymore;
    $USING EB.SystemTables
    $USING EB.API
    $USING EB.Template
*** </region>

*-----------------------------------------------------------------------------
    EB.Template.TableDefineid("ID", "" : @FM : "50" : @FM : "A")
*-----------------------------------------------------------------------------
    EB.Template.TableAddfielddefinition("CUSTOMER", "10","CUS","")
    EB.Template.TableAddfielddefinition("CATEGORY", "5","A","")
    EB.Template.TableAddfielddefinition("NUM.CONTRAT", "15","A","")
    EB.Template.TableAddfielddefinition("APPLICATION", "30","A","")
    EB.Template.FieldSetcheckfile("FILE.CONTROL")
    EB.Template.TableAddfielddefinition("TABLE", "5","":@FM:"LIVE_HISTORY","")

**********
    EB.Template.TableAddfielddefinition("DATE.CHARGEMENT",  "8","D","")
    EB.Template.TableAddfielddefinition("TRANSACTION", "3","":@FM:"YES_NO","")
*-----------------------------------------------------------------------------
*-----------------------------------------------------------------------------
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
