* @ValidationCode : MjotNzU4MDgxOTU3OkNwMTI1MjoxNjAwNDc5MTYxMzA5OkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTp0cnVlOk4vQTpSMTlfQU1SLjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 19 Sep 2020 02:32:41
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
SUBROUTINE BZ.MDP.GENERATEUR.FICHIER.FIELDS
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
*ZIT-UPG-R13-R19 :  removed BP's and changed INCLUDE to INSERT
*                   FM converted to @FM
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
    EB.Template.TableDefineid("ID", "" : @FM : "12" : @FM : "A")

*-----------------------------------------------------------------------------
    EB.Template.TableAddfielddefinition("CONTROL.SEUIL","3","":@FM:"OUI_NON","")
    EB.Template.TableAddfielddefinition("XX<CODE.VALEUR","2","","")
    EB.Template.TableAddfielddefinition("XX-NOMBRE.TOTAL","6","","")
    EB.Template.TableAddfielddefinition("XX-NOMBRE.INTER","6","","")
    EB.Template.TableAddfielddefinition("XX-NOMBRE.INTRA","6","","")
    EB.Template.TableAddfielddefinition("XX>INCLUS","3","":@FM:"OUI_NON","")
    EB.Template.TableAddfielddefinition("XX.COMMENTAIRE","65","A","")
*-----------------------------------------------------------------------------
    EB.Template.TableAddoverridefield()
    EB.Template.TableAddlocalreferencefield("")
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
