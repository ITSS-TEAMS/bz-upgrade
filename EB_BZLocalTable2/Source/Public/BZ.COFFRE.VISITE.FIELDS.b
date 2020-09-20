* @ValidationCode : MjotMTIxNzEwMjM0OkNwMTI1MjoxNjAwNDg0NzE4ODYyOkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTp0cnVlOk4vQTpSMjBfU1A0LjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 19 Sep 2020 04:05:18
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
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable2
SUBROUTINE BZ.COFFRE.VISITE.FIELDS

*-----------------------------------------------------------------------------

* ----------------------------------------------------------------------------
*Modification history :
*ZIT-UPG-R13-R19: Converted FM TO @FM.
*---------------------------------------------

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
    EB.Template.TableDefineid("ID", "" : @FM : "12" : @FM : "A")
*-----------------------------------------------------------------------------
*******
    EB.Template.TableAddfielddefinition("ID.MANDAT", "14","A","")
    EB.Template.TableAddfielddefinition("ID.CONTRAT", "12","A","")
    EB.Template.TableAddfielddefinition("DATE.VISITE", "8","D","")
    EB.Template.TableAddfielddefinition("HEURE.VISITE", "8","A","")
    EB.Template.TableAddfield("OBSERVATIONS", EB.Template.T24Text,"","")
*-----------------------------------------------------------------------------
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
