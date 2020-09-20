* @ValidationCode : MjoyMDYwMDkwMDI3OkNwMTI1MjoxNjAwNDc4OTI0Mjc3OkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTp0cnVlOk4vQTpSMTlfQU1SLjA6LTE6LTE=
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
* <Rating>-2</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable1
SUBROUTINE BZ.ACCT.BALANCE.FIELDS
*-----------------------------------------------------------------------------
*<doc>
* TODO add a description of the application here.
* @DEVT24@BANQUEZITOUNA
*
*
*
*-----------------------------------------------------------------------------
* TODO - You MUST write a .FIELDS routine for the field definitions
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------
* 08 / 07 / 2010
*ZIT-UPG-R13-R19 : Converted FM TO @FM.
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
    EB.Template.TableDefineid("ID", "" : @FM : "90" : @FM : "A")
*-----------------------------------------------------------------------------
    EB.Template.TableAddfielddefinition("ACCOUNT.NUMBER","19", "A", "")
    EB.Template.FieldSetcheckfile("ACCOUNT")

    EB.Template.TableAddfielddefinition("DATE.BALANCE","11", "D", "")

* CALL Table.addFieldDefinition("BALANCE","30", "A", "")
    EB.Template.TableAddamountfield('BALANCE', '', EB.Template.FieldAllowNegative, '')

    EB.Template.TableAddfielddefinition("CATEGORY","6", "A", "")
    EB.Template.FieldSetcheckfile("CATEGORY")


    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
