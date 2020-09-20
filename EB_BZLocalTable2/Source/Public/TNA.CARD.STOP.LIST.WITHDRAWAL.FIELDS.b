* @ValidationCode : MjotNTQxMjE5ODY3OkNwMTI1MjoxNjAwNTYwMTQ0NzIyOkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTp0cnVlOk4vQTpSMjBfU1A0LjA6LTE6LTE=
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
* <Rating>-23</Rating>
* Modification History :
* ZIT-UPG-R13-R19 : Converted $INCLUDE TO $INSERT
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable2
SUBROUTINE TNA.CARD.STOP.LIST.WITHDRAWAL.FIELDS
*-----------------------------------------------------------------------------
*********************************************************************
*                      PROJET CHALLENGE 24
*********************************************************************
*
* @RANIA
*
* @Mail

* @create    06/01/2010 10:23:51

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

    EB.Template.TableDefineid("%TNA.CARD.STOP.LIST.WITHDRAWAL", EB.Template.T24String )
    EB.Template.TableAddfielddefinition("DECLARATION.DATE","10","D","");*
    EB.Template.TableAddfielddefinition("END.DATE","10","D","");*
    EB.Template.TableAddfield("REASON.CODE","A","2","");*
    EB.Template.FieldSetcheckfile("TNA.CARD.REASON")
*CALL Table.addYesNoField("SEND.RECORD","","")
    EB.Template.TableAddfieldwitheblookup("SEND.RECORD","CARD","");*
    EB.Template.TableAddfield("XX.MEMO","A":"60","","");*
    EB.Template.TableAddfielddefinition("REASON.WITHDRAWAL","2","","");*
    EB.Template.FieldSetcheckfile("TNA.CARD.REASON")
    EB.Template.TableAddfielddefinition("WITHDRAWAL.DATE","","D","");*


    
    EB.Template.TableAddlocalreferencefield("")
    EB.Template.TableAddoverridefield()
    EB.Template.TableSetauditposition() ;* Poputale audit information

RETURN
* ----------------------------------------------------------------------------
END
