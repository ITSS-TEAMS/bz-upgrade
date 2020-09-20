* @ValidationCode : MjotNDgxMTk3NDg5OkNwMTI1MjoxNjAwNDc5MDk2NDAzOkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTp0cnVlOk4vQTpSMTlfQU1SLjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 19 Sep 2020 02:31:36
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
SUBROUTINE BZ.IJR.DEBLOCAGE.HJ.FIELDS
*-----------------------------------------------------------------------------
*<doc>
* TODO add a description of the application here.
* @ Zeki.BenOthmen@banquezitouna.com
* 20131212
*
*
*-----------------------------------------------------------------------------
* TODO - You MUST write a .FIELDS routine for the field definitions
*-----------------------------------------------------------------------------
* Modification History :
* Modification History:
* ZIT-UPG-R13-R19 : Converted $INCLUDE TO $INSERT, FM TO @FM
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
    EB.Template.TableDefineid("ID", "" : @FM : "12" : @FM : "A")
*-----------------------------------------------------------------------------

*CALL Table.addFieldDefinition("ID","12", "A", "")
    EB.Template.TableAddfielddefinition("REF.LD","12", "A", "")
    EB.Template.FieldSetcheckfile("LD.LOANS.AND.DEPOSITS")

    EB.Template.TableAddfielddefinition("DATE.EXECUTION","8", "D", "")
    EB.Template.TableAddfielddefinition("DATE.CREATION","8", "D", "")

    EB.Template.TableAddfielddefinition("MONTANT","19", "A", "")
    EB.Template.TableAddfielddefinition("COMPTE.HJ","10", "A", "")
    EB.Template.FieldSetcheckfile("ACCOUNT")
    EB.Template.TableAddfielddefinition("COMPTE.CLIENT","10", "A", "")
    EB.Template.FieldSetcheckfile("ACCOUNT")
    EB.Template.TableAddfielddefinition("REF.DEBLOCAGE","12", "A", "")
    EB.Template.FieldSetcheckfile("FUNDS.TRANSFER")
    EB.Template.TableAddfielddefinition("DATE.DEBLOCAGE","8", "D", "")
    EB.Template.TableAddfielddefinition("REF.OFS","40", "A", "")
    EB.Template.TableAddfielddefinition("STATUT","10", "" : @FM : "CREE_APPURE", "")

    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
