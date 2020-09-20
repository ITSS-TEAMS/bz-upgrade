* @ValidationCode : MjoxNDYwMTc2MDAxOkNwMTI1MjoxNjAwNTYwMTQyNjUwOkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTp0cnVlOk4vQTpSMjBfU1A0LjA6LTE6LTE=
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
* <Rating>-25</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable2
SUBROUTINE TNA.CARD.COMPENSATION.COMMERCANT.FIELDS
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
* @desc      TNA.CARD.COMPENSATION.COMMERCANT TEMPLATE - (TEMPLATE GENERATOR TOOL)
*
* @create    25/03/2010 11:15:01
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
*Modification History :
*ZIT-UPG-R13-R19 :  No Changes.
*-----------------------------------------------------------------------------
*** <region name= Header>
* $INSERT I_COMMON - Not Used anymore;N
* $INSERT I_EQUATE - Not Used anymore;E
* $INSERT I_DataTypes - Not Used anymore;s
    $USING EB.SystemTables
    $USING EB.API
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

    EB.Template.TableAddfielddefinition("CODE.ENREG","2","A","");*
    EB.Template.TableAddfielddefinition("NUM.ENREG","6","N","");*
    EB.Template.TableAddfielddefinition("CODE.OPERATION","2","","");*
    EB.Template.TableAddfielddefinition("DATE.TRAITEMENT","6","","");*
    EB.Template.TableAddfielddefinition("NUM.POINT.VENTE","17","","");*
    EB.Template.TableAddfielddefinition("RIB","24","","");*
    EB.Template.TableAddfielddefinition("ENS.POINT.VENTE","25","","");*
    EB.Template.TableAddfielddefinition("LOCALISATION.ABREG","25","","");*
    EB.Template.TableAddfielddefinition("MNT.DUCROIRE","12","","");*
    EB.Template.TableAddfielddefinition("CODE.H.TERRITOIRE","1","","");*
    EB.Template.TableAddfielddefinition("TYPE.COMMERCANT","1","","");*
    EB.Template.TableAddfielddefinition("CODE.AGENCE","5","","");*
    EB.Template.TableAddfielddefinition("NUMERO.REMISE","6","","");*
    EB.Template.TableAddfielddefinition("DATE.REMISE","6","","");*
    EB.Template.TableAddfielddefinition("NBRE.TRXN","6","","");*
    EB.Template.TableAddfielddefinition("CODE.SBF","5","","");*
    EB.Template.TableAddfielddefinition("MNT.TOT.BRUT.REMIS","12","","");*
    EB.Template.TableAddfielddefinition("MNT.BRUT.REMISE","12","","");*
    EB.Template.TableAddfielddefinition("CODE.MONNAIE.REMIS","3","","");*
    EB.Template.TableAddfielddefinition("NBR.DECIMAL.DS.MT","1","","");*
    EB.Template.TableAddfielddefinition("COMMISSION.TOT.HT","12","","");*
    EB.Template.TableAddfielddefinition("MNT.TOT.TAXE","12","","");*
    EB.Template.TableAddfielddefinition("MNT.NET.REMISE","12","","");*
    EB.Template.TableAddfielddefinition("MNT.COMPENSE","12","","");*
    EB.Template.TableAddfielddefinition("FRAIS.INTERCHANGE","12","","");*
    EB.Template.TableAddfielddefinition("TAXE.FRAIS.INTERCH","12","","");*
    EB.Template.TableAddfielddefinition("MNT.REMISE.LOCALE","12","","");*
    EB.Template.TableAddfielddefinition("TYPE.MACHINE","1","","");*
    EB.Template.TableAddfielddefinition("NUM.REMISE.TPE","5","","");*
    EB.Template.TableAddfielddefinition("NUM.FICHIER.TPE","2","","");*
    EB.Template.TableAddfielddefinition("NUM.LOT.TPE","7","","");*
    EB.Template.TableAddfielddefinition("INUTILSE","97","","");*
    EB.Template.TableAddfielddefinition("NUM.CTB.EMETTEUR","2","","");*
    EB.Template.TableAddfielddefinition("CODE.BQ.EMETTEUR","2","","");*
    EB.Template.TableAddfielddefinition("NUM.CTB.PARTENAIRE","2","","");*
    EB.Template.TableAddfielddefinition("CODE.BQ.PARTENAIRE","5","","");*
    EB.Template.TableAddfielddefinition("CODE.ANNULATION","1","","");*
    EB.Template.TableAddfielddefinition("CODE.ESCOMPTE","1","","");*

    EB.Template.TableAddlocalreferencefield("")
    EB.Template.TableAddoverridefield()
    EB.Template.TableSetauditposition() ;* Poputale audit information

RETURN
* ----------------------------------------------------------------------------
END
