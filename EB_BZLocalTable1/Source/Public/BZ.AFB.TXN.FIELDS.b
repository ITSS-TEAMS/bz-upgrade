* @ValidationCode : MjoxMjg0NDgzMzk5OkNwMTI1MjoxNjAwNDc4OTI4NTM2OkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTp0cnVlOk4vQTpSMTlfQU1SLjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 19 Sep 2020 02:28:48
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
SUBROUTINE BZ.AFB.TXN.FIELDS
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
*ZIT-UPG-R13-R19 :  FM converted to @FM
* ----------------------------------------------------------------------------
*** <region name= Header>
*** <desc>Inserts and control logic</desc>
* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;
* $INSERT I_DataTypes - Not Used anymore;
    $USING EB.API
    $USING EB.SystemTables
    $USING EB.Template

  
*** </region>

*-----------------------------------------------------------------------------
    EB.Template.TableDefineid("ID", "" : @FM : "4" : @FM : "A")
*-----------------------------------------------------------------------------

    EB.Template.TableAddfielddefinition("T24.TXN","4", "A", "")
    EB.Template.FieldSetcheckfile("TRANSACTION")
	EB.Template.TableAddfielddefinition("LABEL.TXN","35", "A", "")
	EB.Template.TableAddfielddefinition("CODE.AFB","2", "A", "")
	EB.Template.TableAddfielddefinition("LABEL.AFB","35", "A", "")
	 
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
