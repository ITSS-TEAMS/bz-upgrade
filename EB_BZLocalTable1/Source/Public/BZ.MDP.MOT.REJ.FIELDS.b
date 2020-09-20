* @ValidationCode : MjotMTc2OTQwOTM4NzpDcDEyNTI6MTYwMDQ3OTE2ODQxMzpBZG1pbmlzdHJhdGV1cjotMTotMTowOjE6dHJ1ZTpOL0E6UjE5X0FNUi4wOi0xOi0x
* @ValidationInfo : Timestamp         : 19 Sep 2020 02:32:48
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
SUBROUTINE BZ.MDP.MOT.REJ.FIELDS
*-------------------------------------------------------------------------
*<doc>
* TODO add a description of the application here.
* @author bounouara fehmi
* @stereotype H
*
*-------------------------------------------------------------------------
* Modification History :
*-----------------------
*ZIT-UPG-R13-R19 : FM CHANGED TO @FM
* ------------------------------------------------------------------------

*** <region name= Header>
*** <desc>Inserts and control logic</desc>
*ZIT-UPG-R13-R19/S
* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;
* $INSERT I_DataTypes - Not Used anymore;

    $USING EB.API
    $USING EB.SystemTables
    $USING EB.Template
*ZIT-UPG-R13-R19/E
*** </region>
*-------------------------------------------------------------------------
    EB.Template.TableDefineid("ID.MOTIF", "" : @FM : "2":@FM:"A")   ;* Define Tabl
*-------------------------------------------------------------------------

    EB.Template.TableAddfielddefinition("DESCRIPTION","35","A","")
    EB.Template.TableAddfielddefinition("REPR","3", "" : @FM : "YES_NO_", "")



*-------------------------------------------------------------------------
    EB.Template.TableAddlocalreferencefield("")
    EB.Template.TableAddoverridefield()
*-------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-------------------------------------------------------------------------
RETURN
*-------------------------------------------------------------------------
END
