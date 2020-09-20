* @ValidationCode : MjoxNDE1MTM1Njc5OkNwMTI1MjoxNjAwNDc5MzUyNDc1OkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTp0cnVlOk4vQTpSMThfQU1SLjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 19 Sep 2020 02:35:52
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : Administrateur
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : true
* @ValidationInfo : Bypass GateKeeper : true
* @ValidationInfo : Compiler Version  : R18_AMR.0
*-----------------------------------------------------------------------------
* <Rating>-1</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable1
SUBROUTINE BZ.TT.PARAM.CHNG.FIELDS

*-----------------------------------------------------------------------------
*<doc>
* TODO add a description of the application here.
* @author Firas Jmal
* @stereotype H
*
*
*-----------------------------------------------------------------------------
* TODO - You MUST write a .FIELDS routine for the field definitions
*-----------------------------------------------------------------------------
*MODIFICATION HISTORY:
*ZIT-UPG-R13-R19-FM TO @FM
*-----------------------------------------------------------------------------

*** <region name= Header>
*** <desc>Inserts and control logic</desc>
* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;
* $INSERT I_DataTypes - Not Used anymore;
    $USING EB.SystemTables
    $USING EB.API
    $USING EB.Template
*** </region>

*** <region name= Main Processing>

    GOSUB DEFINE.FIELDS
RETURN

*** </region>

*** <region name= DEFINE FIELDS>
DEFINE.FIELDS:
**************
*****ID

    EB.Template.TableDefineid("ID", "" : @FM : "30" : @FM : "A")

*****Fields

    EB.Template.TableAddfielddefinition("DESCRIPTION", "30.1","A","")
    EB.Template.TableAddfielddefinition("THRESHOLD.AMOUNT", "20.1","AMT","")
    EB.Template.TableAddfielddefinition("RETR.PERIOD","3.1","A","")

*****Reserved Fields
    EB.Template.TableAddfield("RESERVED.1", EB.Template.T24String, EB.Template.FieldNoInput,"")
    EB.Template.TableAddfield("RESERVED.2", EB.Template.T24String, EB.Template.FieldNoInput,"")
    EB.Template.TableAddfield("RESERVED.3", EB.Template.T24String, EB.Template.FieldNoInput,"")
    EB.Template.TableAddfield("RESERVED.4", EB.Template.T24String, EB.Template.FieldNoInput,"")
    EB.Template.TableAddfield("RESERVED.5", EB.Template.T24String, EB.Template.FieldNoInput,"")
    EB.Template.TableAddfield("RESERVED.6", EB.Template.T24String, EB.Template.FieldNoInput,"")
    EB.Template.TableAddfield("RESERVED.7", EB.Template.T24String, EB.Template.FieldNoInput,"")
    EB.Template.TableAddfield("RESERVED.8", EB.Template.T24String, EB.Template.FieldNoInput,"")
    EB.Template.TableAddfield("RESERVED.9", EB.Template.T24String, EB.Template.FieldNoInput,"")
    EB.Template.TableAddfield("RESERVED.10", EB.Template.T24String, EB.Template.FieldNoInput,"")

*-----------------------------------------------------------------------------
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------

RETURN
*** </region>

END
