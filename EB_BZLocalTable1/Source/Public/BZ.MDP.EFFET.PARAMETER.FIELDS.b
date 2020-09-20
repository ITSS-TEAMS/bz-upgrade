* @ValidationCode : MjoxNDUxNTg2Nzk6Q3AxMjUyOjE2MDA0NzkxNTQyMjU6QWRtaW5pc3RyYXRldXI6LTE6LTE6MDoxOnRydWU6Ti9BOlIxOV9BTVIuMDotMTotMQ==
* @ValidationInfo : Timestamp         : 19 Sep 2020 02:32:34
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
SUBROUTINE BZ.MDP.EFFET.PARAMETER.FIELDS
*-----------------------------------------------------------------------------
*<doc>
* TODO add a description of the application here.
* @FEHMI BOUNOUARA
* 20120403
*
*
*-----------------------------------------------------------------------------
* TODO - You MUST write a .FIELDS routine for the field definitions
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------
*ZIT-UPG-R13-R19 : FM TO @FM CHANGED
* ----------------------------------------------------------------------------
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

*-----------------------------------------------------------------------------
    EB.Template.TableDefineid("ID", "" : @FM : "35" : @FM : "A")

*-----------------------------------------------------------------------------
    EB.Template.TableAddfielddefinition("NBR.EFFET.GEN","12", "", "")
    EB.Template.TableAddfielddefinition("RESERVED.1","12", "", "")
    EB.Template.TableAddfielddefinition("RESERVED.2","12", "", "")
    EB.Template.TableAddfielddefinition("RESERVED.3","12", "", "")
    EB.Template.TableAddfielddefinition("RESERVED.4","12", "", "")
    EB.Template.TableAddfielddefinition("RESERVED.5","12", "", "")
    EB.Template.TableAddfielddefinition("RESERVED.6","12", "", "")
    EB.Template.TableAddfielddefinition("RESERVED.7","12", "", "")

    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
