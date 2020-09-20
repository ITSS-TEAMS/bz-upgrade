* @ValidationCode : MjoxMTMwODMxMzUwOkNwMTI1MjoxNjAwNDc5MDkzODUzOkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTp0cnVlOk4vQTpSMTlfQU1SLjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 19 Sep 2020 02:31:33
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
*<Rating></Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable1
SUBROUTINE BZ.GEN.STMT.DETAIL.PARAM.FIELDS
*-----------------------------------------------------------------------------
*********************************************************************
* @author    HAMZA BENALI
* @Mail      hamza.benali@gmail.com
* @desc      THIS IS AN AUTO-GENERATED ROUTINE
* @desc      BZ.GEN.STMT.DETAIL.PARAM TEMPLATE - (TEMPLATE GENERATOR TOOL)
* @create    13/01/2016 11:20:11
*********************************************************************
*ZIT-UPG-R13-R19:
* FM converted to @FM.
*-----------------------------------------------------------------------------
*** <region name= Header>
* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;
* $INSERT I_DataTypes - Not Used anymore;
    $USING EB.SystemTables
    $USING EB.API
    $USING EB.Template
*** </region>
*-----------------------------------------------------------------------------
* <Main controlling section>
*----------------------------------------------------------------------

    GOSUB INITIALISATION
    GOSUB MAIN.PROCESS

RETURN
*---------------------------------------------------------------------------
INITIALISATION:
*file opening, variable set up

RETURN
*---------------------------------------------------------------------------
MAIN.PROCESS:
*main subroutine processing

    EB.Template.TableDefineid("ID", "" : @FM : "10" : @FM : "A")    ;* Define Table id

    EB.Template.TableAddfielddefinition("XX<ACCOUNT.ID","16.1","ANT","")
    EB.Template.FieldSetcheckfile("ACCOUNT")

    EB.Template.TableAddoptionsfield("XX-GEN.MONTHLY",'YES_NO',Field,'')       ;*

    EB.Template.TableAddoptionsfield("XX-GEN.DAILY",'YES_NO',Field,'')       ;*

    EB.Template.TableAddfielddefinition("XX>REPORT.ID","35.1","A","")
    EB.Template.FieldSetcheckfile("REPORT.CONTROL")

    EB.Template.TableAddfielddefinition("ONLINE.DATE","8","D","")

    EB.Template.TableAddlocalreferencefield("")
    EB.Template.TableAddoverridefield()
    EB.Template.TableSetauditposition()         ;* Poputale audit information
RETURN
* ----------------------------------------------------------------------------
END
