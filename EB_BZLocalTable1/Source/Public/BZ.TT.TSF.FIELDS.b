* @ValidationCode : MjotMTYxNjI1ODM4ODpDcDEyNTI6MTYwMDQ3OTM1MjU5MjpBZG1pbmlzdHJhdGV1cjotMTotMTowOjE6dHJ1ZTpOL0E6UjE5X0FNUi4wOi0xOi0x
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
SUBROUTINE BZ.TT.TSF.FIELDS

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
*Modification History:

*ZIT-UPG-R13-R19 : FM CHANGED TO @FM
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
    EB.Template.TableDefineid("ID.CC", "" : @FM : "16" : @FM : "A")
*-----------------------------------------------------------------------------
    EB.Template.TableAddfielddefinition("TYPE.TSF", "20","A","")
    EB.Template.TableAddfielddefinition("DATE.ENVOI", "8","D","")
    EB.Template.TableAddfielddefinition("UNITE.ENVOI", "4","A","")
    EB.Template.FieldSetcheckfile('DEPT.ACCT.OFFICER')
    EB.Template.TableAddfielddefinition("CAISSE.EMET", "5","A","")
    EB.Template.FieldSetcheckfile('TELLER.ID')
    EB.Template.TableAddfielddefinition("CAISSIER.EMET", "35","A","")
    EB.Template.FieldSetcheckfile('USER')
    EB.Template.TableAddfielddefinition("UNITE.RECEPTRICE", "4","A","")
    EB.Template.FieldSetcheckfile('DEPT.ACCT.OFFICER')
    EB.Template.TableAddfielddefinition("MONTANT", "15","AMT","")
    EB.Template.TableAddfielddefinition("DEVISE", "3","CCY","")
    EB.Template.FieldSetcheckfile('CURRENCY')
    EB.Template.TableAddfielddefinition("CAISSE.RCPT", "5","A","")
    EB.Template.FieldSetcheckfile('TELLER.ID')
    EB.Template.TableAddfielddefinition("CAISSIER.RCPT", "35","A","")
    EB.Template.FieldSetcheckfile('USER')
    EB.Template.TableAddfielddefinition("DATE.RCPT", "8","D","")
    EB.Template.TableAddfielddefinition("STATUT", "35","":@FM:"ENVOIE_RECEPTION_ANNULER","")

    EB.Template.TableAddfielddefinition("REF.RCPT", "16","A","")
    EB.Template.TableAddfielddefinition("NOMBRE", "10","A","")

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
