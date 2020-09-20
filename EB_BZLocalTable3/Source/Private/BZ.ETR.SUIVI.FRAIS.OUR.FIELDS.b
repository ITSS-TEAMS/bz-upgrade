* @ValidationCode : Mjo4NDgxNjk5OTI6Q3AxMjUyOjE2MDA1NjIxOTIyMzE6QWRtaW5pc3RyYXRldXI6LTE6LTE6MDoxOnRydWU6Ti9BOlIyMF9TUDQuMDotMTotMQ==
* @ValidationInfo : Timestamp         : 20 Sep 2020 01:36:32
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : Administrateur
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : true
* @ValidationInfo : Bypass GateKeeper : true
* @ValidationInfo : Compiler Version  : R20_SP4.0
*-----------------------------------------------------------------------------
* <Rating>-1</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable3
SUBROUTINE BZ.ETR.SUIVI.FRAIS.OUR.FIELDS
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
    EB.Template.TableDefineid("ID", "" : @FM : "16" : @FM : "A") ;
*-----------------------------------------------------------------------------
    EB.Template.TableAddfielddefinition("REF.OFS","35", "A", "")
    EB.Template.TableAddfielddefinition("OFS.MESSAGE", "600", "A","")
    EB.Template.TableAddfielddefinition("ID.CHG", "35", "A","")
    EB.Template.TableAddfielddefinition("ERREUR.MSG", "300", "A","")
    EB.Template.TableAddfielddefinition("DATE.OPERATION","8", "D", "")
    EB.Template.TableAddfielddefinition("STATUT","35", "A", "")
    EB.Template.TableAddfielddefinition("MONTANT.RECLAME","19", "AMT", "")
    EB.Template.TableAddfielddefinition("MONTANT.RECU","19", "AMT", "")
    EB.Template.TableAddfielddefinition("FICHIER.RECU","50", "A", "")
    EB.Template.TableAddfielddefinition("DATE.MATCHING","8", "D", "")
    EB.Template.TableAddfielddefinition("REF.COMMISSION","35", "A", "")
    EB.Template.TableAddfielddefinition("REF.OFS.PAID","20", "A", "")
    EB.Template.TableAddfielddefinition("XX<CODE.COMM.RECU","35", "A", "")
    EB.Template.TableAddfielddefinition("XX>MNT.COMM.RECU","19", "AMT", "")
    EB.Template.TableAddfielddefinition("OFS.MESSAGE.PAID", "600", "A","")
    EB.Template.TableAddfielddefinition("STATUT.PAID","35", "A", "")
    EB.Template.TableAddfielddefinition("ID.CHG.PAID", "35", "A","")
    EB.Template.TableAddfielddefinition("CONVENTION", "10", "YES_NO","")
*-----------------------------------------------------------------------------

    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
