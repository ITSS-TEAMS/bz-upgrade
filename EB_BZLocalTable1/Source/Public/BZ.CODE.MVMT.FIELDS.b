* @ValidationCode : MjotMzA4NTg0NjU5OkNwMTI1MjoxNjAwNDc4OTY4NTU4OkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTp0cnVlOk4vQTpSMTlfQU1SLjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 19 Sep 2020 02:29:28
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
SUBROUTINE BZ.CODE.MVMT.FIELDS
*-----------------------------------------------------------------------------
* Modification histroy:
*ZIT-UPG-R13-R19:  Converted FM TO @FM.
*---------------------------------------------
* TODO - You MUST write a .FIELDS routine for the field definitions
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
    EB.Template.TableDefineid("ID", "" : @FM : "20" : @FM : "A")
*-----------------------------------------------------------------------------
    EB.Template.TableAddfielddefinition("DESCRIPTION","35", "A", "")
    EB.Template.TableAddfielddefinition("CODE.TRAITEMENT","35", "A", "")
    EB.Template.FieldSetcheckfile('BZ.TYPE.TRAITEMENT')
    EB.Template.TableAddfielddefinition("SENS","1", "" : @FM : "D_C", "")
    EB.Template.TableAddfielddefinition("CODE.TRANSACTION","4", "", "")
    EB.Template.FieldSetcheckfile('TRANSACTION')
    EB.Template.TableAddfielddefinition("DATE.VALEUR","2", "", "")
    EB.Template.TableAddfielddefinition("COMPTE","20", "A", "")
*  CALL Field.setCheckFile('ACCOUNT')
*-----------------------------------------------------------------------------
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
