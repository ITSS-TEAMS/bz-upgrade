* @ValidationCode : MjotMTg1Nzg0NTI1MDpDcDEyNTI6MTYwMDQ3OTA3MTY1NTpBZG1pbmlzdHJhdGV1cjotMTotMTowOjE6dHJ1ZTpOL0E6UjE5X0FNUi4wOi0xOi0x
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
*ZIT_UPG_R13_TO_R19 : FM CHANGED TO @FM
*-----------------------------------------------------------------------------
*<Rating></Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable1
SUBROUTINE BZ.GEN.RELEVES.INIT.FIELDS
*-----------------------------------------------------------------------------
*********************************************************************
* @author    HAMZA BENALI
* @Mail      hamza.benali@gmail.com
* @desc      THIS IS AN AUTO-GENERATED ROUTINE
* @desc      BZ.GEN.RELEVES.INIT TEMPLATE - (TEMPLATE GENERATOR TOOL)
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
    EB.Template.TableAddfielddefinition("XX<START.CATEGORY","5.1","","")    ;*
    EB.Template.FieldSetcheckfile("CATEGORY")
    EB.Template.TableAddfielddefinition("XX>END.CATEGORY","5.1","","")
    EB.Template.FieldSetcheckfile("CATEGORY")
    EB.Template.TableAddfielddefinition("GEN.START.DATE","8.1","D","")      ;*
    EB.Template.TableAddfielddefinition("GEN.END.DATE","8.1","D","")        ;*
    EB.Template.TableAddfielddefinition("BULK.LOT","2.1","","")   ;*
    EB.Template.TableAddfielddefinition("BULK.SPLIT","4.1","","") ;*
    EB.Template.TableAddfielddefinition("NB.TOP.CRITICAL","2.1","","")      ;*
    EB.Template.TableAddfielddefinition("WPRF.CRITICAL","30.1","A","")       ;*
    EB.Template.FieldSetcheckfile("TSA.WORKLOAD.PROFILE")
    EB.Template.TableAddfielddefinition("WPRF.LOT","30.1","A","")   ;*
    EB.Template.FieldSetcheckfile("TSA.WORKLOAD.PROFILE")
    EB.Template.TableAddfielddefinition("TOTAL.AGENTS","3","A" : @FM : "" : @FM : "NOINPUT","")
    EB.Template.TableAddfielddefinition("GEN.PATH","60.1","A","")       ;*
    EB.Template.TableAddlocalreferencefield("")
    EB.Template.TableAddoverridefield()
    EB.Template.TableSetauditposition()         ;* Poputale audit information

RETURN
* ----------------------------------------------------------------------------
END
