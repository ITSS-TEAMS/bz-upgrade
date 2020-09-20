* @ValidationCode : MjotOTM5NDg1OTUxOkNwMTI1MjoxNjAwNTYwMTQ0NDg4OkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTp0cnVlOk4vQTpSMjBfU1A0LjA6LTE6LTE=
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
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable2
SUBROUTINE TNA.CARD.REASON.FIELDS
*-----------------------------------------------------------------------------
*********************************************************************
*                      PROJET CHALLENGE 24
*********************************************************************
**
* MODIFIER PAR : ZIED BEN YOUSSEF
* DESCRPTION : L OPERATION SE RECUPERE DEPUIS LA TABLE TNA.CARD.OPERATION
* DATE MODIFICATION : 31/10/2012
*
* @stereotype H
*********************************************************************
*ZIT-UPG-R13-R19  :FM TO @FM
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

    EB.Template.TableDefineid("ID", "A" : @FM : "2.2")   ;* Define Table id

    EB.Template.TableAddfielddefinition("DESCRIPTION","30","A","")          ;*
    EB.Template.TableAddfielddefinition("OPERATION","3", "A", "")
    EB.Template.FieldSetcheckfile("TNA.CARD.OPERATION")
    EB.Template.TableAddfielddefinition("XX<TYPE.CARTE","3","A","")         ;*
    EB.Template.FieldSetcheckfile("TNA.CARD.PRODUCT")
    EB.Template.TableAddfielddefinition("XX>CODE.COMMISSION","20", "A", "")
    EB.Template.FieldSetcheckfile("FT.COMMISSION.TYPE")


    EB.Template.TableAddlocalreferencefield("")

    EB.Template.TableAddoverridefield()
    EB.Template.TableSetauditposition()         ;* Poputale audit information

RETURN
* ----------------------------------------------------------------------------
END
