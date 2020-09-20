* @ValidationCode : MjotMTgyNzYwMzQ2MDpDcDEyNTI6MTYwMDQ4NDcyMDI0MzpBZG1pbmlzdHJhdGV1cjotMTotMTowOjE6dHJ1ZTpOL0E6UjIwX1NQNC4wOi0xOi0x
* @ValidationInfo : Timestamp         : 19 Sep 2020 04:05:20
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
* <Rating>-3</Rating>
*-----------------------------------------------------------------------------
*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R13-R19:FM converted to @FM
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable2
SUBROUTINE BZ.MDP.REGISTRE.EFF.FIELDS
*-----------------------------------------------------------------------------
*<doc>
* TODO add a description of the application here.
* @author KTALHAOUI
* @stereotype H
*
*
*-----------------------------------------------------------------------------
* TODO - You MUST write a .FIELDS routine for the field definitions
*-----------------------------------------------------------------------------
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
    EB.Template.TableDefineid("ID", "" : @FM : "30" : @FM : "A")
*-----------------------------------------------------------------------------
    EB.Template.TableAddfielddefinition("CODE.VALEUR", "2","A","")
    EB.Template.FieldSetcheckfile("BZ.MDP.TYPE.VALEUR")
    EB.Template.TableAddfielddefinition("NATURE.REM", "1","A","")
    EB.Template.TableAddfielddefinition("CODE.REM", "2","A","")

    EB.Template.TableAddfielddefinition("CODE.CENTRE.REM", "3","A","")
    EB.Template.TableAddfielddefinition("DATE.OPERATION", "8","D","")
    EB.Template.TableAddfielddefinition("NUM.LOT", "4","","")
    EB.Template.TableAddfielddefinition("CODE.ENREG", "2","A","")
    EB.Template.TableAddfielddefinition("CODE.DEVISE","3","A","")
    EB.Template.TableAddfielddefinition("RANG","2","A","")
    EB.Template.TableAddfielddefinition("MNT.LCN","15","AMT","")
    EB.Template.TableAddfielddefinition("MNT.INTERETS","15","AMT","")
    EB.Template.TableAddfielddefinition("MNT.FRAIS.PROT","15","AMT","")

    EB.Template.TableAddfielddefinition("NUM.LCN", "12","A","")

    EB.Template.TableAddfielddefinition("RIB.TIRE", "20","A","")
    EB.Template.TableAddfielddefinition("RIB.TIRE.INIT", "20","A","")
    EB.Template.TableAddfielddefinition("CODE.DEST", "2","A","")
    EB.Template.TableAddfielddefinition("CODE.CENTRE.DEST", "3","A","")
    EB.Template.TableAddfielddefinition("RIB.CEDANT", "20","A","")
    EB.Template.TableAddfielddefinition("NOM.CEDANT", "35","A","")
    EB.Template.TableAddfielddefinition("NOM.TIRE", "35","A","")
    EB.Template.TableAddfielddefinition("REF.COM.TIRE", "30","A","")
    EB.Template.TableAddfielddefinition("CODE.ACCEPTATION", "30","A","")
    EB.Template.TableAddfielddefinition("CODE.ENDOS.AVAL", "1","A","")
    EB.Template.TableAddfielddefinition("DATE.ECHEANCE", "8","D","")
    EB.Template.TableAddfielddefinition("DATE.ECHEANCE.INIT", "8","D","")
    EB.Template.TableAddfielddefinition("DATE.CREATION", "8","D","")
    EB.Template.TableAddfielddefinition("LIEU.CREATION", "30","A","")
    EB.Template.TableAddfielddefinition("REF.COM.TIREUR", "30","A","")      ;* = ID DE LA TABLE AVEC PAD ESPACE
    EB.Template.TableAddfielddefinition("CODE.ORDRE.PAYE", "1","A","")
    EB.Template.TableAddfielddefinition("SITUATION.CEDANT", "1","A","")
    EB.Template.TableAddfielddefinition("NATURE.COMPTE", "1","A","")
    EB.Template.TableAddfielddefinition("DATE.COMPENSATION", "8","D","")
    EB.Template.TableAddfielddefinition("CODE.RISQUE.BCT", "6","A","")
    EB.Template.TableAddfielddefinition("ZONE.LIBRE", "29","A","")
    EB.Template.TableAddfielddefinition("NUM.LCN.40", "12","A","")          ;* SEQ A GENERER LORS DE LA GENERATION DE FICHIER DE PRESENTATION DES EFFETS

    EB.Template.TableAddfielddefinition("ENDOS.NOM", "35","A","")
    EB.Template.TableAddfielddefinition("ENDOS.ADRESSE", "65","A","")
    EB.Template.TableAddfielddefinition("ENDOS.NATURE", "1","A","")
    EB.Template.TableAddfielddefinition("ENDOS.IDENTIFIANT", "15","A","")
    EB.Template.TableAddfielddefinition("ENDOS.CODE.RISQUE", "15","A","")

    EB.Template.TableAddfielddefinition("AVAL.NOM", "35","A","")
    EB.Template.TableAddfielddefinition("AVAL.ADRESSE", "65","A","")
    EB.Template.TableAddfielddefinition("AVAL.NATURE", "1","A","")
    EB.Template.TableAddfielddefinition("AVAL.IDENTIFIANT", "15","A","")
    EB.Template.TableAddfielddefinition("AVAL.CODE.RISQUE", "15","A","")


**********CHAMPS TRAITEMENT

    EB.Template.TableAddfielddefinition("STATUT", "20","A","")
    EB.Template.FieldSetcheckfile("BZ.TRAIT.STATUT")
    EB.Template.TableAddfielddefinition("FICHIER.ENVOI", "65","A","")
    EB.Template.TableAddfielddefinition("REF.BORD", "35","A","")
    EB.Template.TableAddfielddefinition("NUM.REM", "35","A","")
    EB.Template.TableAddfielddefinition("UNITE.GESTION", "4","A","")
    EB.Template.FieldSetcheckfile("DEPT.ACCT.OFFICER")
    EB.Template.TableAddfielddefinition("DATE.ECHEANCE.CPS", "8","D","")
    EB.Template.TableAddfielddefinition("DATE.SORTIE.PFC", "8","D","")
    EB.Template.TableAddfielddefinition("DATE.SORT", "8","D","")
    EB.Template.TableAddfielddefinition("DATE.CAPTURE", "8","D","")
    EB.Template.TableAddfielddefinition("REF.CLE", "16","A","")
    EB.Template.TableAddfielddefinition("AGENCE.TIRE", "10","A","")
    EB.Template.TableAddfielddefinition("LOCALITE", "25","A","")
    EB.Template.TableAddfielddefinition("CODE.CLIENT", "20","CUS","")
    EB.Template.FieldSetcheckfile("CUSTOMER")
    EB.Template.TableAddfielddefinition("OBSERVATION", "35","A","")
    EB.Template.TableAddfielddefinition("FT.LIQUIDATION", "35","A","")
    EB.Template.TableAddfielddefinition("DATE.LIQUIDATION", "8","D","")
    EB.Template.TableAddfielddefinition("COMPTE.CEDANT", "10","ACC","")
    EB.Template.FieldSetcheckfile("ACCOUNT")
    EB.Template.TableAddfielddefinition("DVS.CPT.CEDANT", "3","CCY","")
    EB.Template.FieldSetcheckfile("CURRENCY")
    EB.Template.TableAddfielddefinition("MONTANT","15","AMT","")
    EB.Template.TableAddfielddefinition("REF.LEASING", "50","A","")
    EB.Template.TableAddfielddefinition("RESERVED.1", "10","A","")
    EB.Template.TableAddfielddefinition("RESERVED.2", "10","A","")
    EB.Template.TableAddfielddefinition("RESERVED.3", "10","A","")
    EB.Template.TableAddfielddefinition("RESERVED.4", "10","A","")
    EB.Template.TableAddfielddefinition("RESERVED.5", "10","A","")
    EB.Template.TableAddfielddefinition("RESERVED.6", "10","A","")
    EB.Template.TableAddfielddefinition("RESERVED.7", "10","A","")
    EB.Template.TableAddfielddefinition("RESERVED.8", "10","A","")
    EB.Template.TableAddfielddefinition("RESERVED.9", "10","A","")
    EB.Template.TableAddfielddefinition("RESERVED.10", "10","A","")
*-----------------------------------------------------------------------------
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
