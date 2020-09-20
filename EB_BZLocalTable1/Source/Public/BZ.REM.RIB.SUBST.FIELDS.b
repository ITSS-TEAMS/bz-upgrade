* @ValidationCode : MjotMjkyNzgzNjU0OkNwMTI1MjoxNjAwNDc5MjUxMTU5OkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTp0cnVlOk4vQTpSMTlfQU1SLjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 19 Sep 2020 02:34:11
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
* <Rating>-3</Rating>
*-----------------------------------------------------------------------------
*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13  : $INSERT GLOBUS.BP to $INCLUDE ../T24_BP
*ZIT-UPG-R13-R19  : FM CHANGED TO @FM
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable1
SUBROUTINE BZ.REM.RIB.SUBST.FIELDS
*-----------------------------------------------------------------------------
*<doc>
* TODO add a description of the application here.
* @author Anas Zdadou
* @stereotype H
*
*
*-----------------------------------------------------------------------------
* TODO - You MUST write a .FIELDS routine for the field definitions
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------
* 24 / 04 / 2010 - azdadou@temenos.com New Template changes
* ----------------------------------------------------------------------------
*** <region name= Header>
*** <desc>Inserts and control logic</desc>
*ZIT-UPG-R09-R13/S
*$INSERT GLOBUS.BP I_COMMON
*$INSERT GLOBUS.BP I_EQUATE
*$INSERT GLOBUS.BP I_DataTypes
* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;
* $INSERT I_DataTypes - Not Used anymore;
    $USING EB.SystemTables
    $USING EB.API
    $USING EB.Template
    
*ZIT-UPG-R09-R13/E
*** </region>

*-----------------------------------------------------------------------------
*CALL Table.defineId("ID",T24_String) ;* Define Table id
*CALL Table.defineId("ID", "" : @FM : "20" : @FM : "A") ;
    EB.Template.TableDefineid("%BZ.REM.RIB.SUBST", EB.Template.T24Numeric : @FM : "20") ;* Define Table id
*-----------------------------------------------------------------------------
*CALL Table.addFieldDefinition("ID", "27", "A", "")
    EB.Template.FieldSetcheckfile('ALTERNATE.ACCOUNT')
    EB.Template.TableAddfielddefinition("RIB.SUBSTITUT", "20", "A", "")
    EB.Template.FieldSetcheckfile('ALTERNATE.ACCOUNT')
    EB.Template.TableAddfielddefinition("DATE.PROCESS", "8", "D", "")



*-----------------------------------------------------------------------------
    EB.Template.TableAddlocalreferencefield("")
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
