* @ValidationCode : MjotOTkzMjczNTM4OkNwMTI1MjoxNjAwNDc5MzI3NzQ5OkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTp0cnVlOk4vQTpSMTlfQU1SLjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 19 Sep 2020 02:35:27
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
SUBROUTINE BZ.TL.REGISTRE.FIELDS
*-----------------------------------------------------------------------------
*<doc>
* TODO add a description of the application here.
* @author T24 TEAM
* @stereotype H
**
*-----------------------------------------------------------------------------
* TODO - You MUST write a .FIELDS routine for the field definitions
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------
*ZIT-UPG-R13-R19 : FM TO @FM
* ----------------------------------------------------------------------------
*** <region name= Header>
*** <desc>Inserts and control logic</desc>
*ZIT-UPG-R13-R19/S
* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;
* $INSERT I_DataTypes - Not Used anymore;
    
    $USING EB.API
    $USING EB.SystemTables
    $USING EB.Template
*ZIT-UPG-R13-R19/E
*** </region>

*-----------------------------------------------------------------------------
    EB.Template.TableDefineid("ID", "" : @FM : "35" : @FM : "A") ;
*-----------------------------------------------------------------------------
    EB.Template.TableAddfielddefinition("BANQUE.ACQUEREUR","4", "A", "")
    EB.Template.TableAddfielddefinition("REF.DAB","10", "A", "")
    EB.Template.TableAddfielddefinition("BANQUE.EMETTEUR","4", "A", "")
    EB.Template.TableAddfielddefinition("TYPE.MESSAGE","4", "A", "")
    EB.Template.TableAddfielddefinition("DATE.TRANS","6", "A", "")
    EB.Template.TableAddfielddefinition("HEURE","8", "A", "")
    EB.Template.TableAddfielddefinition("MONTANT","19", "A", "")
    EB.Template.TableAddfielddefinition("RESPONSE.CODE","3", "A", "")
    EB.Template.TableAddfielddefinition("DATE.CLOTURE","6", "A", "")

**RESERVED
    EB.Template.TableAddfielddefinition("STATUT","10", "A", "")
    EB.Template.TableAddfielddefinition("REF.FICHIER","25", "A", "")
    EB.Template.TableAddfielddefinition("DATE.CHARGEMENT","8", "D", "")
    EB.Template.TableAddfielddefinition("RESERVED4","10", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED5","10", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED6","10", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED7","10", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED8","10", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED9","10", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED10","10", "A", "")

*-----------------------------------------------------------------------------

    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
