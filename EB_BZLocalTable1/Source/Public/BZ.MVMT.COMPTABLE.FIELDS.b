* @ValidationCode : MjotMjA3MTc2MTEzMjpDcDEyNTI6MTYwMDQ3OTIyNTcwNTpBZG1pbmlzdHJhdGV1cjotMTotMTowOjE6dHJ1ZTpOL0E6UjE5X0FNUi4wOi0xOi0x
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
* <Rating>-1</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable1
SUBROUTINE BZ.MVMT.COMPTABLE.FIELDS
*-----------------------------------------------------------------------------
* TODO - You MUST write a .FIELDS routine for the field definitions
*** <region name= Header>
*** <desc>Inserts and control logic</desc>
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------
*ZIT-UPG-R13-R19 :   removed BP's and changed INCLUDE to INSERT
*                    FM converted to @FM
* ----------------------------------------------------------------------------
* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;
* $INSERT I_DataTypes - Not Used anymore;
    $USING EB.API
    $USING EB.SystemTables
    $USING EB.Template

*** </region>
*-----------------------------------------------------------------------------
    EB.Template.TableDefineid("ID", "" : @FM : "40" : @FM : "A")
*-----------------------------------------------------------------------------
    EB.Template.TableAddfielddefinition("TYPE.TRAIT","20", "A", "")
    EB.Template.FieldSetcheckfile('BZ.TYPE.TRAITEMENT')
    EB.Template.TableAddfielddefinition("CODE.MVMT","20", "A", "")
    EB.Template.FieldSetcheckfile('BZ.CODE.MVMT')
    EB.Template.TableAddfielddefinition("DATE.MVMT","8", "D", "")
    EB.Template.TableAddfielddefinition("SENS","1", "" : @FM : "D_C", "")
    EB.Template.TableAddfielddefinition("CODE.TRANSACTION","4", "", "")
    EB.Template.FieldSetcheckfile('TRANSACTION')
    EB.Template.TableAddfielddefinition("DATE.VALEUR","8", "D", "")
    EB.Template.TableAddfielddefinition("COMPTE","20", "A", "")
    EB.Template.FieldSetcheckfile('ACCOUNT')
    EB.Template.TableAddfielddefinition("DEVISE","3", "CCY", "")
    EB.Template.FieldSetcheckfile('CURRENCY')
    EB.Template.TableAddfielddefinition("MONTANT","15", "AMT", "")
    EB.Template.TableAddfielddefinition("DETAIL.PAI","35", "A", "")
    EB.Template.TableAddfielddefinition("STATUT","15", "A", "")
    EB.Template.TableAddfielddefinition("REF.TRAIT","20", "A", "")
    EB.Template.TableAddfielddefinition("FICHIER.RECU","65", "A", "")
*-----------------------------------------------------------------------------
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition() ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
