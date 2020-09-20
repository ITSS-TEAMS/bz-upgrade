*-----------------------------------------------------------------------------
* <Rating>0</Rating>
*-----------------------------------------------------------------------------
     $PACKAGE EB.BZLocalTable1
    SUBROUTINE BZ.CPT.LOT.FIELDS
*-----------------------------------------------------------------------------
*Modification history :
*ZIT-UPG-R13-R19: Converted FM TO @FM.
*---------------------------------------------
* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;
* $INSERT I_DataTypes - Not Used anymore;
$USING EB.SystemTables
$USING EB.API
$USING EB.Template
*-----------------------------------------------------------------------------
    EB.Template.TableDefineid("ID", "" : @FM : "12" : @FM : "A")
*-----------------------------------------------------------------------------
    EB.Template.TableAddfielddefinition("SS.SYSTEME","5","A","")
    EB.Template.FieldSetcheckfile('BZ.CPT.SS.SYSTEME')
    EB.Template.TableAddfielddefinition("ACTION", "50","":@FM:"PREPARER_EXECUTER_ANNULER","")
    EB.Template.TableAddfielddefinition("DATE.OPERATION","8", "D", "")
    EB.Template.TableAddfielddefinition("XX.COMMENTAIRE","35", "A", "")

    EB.Template.TableAddfielddefinition("RESERVED1","15", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED2","15", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED3","15", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED4","15", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED5","15", "A", "")
*-----------------------------------------------------------------------------
    EB.Template.TableAddlocalreferencefield("")
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()
*-----------------------------------------------------------------------------
    RETURN
*-----------------------------------------------------------------------------
END
