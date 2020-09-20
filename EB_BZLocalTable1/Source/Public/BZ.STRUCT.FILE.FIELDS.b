* @ValidationCode : MjotMTA2ODM2Mzc4OTpDcDEyNTI6MTYwMDQ3OTMxNjgwMzpBZG1pbmlzdHJhdGV1cjotMTotMTowOjE6dHJ1ZTpOL0E6UjE5X0FNUi4wOi0xOi0x
* @ValidationInfo : Timestamp         : 19 Sep 2020 02:35:16
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
SUBROUTINE BZ.STRUCT.FILE.FIELDS
*-----------------------------------------------------------------------------
*<doc>
* TODO add a description of the application here.
* @author T24 TEAM
* @stereotype H
**
*-----------------------------------------------------------------------------
* TODO - You MUST write a .FIELDS routine for the field definitions
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------
*ZITUNA-UPG-R13-R19 :  removed BP's and changed INCLUDE to INSERT
*                      FM converted to @FM
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
    EB.Template.TableDefineid("ID", "" : @FM : "35" : @FM : "A") ;
*-----------------------------------------------------------------------------
    EB.Template.TableAddfielddefinition("DESCRIPTION","35", "A", "")
    EB.Template.TableAddfielddefinition("TABLE","35", "A", "")
    EB.Template.TableAddfielddefinition("XX<CHAMPS","35", "A", "")
    EB.Template.TableAddfielddefinition("XX-POSITION","3", "A", "")
    EB.Template.TableAddfielddefinition("XX-LONGEUR","3", "A", "")
    EB.Template.TableAddfielddefinition("XX-CHAMPST24","35", "A", "")
    EB.Template.TableAddfielddefinition("XX>TYPE","10", "A", "")
    EB.Template.TableAddfielddefinition("IN.FOLDER","40", "A", "")
    EB.Template.TableAddfielddefinition("IN.ARC.FOLDER","40", "A", "")
    EB.Template.TableAddfielddefinition("SYSTEM","35", "A", "")
    EB.Template.FieldSetcheckfile("BZ.CHRG.SYSTEM")
    EB.Template.TableAddfielddefinition("PREFIX","10", "A", "")
    EB.Template.TableAddfielddefinition("LIGNE.GLOB","6", "" : @FM : "YES_NO_", "")
    EB.Template.TableAddfielddefinition("ECRAN","35", "A", "")
    EB.Template.FieldSetcheckfile("VERSION")

    EB.Template.TableAddfielddefinition("RESERVED1","10", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED2","10", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED3","10", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED4","10", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED5","10", "A", "")




*-----------------------------------------------------------------------------

    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
