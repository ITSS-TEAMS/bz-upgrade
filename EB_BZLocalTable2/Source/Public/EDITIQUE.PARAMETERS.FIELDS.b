* @ValidationCode : MjotMzg5MTM5MTAxOkNwMTI1MjoxNjAwNTYwMTM3ODMxOkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTp0cnVlOk4vQTpSMjBfU1A0LjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 20 Sep 2020 01:02:17
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
* <Rating>-1</Rating>
* Modification History :
* ZIT-UPG-R13-R19 : Converted $INCLUDE TO $INSERT, Converted FM to @FM
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable2
SUBROUTINE EDITIQUE.PARAMETERS.FIELDS

*-----------------------------------------------------------------------------
*<doc>
* TODO add a description of the application here.
* @author
* @stereotype H
*
*
*-----------------------------------------------------------------------------
* TODO - You MUST write a .FIELDS routine for the field definitions
*-----------------------------------------------------------------------------
* ----------------------------------------------------------------------------

*** <region name= Header>
*** <desc>Inserts and control logic</desc>
* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;
* $INSERT I_DataTypes - Not Used anymore;
    $USING EB.API
    $USING EB.SystemTables
    $USING EB.Template
*** </region>

*-----------------------------------------------------------------------------
    EB.Template.TableDefineid("ID", "" : @FM : "100" : @FM : "A")
*-----------------------------------------------------------------------------
    EB.Template.TableAddfielddefinition("driverClassName", "50","A","")
    EB.Template.TableAddfielddefinition("url", "50","A","")
    EB.Template.TableAddfielddefinition("username", "50","A","")
    EB.Template.TableAddfielddefinition("password", "50","A","")
    EB.Template.TableAddfielddefinition("SQL.TABLE", "50","A","")
    EB.Template.TableAddfielddefinition("NBR.FIELD.MAX", "4","A","")
    EB.Template.TableAddfielddefinition("XX<FIELD.NAME", "50","A","")
    EB.Template.TableAddfielddefinition("XX-FIELD.POSITION", "4","A","")
    EB.Template.TableAddfielddefinition("XX-FIELD.TYPE", "100","A","")
    EB.Template.TableAddfielddefinition("XX-FIELD.LENGTH", "10","A","")
    EB.Template.TableAddfielddefinition("XX>SQL.FIELD.NAME", "50","A","")
    EB.Template.TableAddfielddefinition("XX<LR.NAME", "50","A","")
    EB.Template.TableAddfielddefinition("XX-LR.POSITION", "4","A","")
    EB.Template.TableAddfielddefinition("XX-LR.FIELD.TYPE", "100","A","")
    EB.Template.TableAddfielddefinition("XX-LR.FIELD.LENGTH", "10","A","")
    EB.Template.TableAddfielddefinition("XX>SQL.LR.NAME", "50","A","")
    EB.Template.TableAddfielddefinition("SS.LR.NO", "2","A","")
    EB.Template.TableAddfielddefinition("SEND.ALL.DATA", "3","A","")
    EB.Template.TableAddfielddefinition("CRATE.SQL.STR", "2000","A","")
    EB.Template.TableAddfielddefinition("SELECT.FILTER", "500","A","")

**RESERVED
    EB.Template.TableAddfielddefinition("RESERVED.1", "10","A","")
    EB.Template.TableAddfielddefinition("RESERVED.2", "10","A","")
    EB.Template.TableAddfielddefinition("RESERVED.3", "10","A","")
    EB.Template.TableAddfielddefinition("RESERVED.4", "10","A","")
    EB.Template.TableAddfielddefinition("RESERVED.5", "10","A","")
    EB.Template.TableAddfielddefinition("RESERVED.6", "10","A","")
    EB.Template.TableAddfielddefinition("RESERVED.7", "10","A","")
    EB.Template.TableAddfielddefinition("RESERVED.8", "10","A","")
    EB.Template.TableAddfielddefinition("RESERVED.9", "10","A","")
    EB.Template.TableAddfielddefinition("RESERVED.10", "10","A","")
*-----------------------------------------------------------------------------
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
