* @ValidationCode : MjotMTAwMjc4Nzc3OTpDcDEyNTI6MTYwMDU2MjE5MTM2MzpBZG1pbmlzdHJhdGV1cjotMTotMTowOjE6dHJ1ZTpOL0E6UjIwX1NQNC4wOi0xOi0x
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
* Modification History :
*-----------------------
*ZIT_UPG_R13_TO_R19      :   changed FM to @FM
*----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable3
SUBROUTINE BZ.COMMERCANT.TRANS.DETAIL.FIELDS

*-----------------------------------------------------------------------------
*<doc>
* TODO add a description of the application here.
* @author T24
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
    $USING EB.SystemTables
    $USING EB.API
    $USING EB.Template

*** </region>

*-----------------------------------------------------------------------------
    EB.Template.TableDefineid("ID", "" : @FM : "35" : @FM : "A")
*-----------------------------------------------------------------------------
    EB.Template.TableAddfielddefinition("TRANSACTION.DATE", "8","D","")
    EB.Template.TableAddfielddefinition("TYPE.COMMERCE","35", "A", "")
    EB.Template.TableAddfielddefinition("NUM.AFFILIATION","35", "A", "")
    EB.Template.TableAddfielddefinition("MONTANT", "35","A","")
    EB.Template.TableAddfielddefinition("AFFILIATION","35", "A", "")
    EB.Template.TableAddfielddefinition("BANQUE.EMETRICE","35", "A", "")
    EB.Template.TableAddfielddefinition("MONTANT.COMPENSE", "35","A","")
    EB.Template.TableAddfielddefinition("NUM.CARTE", "35","A","")
    EB.Template.TableAddfielddefinition("NUM.AUTORISATION", "35","A","")
    EB.Template.TableAddfielddefinition("PORTEUR", "4","":@FM : "VISA_MCD","")
    EB.Template.TableAddfielddefinition("TPE", "35","A","")
    EB.Template.TableAddfielddefinition("STATUT", "35","":@FM : "CHARGE_CONFIRME","")
    EB.Template.TableAddfielddefinition("REF.FT", "20","A","")
    EB.Template.TableAddfielddefinition("DATE.ENCAISSEMENT", "8","D","")

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
