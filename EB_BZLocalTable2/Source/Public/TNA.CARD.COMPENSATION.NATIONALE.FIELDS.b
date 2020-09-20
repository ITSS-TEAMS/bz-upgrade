* @ValidationCode : MjozNDUzMDI1NzM6Q3AxMjUyOjE2MDA1NjAxNDI3Nzc6QWRtaW5pc3RyYXRldXI6LTE6LTE6MDoxOnRydWU6Ti9BOlIyMF9TUDQuMDotMTotMQ==
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
SUBROUTINE TNA.CARD.COMPENSATION.NATIONALE.FIELDS
*-----------------------------------------------------------------------------
*********************************************************************
*                      PROJET CHALLENGE 24
*********************************************************************
*
* @author
*
* @Mail
*
* @desc
* @desc
*
* @create    11/03/2010 15:17:51
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
* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;
* $INSERT I_DataTypes - Not Used anymore;
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

    EB.Template.TableDefineid("ID", EB.Template.T24String);* Define Table id

    EB.Template.TableAddfielddefinition("NUM.COMMERCANT","10","N","");*
    EB.Template.TableAddfielddefinition("NUM.BOREDEREAU","6","N","");*
    EB.Template.TableAddfielddefinition("NUM.FACTURETTE","6","N","");*
    EB.Template.TableAddfielddefinition("NUM.PORTEUR","19","N","");*
    EB.Template.TableAddfielddefinition("SECTEUR.COMM","","","");*
    EB.Template.TableAddfielddefinition("ID.TRXN","1","","");*
    EB.Template.TableAddfielddefinition("NATURE.OPERATION","1","","");*
    EB.Template.TableAddfielddefinition("CODE.OPERATION","2","N","");*
    EB.Template.TableAddfielddefinition("MONTANT","9","N","");*
    EB.Template.TableAddfielddefinition("DATE.VALIDITE","9","N","");*
    EB.Template.TableAddfielddefinition("DATE.TRAITEMENT","6","","");*
    EB.Template.TableAddfielddefinition("DATE.ACHAT","6","","");*
    EB.Template.TableAddfielddefinition("N.AUTORISATION","6","A","");*
    EB.Template.TableAddfielddefinition("DATE.REMISE","6","","");*
    EB.Template.TableAddfielddefinition("MCC","4","","");*
    EB.Template.TableAddfielddefinition("BANQUE.COMM","5","N","");*
    EB.Template.TableAddfielddefinition("SYSTEME","1","N","");*
    EB.Template.TableAddfielddefinition("BANQUE.PORTEUR","5","N","");*
    EB.Template.TableAddfielddefinition("REF.ARCHIVAGE","23","N","");*
    EB.Template.TableAddfielddefinition("ORDRE","2","N","");*
    EB.Template.TableAddfielddefinition("ZONE.1","","","");*
    EB.Template.TableAddfielddefinition("ENS.COMM.1","25","","");*
    EB.Template.TableAddfielddefinition("MNT.COMP.1","9","","");*
    EB.Template.TableAddfielddefinition("HEURE.TXN.1","4","","");*
    EB.Template.TableAddfielddefinition("F.ENRGI.1","1","A","");*
    EB.Template.TableAddfielddefinition("ZONE.2","","","");*
    EB.Template.TableAddfielddefinition("MOTIF.2","2","N","");*
    EB.Template.TableAddfielddefinition("MVT.DIVERS.2","","","");*
    EB.Template.TableAddfielddefinition("MESSAGE.2","22","","");*
    EB.Template.TableAddfielddefinition("MNT.COMP.2","9","","");*
    EB.Template.TableAddfielddefinition("HEURE.TXN.2","4","","");*
    EB.Template.TableAddfielddefinition("F.ENREGI.2","1","","");*
    EB.Template.TableAddfielddefinition("ZONE.3","","","");*
    EB.Template.TableAddfielddefinition("MOTIF.3","2","","");*
    EB.Template.TableAddfielddefinition("MVT.DIVERS.3","","","");*
    EB.Template.TableAddfielddefinition("MESSAGE.3","","","");*
    EB.Template.TableAddfielddefinition("MNT.COMP.3","9","","");*
    EB.Template.TableAddfielddefinition("HEURE.TXN.3","","","");*
    EB.Template.TableAddfielddefinition("REPRESENTATION","1","","");*
    EB.Template.TableAddfielddefinition("F.ENREGI.3","","","");*

    EB.Template.TableAddlocalreferencefield("")
    EB.Template.TableAddoverridefield()
    EB.Template.TableSetauditposition() ;* Poputale audit information

RETURN
* ----------------------------------------------------------------------------
END
