* @ValidationCode : MjotMTQ0MjE3MjcyNDpDcDEyNTI6MTYwMDQ3OTAwMDcwOTpBZG1pbmlzdHJhdGV1cjotMTotMTowOjE6dHJ1ZTpOL0E6UjE4X0FNUi4wOi0xOi0x
* @ValidationInfo : Timestamp         : 19 Sep 2020 02:30:00
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : Administrateur
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : true
* @ValidationInfo : Bypass GateKeeper : true
* @ValidationInfo : Compiler Version  : R18_AMR.0
$PACKAGE EB.BZLocalTable1
SUBROUTINE BZ.DE.FORMAT.ADVICE.FIELDS
*-----------------------------------------------------------------------------
*<doc>
* TODO add a description of the application here.
* @author BOUNOUARA FEHMI
* @stereotype H
*-------------------------------------------------------
*MODIFICATION HISTORY:
*ZIT-UPG-R13-R19-FM TO @FM
********************************************************
* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;
* $INSERT I_DataTypes - Not Used anymore;
    $USING EB.SystemTables
    $USING EB.API
    $USING EB.Template

*** </region>
*-----------------------------------------------------------------------------
    EB.Template.TableDefineid("ID", "" : @FM : "35" : @FM : "A")
*-----------------------------------------------------------------------------
    EB.Template.TableAddfielddefinition("DESCRIPTION", "35","A","")
    EB.Template.TableAddfielddefinition("XX<ZONE", "2","","")
    EB.Template.TableAddfielddefinition("XX-LIBELLE", "35","A","")
    EB.Template.TableAddfielddefinition("XX-MANDATORY", "3","":@FM:"_YES","")
    EB.Template.TableAddfielddefinition("XX-FORMAT", "35","A","")
    EB.Template.TableAddfielddefinition("XX>ROUTINE", "35","A","")

*-----------------------------------------------------------------------------
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
