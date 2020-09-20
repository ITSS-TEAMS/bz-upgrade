* @ValidationCode : MjotNzkwMzkyNTUxOkNwMTI1MjoxNjAwNDc5MDcxNDI2OkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTp0cnVlOk4vQTpSMTlfQU1SLjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 19 Sep 2020 02:31:11
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : Administrateur
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : true
* @ValidationInfo : Bypass GateKeeper : true
* @ValidationInfo : Compiler Version  : R19_AMR.0
* Modification History :
*-----------------------
*ZIT_UPG_R13_TO_R19 : CHANGE FM TO @FM
*-----------------------------------------------------------------------------
*<Rating></Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable1
SUBROUTINE BZ.GEN.REL.CUS.INIT.FIELDS
*-----------------------------------------------------------------------------
*********************************************************************
* @author    HAMZA BENALI
* @Mail      hamza.benali@gmail.com
* @desc      THIS IS AN AUTO-GENERATED ROUTINE
* @desc      BZ.GEN.REL.CUS.INIT TEMPLATE - (TEMPLATE GENERATOR TOOL)
* @create    13/01/2016 11:20:11
*********************************************************************
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
    EB.Template.TableAddfielddefinition("STATUS","10","" : @FM : "PROCESSING_COMPLETED_" : @FM : "NOINPUT","")        ;*
    EB.Template.TableAddfielddefinition("PROCESS.TYPE","10","" : @FM : "NONE_ONLINE_BATCH_" : @FM : "","")  ;*
    EB.Template.TableAddfielddefinition("XX<START.CATEGORY","5","","")      ;*
    EB.Template.FieldSetcheckfile("CATEGORY")
    EB.Template.TableAddfielddefinition("XX-END.CATEGORY","5","","")
    EB.Template.FieldSetcheckfile("CATEGORY")
    EB.Template.TableAddfielddefinition("XX>XX.EXCL.CATEGORY","5","","")
    EB.Template.FieldSetcheckfile("CATEGORY")

    EB.Template.TableAddfielddefinition("XX.CATEG","5","","")
    EB.Template.FieldSetcheckfile("CATEGORY")
    EB.Template.TableAddfielddefinition("XX.ACCT.ID","15","A","")
    EB.Template.FieldSetcheckfile("ACCOUNT")

    EB.Template.TableAddfielddefinition("GEN.START.DATE","8.1","D","")      ;*
    EB.Template.TableAddfielddefinition("GEN.END.DATE","8.1","D","")        ;*
    EB.Template.TableAddfielddefinition("GEN.PATH","60.1","A","") ;*

    EB.Template.TableAddfielddefinition("WORK.PROFILE","30.1","A","")       ;*
    EB.Template.FieldSetcheckfile("TSA.WORKLOAD.PROFILE")

    EB.Template.TableAddfielddefinition("LAST.STARTED","20","A" : @FM : "" : @FM : "NOINPUT","")  ;*
    EB.Template.TableAddfielddefinition("LAST.STOPPED","20","A" : @FM : "" : @FM : "NOINPUT","")  ;*
    EB.Template.TableAddfielddefinition("LAST.ELAPSED","20","A" : @FM : "" : @FM : "NOINPUT","")  ;*

    EB.Template.TableAddfielddefinition("NO.MVMT.GEN","3.1","" : @FM : "YES_NO" : @FM : "","")

    EB.Template.TableAddlocalreferencefield("")
    EB.Template.TableAddoverridefield()
    EB.Template.TableSetauditposition()         ;* Poputale audit information
RETURN
* ----------------------------------------------------------------------------
END
