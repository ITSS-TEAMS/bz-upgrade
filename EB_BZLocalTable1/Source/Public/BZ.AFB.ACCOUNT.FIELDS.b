* @ValidationCode : Mjo2MDI2NDk5NzI6Q3AxMjUyOjE2MDA0Nzg5MjQ1MDI6QWRtaW5pc3RyYXRldXI6LTE6LTE6MDoxOnRydWU6Ti9BOlIxOV9BTVIuMDotMTotMQ==
* @ValidationInfo : Timestamp         : 19 Sep 2020 02:28:44
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
SUBROUTINE BZ.AFB.ACCOUNT.FIELDS
*-----------------------------------------------------------------------------
*<doc>
* TODO add a description of the application here.

*
*
*-----------------------------------------------------------------------------
* TODO - You MUST write a .FIELDS routine for the field definitions
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------
*ZIT_UPG_R13_TO_R19   :changed FM
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
    EB.Template.TableDefineid("ID", "" : @FM : "10" : @FM : "A")
*-----------------------------------------------------------------------------

    EB.Template.TableAddfielddefinition("AFB.ACCOUNT","10", "A", "")
    EB.Template.FieldSetcheckfile("ACCOUNT")
	EB.Template.TableAddfielddefinition("CODE.CLIENT","10", "A", "")
	EB.Template.FieldSetcheckfile("CUSTOMER")
    EB.Template.TableAddfielddefinition("DATE.CREATION","8", "D", "")
    EB.Template.TableAddfielddefinition("ADR.MAIL","60", "A", "")
	
    EB.Template.TableAddfielddefinition("RESERVED.1","35", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED.2","35", "A", "")
	EB.Template.TableAddfielddefinition("RESERVED.3","35", "A", "")
	EB.Template.TableAddfielddefinition("RESERVED.4","35", "A", "")
	EB.Template.TableAddfielddefinition("RESERVED.5","35", "A", "")
	EB.Template.TableAddfielddefinition("RESERVED.6","35", "A", "")
	EB.Template.TableAddfielddefinition("RESERVED.7","35", "A", "")
	EB.Template.TableAddfielddefinition("RESERVED.8","35", "A", "")

    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
