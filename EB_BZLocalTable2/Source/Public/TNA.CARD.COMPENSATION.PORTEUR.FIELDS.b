* @ValidationCode : MjoxNjY3NDg3NDA0OkNwMTI1MjoxNjAwNTYwMTQyOTAzOkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTp0cnVlOk4vQTpSMjBfU1A0LjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 20 Sep 2020 01:02:22
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
* <Rating>-24</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable2
SUBROUTINE TNA.CARD.COMPENSATION.PORTEUR.FIELDS
*-----------------------------------------------------------------------------
*********************************************************************
*                      PROJET CHALLENGE 24
*********************************************************************
*
* @author
*
* @Mail
*
* @desc      THIS IS AN AUTO-GENERATED ROUTINE
* @desc      TNA.CARD.COMPENSATION.PORTEUR TEMPLATE - (TEMPLATE GENERATOR TOOL)
*
* @create    25/03/2010 12:01:51
*
* @param
*
* @calls
*
* @error
*
* @change
*
* @revby
*
* @stereotype H
*********************************************************************
*-----------------------------------------------------------------------------
* Modification History :
*ZIT-UPG-R13-R19:NO CHANGES
*-----------------------------------------------------------------------------
*** <region name= Header>
* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;
* $INSERT I_DataTypes - Not Used anymore;

    $USING EB.API
    $USING EB.SystemTables
    $USING EB.Template
*** </region>
*-----------------------------------------------------------------------------
* <Main controlling section>
*----------------------------------------------------------------------

    GOSUB INITIALISATION
    GOSUB MAIN.PROCESS

RETURN
*---------------------------------------------------------------------------
INITIALISATION:
*file opening, variable set up

RETURN
*---------------------------------------------------------------------------
MAIN.PROCESS:
*main subroutine processing

    EB.Template.TableDefineid("ID", EB.Template.T24String) ;* Define Table id

    EB.Template.TableAddfielddefinition("CODE.ENREGISTREMEN","2","A","");*
    EB.Template.TableAddfielddefinition("NUM.ENREGISTREMENT","6","N","");*
    EB.Template.TableAddfielddefinition("CODE.OPERATION ","2","","");*
    EB.Template.TableAddfielddefinition("DATE.TRAITEMENT","6","","");*
    EB.Template.TableAddfielddefinition("NUM.COMMERCANT","10","","");*
    EB.Template.TableAddfielddefinition("RIB.COMMERCANT","24","","");*
    EB.Template.TableAddfielddefinition("ENS.ABREGEE","25","","");*
    EB.Template.TableAddfielddefinition("LOCALISATION.ABREG","17","","");*
    EB.Template.TableAddfielddefinition("NUM.REMISE.TPE","5","","");*
    EB.Template.TableAddfielddefinition("NUM.FICHIER.TPE","2","","");*
    EB.Template.TableAddfielddefinition("NATURE.TRANSACTION","1","","");*
    EB.Template.TableAddfielddefinition("PLAFOND.GARANTIE","12","","");*
    EB.Template.TableAddfielddefinition("CODE.H.TERRITOIRE","1","","");*
    EB.Template.TableAddfielddefinition("NUMERO.PORTEUR","19","","");*
    EB.Template.TableAddfielddefinition("RIB.PORTEUR","24","","");*
    EB.Template.TableAddfielddefinition("DATE.VALIDITE","4","","");*
    EB.Template.TableAddfielddefinition("TOP.OPPOSITION.","1","","");*
    EB.Template.TableAddfielddefinition("TOP.LISTE.NOIRE","1","","");*
    EB.Template.TableAddfielddefinition("REF.ARCHIVAGE","23","","");*
    EB.Template.TableAddfielddefinition("NUM.REMISE","6","","");*
    EB.Template.TableAddfielddefinition("DATE.REMISE","6","","");*
    EB.Template.TableAddfielddefinition("NUM.FACTURETTE","6","","");*
    EB.Template.TableAddfielddefinition("DATE.ACHAT","6","","");*
    EB.Template.TableAddfielddefinition("NUM.AUTORISATION","6","","");*
    EB.Template.TableAddfielddefinition("MNT.AUTORISE","12","","");*
    EB.Template.TableAddfielddefinition("CODE.ORIGINE.TRXN","1","","");*
    EB.Template.TableAddfielddefinition("CODE.SBF","5","","");*
    EB.Template.TableAddfielddefinition("CODE.DEBIT.PORTEUR","1","","");*
    EB.Template.TableAddfielddefinition("MNT.BRUT.TRXN","12","","");*
    EB.Template.TableAddfielddefinition("CODE.MONNAIE.TRXN","3","","");*
    EB.Template.TableAddfielddefinition("NBR.DECIMAL","1","","");*
    EB.Template.TableAddfielddefinition("MNT.COMPENSE","12","","");*
    EB.Template.TableAddfielddefinition("CODE.MONNAIE.MNT.C","3","","");*
    EB.Template.TableAddfielddefinition("NBR.DECIMAL.MNT.C","1","","");*
    EB.Template.TableAddfielddefinition("FRAIS.INTERCHANGE","12","","");*
    EB.Template.TableAddfielddefinition("TAXE.FRAIS.INTER","12","","");*
    EB.Template.TableAddfielddefinition("TAXE.COMM.P.HT","12","","");*
    EB.Template.TableAddfielddefinition("TAXE.COMM.PORTEUR","12","","");*
    EB.Template.TableAddfielddefinition("MONTANT.DEBITER","12","","");*
    EB.Template.TableAddfielddefinition("MONTANT.NET.COMM","12","","");*
    EB.Template.TableAddfielddefinition("COMMISSION.COMMERC","12","","");*
    EB.Template.TableAddfielddefinition("TAXE.COMM.COMM","12","","");*
    EB.Template.TableAddfielddefinition("DEBIT.PERIODICITE","1","","");*
    EB.Template.TableAddfielddefinition("REFERENCE.CARTE","3","","");*
    EB.Template.TableAddfielddefinition("NUM.CTB.EMETTEUR","2","","");*
    EB.Template.TableAddfielddefinition("CODE.BQ.EMETTRICE","5","","");*
    EB.Template.TableAddfielddefinition("CODE.AGENCE.POR","5","","");*
    EB.Template.TableAddfielddefinition("CODE.CTB.PARTENAI","5","","");*
    EB.Template.TableAddfielddefinition("CODE.BQ.PARTENAI","5","","");*
    EB.Template.TableAddfielddefinition("CODE.ANNULATION","1","","");*
    EB.Template.TableAddfielddefinition("MONTANT.LOCAL","12","","");*
    EB.Template.TableAddfielddefinition("FRAIS.CASH","12","","");*
    EB.Template.TableAddfielddefinition("FRAIS.CHANGE","12","","");*
    EB.Template.TableAddfielddefinition("CODE.APP","1","","");*
    EB.Template.TableAddfielddefinition("CATEGORIE.COMM","4","","");*
    EB.Template.TableAddfielddefinition("CODE.PROV","1","","");*
    EB.Template.TableAddfielddefinition("SYSTEME","1","","");*
    EB.Template.TableAddfielddefinition("ORIGINE.TRXN","1","","");*
    EB.Template.TableAddfielddefinition("SECTEUR.COMM","1","","");*
    EB.Template.TableAddfielddefinition("CTB","2","","");*
    EB.Template.TableAddfielddefinition("BANQUE","5","","");*
    EB.Template.TableAddfielddefinition("REMISE","1","","");*



    EB.Template.TableAddlocalreferencefield("")
    EB.Template.TableAddoverridefield()
    EB.Template.TableSetauditposition() ;* Poputale audit information

RETURN
* ----------------------------------------------------------------------------
END
