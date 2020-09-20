* @ValidationCode : MjotNjE2NDc3MjI6Q3AxMjUyOjE2MDA0NzkxNjEwMDU6QWRtaW5pc3RyYXRldXI6LTE6LTE6MDoxOnRydWU6Ti9BOlIxOV9BTVIuMDotMTotMQ==
* @ValidationInfo : Timestamp         : 19 Sep 2020 02:32:41
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
SUBROUTINE BZ.MDP.FICHIER.SIBTEL.FIELDS
*-----------------------------------------------------------------------------
*<doc>
* TODO add a description of the application here.
* @author ktalhaoui@temenos.com
* @stereotype H
*
*
*-----------------------------------------------------------------------------
* TODO - You MUST write a .FIELDS routine for the field definitions
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------
* 09 / 03 / 10 - ktalhaoui New Template changes
* ZIT-UPG-R13-R19 : Converted $INCLUDE TO $INSERT, FM to @FM
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
    EB.Template.TableDefineid("ID", "" : @FM : "100" : @FM : "A")
*-----------------------------------------------------------------------------
    EB.Template.TableAddfielddefinition("REF.ECHANGE","100", "A", "")

    EB.Template.TableAddfielddefinition("ACTION","9", "" : @FM : "NONE_A CHARGER_CHARGER_ANNULER_CONFIRMER", "")

    EB.Template.TableAddfielddefinition("SENS","3", "" : @FM : "OUT_IN_", "")
    EB.Template.TableAddfielddefinition("CODE.VALEUR","2", "", "")
    EB.Template.FieldSetcheckfile("BZ.MDP.TYPE.VALEUR")
    EB.Template.TableAddfielddefinition("TYPE.PRES","3", "" : @FM : "PR_RJ_ALL_", "")
    EB.Template.TableAddfielddefinition("DATE.GENERATION","8", "D", "")

    EB.Template.TableAddamountfield("MNT.GLOBAL","15", T24_NUMERIC, "")

    EB.Template.TableAddfielddefinition("NBRE.GLOBAL","10","","")

    EB.Template.TableAddfielddefinition("CAT.PACK","3", "" : @FM : "YES_NO_", "")
    EB.Template.TableAddfielddefinition("OBSERVATION","35","A","")
*-----------------------------------------------------------------------------
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition() ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
