* @ValidationCode : MjotMTgwOTk3NTE1ODpDcDEyNTI6MTYwMDQ3OTAwMDU0MjpBZG1pbmlzdHJhdGV1cjotMTotMTowOjE6dHJ1ZTpOL0E6UjE5X0FNUi4wOi0xOi0x
* @ValidationInfo : Timestamp         : 19 Sep 2020 02:30:00
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
* Modification History:
* ZIT-UPG-R13-R19 : Converted FM to @FM
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable1
SUBROUTINE BZ.DDE.OP.EFFET.FIELDS
*-----------------------------------------------------------------------------
*<doc>
* TODO add a description of the application here.
* @author Bounouara Fehmi
* @stereotype H
*
*
*-----------------------------------------------------------------------------
* TODO - You MUST write a .FIELDS routine for the field definitions
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
    EB.Template.TableDefineid("ID", "" : @FM : "25" : @FM : "A")
*-----------------------------------------------------------------------------
    EB.Template.TableAddfielddefinition("TYPE.DEMANDE","30", "" : @FM : "Prorogation_Reclamation_Changement domiciliation", "")
    EB.Template.TableAddfielddefinition("TYPE.RECLAMATION","25", "" : @FM : "Client_Agence", "")
    EB.Template.TableAddfielddefinition("NUM.LCN", "12","A","")
    EB.Template.TableAddfielddefinition("COMPTE.CEDANT", "20","ACC","")
    EB.Template.TableAddfielddefinition("NOM.CEDANT", "35","A","")
    EB.Template.TableAddfielddefinition("MONTANT.PRINCIPAL", "15","AMT","")
    EB.Template.TableAddfielddefinition("DATE.ECHEANCE", "8","D","")
    EB.Template.TableAddfielddefinition("RIB.TIRE", "20","A","")
    EB.Template.TableAddfielddefinition("DATE.CREATION", "8","D","")
    EB.Template.TableAddfielddefinition("DATE.REMISE", "8","D","")
    EB.Template.TableAddfielddefinition("DATE.EFFET.DDE", "8","D","")
    EB.Template.TableAddfielddefinition("DATE.PEC.DDE", "8","D","")
    EB.Template.TableAddfielddefinition("UNITE.GESTION", "4","A","")
    EB.Template.TableAddfielddefinition("NVL.DDE.ECHEANCE", "8","D","")
    EB.Template.TableAddfielddefinition("NOUVEAU.RIB.TIRE", "20","A","")
    EB.Template.TableAddfielddefinition("DATE.TRAIT.PFC", "8","D","")
    EB.Template.TableAddfielddefinition("DATE.APUREMENT", "8","D","")
    EB.Template.TableAddfielddefinition("STATUT", "2","A","")

*-----------------------------------------------------------------------------
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
* -----------------------------------------------------------------------------
END
