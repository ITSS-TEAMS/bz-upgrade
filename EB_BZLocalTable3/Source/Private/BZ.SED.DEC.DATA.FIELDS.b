* @ValidationCode : MjoyMDUzMDUzNjI2OkNwMTI1MjoxNjAwNTYyNzUzODA1OkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTp0cnVlOk4vQTpSMjBfU1A0LjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 20 Sep 2020 01:45:53
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
SUBROUTINE BZ.SED.DEC.DATA.FIELDS
*-----------------------------------------------------------------------------
*<doc>
* TODO add a description of the application here.
* @DEVT24@BANQUEZITOUNA
*
*
*
*-----------------------------------------------------------------------------
* TODO - You MUST write a .FIELDS routine for the field definitions
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------
* 08 / 07 / 2010

*ZIT-UPG-R13-R19:FM converted to @FM
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
    EB.Template.TableDefineid("ID", "" : @FM : "90" : @FM : "A")
*-----------------------------------------------------------------------------

    EB.Template.TableAddfielddefinition("DATE.DENOUMENT","8", "D", "")
    EB.Template.TableAddfielddefinition("INTER.AGREE","2", "A", "")
    EB.Template.TableAddfielddefinition("NAT.OPERATION","2", "A", "")
    EB.Template.TableAddfielddefinition("DEV.OPERATION","3", "A", "")
    EB.Template.FieldSetcheckfile("CURRENCY")
    EB.Template.TableAddfielddefinition("CODE.RIO","2", "A", "")
    EB.Template.TableAddfielddefinition("NUM.RIO","15", "A", "")
    EB.Template.TableAddfielddefinition("DATE.RIO","8", "D", "")
    EB.Template.TableAddfielddefinition("PAYS","3", "A", "")
    EB.Template.FieldSetcheckfile("COUNTRY")
    EB.Template.TableAddfielddefinition("CODE.BP","4", "A", "")
    EB.Template.TableAddfielddefinition("IA.ANNEE","4", "A", "")
    EB.Template.TableAddfielddefinition("MONTANT.DEVISE","15", "AMT", "")
    EB.Template.TableAddfielddefinition("MONTANT.TND","15", "AMT", "")
    EB.Template.TableAddfielddefinition("TYPE.CMP.DEV","1", "A", "")
    EB.Template.TableAddfielddefinition("INTER.AGREE.2","2", "A", "")
    EB.Template.TableAddfielddefinition("DTE.VAL.CORR","8", "D", "")
    EB.Template.TableAddfielddefinition("CODE.DOUANE","8", "A", "")


*-----------------------------------------------------------------------------
    EB.Template.TableAddfielddefinition("CODE.CMP.DEV","20", "A", "")
    EB.Template.TableAddfielddefinition("CONTRE.VAL.TND","15", "A", "")
    EB.Template.TableAddfielddefinition("CUSTOMER","10", "A", "")
    EB.Template.TableAddfielddefinition("ACCOUNT","10", "A", "")
    EB.Template.TableAddfielddefinition("DATE.OPERATION","8", "D", "")
    EB.Template.TableAddfielddefinition("RESERVED.6","10", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED.7","10", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED.8","10", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED.9","10", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED.10","10", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED.11","10", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED.12","10", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED.13","10", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED.14","10", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED.15","10", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED.16","10", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED.17","10", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED.18","10", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED.19","10", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED.20","10", "A", "")
*-----------------------------------------------------------------------------
    EB.Template.TableAddlocalreferencefield("")
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
