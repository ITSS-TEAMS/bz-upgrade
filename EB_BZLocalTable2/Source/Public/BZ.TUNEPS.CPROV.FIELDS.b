* @ValidationCode : MjoxMDgxNTU3ODIzOkNwMTI1MjoxNjAwNDg0NzIxNDg5OkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTp0cnVlOk4vQTpSMjBfU1A0LjA6LTE6LTE=
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
SUBROUTINE BZ.TUNEPS.CPROV.FIELDS

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
*Modification History :
*ZIT-UPG-R13-R19 : Converted FM to @FM.
* ----------------------------------------------------------------------------

*** <region name= Header>
*** <desc>Inserts and control logic</desc>
* $INSERT I_COMMON - Not Used anymore;N
* $INSERT I_EQUATE - Not Used anymore;E
* $INSERT I_DataTypes - Not Used anymore;s
    $USING EB.SystemTables
    $USING EB.API
    $USING EB.Template
*** </region>

*-----------------------------------------------------------------------------
    EB.Template.TableDefineid("ID", "" : @FM : "25" : @FM : "A")
*-----------------------------------------------------------------------------
    EB.Template.TableAddfielddefinition("HEURE.RECU", "19","A" : @FM :"" : @FM :"NOINPUT", "")
    EB.Template.TableAddfielddefinition("CODE.RESULTAT.RECU", "4","A" : @FM :"" : @FM :"NOINPUT", "")
    EB.Template.TableAddfielddefinition("MESSAGE.RESULTAT", "20","A" : @FM :"" : @FM :"NOINPUT", "")
    EB.Template.TableAddfielddefinition("ID.TRANSMISSION", "20","A" : @FM :"" : @FM :"NOINPUT", "")
    EB.Template.TableAddfielddefinition("REF.CAUTION", "15","A","")
    EB.Template.TableAddfielddefinition("ID.CLIENT", "15","A","")
    EB.Template.FieldSetcheckfile("CUSTOMER")
    EB.Template.TableAddfielddefinition("NOM.CLIENT", "50","A","")
    EB.Template.TableAddfielddefinition("NOM.DEMANDEUR", "35","A","")
    EB.Template.TableAddfielddefinition("NOM.AVIS.AO", "200","A" ,"")
    EB.Template.TableAddfielddefinition("NUM.AO", "20","A","")
    EB.Template.TableAddfielddefinition("NUM.SEQ.AO", "2","A","")
    EB.Template.TableAddfielddefinition("XX<NUM.LOT", "3","A","")
    EB.Template.TableAddfielddefinition("XX-NOM.LOT", "200","A" ,"")
    EB.Template.TableAddfielddefinition("XX-DETAIL.LOT", "200","T24.TEXT" ,"")
    EB.Template.TableAddfielddefinition("XX-DEVISE", "3","CCY" , "")
    EB.Template.FieldSetcheckfile('CURRENCY')
    EB.Template.TableAddfielddefinition("XX-MONTANT.AO", "19","A" , "")
    EB.Template.TableAddfielddefinition("XX-MONTANT.BLOCAGE", "19","AMT" , "")
    EB.Template.TableAddfielddefinition("XX>MONTANT.LETTRE", "50","A" , "")
    EB.Template.TableAddfielddefinition("NOM.ACHETEUR", "200","A" ,"")
    EB.Template.TableAddfielddefinition("CODE.ACHETEUR", "10","A" ,"")
    EB.Template.TableAddfielddefinition("DATE.PUBLICATION", "19","A" ,"")
    EB.Template.TableAddfielddefinition("NOM.GERANT", "200","A" ,"")
    EB.Template.TableAddfielddefinition("NUM.TUNEPS", "20","A" ,"")
    EB.Template.TableAddfielddefinition("ADRESSE", "1000","A" ,"")
    EB.Template.TableAddfielddefinition("CODE.TYPE", "10","A" ,"")
    EB.Template.FieldSetcheckfile("BZ.TUNEPS.TYPECAUTION")
    EB.Template.TableAddfielddefinition("DESCRIPTION.TYPE", "100","A" ,"")
    EB.Template.TableAddfielddefinition("MONTANT.CAUTION", "17","A" ,"")
*CALL Table.addFieldDefinition("MONTANT.LETTRE", "100","A" ,"")
    EB.Template.TableAddfielddefinition("CONTENU.CAUTION", "50","A","")
    EB.Template.TableAddfielddefinition("DATE.DEB.CAU", "19","A","")
    EB.Template.TableAddfielddefinition("DATE.EXP.CAU", "19","A","")
    EB.Template.TableAddfielddefinition("DUREE.VALIDITE", "19","A" ,"")
    EB.Template.TableAddfielddefinition("BANQUE.EMET", "50","A","")
    EB.Template.TableAddfielddefinition("NUM.RC.BANK", "15","A","")
    EB.Template.TableAddfielddefinition("NUM.RECU.BANK", "15","A","")
    EB.Template.TableAddfielddefinition("DATE.RECU.BANK", "19","A","")
    EB.Template.TableAddfielddefinition("AGENCE.EMET", "35","A","")
    EB.Template.TableAddfielddefinition("CHEF.AGENCE", "50","A","")
    EB.Template.TableAddfielddefinition("ADRESSE.AGENCE", "100","A","")
    EB.Template.TableAddfielddefinition("NOM.RESP.CAUT", "50","A","")
    EB.Template.TableAddfielddefinition("NUM.TEL", "12","A","")
    EB.Template.TableAddfielddefinition("NUM.FAX", "13","A","")
    EB.Template.TableAddfielddefinition("EMAIL", "50","A","")
    EB.Template.TableAddfielddefinition("STATUT", "8","":@FM : "DEMANDE_ENPLACE_DEPOSE_ANNULE_ERRONE","")
    EB.Template.TableAddfielddefinition("QUALITE.DEMANDEUR", "25", "A","")
    EB.Template.TableAddfielddefinition("SIGNATAIRE1", "50","A","")
    EB.Template.TableAddfielddefinition("SIGNATAIRE2", "50","A","")
    EB.Template.TableAddfielddefinition("REFERENCE.MD", "15","A","")
    EB.Template.TableAddfielddefinition("DATE.DELIVRANCE", "19","A" ,"")
    EB.Template.TableAddfielddefinition("RS.FOURNISSEUR", "35","A" , "")
    EB.Template.TableAddfielddefinition("CODE.POS.FRS", "10","A" , "")
    EB.Template.TableAddfielddefinition("TEL.FRS", "20","A" , "")
    EB.Template.TableAddfielddefinition("FAX.FRS", "20","A" , "")
    EB.Template.TableAddfielddefinition("DATE.ENRG.FRS", "10","D" , "")
    EB.Template.TableAddfielddefinition("EMAIL.FRS", "50","A" , "")
    EB.Template.TableAddfielddefinition("CODE.STRUCTURE", "20","A" , "")
    EB.Template.TableAddfielddefinition("HOME.PAGE", "50","A" , "")
    EB.Template.TableAddfielddefinition("AVIS.REEL", "1","A" , "")
    EB.Template.TableAddfielddefinition("OPEN.DATE", "19","A" , "")
    EB.Template.TableAddfielddefinition("CATEG.ACTIVITE", "10","A" , "")
    EB.Template.TableAddfielddefinition("MODE.PASSATION", "10","A" , "")
    EB.Template.TableAddfielddefinition("AO.ELECTRONIQUE", "10","A" , "")
    EB.Template.TableAddfielddefinition("CODE.AGENCE.EMET", "5","A" , "")
    EB.Template.TableAddfielddefinition("XX.SIGNATAIRE", "50","A" , "")
    EB.Template.TableAddfielddefinition("REF.DEMANDE", "20","A" , "")
    EB.Template.TableAddfielddefinition("DATE.MODIF", "12","D" , "")

**RESERVED
    EB.Template.TableAddfielddefinition("DESC.ACTIV", "50","A" ,"")
    EB.Template.TableAddfielddefinition("DESC.PASSATION", "50","A" ,"")
    EB.Template.TableAddfielddefinition("DESC.AO.ELEC", "20","A" ,"")
    EB.Template.TableAddfielddefinition("REF.MD", "15","A" ,"")
    EB.Template.TableAddfielddefinition("COMMENT", "50","A" ,"")
    EB.Template.TableAddfielddefinition("DATE.DEMANDE", "12","D" , "")

*-----------------------------------------------------------------------------
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
