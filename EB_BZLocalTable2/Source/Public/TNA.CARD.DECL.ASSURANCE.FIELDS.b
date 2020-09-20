* @ValidationCode : MjotODAzNzQ3NjM0OkNwMTI1MjoxNjAwNTYwMTQzMDg5OkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTp0cnVlOk4vQTpSMjBfU1A0LjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 20 Sep 2020 01:02:23
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
* <Rating>-12</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable2
SUBROUTINE TNA.CARD.DECL.ASSURANCE.FIELDS
*-----------------------------------------------------------------------------
*********************************************************************
*                      PROJET CHALLENGE 24
*********************************************************************
*
* @author    :RELMEDYER@TEMENOS.COM
*
* @Mail
*
* @desc      TABLE PERMETTANT DE STOCKER LES DECLARATIONS D ASSURANCE SUR CARTE
* @desc      ZT.ATM.TXN.LIST TEMPLATE - (TEMPLATE GENERATOR TOOL)
*
* @create    25/03/2010 10:40:25
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
* @stereotype L
*********************************************************************
* Modification History :
*ZIT-UPG-R13-R19 : removed BP's and changed INCLUDE to INSERT
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


*---------------------------------------------------------------------------
MAIN.PROCESS:
*main subroutine processing

    EB.Template.TableDefineid("ID", EB.Template.T24String)         ;* Define Table id

    EB.Template.TableAddfielddefinition("CLIENT","20","","")      ;*
    EB.Template.TableAddfielddefinition("TYPE.PRODUIT","20","","")          ;*
    EB.Template.TableAddfielddefinition("TYPE.ADHESION","35","","")         ;*
    EB.Template.TableAddfielddefinition("TRAITE","3","","")       ;*
    EB.Template.TableAddfielddefinition("DATE.CREATION","8","D","")         ;*
    EB.Template.TableAddfielddefinition("DATE.ANNULATION","8","D","")       ;*

    EB.Template.TableAddoverridefield()
    EB.Template.TableSetauditposition()         ;* Poputale audit information

RETURN
* ----------------------------------------------------------------------------
END
