* @ValidationCode : MjotMTc5Mjk5OTQ1MTpDcDEyNTI6MTYwMDQ4NDcxOTAwNjpBZG1pbmlzdHJhdGV1cjotMTotMTowOjE6dHJ1ZTpOL0E6UjIwX1NQNC4wOi0xOi0x
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
* <Rating>-2</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable2
SUBROUTINE BZ.CORPORATE.FIELDS
*-----------------------------------------------------------------------------
*<doc>
* Template for field definitions routine YOURAPPLICATION.FIELDS
*
* @author aelidrissi@temenos.com
* @stereotype H
* </doc>
*-----------------------------------------------------------------------------
* Modification History :
*
* 19/11/09 - aelidrissi   New Template changes
* 19/12/2018- Abdelmonam.mastouri@banquezitouna.com
*@Desc: Data Model KYC PM

*ZIT-UPG-R13-R19:FM converted to @FM
*-----------------------------------------------------------------------------
*** <region name= Header>
*** <desc>Inserts and control logic</desc>
* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;
* $INSERT I_DataTypes - Not Used anymore;
    
    $USING EB.API
    $USING EB.SystemTables
    $USING EB.Template
*** </region>
*-------------------------------------T24_Date----------------------------------------
    EB.Template.TableDefineid("ID", EB.Template.T24Numeric : @FM : "10")      ;* Define Table id
*-----------------------------------------------------------------------------
    EB.Template.TableAddfield("DATE.PUB.JORT", EB.Template.T24Date, "", "")
    EB.Template.TableAddfielddefinition("XX<SITUATN.JUR", "2", "", "")
    EB.Template.FieldSetcheckfile("BZ.SITUATION.JURIDIQUE")
    EB.Template.TableAddfield("XX>DATE.SIT", EB.Template.T24Date, "", "")
    EB.Template.TableAddfield("ENTREE.ACTIVITE", EB.Template.T24Date, "", "")
    EB.Template.TableAddfielddefinition("MONTANT.CAPITAL", "20", "","")
    EB.Template.TableAddfielddefinition("DEVISE.CAPITAL", "3", "A", "")
    EB.Template.FieldSetcheckfile("CURRENCY")
    EB.Template.TableAddfield("DERNIER.AUG.CAP", EB.Template.T24Date, "", "")
    EB.Template.TableAddfielddefinition("XX<FCT.DIRECTN", "3", "A", "")
    EB.Template.FieldSetcheckfile("BZ.FONCTION.DIRECTION")
    EB.Template.TableAddfielddefinition("XX>NOM.DIRECT","35", "A", "")
    EB.Template.TableAddfielddefinition("XX<NOM.INTERLOC","35", "A", "")
    EB.Template.TableAddfielddefinition("XX.FCT.INTERLOC","35", "A", "")
    EB.Template.TableAddfielddefinition("XX>MAIL.INTERL","45", "A", "")
    EB.Template.TableAddfielddefinition("CHIFFRE.AFFAIRE", "20", "", "")
    EB.Template.TableAddfielddefinition("XX.SITE.WEB","35", "A", "")
    EB.Template.TableAddfielddefinition("XX<ACTIONNAIRES","35", "A", "")
    EB.Template.TableAddfielddefinition("XX>PRCENT.CAPTL", "20", "", "")
    EB.Template.TableAddfielddefinition("CODE.ISIN", "20", "", "")
    EB.Template.TableAddfielddefinition("EXPORTATRICE","35", "" : @FM : "Exportatrice_Non exportatrice_", "")
    EB.Template.TableAddfield("XX<EFFET.SEGMT", EB.Template.T24Date, "", "")
    EB.Template.TableAddfield("XX>MODIF.SEGMT", EB.Template.T24Date, "", "")
    EB.Template.TableAddfielddefinition("CODE.DOUANE", "20", "A", "")
    EB.Template.TableAddfielddefinition("SUSP.TVA","3", "" : @FM : "Oui_Non_", "")
    EB.Template.TableAddfielddefinition("SUSPENS.TVA", "20", "", "")
    EB.Template.TableAddfield("FIN.SUPENS.TVA", EB.Template.T24Date, "", "")
    EB.Template.TableAddfield("DEBUT.SUSP.TVA", EB.Template.T24Date, "", "")
    EB.Template.TableAddfielddefinition("CODE.INS", "20", "", "")
    EB.Template.TableAddfielddefinition("NATURE", "3", "A", "")
*---------------------DATA MODEL KYC PM------------------------------------------
    EB.Template.TableAddfielddefinition("NOM.CLIENT", "35", "A", "")
    EB.Template.TableAddfielddefinition("GROUPE","3", "" : @FM : "Oui_Non", "")
    EB.Template.TableAddfielddefinition("NOM.GROUPE", "35", "A", "")
    EB.Template.TableAddfielddefinition("XX<FONCTION","12", "" : @FM : " _Dirigeant_Actionnaire", "")
    EB.Template.TableAddfielddefinition("XX-NOM.PRENOM", "35", "A", "")
    EB.Template.TableAddfielddefinition("XX-ID.CLIENT", "10" , "A" , "")
    EB.Template.FieldSetcheckfile("CUSTOMER")
    EB.Template.TableAddfielddefinition("XX-TYPE.PIECE.ID","9", "" : @FM : "CIN_Passeport_", "")
    EB.Template.TableAddfielddefinition("XX-NUM.PIECE.ID", "12", "A", "")
    EB.Template.TableAddfielddefinition("XX-PRCENT.CAPITAL", "20", "", "")
    EB.Template.TableAddfielddefinition("XX-ADRESSE", "100", "A", "")
    EB.Template.TableAddfielddefinition("XX-MAIL", "35", "A", "")
    EB.Template.TableAddfielddefinition("XX-NUM.TEL", "13" , "A" , "")
    EB.Template.TableAddfielddefinition("XX-NATIONALITE", "2", "A", "")
    EB.Template.FieldSetcheckfile("COUNTRY")
    EB.Template.TableAddfielddefinition("XX-PEP","3", "" : @FM : " _Oui_Non", "")
    EB.Template.TableAddfielddefinition("XX-RAISON.PEP", "50", "A", "")
    EB.Template.FieldSetcheckfile("BZ.KYC.PEP")
    EB.Template.TableAddfielddefinition("XX-RELATION.PEP","3", "" : @FM : " _Oui_Non", "")
    EB.Template.TableAddfielddefinition("XX-TYPE.REL.PEP","40", "" : @FM : "Relation d'affaires_Relation familiale ascendante_ Relation familiale descendante_Conjoint_", "")
    EB.Template.TableAddfielddefinition("XX-RAISON.REL.PEP", "2", "A", "")
    EB.Template.FieldSetcheckfile("BZ.KYC.PEP")
    EB.Template.TableAddfielddefinition("XX-PARTIE.LIEE","3", "" : @FM : "Oui_Non", "")
    EB.Template.TableAddfielddefinition("XX-NATURE.LIEN", "50", "A", "")
    EB.Template.FieldSetcheckfile("BZ.KYC.PARTIE.LIEE")
    EB.Template.TableAddfielddefinition("XX>SIORN.KYC","3", "" : @FM : " _Oui_Non", "")
    EB.Template.TableAddfielddefinition("BENEF.EFFECTIF","3", "" : @FM : "Oui_Non", "")
    EB.Template.TableAddfielddefinition("NOM.BENEF", "100", "A", "")
    EB.Template.TableAddfielddefinition("PARTIE.LIE.PM","3", "" : @FM : "Oui_Non", "")
    EB.Template.TableAddfielddefinition("NATURE.PM", "50", "A", "")
    EB.Template.FieldSetcheckfile("BZ.KYC.PARTIE.LIEE.PM")
    EB.Template.TableAddfielddefinition("TYPE.OPERATION", "25", "A", "")
*--------------------------------------------------------------------------------
    EB.Template.TableAddlocalreferencefield("")
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
