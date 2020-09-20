*-----------------------------------------------------------------------------
* <Rating>-5</Rating>
*-----------------------------------------------------------------------------
     $PACKAGE EB.BZLocalTable1
      SUBROUTINE BZ.CODE.POSTAL.FIELDS
*-----------------------------------------------------------------------------
*<doc>
* Template for field definitions routine YOURAPPLICATION.FIELDS
*
* @author aelidrissi@temenos.com
* @stereotype fields template
* @uses Table
* @public Table Creation
* @package infra.eb
* </doc>
*-----------------------------------------------------------------------------
* Modification History :
*
* 19/10/07 - EN_10003543
*            New Template changes
*
* 14/11/07 - BG_100015736
*            Exclude routines that are not released
* ZIT-UPG-R13-R19 : $INCLUDE TO $INSERT, FM TO @FM
*-----------------------------------------------------------------------------
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
    EB.Template.TableDefineid("ID", EB.Template.T24Numeric : @FM : "4") ;* Define Table id
*-----------------------------------------------------------------------------
    EB.Template.TableAddfielddefinition("KCPOST", "4", "", "") ;* Add a new field
    EB.Template.TableAddfielddefinition("KGOUV.DELEG", "4", "", "") ;* Add a new field
    EB.Template.TableAddfielddefinition("LOCALITE", "60", "A", "") ;* Add a new field
    EB.Template.TableAddlocalreferencefield("")
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition() ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END