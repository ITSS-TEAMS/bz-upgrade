* @ValidationCode : MjotODU2OTQxNzgxOkNwMTI1MjoxNjAwNTYwMTQ0NTc1OkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTp0cnVlOk4vQTpSMjBfU1A0LjA6LTE6LTE=
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
* <Rating>-25</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable2
SUBROUTINE TNA.CARD.RECALCUL.CODE.FIELDS
*-----------------------------------------------------------------------------
*********************************************************************
*                      PROJET CHALLENGE 24
*********************************************************************
*
* @author
* ZIED BEN YOUSSEF
* @Mail
* ZIED.BENYOUSSEF@BANQUEZITOUNA.COM
* @desc      THIS IS AN AUTO-GENERATED ROUTINE
* @desc      RECALCUL.CODE.CONFIDENTEIL TEMPLATE - (TEMPLATE GENERATOR TOOL)
*
* @create    26/02/2010 14:38:15
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
*MODIFICATION HISTORY:
*ZIT-UPG-R13-R19  : NO CHANGES
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

    EB.Template.TableDefineid("ID", EB.Template.T24String)         ;* Define Table id


    EB.Template.TableAddfielddefinition("NOM.PORTEUR","","","")   ;*
    EB.Template.TableAddfielddefinition("FRAIS","3","","")        ;*
    EB.Template.FieldSetcheckfile("TNA.CARD.FEES")      ;*
    EB.Template.TableAddfielddefinition("DATE.OPERATION","8","D","")        ;*
    EB.Template.TableAddfielddefinition("REASON.CODE","2","","")  ;*
    EB.Template.FieldSetcheckfile("TNA.CARD.REASON")    ;*

    EB.Template.TableAddlocalreferencefield("")         ;*
    EB.Template.TableAddoverridefield()         ;*
    EB.Template.TableSetauditposition()         ;* Poputale audit information

RETURN
* ----------------------------------------------------------------------------
END
