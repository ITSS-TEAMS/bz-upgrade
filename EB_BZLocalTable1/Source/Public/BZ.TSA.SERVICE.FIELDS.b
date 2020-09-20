* @ValidationCode : MjotMTA2MzkyMDg2MzpDcDEyNTI6MTYwMDQ3OTM1MTg5NjpBZG1pbmlzdHJhdGV1cjotMTotMTowOjE6dHJ1ZTpOL0E6UjE5X0FNUi4wOi0xOi0x
* @ValidationInfo : Timestamp         : 19 Sep 2020 02:35:51
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
$PACKAGE EB.BZLocalTable1
SUBROUTINE BZ.TSA.SERVICE.FIELDS
*-----------------------------------------------------------------------------
* Application de parametrage du TSA SERVICE
* @Author Maroua Chikhaoui
* @Stereotype H
* Date : 29-06-17
* ----------------------------------------------------------------------------
* Modification History :
*ZITUNA-UPG-R13-R19 :  removed BP's and changed INCLUDE to INSERT
*                      FM converted to @FM
*------------------------------------------------------
* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;
* $INSERT I_DataTypes - Not Used anymore;
    $USING EB.API
    $USING EB.SystemTables
    $USING EB.Template
        

    GOSUB DEFINE.FIELDS
RETURN

DEFINE.FIELDS:
**************
*****ID
    EB.Template.TableDefineid("ID", "" : @FM : "35" : @FM : "A")
*****Fields

    EB.Template.TableAddfielddefinition("DESCRIPTION", "35","A","")
    EB.Template.TableAddfielddefinition("ACTIVE", "3","":@FM:"YES_NO","")
    EB.Template.TableAddfielddefinition("SELECTION", "510","A","")
*****Reserved Fields
    EB.Template.TableAddfielddefinition("TABLE", "35", "A","")

    EB.Template.TableAddfielddefinition("POS.MSG.OFS", "35", "A","")
    EB.Template.TableAddfielddefinition("POS.REF.TXN", "35", "A","")
    EB.Template.TableAddfielddefinition("POS.ERREUR.MSG", "35", "A","")



    EB.Template.TableAddfield("RESERVED.2", EB.Template.T24String, EB.Template.FieldNoInput,"")
    EB.Template.TableAddfield("RESERVED.3", EB.Template.T24String, EB.Template.FieldNoInput,"")
    EB.Template.TableAddfield("RESERVED.4", EB.Template.T24String, EB.Template.FieldNoInput,"")
    EB.Template.TableAddfield("RESERVED.5", EB.Template.T24String, EB.Template.FieldNoInput,"")
    EB.Template.TableAddfield("RESERVED.6", EB.Template.T24String, EB.Template.FieldNoInput,"")
    EB.Template.TableAddfield("RESERVED.7", EB.Template.T24String, EB.Template.FieldNoInput,"")
    EB.Template.TableAddfield("RESERVED.8", EB.Template.T24String, EB.Template.FieldNoInput,"")
    EB.Template.TableAddfield("RESERVED.9", EB.Template.T24String, EB.Template.FieldNoInput,"")
    EB.Template.TableAddfield("RESERVED.10", EB.Template.T24String, EB.Template.FieldNoInput,"")
*-----------------------------------------------------------------------------
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
END
