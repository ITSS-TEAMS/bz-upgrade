* @ValidationCode : MjotODY4MTcwODY5OkNwMTI1MjoxNjAwNTYwMTQ0MDQ2OkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTp0cnVlOk4vQTpSMjBfU1A0LjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 20 Sep 2020 01:02:24
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
* Modification History :
* ZIT-UPG-R13-R19 : Converted $INCLUDE TO $INSERT
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable2
SUBROUTINE TNA.CARD.MOUVEMENT.INTERBANCAIRE.FIELDS
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
* @desc      TNA.CARD.MOUVEMENT.INTERBANCAIRE TEMPLATE - (TEMPLATE GENERATOR TOOL)
*
* @create    25/03/2010 13:56:57
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

    EB.Template.TableAddfielddefinition("CODE.ENREGITREMENT","2","","");*
    EB.Template.TableAddfielddefinition("NUM.ENREGISTREMENT","6","","");*
    EB.Template.TableAddfielddefinition("CODE.OPERATION","2","","");*
    EB.Template.TableAddfielddefinition("DATE.TRAITEMENT","6","","");*
    EB.Template.TableAddfielddefinition("CODE.BQE.PARTENAIR","5","","");*
    EB.Template.TableAddfielddefinition("SOLDE.COMPENSATION","12","","");*
    EB.Template.TableAddfielddefinition("MONTANT.DEBIT","12","","");*
    EB.Template.TableAddfielddefinition("MONTANT.CREDIT","12","","");*
    EB.Template.TableAddfielddefinition("NUM.CTB.EMETTEUR","2","","");*
    EB.Template.TableAddfielddefinition("CODE.BANQUE.EMETRI","5","","");*
    EB.Template.TableAddfielddefinition("NUM.CTB.PARTENAIRE","2","","");*
    EB.Template.TableAddfielddefinition("CODE.BANQUE.PARTEN","5","","");*

    EB.Template.TableAddlocalreferencefield("")
    EB.Template.TableAddoverridefield()
    EB.Template.TableSetauditposition() ;* Poputale audit information

RETURN
* ----------------------------------------------------------------------------
END
