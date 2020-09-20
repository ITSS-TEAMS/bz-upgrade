* @ValidationCode : Mjo3NTIwMTM5MTY6Q3AxMjUyOjE2MDA0NzkzNDM1ODE6QWRtaW5pc3RyYXRldXI6LTE6LTE6MDoxOnRydWU6Ti9BOlIxOV9BTVIuMDotMTotMQ==
* @ValidationInfo : Timestamp         : 19 Sep 2020 02:35:43
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
* <Rating>-1</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable1
SUBROUTINE BZ.TRANSACTION.ONLINE.FIELDS
*-----------------------------------------------------------------------------
*<doc>
* TODO add a description of the application here.
* @author BOUNOUARA FEHMI
* @stereotype H
*
*
*-----------------------------------------------------------------------------
* TODO - You MUST write a .FIELDS routine for the field definitions
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------
*ZIT-UPG-R13-R19    : FM CHANGED TO @FM
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
    EB.Template.TableDefineid("ID", "" : @FM : "60" : @FM : "A")
*-----------------------------------------------------------------------------

    EB.Template.TableAddfielddefinition("DATE.SYSTEME","8", "D", "")

    EB.Template.TableAddfielddefinition("DATE.AUT","8", "D", "")
    EB.Template.TableAddfielddefinition("FT.AUT","16", "A", "")
    EB.Template.TableAddfielddefinition("REF.AUT","60", "A", "")

    EB.Template.TableAddfielddefinition("DATE.ANL","8", "D", "")
    EB.Template.TableAddfielddefinition("FT.ANL","16", "A", "")
    EB.Template.TableAddfielddefinition("REF.ANL","60", "A", "")


    EB.Template.TableAddfielddefinition("RESERVED.1","50", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED.2","50", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED.3","50", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED.4","50", "A", "")

*-----------------------------------------------------------------------------
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
