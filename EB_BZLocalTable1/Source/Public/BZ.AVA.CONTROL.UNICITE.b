*-----------------------------------------------------------------------------
* <Rating>0</Rating>
*-----------------------------------------------------------------------------
    $PACKAGE EB.BZLocalTable1
    SUBROUTINE BZ.AVA.CONTROL.UNICITE
*-----------------------------------------------------------------------------
*<doc>
* TODO add a description of the application here.
* @author ZIED BEN YOUSSEF
* @stereotype H
*
*-----------------------------------------------------------------------------
* Modification History :  
*ZIT-UPG-R13-R19     :  No Changes.  
* ----------------------------------------------------------------------------
* <region name= Inserts>
* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;
* $INSERT I_Table - Not Used anymore;
$USING EB.SystemTables
$USING EB.API
$USING EB.Template
* </region>  
*-----------------------------------------------------------------------------
 
    EB.Template.setTableName('BZ.AVA.CONTROL.UNICITE')
    EB.Template.setTableTitle('BZ.AVA.CONTROL.UNICITE')
    EB.Template.setTableStereotype('H')
    EB.Template.setTableProduct('ST')
    EB.Template.setTableSubproduct('')
    EB.Template.setTableClassification('CUS')
    EB.Template.setTableSystemclearfile('Y')
    EB.Template.setTableRelatedfiles('')
    EB.Template.setTableIspostclosingfile('')
    EB.Template.setTableEquateprefix('AVA.UNI')
*-----------------------------------------------------------------------------
    EB.Template.setTableBlockedfunctions('') 
    Table.trigger = ''
*-----------------------------------------------------------------------------
    RETURN
 
END
 