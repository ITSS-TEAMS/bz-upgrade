* @ValidationCode : MjotODcwNjU2OTgyOkNwMTI1MjoxNjAwNDc4OTk5ODI0OkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTp0cnVlOk4vQTpSMTlfQU1SLjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 19 Sep 2020 02:29:59
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
* Modification History :

*ZIT-UPG-R13-R19 : FM CHANGED TO @FM
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable1
SUBROUTINE BZ.CUSTOMER.AVIS.FIELDS
*-----------------------------------------------------------------------------
*<doc>
* TODO add a description of the application here.
* AUTHOR : FEHMI BOUNOUARA

* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;
* $INSERT I_DataTypes - Not Used anymore;
    
    $USING EB.API
    $USING EB.SystemTables
    $USING EB.Template

*-----------------------------------------------------------------------------
    EB.Template.TableDefineid("ID", "" : @FM : "10" : @FM : "CUS")
*  CALL Table.addFieldDefinition("ID","60", "CUS", "")
    EB.Template.FieldSetcheckfile("CUSTOMER")
*-----------------------------------------------------------------------------
    EB.Template.TableAddfielddefinition("SEND.ADVICE","10", "":@FM:"YES_NO", "")
    EB.Template.TableAddfielddefinition("COMMENTAIRE","35", "A", "")


    EB.Template.TableAddfielddefinition("RESERVED.1","35", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED.2","35", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED.3","35", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED.4","35", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED.5","35", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED.6","35", "A", "")


    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
