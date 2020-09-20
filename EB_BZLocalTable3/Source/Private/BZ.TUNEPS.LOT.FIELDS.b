* @ValidationCode : MjoyMTQ2NDk0MDk2OkNwMTI1MjoxNjAwNTYyNzU0Nzk3OkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTp0cnVlOk4vQTpSMjBfU1A0LjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 20 Sep 2020 01:45:54
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
SUBROUTINE BZ.TUNEPS.LOT.FIELDS

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
*MODIFICATION HISTORY:
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
    EB.Template.TableDefineid("ID", "" : @FM : "35" : @FM : "A")
*-----------------------------------------------------------------------------
    EB.Template.TableAddfielddefinition("REF.CAUTION", "15","A","")
    EB.Template.TableAddfielddefinition("NOM.AVIS.AO", "200","A" ,"")
    EB.Template.TableAddfielddefinition("NUM.AO", "20","A","")
    EB.Template.TableAddfielddefinition("NUM.SEQ.AO", "2","A","")
    EB.Template.TableAddfielddefinition("NUM.LOT", "3","A","")
    EB.Template.TableAddfielddefinition("NOM.LOT", "200","A", "")
    EB.Template.TableAddfielddefinition("DETAIL.LOT", "2000","A" , "")
    EB.Template.TableAddfielddefinition("DEVISE", "3","CCY" , "")
    EB.Template.FieldSetcheckfile('CURRENCY')
    EB.Template.TableAddfielddefinition("MONTANT.AO", "19","AMT", "")
    EB.Template.TableAddfielddefinition("MONTANT.CAUTION", "19","AMT", "")
    EB.Template.TableAddfielddefinition("ID.CLIENT", "25","A","")
    EB.Template.TableAddfielddefinition("STATUT", "8","":@FM : "DEMANDE_DEPOSE_ANNULE_ERRONE_MODIFIE","")
    EB.Template.TableAddfielddefinition("REFERENCE.MD", "15","A","")
    EB.Template.TableAddfielddefinition("CATEGORY ", "8","A","")
    EB.Template.TableAddfielddefinition("DEAL.DATE", "11","D","")
    EB.Template.TableAddfielddefinition("VALUE.DATE", "11","D","")
    EB.Template.TableAddfielddefinition("MATURITY.DATE", "12","A","")
*    CALL Table.addFieldDefinition("REF.DEMANDE", "15","A","")

**RETOUR Tuneps

    EB.Template.TableAddfielddefinition("HEURE.RECU", "19","A", "")
    EB.Template.TableAddfielddefinition("CODE.RESULTAT.RECU", "4","A", "")
    EB.Template.TableAddfielddefinition("MESSAGE.RESULTAT", "20","A", "")
    EB.Template.TableAddfielddefinition("ID.TRANSMISSION", "20","A", "")
    EB.Template.TableAddfielddefinition("REF.DEMANDE", "15","A","")
    EB.Template.TableAddfielddefinition("XX.SIGNATAIRE", "50","A" , "")
    EB.Template.TableAddfielddefinition("CODE.AGENCE.EMET", "5","A" , "")
    EB.Template.TableAddfielddefinition("AGENCE.EMET", "35","A","")
    EB.Template.TableAddfielddefinition("CHEF.AGENCE", "50","A","")
    EB.Template.TableAddfielddefinition("ADRESSE.AGENCE", "100","A","")
    EB.Template.TableAddfielddefinition("CODE.TYPE", "10","A" ,"")
    EB.Template.FieldSetcheckfile("BZ.TUNEPS.TYPECAUTION")
    EB.Template.TableAddfielddefinition("DATE.MODIF", "12","D" ,"")
    EB.Template.TableAddfielddefinition("COMMENTAIRE", "50","A" ,"")
    EB.Template.TableAddfielddefinition("DATE.DEMANDE", "12","D" ,"")
**RESERVED
    EB.Template.TableAddfielddefinition("MONTANT.BLOCAGE", "19","AMT" , "")
    EB.Template.TableAddfielddefinition("NUM.TUNEPS", "20","A", "")
    EB.Template.TableAddfielddefinition("DATE.EXP.CP", "8","D" , "")
    EB.Template.TableAddfielddefinition("RESERVED.4", "10","A" : @FM :"" : @FM :"NOINPUT", "")
    EB.Template.TableAddfielddefinition("RESERVED.5", "10","A" : @FM :"" : @FM :"NOINPUT", "")

*-----------------------------------------------------------------------------
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
