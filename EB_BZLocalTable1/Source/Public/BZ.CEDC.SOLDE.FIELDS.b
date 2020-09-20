* @ValidationCode : MjoxNzAyMTc4MDI1OkNwMTI1MjoxNjAwNDc4OTU2NTk5OkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTp0cnVlOk4vQTpSMTlfQU1SLjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 19 Sep 2020 02:29:16
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
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable1
SUBROUTINE BZ.CEDC.SOLDE.FIELDS
*-----------------------------------------------------------------------------
*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R13-R19      : changed FM to @FM
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
*-----------------------------------------------------------------------------
    EB.Template.TableDefineid("ID", "" : @FM : "35":@FM:"A")
*-----------------------------------------------------------------------------

    EB.Template.TableAddfielddefinition("SOLDE.DEPART","30", "A", "")
    EB.Template.TableAddfielddefinition("SOLDE.FIN","30", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED.1","30", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED.2","30", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED.3","30", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED.4","30", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED.5","30", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED.6","30", "A", "")

*-----------------------------------------------------------------------------
    EB.Template.TableAddlocalreferencefield("")
*-----------------------------------------------------------------------------

    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
