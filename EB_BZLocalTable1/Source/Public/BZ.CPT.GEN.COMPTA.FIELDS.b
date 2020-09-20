* @ValidationCode : MjoxOTE5MjE5ODQ0OkNwMTI1MjoxNjAwNDc4OTk4NDIxOkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTp0cnVlOk4vQTpSMThfQU1SLjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 19 Sep 2020 02:29:58
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : Administrateur
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : true
* @ValidationInfo : Bypass GateKeeper : true
* @ValidationInfo : Compiler Version  : R18_AMR.0
*-----------------------------------------------------------------------------
* <Rating>-1</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable1
SUBROUTINE BZ.CPT.GEN.COMPTA.FIELDS
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
*ZIT-UPG-R13-R19-FM TO @FM
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
    EB.Template.TableDefineid("ID", "" : @FM : "60" : @FM : "A") ;
*-----------------------------------------------------------------------------
    EB.Template.TableAddfielddefinition("ID.CPT.LOT","12", "A", "")
    EB.Template.TableAddfielddefinition("EVENEMENT","5", "ACC", "")
    EB.Template.TableAddfielddefinition("REF.OFS","35", "A", "")
    EB.Template.TableAddfielddefinition("OFS.MESSAGE", "600", "A","")
    EB.Template.TableAddfielddefinition("REF.TRANSACTION", "35", "A","")
    EB.Template.TableAddfielddefinition("ERREUR.MSG", "300", "A","")
    EB.Template.TableAddfielddefinition("DB.DEVISE", "3", "CCY","")
    EB.Template.FieldSetcheckfile("CURRENCY")
    EB.Template.TableAddfielddefinition("DB.COMPTE","16", "A", "")
    EB.Template.FieldSetcheckfile("ACCOUNT")
    EB.Template.TableAddfielddefinition("CR.DEVISE", "3", "CCY","")
    EB.Template.FieldSetcheckfile("CURRENCY")
    EB.Template.TableAddfielddefinition("CR.COMPTE","16", "A", "")
    EB.Template.FieldSetcheckfile("ACCOUNT")
    EB.Template.TableAddfielddefinition("MONTANT","15", "AMT", "")
    EB.Template.TableAddfielddefinition("DEBIT.REF","35", "A", "")
    EB.Template.TableAddfielddefinition("CREDIT.REF","35", "A", "")
    EB.Template.TableAddfielddefinition("DATE.OPERATION","8", "D", "")
    EB.Template.TableAddfielddefinition("STATUT","35", "A", "")
    EB.Template.FieldSetcheckfile("BZ.TRAIT.STATUT")
    EB.Template.TableAddfielddefinition("DEPT","7", "A", "")
    EB.Template.TableAddfielddefinition("REF.ORIGINE","50", "A", "")
    EB.Template.TableAddfielddefinition("DOMAINE","20", "A", "")
*-----------------------------------------------------------------------------

    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
