* @ValidationCode : MjoxOTc5OTk1OTIzOkNwMTI1MjoxNjAwNDg0NzIwNzQ4OkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTp0cnVlOk4vQTpSMjBfU1A0LjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 19 Sep 2020 04:05:20
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
* Modification History:
* ZIT-UPG-R13-R19 : Converted $INCLUDE TO $INSERT, Converted FM to @FM
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable2
SUBROUTINE BZ.RIA.COMPENSATION.FIELDS

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
    EB.Template.TableDefineid("ID", "" : @FM : "35" : @FM : "A")
*-----------------------------------------------------------------------------
*******
    tArrayItem = "AMT"
    tArrayItem<2,1> = "-"
    tArrayItem<2,2> = "EUR"
*******
    EB.Template.TableAddfielddefinition("XX<AGENCE", "4","A","")
    EB.Template.FieldSetcheckfile('DEPT.ACCT.OFFICER')
    EB.Template.TableAddfielddefinition("XX-CHARGES", "12",tArrayItem,"")
    EB.Template.TableAddfielddefinition("XX-FRAIS", "12",tArrayItem,"")
    EB.Template.TableAddfielddefinition("XX-CHARGE.TND.HT", "12","A","")
    EB.Template.TableAddfielddefinition("XX-TVA", "12","A","")
    EB.Template.TableAddfielddefinition("XX-CHARGES.TND", "12","A","")
    EB.Template.TableAddfielddefinition("XX-EXCHANGE.TND", "12","A","")
    EB.Template.TableAddfielddefinition("XX-FRAIS.TND", "12","A","")
    EB.Template.TableAddfielddefinition("XX>EXCHANGE", "12",tArrayItem,"")
    EB.Template.TableAddfielddefinition("DEVISE", "3","CCY","")
    EB.Template.TableAddfielddefinition("TOTAL.CHARGES", "19",tArrayItem,"")
    EB.Template.TableAddfielddefinition("TOTAL.EXCHANGE", "19",tArrayItem,"")
    EB.Template.TableAddfielddefinition("TAUX.CHANGE", "6","R","")
    EB.Template.TableAddfielddefinition("JOURNEE","8","D","")
    EB.Template.TableAddfielddefinition("TOTAL.PRINCIPAL", "19",tArrayItem,"")
    EB.Template.TableAddfielddefinition("TOTAL.NET", "19",tArrayItem,"")
    EB.Template.TableAddfielddefinition("TOTAL.FRAIS", "19",tArrayItem,"")
    EB.Template.TableAddfielddefinition("TOTAL.PRINCTND","19","A","")
    EB.Template.TableAddfielddefinition("TOTAL.NET.TND","19","A","")
    EB.Template.TableAddfielddefinition("TOTAL.FRAISTND","19","A","")
    EB.Template.TableAddfielddefinition("TOTAL.CHARGTND","19","A","")
    EB.Template.TableAddfielddefinition("TOTAL.EXCHATND","19","A","")
    EB.Template.TableAddfielddefinition("NBR.OPERATION", "19","A","")
    EB.Template.TableAddfielddefinition("MONTANT.OPER", "19","A","")
    EB.Template.TableAddfielddefinition("TOTAL.PR.AJUST", "19","A","")
    EB.Template.TableAddfielddefinition("REF.BATCH", "19","A","")

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
