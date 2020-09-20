* @ValidationCode : MjotODU1NjA1MTU5OkNwMTI1MjoxNjAwNDg0NzE4NDk4OkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTp0cnVlOk4vQTpSMjBfU1A0LjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 19 Sep 2020 04:05:18
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
$PACKAGE EB.BZLocalTable2
SUBROUTINE BZ.CLIENT.ENG.CLASSIF.FIELDS
*-----------------------------------------------------------------------------
*<doc>
* TODO add a description of the application here.
* @Zeki.BenOthmen@banquezitouna.com
* 20181218
*
*
*----------------------------------------------------------------------------
* TODO - You MUST write a .FIELDS routine for the field definitions
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------
*ZIT_UPG_R13_TO_R19  : changed FM to @FM
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
    EB.Template.TableDefineid("ID", "" : @FM : "10" : @FM : "A")  ;*changed
*-----------------------------------------------------------------------------
    EB.Template.FieldSetcheckfile("CUSTOMER")

    EB.Template.TableAddfielddefinition("BO.COMPTE.DEB","35", "AMT", "")
    EB.Template.TableAddfielddefinition("BO.ENCOURS.LD","35", "AMT", "")
    EB.Template.TableAddfielddefinition("BO.REECHELONNEMENT","35", "AMT", "")
    EB.Template.TableAddfielddefinition("BO.IMPAYES.PR","35", "AMT", "")
    EB.Template.TableAddfielddefinition("BO.IMPAYES.IN","35", "AMT", "")
    EB.Template.TableAddfielddefinition("BO.IMPAYES.CH","35", "AMT", "")
    EB.Template.TableAddfielddefinition("BC.COMPTE.DEB","35", "AMT", "")
    EB.Template.TableAddfielddefinition("BC.CTX.CHARGES","35", "AMT", "")
    EB.Template.TableAddfielddefinition("BC.CTX.PROFIT","35", "AMT", "")
    EB.Template.TableAddfielddefinition("BC.CTX.PRINCIPAL","35", "AMT", "")
    EB.Template.TableAddfielddefinition("BC.CTX.FRAIS","35", "AMT", "")
    EB.Template.TableAddfielddefinition("HB.EPS","35", "AMT", "")
    EB.Template.TableAddfielddefinition("HB.LC.IMPORT","35", "AMT", "")
    EB.Template.TableAddfielddefinition("HB.AVAL","35", "AMT", "")
    EB.Template.TableAddfielddefinition("DATE.RECEPTION", "8","D","")

***

    EB.Template.TableAddfielddefinition("CLASSE.THEO1", "10","A","")
    EB.Template.FieldSetcheckfile("RISK.CLASS")
    EB.Template.TableAddfielddefinition("CLASSE.THEO2", "10","A","")
    EB.Template.FieldSetcheckfile("RISK.CLASS")
    EB.Template.TableAddfielddefinition("CLASSE.THEO3", "10","A","")
    EB.Template.FieldSetcheckfile("RISK.CLASS")
    EB.Template.TableAddfielddefinition("CLASSE.THEORIQUE", "10","A","")
    EB.Template.FieldSetcheckfile("RISK.CLASS")
    EB.Template.TableAddfielddefinition("CLASSE.FORCEE", "10","A","")
    EB.Template.FieldSetcheckfile("RISK.CLASS")
    EB.Template.TableAddfielddefinition("CLASSE.REELLE", "10","A","")
    EB.Template.FieldSetcheckfile("RISK.CLASS")
    EB.Template.TableAddfielddefinition("DATE.ENVOI", "8","D","")

**RESERVED
    EB.Template.TableAddfielddefinition("CLASSE.REELLE.PRC", "10","A","")
    EB.Template.FieldSetcheckfile("RISK.CLASS")
    EB.Template.TableAddfielddefinition("RESERVED.2", "10","A","")
    EB.Template.TableAddfielddefinition("RESERVED.3", "10","A","")
    EB.Template.TableAddfielddefinition("RESERVED.4", "10","A","")
    EB.Template.TableAddfielddefinition("RESERVED.5", "10","A","")
    EB.Template.TableAddfielddefinition("RESERVED.6", "10","A","")
    EB.Template.TableAddfielddefinition("RESERVED.7", "10","A","")
    EB.Template.TableAddfielddefinition("RESERVED.8", "10","A","")
    EB.Template.TableAddfielddefinition("RESERVED.9", "10","A","")
    EB.Template.TableAddfielddefinition("RESERVED.10", "10","A","")
    EB.Template.TableAddfielddefinition("RESERVED.11", "10","A","")
    EB.Template.TableAddfielddefinition("RESERVED.12", "10","A","")
    EB.Template.TableAddfielddefinition("RESERVED.13", "10","A","")
    EB.Template.TableAddfielddefinition("RESERVED.14", "10","A","")
    EB.Template.TableAddfielddefinition("RESERVED.15", "10","A","")
    EB.Template.TableAddfielddefinition("RESERVED.16", "10","A","")
    EB.Template.TableAddfielddefinition("RESERVED.17", "10","A","")
    EB.Template.TableAddfielddefinition("RESERVED.18", "10","A","")
    EB.Template.TableAddfielddefinition("RESERVED.19", "10","A","")
    EB.Template.TableAddfielddefinition("RESERVED.20", "10","A","")

    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
