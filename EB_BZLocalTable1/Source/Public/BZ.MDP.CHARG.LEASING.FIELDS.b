* @ValidationCode : MjotOTcxNjM1OTMzOkNwMTI1MjoxNjAwNDc5MTQ3NjI2OkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTp0cnVlOk4vQTpSMThfQU1SLjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 19 Sep 2020 02:32:27
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : Administrateur
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : true
* @ValidationInfo : Bypass GateKeeper : true
* @ValidationInfo : Compiler Version  : R18_AMR.0
*-----------------------------------------------------------------------------
* <Rating>-1</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable1
SUBROUTINE BZ.MDP.CHARG.LEASING.FIELDS
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
*ZIT-UPG-R13-R19-FM TO @FM
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

    EB.Template.TableAddfielddefinition("ACTION","30", "" : @FM : "NONE_A CHARGER_CHARGER_ANNULER_CONFIRMER_ENTRER PFC_GENERER RETOUR", "")

    EB.Template.TableAddfielddefinition("COMPTE","10", "ACC", "")
    EB.Template.FieldSetcheckfile("BZ.LEASING.CLIENT")

    EB.Template.TableAddfielddefinition("CLIENT","10", "CUS", "")
    EB.Template.FieldSetcheckfile("CUSTOMER")

    EB.Template.TableAddfielddefinition("NOM.PRENOM","35", "A", "")

    EB.Template.TableAddfielddefinition("DATE.CHARGEMENT","8", "D", "")

    EB.Template.TableAddamountfield("MNT.GLOBAL","15", T24_NUMERIC, "")

    EB.Template.TableAddfielddefinition("NBRE.GLOBAL","10","","")

    EB.Template.TableAddfielddefinition("OBSERVATION","35","A","")
    EB.Template.TableAddfielddefinition("REF.FICHIER","35","A","")
    EB.Template.TableAddfielddefinition("FICHIER.GENERE","3","":@FM:"Non_Oui","")
*-----------------------------------------------------------------------------
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
