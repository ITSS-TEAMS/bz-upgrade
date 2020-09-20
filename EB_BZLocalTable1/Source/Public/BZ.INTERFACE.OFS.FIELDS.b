* @ValidationCode : MjotMzMwMTc2NzI5OkNwMTI1MjoxNjAwNDc5MDk2Njc0OkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTp0cnVlOk4vQTpSMTlfQU1SLjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 19 Sep 2020 02:31:36
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
SUBROUTINE BZ.INTERFACE.OFS.FIELDS
*-----------------------------------------------------------------------------
*<doc>
* TODO add a description of the application here.
* @author BOUNOUARA FEHMI
* @stereotype H
*
*
*-----------------------------------------------------------------------------
* TODO - You MUST write a .FIELDS routine for the field definitions
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------
*ZIT-UPG-R13-R19    : FM CHANGED TO @FM
* ----------------------------------------------------------------------------

*** <region name= Header>
*** <desc>Inserts and control logic</desc>
* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;
* $INSERT I_DataTypes - Not Used anymore;
    $USING EB.SystemTables
    $USING EB.API
    $USING EB.Template
*** </region>
*-----------------------------------------------------------------------------
    EB.Template.TableDefineid("ID", "" : @FM : "30" : @FM : "A")
*-----------------------------------------------------------------------------
    EB.Template.TableAddfielddefinition("DESCRIPTION","35", "A", "")

    EB.Template.TableAddfielddefinition("TYPE.APPLICATION","9.1", "" : @FM : "ENQUIRY_VERSION", "")

    EB.Template.TableAddfielddefinition("APPLICATION","100", "A", "")

    EB.Template.TableAddfielddefinition("XX<DONNEE.IN","20", "A", "")

    EB.Template.TableAddfielddefinition("XX>DONNEE.MAP","20", "A", "")

    EB.Template.TableAddfielddefinition("FONCTION","3", "" : @FM : "I_R", "")

*-----------------------------------------------------------------------------
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
