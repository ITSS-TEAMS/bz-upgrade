* @ValidationCode : MjotNjUxMjMwODQxOkNwMTI1MjoxNjAwNDc5MDcxMjkzOkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTp0cnVlOk4vQTpSMTlfQU1SLjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 19 Sep 2020 02:31:11
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
* <Rating>-5</Rating>
*---------------------------------------------
*Modification History:
*ZIT-UPG-R13-R19:FM converted to @FM
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable1
SUBROUTINE BZ.GEN.CONDITION.AC.FIELDS
*-----------------------------------------------------------------------------
*<doc>
* TODO add a description of the application here.
* @author Bounouara fehmi
* @stereotype H
*
*
*-----------------------------------------------------------------------------
* TODO - You MUST write a .FIELDS routine for the field definitions
*-----------------------------------------------------------------------------
* ----------------------------------------------------------------------------

*** <region name= Header>
*** <desc>Inserts and control logic</desc>

*ZIT-UPG-R13-R19  S
* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;
* $INSERT I_DataTypes - Not Used anymore;
    
    $USING EB.API
    $USING EB.SystemTables
    $USING EB.Template
*ZIT-UPG-R13-R19  E

*** </region>

*-----------------------------------------------------------------------------
    EB.Template.TableDefineid("ID", "" : @FM : "10" : @FM : "A")
*-----------------------------------------------------------------------------
    EB.Template.TableAddfielddefinition("LIBELLE", "35","A","")

    EB.Template.TableAddfielddefinition("CURRENCY", "3.1","CCY","")
    EB.Template.FieldSetcheckfile("CURRENCY")
    EB.Template.TableAddfielddefinition("XX<FLAT.AMOUNT", "19","AMT","")

    EB.Template.TableAddfielddefinition("XX-PERCENT", "5","","")

    EB.Template.TableAddfielddefinition("XX-MIN.AMT", "19","AMT","")
    EB.Template.TableAddfielddefinition("XX-MAX.AMT", "19","AMT","")

    EB.Template.TableAddfielddefinition("XX>COM.TYPE", "20","A","")
    EB.Template.FieldSetcheckfile("FT.COMMISSION.TYPE")

************************
    EB.Template.TableAddfielddefinition("RESERVED.2", "10","A","")
    EB.Template.TableAddfielddefinition("RESERVED.3", "10","A","")

*-----------------------------------------------------------------------------
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
