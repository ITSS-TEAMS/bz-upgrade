* @ValidationCode : MjotMTIxNDEwMTcyNDpDcDEyNTI6MTYwMDQ3OTE5Njc1NzpBZG1pbmlzdHJhdGV1cjotMTotMTowOjE6dHJ1ZTpOL0E6UjE5X0FNUi4wOi0xOi0x
* @ValidationInfo : Timestamp         : 19 Sep 2020 02:33:16
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
SUBROUTINE BZ.MDP.REMISE.EFF.FIELDS
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
*ZIT-UPG-R13-R19    : FM CHANGED TO @FM
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
    EB.Template.TableDefineid("ID", "" : @FM : "16" : @FM : "A") ;
*-----------------------------------------------------------------------------
    EB.Template.TableAddfielddefinition("COMPTE.CEDANT","10", "ACC", "")
    EB.Template.FieldSetcheckfile("ACCOUNT")
    EB.Template.TableAddfielddefinition("DEVISE","3", "CCY", "")
    EB.Template.FieldSetcheckfile("CURRENCY")
    EB.Template.TableAddfielddefinition("RIB.CEDANT", "20", "A","")
    EB.Template.TableAddfielddefinition("NOM.CEDANT", "35", "A","")
    EB.Template.TableAddfielddefinition("SITUATION.CEDANT", "20", "A","")
    EB.Template.FieldSetcheckfile("BZ.MDP.SITUATION.CLT")
    EB.Template.TableAddfielddefinition("NATURE.COMPTE", "1", "A","")
* CALL Field.setCheckFile("BZ.MDP.NATURE.CPT")
    EB.Template.TableAddfielddefinition("NUM.BORD","8.8", "A", "")
    EB.Template.TableAddfielddefinition("MONTANT.GLOB","15", "AMT", "")
    EB.Template.TableAddfielddefinition("NOMBRE.GLOB","10", "", "")
    EB.Template.TableAddfielddefinition("DATE.REMISE","8", "D", "")
    EB.Template.TableAddfielddefinition("UNITE.GESTION","4", "A", "")
    EB.Template.FieldSetcheckfile("DEPT.ACCT.OFFICER")
    EB.Template.TableAddfielddefinition("OBSERVATION","35", "A", "")
    EB.Template.TableAddfielddefinition("STATUT","35", "A", "")
    EB.Template.FieldSetcheckfile("BZ.TRAIT.STATUT")
    EB.Template.TableAddfielddefinition("DATE.RCPT.PFC","8", "D", "")
    EB.Template.TableAddfielddefinition("REF.SCAN","35", "A", "")
    EB.Template.TableAddfielddefinition("VERSION","40", "A", "")
    EB.Template.TableAddfielddefinition("MODIFIE","3", "A", "")
    EB.Template.TableAddfielddefinition("CODE.CLIENT","35", "A", "")
    EB.Template.TableAddfielddefinition("DATE.CAPTURE","8", "D", "")

*-----------------------------------------------------------------------------

    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
