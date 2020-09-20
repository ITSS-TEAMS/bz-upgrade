* @ValidationCode : MjotMTE2MjYyNjQzNjpDcDEyNTI6MTYwMDQ3OTIyNjI4MzpBZG1pbmlzdHJhdGV1cjotMTotMTowOjE6dHJ1ZTpOL0E6UjE5X0FNUi4wOi0xOi0x
* @ValidationInfo : Timestamp         : 19 Sep 2020 02:33:46
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
* <Rating>-2</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable1
SUBROUTINE BZ.PAI.FRS.VIR.INT.FIELDS
*-----------------------------------------------------------------------------
*<doc>
* TODO add a description of the application here.
* @FEHMI BOUNOUARA
* 20120403
*
*
*-----------------------------------------------------------------------------
* TODO - You MUST write a .FIELDS routine for the field definitions
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------
*ZITUNA-UPG-R13-R19 :  removed BP's and changed INCLUDE to INSERT
*                      FM converted to @FM
* ----------------------------------------------------------------------------
*** <region name= Header>
*** <desc>Inserts and control logic</desc>
* $INSERT I_COMMON - Not Used anymore;N
* $INSERT I_EQUATE - Not Used anymore;E
* $INSERT I_DataTypes - Not Used anymore;s
    $USING EB.API
    $USING EB.SystemTables
    $USING EB.Template

    
*** </region>

*-----------------------------------------------------------------------------
    EB.Template.TableDefineid("ID", "" : @FM : "30" : @FM : "A")

*-----------------------------------------------------------------------------
    EB.Template.TableAddfielddefinition("TYPE.VIR","5", "":@FM:"INT_EXT", "")
    EB.Template.TableAddfielddefinition("REF.DEMANDE","12", "A", "")
    EB.Template.FieldSetcheckfile("BZ.DEMANDE.ISB")
    EB.Template.TableAddfielddefinition("CODE.FRS","15", "A", "")
    EB.Template.FieldSetcheckfile("BZ.ISB.FOURNISSEUR")
    EB.Template.TableAddfielddefinition("COMPTE.FRS","12", "A", "")
    EB.Template.FieldSetcheckfile("ACCOUNT")
    EB.Template.TableAddfielddefinition("MNT.PAIEMENT","15", "AMT", "")
    EB.Template.TableAddfielddefinition("REFERENCE","16", "A", "")
    EB.Template.TableAddfielddefinition("COMPTE.HJ","12", "ACC", "")
    EB.Template.FieldSetcheckfile("ACCOUNT")
    EB.Template.TableAddfielddefinition("DATE.CREATION","8", "D", "")
    EB.Template.TableAddfielddefinition("STATUT","1", "A", "")    ;*1 : CREEE, 2 : APPURE
    EB.Template.TableAddfielddefinition("REF.TXN","12", "A", "")
    EB.Template.TableAddfielddefinition("DATE.TXN","8", "D", "")
    EB.Template.TableAddfielddefinition("CODE.CLIENT","10", "CUS", "")
    EB.Template.FieldSetcheckfile("CUSTOMER")
    EB.Template.TableAddfielddefinition("MNT.HJ","15", "AMT", "")

    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
