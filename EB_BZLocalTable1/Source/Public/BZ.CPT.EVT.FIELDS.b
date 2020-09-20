*-----------------------------------------------------------------------------
* <Rating>-3</Rating>
*-----------------------------------------------------------------------------
     $PACKAGE EB.BZLocalTable1
    SUBROUTINE BZ.CPT.EVT.FIELDS
*-----------------------------------------------------------------------------
*<doc>
* TODO add a description of the application here.
* @author FEHMI
* @stereotype H
**
*-----------------------------------------------------------------------------
* TODO - You MUST write a .FIELDS routine for the field definitions
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------
*ZIT-UPG-R13-R19     :  Converted FM TO @FM.
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
    EB.Template.TableDefineid("ID", "" : @FM : "5" : @FM : "A") ;
*-----------------------------------------------------------------------------
    EB.Template.TableAddfielddefinition("DESCRIPTION","35", "A", "")
    EB.Template.TableAddfielddefinition("CODE.TRANSACTION","4", "A", "")
    EB.Template.FieldSetcheckfile("FT.TXN.TYPE.CONDITION")
    EB.Template.TableAddfielddefinition("DB.COMPTE","16", "A", "")
* CALL Field.setCheckFile("ACCOUNT")
    EB.Template.TableAddfielddefinition("CR.COMPTE","16", "A", "")
*    CALL Field.setCheckFile("ACCOUNT")
    EB.Template.TableAddfielddefinition("STATUT","35", "A", "")
    EB.Template.FieldSetcheckfile("BZ.TRAIT.STATUT")
    EB.Template.TableAddfielddefinition("ECRAN","80", "A", "")
    EB.Template.FieldSetcheckfile("VERSION")
    EB.Template.TableAddfielddefinition("COMMISSION","3", "":@FM:"_OUI", "")
    EB.Template.TableAddfielddefinition("CODE.COMMISSION","30", "A", "")
    EB.Template.FieldSetcheckfile("FT.COMMISSION.TYPE")
    EB.Template.TableAddfielddefinition("CODE.TXN.AVIS","4", "A", "")
    EB.Template.FieldSetcheckfile("FT.TXN.TYPE.CONDITION")
*-----------------------------------------------------------------------------

    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
    RETURN
*-----------------------------------------------------------------------------
END
