* @ValidationCode : MjotNjUwNTE3NTAyOkNwMTI1MjoxNjAwNTYyNzUzMTY0OkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTp0cnVlOk4vQTpSMjBfU1A0LjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 20 Sep 2020 01:45:53
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
$PACKAGE EB.BZLocalTable3
SUBROUTINE BZ.MON.REGISTRE.GAB.CHANGE.FIELDS
*-----------------------------------------------------------------------------
*<doc>
* TODO add a description of the application here.
* @FEHMI BOUNOUARA
*
*
*-----------------------------------------------------------------------------
* TODO - You MUST write a .FIELDS routine for the field definitions
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------
*ZIT-UPG-R13-R19 :   removed BP's and changed INCLUDE to INSERT
*                    FM converted to @FM
* ----------------------------------------------------------------------------
*** <region name= Header>
*** <desc>Inserts and control logic</desc>
* $INSERT I_COMMON - Not Used anymore;N
* $INSERT I_EQUATE - Not Used anymore;E
* $INSERT I_DataTypes - Not Used anymore;s
    $USING EB.API
    $USING EB.SystemTables
    $USING EB.Template
    
*** </region>

*-----------------------------------------------------------------------------
    EB.Template.TableDefineid("ID", "" : @FM : "60" : @FM : "A")

*-----------------------------------------------------------------------------

    EB.Template.TableAddfielddefinition("TERM.ID","10", "A", "")
    EB.Template.TableAddfielddefinition("TERM.NAME","40", "A", "")
    EB.Template.TableAddfielddefinition("TRANS.TYPE","2", "", "")
    EB.Template.TableAddfielddefinition("TRANS.CODE","3", "", "")
    EB.Template.TableAddfielddefinition("TRANS.SEQ","4", "", "")
    EB.Template.TableAddfielddefinition("TRANS.DATE","14", "A", "")
    EB.Template.TableAddfielddefinition("CCY.CODE.1","3", "", "")
    EB.Template.TableAddfielddefinition("AMT.DEP.1","12", "A", "")
    EB.Template.TableAddfielddefinition("CONV.RATE.1","9", "A", "")
    EB.Template.TableAddfielddefinition("CONV.AMT.1","12", "A", "")
    EB.Template.TableAddfielddefinition("CCY.CODE.2","3", "", "")
    EB.Template.TableAddfielddefinition("AMT.DEP.2","12", "A", "")
    EB.Template.TableAddfielddefinition("CONV.RATE.2","9", "A", "")
    EB.Template.TableAddfielddefinition("CONV.AMT.2","12", "A", "")
    EB.Template.TableAddfielddefinition("TRANS.STATUS","2", "", "")
    EB.Template.TableAddfielddefinition("CASS.COUNT.1","3", "A", "")
    EB.Template.TableAddfielddefinition("CASS.COUNT.2","3", "A", "")
    EB.Template.TableAddfielddefinition("HOP.COUNT.1","3", "A", "")
    EB.Template.TableAddfielddefinition("HOP.COUNT.2","3", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED","28", "A", "")
    EB.Template.TableAddfielddefinition("CCY.COM.AMT","3", "", "")
    EB.Template.TableAddfielddefinition("COM.AMT","6", "A", "")
    EB.Template.TableAddfielddefinition("CCY.NET.AMT","3", "", "")
    EB.Template.TableAddfielddefinition("NET.AMT","12", "A", "")
    EB.Template.TableAddfielddefinition("CCY.DISP.AMT","3", "", "")
    EB.Template.TableAddfielddefinition("DISP.AMT","12", "A", "")

    EB.Template.TableAddfielddefinition("DATE.CHARGEMENT","8", "D", "")
    EB.Template.TableAddfielddefinition("FICHIER.RECU","60", "A", "")
    EB.Template.TableAddfielddefinition("STATUT","1", "A", "")

    EB.Template.TableAddfielddefinition("REF.TRANS.1","12", "A", "")
    EB.Template.TableAddfielddefinition("REF.TRANS.2","12", "A", "")
    EB.Template.TableAddfielddefinition("REF.TRANS.PL","12", "A", "")

    EB.Template.TableSetauditposition()         ;* Poputale audit information
RETURN
*-----------------------------------------------------------------------------
END
