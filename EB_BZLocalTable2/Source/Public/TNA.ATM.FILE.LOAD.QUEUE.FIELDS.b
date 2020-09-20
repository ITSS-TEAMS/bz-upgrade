* @ValidationCode : MjoxOTEzNDAxMzkzOkNwMTI1MjoxNjAwNTYwMTQwNzUyOkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTp0cnVlOk4vQTpSMjBfU1A0LjA6LTE6LTE=
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
$PACKAGE EB.BZLocalTable2
SUBROUTINE TNA.ATM.FILE.LOAD.QUEUE.FIELDS
*-----------------------------------------------------------------------------
*<doc>
* @author aajouad@temenos.com
* @stereotype H
*
*
*-----------------------------------------------------------------------------
* Modification History
*-----------------------
* Version Initiale 13/08/2009 -- STD 0.1 23/06/09
*ZIT-UPG-R13-R19  : FM TO @FM
* ----------------------------------------------------------------------------

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
    EB.Template.TableDefineid("ID.CHG",  "" : @FM : "15" : @FM : "A")  ;* Define Table id
*-----------------------------------------------------------------------------

    EB.Template.TableAddfielddefinition("ACTION","10.1","" : @FM : "CHARGER_ANNULER","")
    

*-----------------------------------------------------------------------------

    EB.Template.TableAddlocalreferencefield("")
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
