* @ValidationCode : MjotNTA5NDcwMDU1OkNwMTI1MjoxNjAwNDc5MTQ3OTg4OkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTp0cnVlOk4vQTpSMTlfQU1SLjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 19 Sep 2020 02:32:27
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : Administrateur
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : true
* @ValidationInfo : Bypass GateKeeper : true
* @ValidationInfo : Compiler Version  : R19_AMR.0
* Modification History:
* ZIT-UPG-R13-R19 : Converted $INCLUDE TO $INSERT, FM to @FM

$PACKAGE EB.BZLocalTable1
SUBROUTINE BZ.MDP.CHQ.SCAN.CONTROL.FIELDS
*-----------------------------------------------------------------------------
*<doc>
* TODO add a description of the application here.
* @author BOUNOUARA FEHMI
* @stereotype H

* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;
* $INSERT I_DataTypes - Not Used anymore;
    $USING EB.API
    $USING EB.SystemTables
    $USING EB.Template
*** </region>
*-----------------------------------------------------------------------------
    EB.Template.TableDefineid("ID", "" : @FM : "27" : @FM : "A")
*-----------------------------------------------------------------------------
    EB.Template.TableAddfielddefinition("DATE.SCAN", "8","D","")

*-----------------------------------------------------------------------------
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
