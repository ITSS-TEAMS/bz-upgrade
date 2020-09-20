* @ValidationCode : MjotMTg0MTg1MjM5NTpDcDEyNTI6MTYwMDQ3OTI1MDExMDpBZG1pbmlzdHJhdGV1cjotMTotMTowOjE6dHJ1ZTpOL0E6UjE5X0FNUi4wOi0xOi0x
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
*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R13-R19  : FM CHANGED OT @FM
*-----------------------------------------------------------------------------
* <Rating>-1</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable1
SUBROUTINE BZ.PWC.TYPE.FRAIS.FIELDS

* @author BOUNOUARA FEHMI

* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;
* $INSERT I_DataTypes - Not Used anymore;

    $USING EB.SystemTables
    $USING EB.API
    $USING EB.Template


    EB.Template.TableDefineid("ID", "" : @FM : "10" : @FM : "A")

    EB.Template.TableAddfielddefinition("DESCRIPTION", "35", "A", "")

    EB.Template.TableAddfielddefinition("RESERVED.1", "35", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED.2", "35", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED.3", "35", "A", "")
*-----------------------------------------------------------------------------
    EB.Template.TableAddlocalreferencefield("")
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
