* @ValidationCode : Mjo1ODQyMDYwODU6Q3AxMjUyOjE2MDA0ODQ3MjEyNDc6QWRtaW5pc3RyYXRldXI6LTE6LTE6MDoxOnRydWU6Ti9BOlIyMF9TUDQuMDotMTotMQ==
* @ValidationInfo : Timestamp         : 19 Sep 2020 04:05:21
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : Administrateur
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : true
* @ValidationInfo : Bypass GateKeeper : true
* @ValidationInfo : Compiler Version  : R20_SP4.0
* Modification History :
*-----------------------
*ZIT-UPG-R13-R19  : FM CHANGED TO @FM
*-----------------------------------------------------------------------------
* <Rating>-1</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable2
SUBROUTINE BZ.SM.REGISTRE.CPS.FIELDS

*-----------------------------------------------------------------------------
*<doc>
* TODO add a description of the application here.
* @author Bounouara fehmi
* @stereotype H
*
*
*-----------------------------------------------------------------------------
* TODO - You MUST write a .FIELDS routine for the field definitions
*-----------------------------------------------------------------------------
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
    EB.Template.TableDefineid("ID", "" : @FM : "50" : @FM : "A")
*-----------------------------------------------------------------------------
    EB.Template.TableAddfielddefinition("NUM.COMERCANT", "10","A","")
    EB.Template.TableAddfielddefinition("NUM.BORDEREAU", "6","A","")
    EB.Template.TableAddfielddefinition("NUM.FACTURETTE", "6","A","")
    EB.Template.TableAddfielddefinition("NUM.PORTEUR", "19","A","")
    EB.Template.TableAddfielddefinition("SECTEUR.COM", "1","A","")
    EB.Template.TableAddfielddefinition("IDENTIF.REG.TXN", "1","A","")
    EB.Template.TableAddfielddefinition("NATURE.OPERATION", "1","A","")
    EB.Template.TableAddfielddefinition("CODE.OPERATION", "2","A","")
    EB.Template.TableAddfielddefinition("MONTANT", "9","AMT","")
    EB.Template.TableAddfielddefinition("DATE.VALIDITE", "4","A","")
    EB.Template.TableAddfielddefinition("DATE.TRAITEMENT", "6","A","")
    EB.Template.TableAddfielddefinition("DATE.ACHAT", "6","A","")
    EB.Template.TableAddfielddefinition("NUM.AUTORISATION", "6","A","")
    EB.Template.TableAddfielddefinition("DATE.REMISE", "6","A","")
    EB.Template.TableAddfielddefinition("MCC", "4","A","")
    EB.Template.TableAddfielddefinition("FILLER", "2","A","")
    EB.Template.TableAddfielddefinition("BQ.COMMERCANT", "5","A","")
    EB.Template.TableAddfielddefinition("SYSTEME", "1","A","")
    EB.Template.TableAddfielddefinition("BQ.PORTEUR", "5","A","")
    EB.Template.TableAddfielddefinition("REF.ARCHIVAGE", "23","A","")
    EB.Template.TableAddfielddefinition("ORDRE", "2","A","")
    EB.Template.TableAddfielddefinition("ENS.COMMERCANT", "25","A","")
    EB.Template.TableAddfielddefinition("MONTANT.COMPENSE", "9","A","")
    EB.Template.TableAddfielddefinition("HEURE.TXN", "4","A","")
    EB.Template.TableAddfielddefinition("FILLER.ZONE", "4","A","")
    EB.Template.TableAddfielddefinition("FIN.ENREG", "1","A","")
    EB.Template.TableAddfielddefinition("CODE.MOTIF", "2","A","")
    EB.Template.TableAddfielddefinition("CYCLE.MVMT", "1","A","")
    EB.Template.TableAddfielddefinition("MESSAGE", "22","A","")
    EB.Template.TableAddfielddefinition("CODE.REPRES", "1","A","")
**********
    EB.Template.TableAddfielddefinition("REF.FICHIER", "35","A","")
    EB.Template.TableAddfielddefinition("DATE.CHARGEMENT", "35","A","")
    EB.Template.TableAddfielddefinition("STATUT", "35","A","")
    EB.Template.TableAddfielddefinition("FT.PAIEMENT", "16","A","")
**RESERVED
    EB.Template.TableAddfielddefinition("RESERVED.1", "10","A","")
    EB.Template.TableAddfielddefinition("RESERVED.2", "10","A","")
    EB.Template.TableAddfielddefinition("RESERVED.3", "10","A","")
    EB.Template.TableAddfielddefinition("RESERVED.4", "10","A","")
    EB.Template.TableAddfielddefinition("RESERVED.5", "10","A","")
    EB.Template.TableAddfielddefinition("RESERVED.6", "10","A","")
    EB.Template.TableAddfielddefinition("RESERVED.7", "10","A","")
    EB.Template.TableAddfielddefinition("RESERVED.8", "10","A","")
    EB.Template.TableAddfielddefinition("RESERVED.9", "10","A","")
    EB.Template.TableAddfielddefinition("RESERVED.10", "10","A","")
*-----------------------------------------------------------------------------
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
