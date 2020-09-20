* @ValidationCode : Mjo2NzM3MzU3Mjk6Q3AxMjUyOjE2MDA0ODQ3MjAxODY6QWRtaW5pc3RyYXRldXI6LTE6LTE6MDoxOnRydWU6Ti9BOlIyMF9TUDQuMDotMTotMQ==
* @ValidationInfo : Timestamp         : 19 Sep 2020 04:05:20
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
* <Rating>-2</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable2
SUBROUTINE BZ.MDP.EFFET.REPRIS.FIELDS
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
* Modification History :
*-----------------------
*ZIT-UPG-R13-R19 :  removed BP's and changed INCLUDE to INSERT
*                   FM converted to @FM
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
    EB.Template.TableDefineid("ID", "" : @FM : "35" : @FM : "A")
*-----------------------------------------------------------------------------
    EB.Template.TableAddfielddefinition("CODE.VALEUR", "2","A","")
    EB.Template.FieldSetcheckfile("BZ.MDP.TYPE.VALEUR")
    EB.Template.TableAddfielddefinition("NATURE.REM", "1","A","")
    EB.Template.TableAddfielddefinition("CODE.REM", "2","A","")
    EB.Template.FieldSetcheckfile("BC.SORT.CODE")
    EB.Template.TableAddfielddefinition("CODE.CENTRE.REM", "3","A","")
    EB.Template.TableAddfielddefinition("DATE.OPERATION", "8","D","")
    EB.Template.TableAddfielddefinition("NUM.LOT", "4","","")
    EB.Template.TableAddfielddefinition("CODE.ENREG", "2","A","")
    EB.Template.TableAddfielddefinition("CODE.DEVISE","3","A","")
    EB.Template.TableAddfielddefinition("RANG","2","A","")
    EB.Template.TableAddfielddefinition("MNT.LCN","15","AMT","")
    EB.Template.TableAddfielddefinition("MNT.INTERETS","15","AMT","")
    EB.Template.TableAddfielddefinition("MNT.FRAIS.PROT","15","AMT","")

** MODIFIE PAR KTALHAOUI LE 26 MAI 2010: DE 7 A ++> 12 A
    EB.Template.TableAddfielddefinition("NUM.LCN", "12","A","")

    EB.Template.TableAddfielddefinition("RIB.TIRE", "20","A","")
    EB.Template.TableAddfielddefinition("RIB.TIRE.INIT", "20","A","")
    EB.Template.TableAddfielddefinition("CODE.DEST", "2","A","")
    EB.Template.TableAddfielddefinition("CODE.CENTRE.DEST", "3","A","")
    EB.Template.TableAddfielddefinition("RIB.CEDANT", "20","A","")
    EB.Template.TableAddfielddefinition("BOM.CEDANT", "35","A","")
    EB.Template.TableAddfielddefinition("NOM.TIRE", "35","A","")
    EB.Template.TableAddfielddefinition("REF.COM.TIRE", "30","A","")
    EB.Template.TableAddfielddefinition("REF.ACCEPTATION", "30","A","")
    EB.Template.TableAddfielddefinition("CODE.ENDOS.AVAL", "1","A","")
    EB.Template.TableAddfielddefinition("DATE.ECHEANCE", "8","D","")
    EB.Template.TableAddfielddefinition("DATE.ECHEANCE.INIT", "8","D","")
    EB.Template.TableAddfielddefinition("DATE.CREATION", "8","D","")
    EB.Template.TableAddfielddefinition("LIEU.CREATION", "30","A","")
    EB.Template.TableAddfielddefinition("REF.COM.TIREUR", "30","A","")
    EB.Template.TableAddfielddefinition("CODE.ORDRE.PAYE", "1","A","")
    EB.Template.TableAddfielddefinition("SITUATION.CEDANT", "1","A","")
    EB.Template.TableAddfielddefinition("NATURE.COMPTE", "1","A","")
    EB.Template.TableAddfielddefinition("DATE.COMPENSATION", "8","D","")
    EB.Template.TableAddfielddefinition("MOTIF.REJET", "8","A","")
    EB.Template.TableAddfielddefinition("CODE.RISQUE.BCT", "6","A","")
    EB.Template.TableAddfielddefinition("ZONE.LIBRE", "29","A","")
    EB.Template.TableAddfielddefinition("STATUT", "20","A","")
    EB.Template.FieldSetcheckfile("BZ.TRAIT.STATUT")
    EB.Template.TableAddfielddefinition("DATE.CHARGEMENT", "8","D","")
    EB.Template.TableAddfielddefinition("UNITE.GESTION", "4","A","")
    EB.Template.FieldSetcheckfile("DEPT.ACCT.OFFICER")
    EB.Template.TableAddfielddefinition("COMPTE.TIRE", "10","ACC","")
    EB.Template.FieldSetcheckfile("ACCOUNT")
    EB.Template.TableAddfielddefinition("FICHIER.RECU", "65","A","")
    EB.Template.TableAddfielddefinition("CANAL", "65","A","")

*-----------------------------------------------------------------------------
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
