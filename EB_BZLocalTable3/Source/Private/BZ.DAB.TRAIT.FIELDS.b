* @ValidationCode : MjotMTc1MTk3NTYwNjpDcDEyNTI6MTYwMDU2MjE5MTc4MjpBZG1pbmlzdHJhdGV1cjotMTotMTowOjE6dHJ1ZTpOL0E6UjIwX1NQNC4wOi0xOi0x
* @ValidationInfo : Timestamp         : 20 Sep 2020 01:36:31
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
$PACKAGE EB.BZLocalTable3
SUBROUTINE BZ.DAB.TRAIT.FIELDS
*------------------------------------------------------------------
**Modification History:
**ZIT-UPG-R13-R19:Changed FM to @FM
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
    EB.Template.TableAddfielddefinition("DEVISE", "3","CCY","")
    EB.Template.FieldSetcheckfile('CURRENCY')
    EB.Template.TableAddfielddefinition("AGENCE", "4","A","")
    EB.Template.FieldSetcheckfile('DEPT.ACCT.OFFICER')
    EB.Template.TableAddfielddefinition("AMT.INIT","20","A","")
    EB.Template.TableAddfielddefinition("AMT.DIST","20","A","")
    EB.Template.TableAddfielddefinition("AMT.DISTJOUR","20","A","")
    EB.Template.TableAddfielddefinition("AMT.REJT","20","A","")
    EB.Template.TableAddfielddefinition("AMT.REST","20","A","")
    EB.Template.TableAddfielddefinition("AMT.DISTTL","20","A","")
    EB.Template.TableAddfielddefinition("TOT.DISTTL","20","A","")
    EB.Template.TableAddfielddefinition("AMT.ECART","20","A","")
    EB.Template.TableAddfielddefinition("SOLDE.DAB","20","A","")
    EB.Template.TableAddfielddefinition("SOLDE.CALC","20","A","")
    EB.Template.TableAddfielddefinition("ECART.DAB","20","A","")
    EB.Template.TableAddfielddefinition("AMT.DECHARG","20","A","")
    EB.Template.TableAddfielddefinition("AMT.PHY","20","A","")
    EB.Template.TableAddfielddefinition("AMT.PHY.TOT","20","A","")
    EB.Template.TableAddfielddefinition("AMT.CHARG","20","A","")

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
    EB.Template.TableAddfielddefinition("RESERVED.10","10","A","")
*-----------------------------------------------------------------------------
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
