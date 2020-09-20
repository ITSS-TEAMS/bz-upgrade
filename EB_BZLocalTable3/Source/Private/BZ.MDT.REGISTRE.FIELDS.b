* @ValidationCode : MjoxNDQ3MzUxMDI2OkNwMTI1MjoxNjAwNTYyNzUyOTY2OkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTp0cnVlOk4vQTpSMjBfU1A0LjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 20 Sep 2020 01:45:52
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
$PACKAGE EB.BZLocalTable3
SUBROUTINE BZ.MDT.REGISTRE.FIELDS
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
*ZIT-UPG-R13-R19 : FM CHANGED TO @FM
* ----------------------------------------------------------------------------
*** <region name= Header>
*** <desc>Inserts and control logic</desc>
*ZIT-UPG-R13-R19/S
* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;
* $INSERT I_DataTypes - Not Used anymore;

    $USING EB.API
    $USING EB.SystemTables
    $USING EB.Template
*ZIT-UPG-R13-R19/E
*** </region>

*-----------------------------------------------------------------------------
    EB.Template.TableDefineid("ID", "" : @FM : "35" : @FM : "A") ;
*-----------------------------------------------------------------------------
    EB.Template.TableAddfielddefinition("CODE.DEPT","2", "A", "")
    EB.Template.TableAddfielddefinition("MATRICULE","10", "A", "")
    EB.Template.TableAddfielddefinition("CODE.BANQUE","2", "A", "")
    EB.Template.TableAddfielddefinition("ARTICLE","4", "A", "")
    EB.Template.TableAddfielddefinition("CODE.REGION","4", "A", "")
    EB.Template.FieldSetcheckfile("BZ.MDT.REGION")
    EB.Template.TableAddfielddefinition("NUM.MANDAT","6", "A", "")
    EB.Template.TableAddfielddefinition("NUM.BORDEREAU","6", "A", "")
    EB.Template.TableAddfielddefinition("NOM.CLIENT","30", "A", "")
    EB.Template.TableAddfielddefinition("NUM.COMPTE","30", "A", "")
    EB.Template.TableAddfielddefinition("MONTANT.BRUT","7", "AMT", "")
    EB.Template.TableAddfielddefinition("MONTANT.OPPOSITION","7", "AMT", "")
    EB.Template.TableAddfielddefinition("MONTANT.NET","7", "AMT", "")
    EB.Template.TableAddfielddefinition("MOIS","2", "A", "")
    EB.Template.TableAddfielddefinition("ANNEE","2", "A", "")

    EB.Template.TableAddfielddefinition("REF.FICHIER","35", "A", "")
    EB.Template.TableAddfielddefinition("STATUT","15", "A", "")
    EB.Template.TableAddfielddefinition("DATE.CHARGEMENT","8", "D", "")

    EB.Template.TableAddfielddefinition("MOTIF.REJET","2", "A", "")
    EB.Template.FieldSetcheckfile("BZ.MDP.MOT.REJ")

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
