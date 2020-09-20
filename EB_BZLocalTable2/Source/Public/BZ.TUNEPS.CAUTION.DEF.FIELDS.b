* @ValidationCode : MjotNzc2NzEzMzE4OkNwMTI1MjoxNjAwNDg0NzIxNDM2OkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTp0cnVlOk4vQTpSMjBfU1A0LjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 19 Sep 2020 04:05:21
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
SUBROUTINE BZ.TUNEPS.CAUTION.DEF.FIELDS

*-----------------------------------------------------------------------------
*<doc>
* TODO add a description of the application here.
* @author
* @stereotype H
*
*
*-----------------------------------------------------------------------------
* TODO - You MUST write a .FIELDS routine for the field definitions
*-----------------------------------------------------------------------------
* Modification History :
*ZITUNA-UPG-R13-R19 :  removed BP's and changed INCLUDE to INSERT
*                      FM converted to @FM
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
    EB.Template.TableDefineid("ID", "" : @FM : "25" : @FM : "A")
*-----------------------------------------------------------------------------
    EB.Template.TableAddfielddefinition("HEURE.RECU", "19","A" : @FM :"" : @FM :"NOINPUT", "")
    EB.Template.TableAddfielddefinition("CODE.RESULTAT.RECU", "4","A" : @FM :"" : @FM :"NOINPUT", "")
    EB.Template.TableAddfielddefinition("MESSAGE.RESULTAT", "20","A" : @FM :"" : @FM :"NOINPUT", "")
    EB.Template.TableAddfielddefinition("ID.TRANSMISSION", "20","A" : @FM :"" : @FM :"NOINPUT", "")
    EB.Template.TableAddfielddefinition("DATE.DELIVRANCE", "19","A" ,"")
    EB.Template.TableAddfielddefinition("REF.CAUTION", "15","A","")
    EB.Template.TableAddfielddefinition("ID.CUSTOMER", "15","A","")
    EB.Template.FieldSetcheckfile("CUSTOMER")
    EB.Template.TableAddfielddefinition("NOM.CLIENT", "50","A","")
    EB.Template.TableAddfielddefinition("NOM.NOTIF.CT", "300","A" , "")
    EB.Template.TableAddfielddefinition("NUM.CONTRAT", "15","A","")
    EB.Template.TableAddfielddefinition("NUM.SEQ.CONTRAT", "2","A","")
    EB.Template.TableAddfielddefinition("NUM.NOTIFICATION", "13","A","")
    EB.Template.TableAddfielddefinition("NUM.AO", "20","A","")
    EB.Template.TableAddfielddefinition("NUM.SEQ.AO", "2","A","")
    EB.Template.TableAddfielddefinition("NUM.LOT", "3","A","")
    EB.Template.TableAddfielddefinition("DATE.TIT.MARCHE",  "10","D" ,"")
    EB.Template.TableAddfielddefinition("NOM.FOURNISSEUR", "50","A","")
    EB.Template.TableAddfielddefinition("NUM.TUNEPS", "20","A" ,"")
    EB.Template.TableAddfielddefinition("NOM.ACHETEUR", "200","A" ,"")
    EB.Template.TableAddfielddefinition("CODE.ACHETEUR", "20","A" ,"")
    EB.Template.TableAddfielddefinition("MANDATAIRE", "50","A","")
    EB.Template.TableAddfielddefinition("NOM.DEMANDEUR", "35","A","")
    EB.Template.TableAddfielddefinition("ADRESSE.TIT", "1000","A" ,"")
    EB.Template.TableAddfielddefinition("NUM.CAUTION", "20","A","")
    EB.Template.TableAddfielddefinition("CODE.TYPE", "10","A" ,"")
    EB.Template.FieldSetcheckfile("BZ.TUNEPS.TYPECAUTION")
    EB.Template.TableAddfielddefinition("DESCRIPTION.TYPE", "100","A" ,"")
    EB.Template.TableAddfielddefinition("CODE.RECEPTION", "10","A" ,"")
    EB.Template.FieldSetcheckfile("BZ.TUNEPS.RECEPTION")
    EB.Template.TableAddfielddefinition("DESC.RECEPTION", "100","A" ,"")
    EB.Template.TableAddfielddefinition("DATE.CONTRAT" , "10","D" , "")
    EB.Template.TableAddfielddefinition("NUM.ATTEST.FIS", "15","A","")
    EB.Template.TableAddfielddefinition("DATE.ATTEST.FIS", "10","D" ,"")
    EB.Template.TableAddfielddefinition("MONTANT.MARCHE", "19","AMT" , "")
    EB.Template.TableAddfielddefinition("MONTANT.CAUTION", "19","AMT" , "")
    EB.Template.TableAddfielddefinition("DEVISE.CAUTION", "3","CCY" , "")
    EB.Template.FieldSetcheckfile('CURRENCY')
    EB.Template.TableAddfielddefinition("MONTANT.LETTRE", "100","A" ,"")
    EB.Template.TableAddfielddefinition("DATE.DEB.CAU", "19","A" ,"")
    EB.Template.TableAddfielddefinition("DATE.EXP.CAU", "19","A" ,"")
    EB.Template.TableAddfielddefinition("BANQUE.EMET", "50","A","")
    EB.Template.TableAddfielddefinition("NUM.RC.BANK", "15","A","")
    EB.Template.TableAddfielddefinition("NUM.RECU.BANK", "15","A","")
    EB.Template.TableAddfielddefinition("DATE.RECU.BANK", "19","A","")
    EB.Template.TableAddfielddefinition("AGENCE.EMT", "35","A","")
    EB.Template.TableAddfielddefinition("CHEF.AGENCE", "50","A","")
    EB.Template.TableAddfielddefinition("ADRESSE.AGENCE", "100","A","")
    EB.Template.TableAddfielddefinition("NOM.RESP.TRAIT", "50","A","")
    EB.Template.TableAddfielddefinition("NUM.TEL.RESP", "12","A","")
    EB.Template.TableAddfielddefinition("NUM.FAX.RESP", "12","A","")
    EB.Template.TableAddfielddefinition("EMAIL.RESP", "50","A","")
    EB.Template.TableAddfielddefinition("COMMENT", "50","A","")
    EB.Template.TableAddfielddefinition("STATUT", "8","": @FM : "DEMANDE_DEPOSE_ANNULE_ERRONE_MODIFIE","")
    EB.Template.TableAddfielddefinition("QUALITE.DEMANDEUR", "50","A","")
    EB.Template.TableAddfielddefinition("POURCENTAGE.MARCHE", "19","A","")
    EB.Template.TableAddfielddefinition("MONTANT.BLOCAGE", "19","A" , "")
    EB.Template.TableAddfielddefinition("SIGNATAIRE1", "50","A","")
    EB.Template.TableAddfielddefinition("SIGNATAIRE2", "50","A","")
    EB.Template.TableAddfielddefinition("RAISON.SOCIALE", "200","A" , "")
    EB.Template.TableAddfielddefinition("XX<NUM.PJ", "2","A" : @FM :"" : @FM :"NOINPUT", "")
    EB.Template.TableAddfielddefinition("XX-TITRE.PJ", "100","A" : @FM :"" : @FM :"NOINPUT", "")
    EB.Template.TableAddfielddefinition("XX-NOM.PJ", "300","A" : @FM :"" : @FM :"NOINPUT", "")
    EB.Template.TableAddfielddefinition("XX>CHEMIN.PJ", "500","A" : @FM :"" : @FM :"NOINPUT", "")
    EB.Template.TableAddfielddefinition("REFERENCE.MD", "15","A","")
    EB.Template.TableAddfielddefinition("DATE.ENREG", "19","A" ,"")
    EB.Template.TableAddfielddefinition("LIEU.ENREG", "19","A" ,"")
    EB.Template.TableAddfielddefinition("CODE.POS.FRS", "10","A" , "")
    EB.Template.TableAddfielddefinition("TEL.FRS", "20","A" , "")
    EB.Template.TableAddfielddefinition("FAX.FRS", "20","A" , "")
    EB.Template.TableAddfielddefinition("DATE.ENRG.FRS", "10","D" , "")
    EB.Template.TableAddfielddefinition("EMAIL.FRS", "50","A" , "")
    EB.Template.TableAddfielddefinition("CODE.STRUCTURE", "20","A" , "")
    EB.Template.TableAddfielddefinition("NUM.RC", "10","A", "")
    EB.Template.TableAddfielddefinition("DELAIS.ANS", "3","A" ,"")
    EB.Template.TableAddfielddefinition("DELAIS.MOIS", "2","A" , "")
    EB.Template.TableAddfielddefinition("DELAIS.JOURS", "2","A" , "")
    EB.Template.TableAddfielddefinition("VALUE.DATE", "11","D" , "")
    EB.Template.TableAddfielddefinition("CATEGORY", "11","A" , "")
    EB.Template.TableAddfielddefinition("XX.SIGNATAIRE", "50","A" , "")
    EB.Template.TableAddfielddefinition("CODE.AGENCE.EMET", "5","A" , "")

    EB.Template.TableAddfielddefinition("DEPO.HEURE.RECU", "19","A" : @FM :"" : @FM :"NOINPUT", "")
    EB.Template.TableAddfielddefinition("DEPO.CD.RST.RECU", "4","A" : @FM :"" : @FM :"NOINPUT", "")
    EB.Template.TableAddfielddefinition("DEPO.MSG.RESULTAT", "20","A" : @FM :"" : @FM :"NOINPUT", "")
    EB.Template.TableAddfielddefinition("DEPO.ID.TRANS.DEP", "20","A" : @FM :"" : @FM :"NOINPUT", "")
    EB.Template.TableAddfielddefinition("DATE.MODIF", "12","D" , "")
    EB.Template.TableAddfielddefinition("DATE.DEMANDE", "12","D" , "")

**RESERVED
    EB.Template.TableAddfielddefinition("VALIDITE", "10","A" ,"")
    EB.Template.TableAddfielddefinition("OPEN.DATE", "19","A" ,"")
    EB.Template.TableAddfielddefinition("RESERVED.3", "10","A" ,"")
    EB.Template.TableAddfielddefinition("RESERVED.4", "10","A" ,"")
    EB.Template.TableAddfielddefinition("RESERVED.5", "10","A" ,"")

*-----------------------------------------------------------------------------
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
