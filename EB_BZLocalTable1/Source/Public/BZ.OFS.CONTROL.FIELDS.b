* @ValidationCode : MjoxMjQ2MTI0ODU1OkNwMTI1MjoxNjAwNDc5MjI1OTg3OkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTp0cnVlOk4vQTpSMTlfQU1SLjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 19 Sep 2020 02:33:45
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
SUBROUTINE BZ.OFS.CONTROL.FIELDS
*-----------------------------------------------------------------------------
*<doc>
* TODO add a description of the application here.
* @author ktalhaoui@temenos.com
* @stereotype H
*
*
*-----------------------------------------------------------------------------
* TODO - You MUST write a .FIELDS routine for the field definitions
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------
* 09 / 03 / 10 - ktalhaoui New Template changes
*ZIT-UPG-R13-R19 :   removed BP's and changed INCLUDE to INSERT
*                    FM converted to @FM
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
    EB.Template.TableDefineid("ID", "" : @FM : "70" : @FM : "A")    ;* REF CHEQUE
*-----------------------------------------------------------------------------
    EB.Template.TableAddfielddefinition("REF.OFS","35", "A", "")

    EB.Template.TableAddfielddefinition("STATUT","2", "A", "")

    EB.Template.TableAddfielddefinition("REF.TRANS","35", "A", "")

    EB.Template.TableAddfielddefinition("ERREUR.MESSAGE","512", "A", "")

    EB.Template.TableAddfielddefinition("OFS.MESSAGE","512", "A", "")

    EB.Template.TableAddfielddefinition("EVENEMENT","12", "A", "")

    EB.Template.TableAddfielddefinition("DB.DEVISE","3", "A", "")

    EB.Template.TableAddfielddefinition("DB.COMPTE","10", "ACC", "")

    EB.Template.TableAddfielddefinition("CR.DEVISE","3", "A", "")

    EB.Template.TableAddfielddefinition("CR.COMPTE","10", "ACC", "")

    EB.Template.TableAddamountfield("AMOUNT","15", T24_NUMERIC, "")
    EB.Template.TableAddfielddefinition("DEVISE.AMOUNT","3", "A", "")

    EB.Template.TableAddfielddefinition("CODE.TRANSACTION","5", "A", "")

    EB.Template.TableAddfielddefinition("DOMAINE","15", "A", "")
*-----------------------------------------------------------------------------
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
