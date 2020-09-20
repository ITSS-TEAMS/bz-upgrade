* @ValidationCode : MjotMTQzMDY5NzQxOkNwMTI1MjoxNjAwNDc5MjI2MTY5OkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTp0cnVlOk4vQTpSMThfQU1SLjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 19 Sep 2020 02:33:46
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : Administrateur
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : true
* @ValidationInfo : Bypass GateKeeper : true
* @ValidationInfo : Compiler Version  : R18_AMR.0
*-----------------------------------------------------------------------------
* <Rating>-5</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable1
SUBROUTINE BZ.PACK.DEFINITION.FIELDS
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
*MODIFICATION HISTORY:
*ZIT-UPG-R13-R19-FM TO @FM
*-----------------------------------------------------------------------------

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
    EB.Template.TableDefineid("ID", "" : @FM : "16" : @FM : "A")
*-----------------------------------------------------------------------------
    EB.Template.TableAddfielddefinition("DESCRIPTION", "35","A","")

    EB.Template.TableAddyesnofield("ACCOUNT", "", "")
    EB.Template.TableAddyesnofield("CARD", "", "")
    EB.Template.TableAddyesnofield("TPE", "", "")
    EB.Template.TableAddyesnofield("TAWASSOOL", "", "")

    EB.Template.TableAddvirtualtablefield("CARD.TYPE", "CARD.TYPES", "" , "")
    EB.Template.TableAddoptionsfield("TPE.TYPE", "FIXE_MOBILE",""  , "")

    EB.Template.TableAddfielddefinition("XX.TARGET","10.1" ,"A","")
    EB.Template.FieldSetcheckfile('TARGET')

    EB.Template.TableAddfielddefinition("XX.CATEGORY","10.1" ,"A","")
    EB.Template.FieldSetcheckfile('CATEGORY')

    EB.Template.TableAddoptionsfield("XX<FREQUENCY", "Mensuelle_Trimestrielle_Semestrielle_Annuelle", EB.Template.FieldMandatory, "")
    EB.Template.TableAddfielddefinition("XX>CHARGE.KEY", "20.1","A","")
    EB.Template.FieldSetcheckfile('IC.CHARGE.PRODUCT')


**RESERVED
    EB.Template.TableAddyesnofield("ACTIVE", "", "")
    EB.Template.TableAddfielddefinition("GROUP.AC", "5","A","")
    EB.Template.FieldSetcheckfile('ACCT.GEN.CONDITION')
    EB.Template.TableAddfielddefinition("FRAIS.ANN", "19","AMT","")
    EB.Template.TableAddfielddefinition("RESERVED.4", "10","A","")
    EB.Template.TableAddfielddefinition("RESERVED.5", "10","A","")
    EB.Template.TableAddfielddefinition("RESERVED.6", "10","A","")
    EB.Template.TableAddfielddefinition("RESERVED.7", "10","A","")
    EB.Template.TableAddfielddefinition("RESERVED.8", "10","A","")

*-----------------------------------------------------------------------------
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
