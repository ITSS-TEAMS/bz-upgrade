* @ValidationCode : MjoxMDUwNTQ5NDQ5OkNwMTI1MjoxNjAwNDg0NzE5NjY0OkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTp0cnVlOk4vQTpSMjBfU1A0LjA6LTE6LTE=
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
SUBROUTINE BZ.KYC.ASSOCIATION.FIELDS
*-----------------------------------------------------------------------------
*<doc>
* Template for field definitions routine YOURAPPLICATION.FIELDS
*
* @author abdelmonaam.mastouri@banquezitouna.com
* @stereotype H
* </doc>
*-----------------------------------------------------------------------------
* Modification History :
*ZIT-UPG-R13-R19-FM TO @FM
*-----------------------------------------------------------------------------
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
    EB.Template.TableDefineid("ID", EB.Template.T24Numeric : @FM : "10")      ;* Define Table id
*-----------------------------------------------------------------------------
    EB.Template.TableAddfielddefinition("NOM","35", "A", "")
    EB.Template.TableAddfielddefinition("FORME.JURIDIQUE","3", "A", "")
    EB.Template.FieldSetcheckfile("BZ.FORME.JURIDIQUE")
    EB.Template.TableAddfielddefinition("IDENT.ORG","20", "A", "")
    EB.Template.TableAddfielddefinition("REF.JORT","20", "A", "")
    EB.Template.TableAddfielddefinition("MONTANT.AIDES", "20", "AMT","")
    EB.Template.TableAddfielddefinition("FREQ.AIDES","13", "" : @FM : " _Annuelle_Trimestrielle_Mensuelle_Occasionnelle_Neant_", "")
    EB.Template.TableAddfielddefinition("AMT.DON.NAT", "20", "AMT","")
    EB.Template.TableAddfielddefinition("FREQ.DONS.NAT","13", "" : @FM : " _Annuelle_Trimestrielle_Mensuelle_Occasionnelle_Neant_", "")
    EB.Template.TableAddfielddefinition("AMT.DON.INT", "20", "AMT","")
    EB.Template.TableAddfielddefinition("FREQ.DONS.INT","13", "" : @FM : " _Annuelle_Trimestrielle_Mensuelle_Occasionnelle_Neant_", "")
    EB.Template.TableAddfielddefinition("XX.PAYS.DONS", "2", "A", "")
    EB.Template.FieldSetcheckfile("COUNTRY")
    EB.Template.TableAddfielddefinition("RECETTES","9", "" : @FM : " _Biens_Activites_Projets_", "")
    EB.Template.TableAddfielddefinition("PATRI.ASSOC","100", "A", "")
    EB.Template.TableAddfielddefinition("XX<REALISATION","100", "A", "")
    EB.Template.TableAddfielddefinition("XX>BENEF.AIDES","100", "A", "")
    EB.Template.TableAddfielddefinition("RELATIONS","100", "A", "")
    EB.Template.TableAddfielddefinition("HIST.BANK","100", "A", "")
    EB.Template.TableAddfielddefinition("VOLUME.TRANS","20", "AMT", "")
    EB.Template.TableAddfielddefinition("XX<FONCTION","12", "" : @FM : " _President_Tresorier_Membre du BE", "")
    EB.Template.TableAddfielddefinition("XX-NOM.PRENOM", "35", "A", "")
    EB.Template.TableAddfielddefinition("XX-ID.CLIENT", "10" , "A" , "")
    EB.Template.FieldSetcheckfile("CUSTOMER")
    EB.Template.TableAddfielddefinition("XX-TYPE.PIECE.ID","9", "" : @FM : "CIN_Passeport_", "")
    EB.Template.TableAddfielddefinition("XX-NUM.PIECE.ID", "12", "A", "")
    EB.Template.TableAddfielddefinition("XX-ADRESSE", "100", "A", "")
    EB.Template.TableAddfielddefinition("XX-MAIL", "35", "A", "")
    EB.Template.TableAddfielddefinition("XX-NUM.TEL", "13" , "A" , "")
    EB.Template.TableAddfielddefinition("XX-NATIONALITE", "2", "A", "")
    EB.Template.FieldSetcheckfile("COUNTRY")
    EB.Template.TableAddfielddefinition("XX-PEP","3", "" : @FM : " _Oui_Non", "")
    EB.Template.TableAddfielddefinition("XX-RAISON.PEP", "2", "A", "")
    EB.Template.FieldSetcheckfile("BZ.KYC.PEP")
    EB.Template.TableAddfielddefinition("XX-RELATION.PEP","3", "" : @FM : " _Oui_Non", "")
    EB.Template.TableAddfielddefinition("XX-TYPE.REL.PEP","40", "" : @FM : "Relation d'affaires_Relation familiale ascendante_ Relation familiale descendante_Conjoint_", "")
    EB.Template.TableAddfielddefinition("XX-RAISON.REL.PEP", "2", "A", "")
    EB.Template.FieldSetcheckfile("BZ.KYC.PEP")
    EB.Template.TableAddfielddefinition("XX-PARTIE.LIEE","3", "" : @FM : "Oui_Non", "")
    EB.Template.TableAddfielddefinition("XX-NATURE.LIENS", "50", "A", "")
    EB.Template.FieldSetcheckfile("BZ.KYC.PARTIE.LIEE")
    EB.Template.TableAddfielddefinition("XX>SIORN.KYC","3", "" : @FM : " _Oui_Non", "")
    EB.Template.TableAddfielddefinition("BENEF.EFFECTIF","3", "" : @FM : "Oui_Non", "")
    EB.Template.TableAddfielddefinition("NOM.BENEF", "100", "A", "")
    EB.Template.TableAddfielddefinition("GROUPE","3", "" : @FM : "Oui_Non", "")
    EB.Template.TableAddfielddefinition("PARTIE.LIE","3", "" : @FM : "Oui_Non", "")
    EB.Template.TableAddfielddefinition("NATURE.LIEN", "2", "A", "")
    EB.Template.FieldSetcheckfile("BZ.KYC.PARTIE.LIEE.PM")
    EB.Template.TableAddfielddefinition("TYPE.OPERATION", "25", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED1","10", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED2","10", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED3","10", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED4","10", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED5","10", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED6","10", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED7","10", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED8","10", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED9","10", "A", "")
*--------------------------------------------------------------------------------
    EB.Template.TableAddlocalreferencefield("")
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
