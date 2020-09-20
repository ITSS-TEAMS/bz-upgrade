* @ValidationCode : MjotMTQ4Njc0NjIzMTpDcDEyNTI6MTYwMDQ3OTM1MjA1MjpBZG1pbmlzdHJhdGV1cjotMTotMTowOjE6dHJ1ZTpOL0E6UjE5X0FNUi4wOi0xOi0x
* @ValidationInfo : Timestamp         : 19 Sep 2020 02:35:52
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
SUBROUTINE BZ.TT.COM.BCT.FIELDS
*-----------------------------------------------------------------------------
*<doc>
* TODO add a description of the application here.
* @author KTALHAOUI
* @stereotype H
*
*
*-----------------------------------------------------------------------------
* TODO - You MUST write a .FIELDS routine for the field definitions

*-----------------------------------------------------------------------------
*Modification History:

*ZIT-UPG-R13-R19 : FM TO @FM
*-----------------------------------------------------------------------------

*** <region name= Header>
*** <desc>Inserts and control logic</desc>
*ZIT-UPG-R13-R19/S
* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;
* $INSERT I_DataTypes - Not Used anymore;

    $USING EB.API
    $USING EB.SystemTables
    $USING EB.Template
*ZIT-UPG-R13-R19/E
*** </region>

*-----------------------------------------------------------------------------
    EB.Template.TableDefineid("ID", "" : @FM : "30" : @FM : "A")
*-----------------------------------------------------------------------------
    EB.Template.TableAddfielddefinition("REF.TELLER", "15","A","")
    EB.Template.FieldSetcheckfile("TELLER")
    EB.Template.TableAddfielddefinition("CODE.TRANSACTION", "5","A","")
    EB.Template.FieldSetcheckfile("TELLER.TRANSACTION")
    EB.Template.TableAddfielddefinition("DEVISE", "3","CCY","")
    EB.Template.FieldSetcheckfile("CURRENCY")
    EB.Template.TableAddfielddefinition("COMPTE.CAISSE", "15","A","")
    EB.Template.FieldSetcheckfile("ACCOUNT")
    EB.Template.TableAddfielddefinition("COMPTE.BCT", "15","A","")
    EB.Template.FieldSetcheckfile("ACCOUNT")
    EB.Template.TableAddfielddefinition("MONTANT.FCY", "15","AMT","")
    EB.Template.TableAddfielddefinition("MONTANT.LCY", "15","AMT","")
    EB.Template.TableAddfielddefinition("REF.BCT", "35","A","")

    EB.Template.TableAddfielddefinition("CAISSE", "10","A","")
    EB.Template.FieldSetcheckfile("TELLER.ID")
    EB.Template.TableAddfielddefinition("CAISSIER", "20","A","")
    EB.Template.FieldSetcheckfile("USER")

    EB.Template.TableAddfielddefinition("REF.COM", "15","A","")
    EB.Template.FieldSetcheckfile("FUNDS.TRANSFER")
    EB.Template.TableAddfielddefinition("MONTANT.COM", "15","AMT","")
    EB.Template.TableAddfielddefinition("DATE.OPERATION", "8","D","")
    EB.Template.TableAddfielddefinition("STATUT.COM", "6","":@FM:"INAU_AUT","")
    EB.Template.TableAddfielddefinition("REF.OFS", "20","A","")
*-----------------------------------------------------------------------------
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*----------------------------------------------------------------------------
END
