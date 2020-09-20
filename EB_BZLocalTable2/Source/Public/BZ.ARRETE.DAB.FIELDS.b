* @ValidationCode : MjotOTY5MTgwNjM1OkNwMTI1MjoxNjAwNDg0NzE1MDI2OkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTp0cnVlOk4vQTpSMjBfU1A0LjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 19 Sep 2020 04:05:15
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
*Modification History:

*ZIT-UPG-R13-R19: FM CHANGED TO @FM
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable2
SUBROUTINE BZ.ARRETE.DAB.FIELDS

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
    EB.Template.TableAddfielddefinition("DATE.SAISIE", "8","D","")
    EB.Template.TableAddfielddefinition("NUMERO.DAB", "10","A","")
* CALL Table.addFieldDefinition("AGENCE", "4","A","")
    EB.Template.TableAddfielddefinition("DEVISE", "3","CCY","")
    EB.Template.FieldSetcheckfile('CURRENCY')
    EB.Template.TableAddfielddefinition("AGENCE", "4","A","")
    EB.Template.FieldSetcheckfile('DEPT.ACCT.OFFICER')
    EB.Template.TableAddfielddefinition("NBR.INIT.1", "4","A","")
    EB.Template.TableAddfielddefinition("NBR.INIT.2", "4","A","")
    EB.Template.TableAddfielddefinition("NBR.INIT.3", "4","A","")
    EB.Template.TableAddfielddefinition("NBR.INIT.4", "4","A","")
    EB.Template.TableAddfielddefinition("NBR.DIST.1", "4","A","")
    EB.Template.TableAddfielddefinition("NBR.DIST.2", "4","A","")
    EB.Template.TableAddfielddefinition("NBR.DIST.3", "4","A","")
    EB.Template.TableAddfielddefinition("NBR.DIST.4", "4","A","")
    EB.Template.TableAddfielddefinition("NBR.REJET.1","4","A","")
    EB.Template.TableAddfielddefinition("NBR.REJET.2","4","A","")
    EB.Template.TableAddfielddefinition("NBR.REJET.3","4","A","")
    EB.Template.TableAddfielddefinition("NBR.REJET.4","4","A","")
    EB.Template.TableAddfielddefinition("NBR.REST.1","4","A","")
    EB.Template.TableAddfielddefinition("NBR.REST.2","4","A","")
    EB.Template.TableAddfielddefinition("NBR.REST.3","4","A","")
    EB.Template.TableAddfielddefinition("NBR.REST.4","4","A","")
    EB.Template.TableAddfielddefinition("MONTANT.INIT","20","A","")
    EB.Template.TableAddfielddefinition("MONTANT.DIST","20","A","")
    EB.Template.TableAddfielddefinition("AMT.DIST.JOUR","20","A","")
    EB.Template.TableAddfielddefinition("MONTANT.REJT","20","A","")
    EB.Template.TableAddfielddefinition("MONTANT.REST","20","A","")
    EB.Template.TableAddfielddefinition("AMT.DIST.TL","20","A","")
    EB.Template.TableAddfielddefinition("AMT.TOTDIST.TL","20","A","")
    EB.Template.TableAddfielddefinition("ECART","20","A","")
    EB.Template.TableAddfielddefinition("SOLDE.DAB","20","A","")
    EB.Template.TableAddfielddefinition("SOLDE.CALC","20","A","")
    EB.Template.TableAddfielddefinition("ECART.SOLDE","20","A","")
    EB.Template.TableAddfielddefinition("MONTANT.DECH","20","A","")
    EB.Template.TableAddfielddefinition("MONTANT.PHY","20","A","")
    EB.Template.TableAddfielddefinition("AMT.PHY.CUMUL","20","A","")
    EB.Template.TableAddfielddefinition("MONTANT.CHARG","20","A","")

**RESERVED
    EB.Template.TableAddfielddefinition("DATE.CLOTURE", "8","D","")
    EB.Template.TableAddfielddefinition("RESERVED.2", "10","A","")
    EB.Template.TableAddfielddefinition("RESERVED.3", "10","A","")
    EB.Template.TableAddfielddefinition("RESERVED.4", "10","A","")
    EB.Template.TableAddfielddefinition("RESERVED.5", "10","A","")
    EB.Template.TableAddfielddefinition("RESERVED.6", "10","A","")
    EB.Template.TableAddfielddefinition("RESERVED.7", "10","A","")
    EB.Template.TableAddfielddefinition("RESERVED.8", "10","A","")
    EB.Template.TableAddfielddefinition("RESERVED.9", "10","A","")
    EB.Template.TableAddfielddefinition("RESERVED.10","10","A","")
*-----------------------------------------------------------------------------
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
