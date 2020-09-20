* @ValidationCode : MjotNjU3OTY3ODE6Q3AxMjUyOjE2MDA0NzkwOTM3ODE6QWRtaW5pc3RyYXRldXI6LTE6LTE6MDoxOnRydWU6Ti9BOlIxOF9BTVIuMDotMTotMQ==
* @ValidationInfo : Timestamp         : 19 Sep 2020 02:31:33
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
*<Rating></Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable1
SUBROUTINE BZ.GEN.RELEVES.SETTING.FIELDS
*-----------------------------------------------------------------------------
*********************************************************************
* @author    HAMZA BENALI
* @Mail      hamza.benali@gmail.com
* @desc      THIS IS AN AUTO-GENERATED ROUTINE
* @desc      BZ.GEN.RELEVES.SETTING TEMPLATE - (TEMPLATE GENERATOR TOOL)
* @create    13/01/2016 11:20:11
*********************************************************************
*MODIFICATION HISTORY:
*ZIT-UPG-R13-R19-FM TO @FM
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

    EB.Template.TableDefineid("ID", "" : @FM : "15" : @FM : "A")    ;* Define Table id
    EB.Template.FieldSetcheckfile("ACCOUNT")
    EB.Template.TableAddfielddefinition("STATUS","10","" : @FM : "READY_PROCESSING_COMPLETED_","")         ;*
    EB.Template.TableAddfielddefinition("ALLOW.PROCESS","1.1","" : @FM : "B_O_N_","")  ;*    BATCH/ONLINE/NO
    EB.Template.TableAddfielddefinition("PRIORITY","10.1","A","")
    EB.Template.TableAddfielddefinition("GEN.START.DATE","8.1","D","")      ;*
    EB.Template.TableAddfielddefinition("GEN.END.DATE","8.1","D","")        ;*

    EB.Template.TableAddfielddefinition("XX<DATE.PROCESS","10","A" : @FM : "" : @FM : "NOINPUT","")         ;*
    EB.Template.TableAddfielddefinition("XX-STARTED","20","A" : @FM : "" : @FM : "NOINPUT","")    ;*
    EB.Template.TableAddfielddefinition("XX-STOPPED","20","A" : @FM : "" : @FM : "NOINPUT","")    ;*
    EB.Template.TableAddfielddefinition("XX>ELAPSED","20","A" : @FM : "" : @FM : "NOINPUT","")    ;*

    EB.Template.TableAddfielddefinition("LAST.RUN.DATE","10","A" : @FM : "" : @FM : "NOINPUT","") ;*
    EB.Template.TableAddfielddefinition("LAST.STARTED","20","A" : @FM : "" : @FM : "NOINPUT","")  ;*
    EB.Template.TableAddfielddefinition("LAST.STOPPED","20","A" : @FM : "" : @FM : "NOINPUT","")  ;*
    EB.Template.TableAddfielddefinition("LAST.ELAPSED","20","A" : @FM : "" : @FM : "NOINPUT","")  ;*

    EB.Template.TableAddlocalreferencefield("")
    EB.Template.TableAddoverridefield()
    EB.Template.TableSetauditposition()         ;* Poputale audit information

RETURN
* ----------------------------------------------------------------------------
END
