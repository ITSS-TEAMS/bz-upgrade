* @ValidationCode : MjotMTY3MTQ0NTM1MTpDcDEyNTI6MTYwMDQ3OTAzNTA1NjpBZG1pbmlzdHJhdGV1cjotMTotMTowOjE6dHJ1ZTpOL0E6UjE5X0FNUi4wOi0xOi0x
* @ValidationInfo : Timestamp         : 19 Sep 2020 02:30:35
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
* <Rating>-4</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable1
SUBROUTINE BZ.EPS.AMORT.FIELDS
*-----------------------------------------------------------------------------
*<doc>
* Field definition de l'application amortissemnt des commissions EPS
* @author hicham.atoui@targa-consult.com
* @stereotype H
*-----------------------------------------------------------------------------
* TODO - You MUST write a .FIELDS routine for the field definitions
*-----------------------------------------------------------------------------
*** Modification History:
*** "ZIT-UPG-R13-R19"
*** Converted FM to @FM
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
*  CALL Table.defineId("ID", T24_String)         ;* Define Table id
    EB.Template.TableDefineid("ID.FIN", "" : @FM : "20" : @FM : "A")          ;* Define Table id
*-----------------------------------------------------------------------------


    EB.Template.TableAddfielddefinition("CUSTOMER", "10", "ANY", "")
    EB.Template.FieldSetcheckfile("CUSTOMER")
    EB.Template.TableAddfielddefinition("REF.CAUTION", "15", "ANY", "")
    EB.Template.FieldSetcheckfile("MD.DEAL")
    EB.Template.TableAddfielddefinition("CPTE.AMORT", "15", "ANY", "")
    EB.Template.TableAddamountfield("MONTANT.AMORT", "15","", "")
    EB.Template.TableAddfielddefinition("NBR.AMORT","3", "", "")
    EB.Template.TableAddamountfield("OUTSTANDING", "15","", "")
    EB.Template.TableAddfielddefinition("FREQUENCE","2","" : @FM : "D_M","")
    EB.Template.TableAddfielddefinition("LAST.EXECUTION","8","D","")
    EB.Template.TableAddfielddefinition("NEXT.EXECUTION","8","D","")
    EB.Template.TableAddfielddefinition("DATE.CREATION","8","D","")
    EB.Template.TableAddamountfield("MONTANT.ECH", "15","", "")
    EB.Template.TableAddfielddefinition("XX.REF.TXN.COMPTA", "15", "A", "")
    EB.Template.TableAddfielddefinition("DEVISE", "3", "ANY", "")
    EB.Template.FieldSetcheckfile("CURRENCY")
    EB.Template.TableAddfielddefinition("CPTE.PL.COMM", "15", "ANY", "")
    EB.Template.TableAddfielddefinition("CODE.COMM", "10", "ANY", "")
    EB.Template.FieldSetcheckfile("FT.COMMISSION.TYPE")

*-----------------------------------------------------------------------------

    EB.Template.TableAddlocalreferencefield("")
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
