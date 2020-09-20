* @ValidationCode : MjotNDMwMTY5NDU4OkNwMTI1MjoxNjAwNTYwMTQwMjQ2OkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTp0cnVlOk4vQTpSMjBfU1A0LjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 20 Sep 2020 01:02:20
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

* <Rating>-2</Rating>
*-----------------------------------------------------------------------------

*-----------------------------------------------------------------------------

*<Rating></Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable2
SUBROUTINE TNA.ATM.BANK.ACCOUNT.FIELDS
*-----------------------------------------------------------------------------

*<doc>
* TODO add a description of the application here
* @stereotype H
*
*
* ----------------------------------------------------------------------------

*** <region name= Header>
*** /**/
* $INSERT I_COMMON - Not Used anymore;N
* $INSERT I_EQUATE - Not Used anymore;E
* $INSERT I_DataTypes - Not Used anymore;s
    $USING EB.SystemTables
    $USING EB.API
    $USING EB.Template
*** </region>
* ----------------------------------------------------------------------------

    EB.Template.TableDefineid("NET.ID", EB.Template.T24String)     ;* Define Table id
* ----------------------------------------------------------------------------

    EB.Template.TableAddfielddefinition("PAY.ACCOUNT","35","A","")
    EB.Template.FieldSetcheckfile("ACCOUNT")

    EB.Template.TableAddfielddefinition("RECEIVE.ACCOUNT","35","A","")
    EB.Template.FieldSetcheckfile("ACCOUNT")

    EB.Template.TableAddfielddefinition("REJET.ACCOUNT","35","A","")
    EB.Template.FieldSetcheckfile("ACCOUNT")

    EB.Template.TableAddfielddefinition("COM.ACCOUNT","35","A","")
    EB.Template.FieldSetcheckfile("ACCOUNT")

    EB.Template.TableAddfielddefinition("COM.CODE","35","A","")
    EB.Template.FieldSetcheckfile("FT.COMMISSION.TYPE")

    EB.Template.TableAddfielddefinition("DEAL.CCY","3","A","")
    EB.Template.FieldSetcheckfile("CURRENCY")

    EB.Template.TableAddfielddefinition("FRAIS.ACCOUNT","35","A","")

    EB.Template.TableAddfielddefinition("FRAIS2.ACCOUNT","35","A","")

* ----------------------------------------------------------------------------

    EB.Template.TableAddlocalreferencefield("")
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------

    EB.Template.TableSetauditposition()         ;* Poputale audit information

*-----------------------------------------------------------------------------

RETURN
*-----------------------------------------------------------------------------

END
