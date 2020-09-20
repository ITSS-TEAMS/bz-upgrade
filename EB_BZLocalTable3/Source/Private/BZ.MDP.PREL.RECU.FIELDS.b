* @ValidationCode : MjoxODg0NjMyNTc6Q3AxMjUyOjE2MDA2MDMxMzM5Nzk6QWRtaW5pc3RyYXRldXI6LTE6LTE6MDoxOnRydWU6Ti9BOlIyMF9TUDQuMDotMTotMQ==
* @ValidationInfo : Timestamp         : 20 Sep 2020 12:58:53
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
*----------------------
*ZIT-UPG-R13-R19    : FM CHANGED TO  @FM
*-----------------------------------------------------------------------------
* <Rating>-1</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable3
SUBROUTINE BZ.MDP.PREL.RECU.FIELDS
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
    EB.Template.TableDefineid("ID", "" : @FM : "35" : @FM : "A")
*-----------------------------------------------------------------------------
    EB.Template.TableAddfielddefinition("CODE.VALEUR", "2","A","")
    EB.Template.FieldSetcheckfile("BZ.MDP.TYPE.VALEUR")
    EB.Template.TableAddfielddefinition("NATURE.REM", "1","A","")
    EB.Template.TableAddfielddefinition("CODE.REM", "2","A","")
    EB.Template.TableAddfielddefinition("CODE.CENTRE.REM", "3","A","")
    EB.Template.TableAddfielddefinition("DATE.OPERATION", "8","D","")
    EB.Template.TableAddfielddefinition("NUM.LOT", "4","","")
    EB.Template.TableAddfielddefinition("CODE.ENREG", "2","A","")
    EB.Template.TableAddfielddefinition("CODE.DEVISE","3","A","")
    EB.Template.TableAddfielddefinition("MNT.PRELEVEMENT","15","AMT","")
    EB.Template.TableAddfielddefinition("NUM.PRELEVEMENT","7","A","")
    EB.Template.TableAddfielddefinition("RIB.PAYEUR", "20","A","")
    EB.Template.TableAddfielddefinition("CODE.DEST", "2","A","")
    EB.Template.TableAddfielddefinition("CODE.CENTRE.DEST", "3","A","")
    EB.Template.TableAddfielddefinition("RIB.CREANCIER", "20","A","")
    EB.Template.TableAddfielddefinition("CODE.EMETTEUR", "6","A","")
    EB.Template.TableAddfielddefinition("REF.DOMICILIATION", "20","A","")
    EB.Template.TableAddfielddefinition("LIBELLE.PREL", "50","A","")
    EB.Template.TableAddfielddefinition("DATE.COMPENSATION", "8","D","")
    EB.Template.TableAddfielddefinition("MOTIF.REJET", "8","A","")
    EB.Template.TableAddfielddefinition("DATE.ECHEANCE", "8","D","")
    EB.Template.TableAddfielddefinition("ZONE.LIBRE", "7","A","")
**SPECIFIQUE
    EB.Template.TableAddfielddefinition("XX.LIGNE.RECU", "280","A","")
    EB.Template.TableAddfielddefinition("XX.MOTIF.DETECTE", "2","A","")
    EB.Template.FieldSetcheckfile("BZ.MDP.MOT.REJ")
    EB.Template.TableAddfielddefinition("STATUT", "20","A","")
    EB.Template.FieldSetcheckfile("BZ.TRAIT.STATUT")

    EB.Template.TableAddfielddefinition("COMPTE.PAYEUR", "10","A","")
    EB.Template.FieldSetcheckfile("ACCOUNT")
    EB.Template.TableAddfielddefinition("UNITE.GESTION", "4","A","")
    EB.Template.FieldSetcheckfile("DEPT.ACCT.OFFICER")
    EB.Template.TableAddfielddefinition("DATE.CHARGEMENT", "8","D","")

    EB.Template.TableAddfielddefinition("FT.DECISION", "16","A","")
    EB.Template.TableAddfielddefinition("FICHIER.RECU", "65","A","")
    EB.Template.TableAddfielddefinition("FICHIER.RENDU", "65","A","")
**RESERVED
    EB.Template.TableAddfielddefinition("REF.EMIS", "70","A","")
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
