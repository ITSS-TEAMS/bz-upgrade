* @ValidationCode : MjotMzYxNzM2MzAwOkNwMTI1MjoxNjAwNjAzNDA0MTkyOkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTp0cnVlOk4vQTpSMjBfU1A0LjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 20 Sep 2020 13:03:24
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
* <Rating>-5</Rating>
* Modification History:
* ZIT-UPG-R13-R19 : Converted $INCLUDE TO $INSERT, Converted FM to @FM
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable3
SUBROUTINE BZ.ETR.TICKET.FX.FIELDS
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
* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;
* $INSERT I_DataTypes - Not Used anymore;
    $USING EB.API
    $USING EB.SystemTables
    $USING EB.Template
*** </region>

*-----------------------------------------------------------------------------
    EB.Template.TableDefineid("ID", "" : @FM : "35" : @FM : "A")
*-----------------------------------------------------------------------------

    EB.Template.TableAddfielddefinition("REFERENCE.FX", "12","A","")

    EB.Template.TableAddfielddefinition("CUSTOMER", "10","CUS","")

    EB.Template.TableAddfielddefinition("DATE.OPERATION", "8","D","")

    EB.Template.TableAddfielddefinition("CCY.ACHAT", "3","CCY","")

    EB.Template.TableAddfielddefinition("MNT.ACHAT", "19","AMT","")

    EB.Template.TableAddfielddefinition("CCY.VENTE", "3","CCY","")

    EB.Template.TableAddfielddefinition("MNT.VENTE", "19","AMT","")

    EB.Template.TableAddfielddefinition("SSI.ACHAT", "12","ACC","")

    EB.Template.TableAddfielddefinition("SSI.VENTE", "12","ACC","")

    EB.Template.TableAddfielddefinition("COURS", "10","A","")

    EB.Template.TableAddfielddefinition("XX<CONS.REF.FT", "12","A","")
    EB.Template.TableAddfielddefinition("XX-CONS.DEVISE", "3","CCY","")
    EB.Template.TableAddfielddefinition("XX>CONS.MONTANT", "19","AMT","")

    EB.Template.TableAddfielddefinition("RLQ.DEVISE", "12","A","")
    EB.Template.TableAddfielddefinition("RLQ.AMT", "19","AMT","")


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
