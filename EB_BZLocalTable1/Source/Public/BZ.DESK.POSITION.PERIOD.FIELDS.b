* @ValidationCode : MjotMjQ0NDgyOTQxOkNwMTI1MjoxNjAwNDc5MDM0MDk2OkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTp0cnVlOk4vQTpSMTlfQU1SLjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 19 Sep 2020 02:30:34
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : Administrateur
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : true
* @ValidationInfo : Bypass GateKeeper : true
* @ValidationInfo : Compiler Version  : R19_AMR.0
*-----------------------------------------------------------------------------
* <Rating>-1</Rating>
*-----------------------------------------------------------------
*Modification History:
*ZIT-UPG-R13-R19:Converted FM to @FM
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable1
SUBROUTINE BZ.DESK.POSITION.PERIOD.FIELDS

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
    EB.Template.TableDefineid("ID", "" : @FM : "20" : @FM : "A")
*-----------------------------------------------------------------------------
    EB.Template.TableAddfielddefinition("DEVISE", "3","CCY","")
    EB.Template.FieldSetcheckfile('CURRENCY')
    EB.Template.TableAddfielddefinition("PERIODE", "6","A","")
    EB.Template.TableAddfielddefinition("AGENCE", "4","A","")
    EB.Template.FieldSetcheckfile('DEPT.ACCT.OFFICER')
    EB.Template.TableAddfielddefinition("POSITION.DEVISE", "20","A","")
    EB.Template.TableAddfielddefinition("POSITION.REVALUE", "20","A","")
    EB.Template.TableAddfielddefinition("POSITION.DINARS", "20","A","")
    EB.Template.TableAddfielddefinition("POS.DEVISE.INIT", "20","A","")
    EB.Template.TableAddfielddefinition("POS.DINARS.INIT", "20","A","")
    EB.Template.TableAddfielddefinition("RENTABILITE", "20","A","")
    EB.Template.TableAddfielddefinition("COURS.REVAL", "7","R","")
    EB.Template.TableAddfielddefinition("TOT.MOUV.DEVISE", "20","A","")
    EB.Template.TableAddfielddefinition("TOT.MOUV.DINARS", "20","A","")

**RESERVED
    EB.Template.TableAddfielddefinition("RESERVED.1", "10","A","")
    EB.Template.TableAddfielddefinition("RESERVED.2", "10","A","")
    EB.Template.TableAddfielddefinition("RESERVED.3", "10","A","")
    EB.Template.TableAddfielddefinition("RESERVED.4", "10","A","")
    EB.Template.TableAddfielddefinition("RESERVED.5", "10","A","")

*-----------------------------------------------------------------------------
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
