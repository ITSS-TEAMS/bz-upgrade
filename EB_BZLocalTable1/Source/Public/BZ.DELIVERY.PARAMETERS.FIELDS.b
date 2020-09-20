* @ValidationCode : MjotMTE0ODAxMzk3MDpDcDEyNTI6MTYwMDQ3OTAyNzUxNzpBZG1pbmlzdHJhdGV1cjotMTotMTowOjE6dHJ1ZTpOL0E6UjE5X0FNUi4wOi0xOi0x
* @ValidationInfo : Timestamp         : 19 Sep 2020 02:30:27
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
SUBROUTINE BZ.DELIVERY.PARAMETERS.FIELDS
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
* Modification History : $INSERT GLOBUS.BP to $INCLUDE ../T24_BP
* ZIT-UPG-R13-R19 : CONVERTED FM TO @FM
*-----------------------
* 22 / 05 / 2015
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
    EB.Template.TableDefineid("ID", "" : @FM : "40" : @FM : "A")
*-----------------------------------------------------------------------------
    
    EB.Template.TableAddfielddefinition("SYSTEM.NAME", "40","A","")
    EB.Template.TableAddfielddefinition("HOST", "20","A","")
    EB.Template.TableAddfielddefinition("PORT", "6","A","")

    
**********
    EB.Template.TableAddfielddefinition("STATUT", "10","":@FM:"ACTIVE_DESACTIVE","")

    EB.Template.TableAddfielddefinition("RESERVED.1", "200","A","")
    EB.Template.TableAddfielddefinition("RESERVED.2", "200","A","")
    EB.Template.TableAddfielddefinition("RESERVED.3", "100","A","")
    EB.Template.TableAddfielddefinition("RESERVED.4", "100","A","")


*-----------------------------------------------------------------------------
    EB.Template.TableAddlocalreferencefield("")
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
