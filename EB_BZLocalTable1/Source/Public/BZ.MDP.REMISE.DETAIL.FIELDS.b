* @ValidationCode : MjozMzYwNTk0OTI6Q3AxMjUyOjE2MDA0NzkxOTY2MTI6QWRtaW5pc3RyYXRldXI6LTE6LTE6MDoxOnRydWU6Ti9BOlIxOV9BTVIuMDotMTotMQ==
* @ValidationInfo : Timestamp         : 19 Sep 2020 02:33:16
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
*----------------------
*ZIT-UPG-R13-R19    : FM CHANGED TO @FM
*-----------------------------------------------------------------------------
* <Rating>0</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable1
SUBROUTINE BZ.MDP.REMISE.DETAIL.FIELDS
*-----------------------------------------------------------------------------
*<doc>
* TODO add a description of the application here.

*
*
*-----------------------------------------------------------------------------
* TODO - You MUST write a .FIELDS routine for the field definitions
*-----------------------------------------------------------------------------

* ----------------------------------------------------------------------------

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
    EB.Template.TableDefineid("ID", "" : @FM : "12" : @FM : "A")

*-----------------------------------------------------------------------------

    EB.Template.TableAddfielddefinition("NOMBRE.TOTAL", "10","","")
    EB.Template.TableAddfielddefinition("NOMBRE.INTER", "10","","")
    EB.Template.TableAddfielddefinition("NOMBRE.INTRA", "10","","")
    EB.Template.TableAddfielddefinition("STATUT", "1","A","")
    EB.Template.TableAddfielddefinition("GENERER", "3","":@FM:"OUI_NON","")
    EB.Template.TableAddfielddefinition("CODE.VALEUR", "2","","")
    EB.Template.TableAddfielddefinition("ID.REGISTRE", "16","A","")
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
