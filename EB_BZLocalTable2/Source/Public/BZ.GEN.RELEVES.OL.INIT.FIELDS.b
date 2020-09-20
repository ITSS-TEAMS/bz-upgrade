* @ValidationCode : Mjo3NTAxMDg4NzY6Q3AxMjUyOjE2MDA0ODQ3MTk1OTE6QWRtaW5pc3RyYXRldXI6LTE6LTE6MDoxOnRydWU6Ti9BOlIyMF9TUDQuMDotMTotMQ==
* @ValidationInfo : Timestamp         : 19 Sep 2020 04:05:19
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
*<Rating></Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable2
SUBROUTINE BZ.GEN.RELEVES.OL.INIT.FIELDS
*-----------------------------------------------------------------------------
*********************************************************************
* @author    HAMZA BENALI
* @Mail      hamza.benali@gmail.com
* @desc      THIS IS AN AUTO-GENERATED ROUTINE
* @desc      BZ.GEN.RELEVES.OL.INIT TEMPLATE - (TEMPLATE GENERATOR TOOL)
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

*    GOSUB INITIALISATION    ;*NOT NEEDED FOR FIELDS RTN
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
    EB.Template.TableAddfielddefinition("XX.ACCOUNT.ID","12.1","A","")      ;*
    EB.Template.FieldSetcheckfile("ACCOUNT")
    EB.Template.TableAddfielddefinition("GEN.START.DATE","8.1","D","")      ;*
    EB.Template.TableAddfielddefinition("GEN.END.DATE","8.1","D","")        ;*
    EB.Template.TableAddfielddefinition("WORK.LOAD.PRF","30.1","A","")      ;*
    EB.Template.FieldSetcheckfile("TSA.WORKLOAD.PROFILE")
    EB.Template.TableAddfielddefinition("GEN.PATH","60","A" : @FM : "" : @FM : "NOINPUT","")

    EB.Template.TableAddlocalreferencefield("")
    EB.Template.TableAddoverridefield()
    EB.Template.TableSetauditposition()         ;* Poputale audit information

RETURN
* ----------------------------------------------------------------------------
END
