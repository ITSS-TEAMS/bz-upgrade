* @ValidationCode : MjoxNzI0MzI1MDAxOkNwMTI1MjoxNjAwNDg0NzE5OTA4OkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTp0cnVlOk4vQTpSMjBfU1A0LjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 19 Sep 2020 04:05:19
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : Administrateur
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : true
* @ValidationInfo : Bypass GateKeeper : true
* @ValidationInfo : Compiler Version  : R20_SP4.0
*-----------------------------------------------------------------------------
* <Rating>-1</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable2
SUBROUTINE BZ.MDP.CHARG.TIERS.FIELDS
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
*ZIT-UPG-R13-R19      : Converted FM TO @FM.
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
    EB.Template.TableDefineid("ID", "" : @FM : "65" : @FM : "A")
*-----------------------------------------------------------------------------
    EB.Template.TableAddfielddefinition("REF.ECHANGE","65", "A", "")

    EB.Template.TableAddfielddefinition("ACTION","9", "" : @FM : "NONE_A CHARGER_CHARGER_ANNULER_CONFIRMER", "")

    EB.Template.TableAddfielddefinition("SENS","3", "" : @FM : "OUT_IN_", "")
    EB.Template.TableAddfielddefinition("TYPE.TIERS","2", "", "")
    EB.Template.FieldSetcheckfile("BZ.MDP.TYPE.TIERS")
    EB.Template.TableAddfielddefinition("TIERS","6", "A", "")
    EB.Template.FieldSetcheckfile("BZ.MDP.TIERS")

    EB.Template.TableAddfielddefinition("DATE.GENERATION","8", "D", "")

    EB.Template.TableAddamountfield("MNT.GLOBAL","15", T24_NUMERIC, "")

    EB.Template.TableAddfielddefinition("NBRE.GLOBAL","10","","")

    EB.Template.TableAddfielddefinition("OBSERVATION","35","A","")

    EB.Template.TableAddfielddefinition("DATE.PRES","8", "D", "")
*-----------------------------------------------------------------------------
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
