* @ValidationCode : MjotMTIwNTE3MzYwNjpDcDEyNTI6MTYwMDQ3OTIyNjU0NjpBZG1pbmlzdHJhdGV1cjotMTotMTowOjE6dHJ1ZTpOL0E6UjE5X0FNUi4wOi0xOi0x
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
SUBROUTINE BZ.PREF.DATE.VALEUR.FIELDS
*-------------------------------------------------------------------------
*<doc>
* TODO add a description of the application here.
* @author bounouara fehmi
* @stereotype H
*
*-------------------------------------------------------------------------
* Modification History :
*-----------------------
*ZIT-UPG-R13-R19  : FM CHANGED TO @FM
* ------------------------------------------------------------------------

*** <region name= Header>
*** <desc>Inserts and control logic</desc>
* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;
* $INSERT I_DataTypes - Not Used anymore;
    $USING EB.SystemTables
    $USING EB.API
    $USING EB.Template
*** </region>
*-------------------------------------------------------------------------
    EB.Template.TableDefineid("ID", "" : @FM : "10":@FM:"CUS" )    ;* Define Table id
    EB.Template.FieldSetcheckfile("CUSTOMER")
*-------------------------------------------------------------------------
    EB.Template.TableAddfielddefinition("XX<APPLICATION","25","A","")
    EB.Template.FieldSetcheckfile("FILE.CONTROL")
    EB.Template.TableAddfielddefinition("XX-CODE.OPERATION","8","A","")
    EB.Template.TableAddfielddefinition("XX-SENS","1", "" : @FM : "D_C", "")
    EB.Template.TableAddfielddefinition("XX>DATE.VALEUR","2", "" : @FM : "-1_-2_-3_-4_-5_0_1_2_3_4_5", "")
    EB.Template.TableAddfielddefinition("NOM.PRENOM","35","A" : @FM : "" : @FM : "NOINPUT","")
    EB.Template.TableAddfielddefinition("RATE.PREF","10", "" : @FM : "BUY_MID_SELL", "")
    EB.Template.TableAddfielddefinition("RESERVED.3","10","A" : @FM : "" : @FM : "NOINPUT","")
    EB.Template.TableAddfielddefinition("RESERVED.4","10","A" : @FM : "" : @FM : "NOINPUT","")
*-------------------------------------------------------------------------
    EB.Template.TableAddlocalreferencefield("")
    EB.Template.TableAddoverridefield()
*-------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-------------------------------------------------------------------------
RETURN
*-------------------------------------------------------------------------
END
