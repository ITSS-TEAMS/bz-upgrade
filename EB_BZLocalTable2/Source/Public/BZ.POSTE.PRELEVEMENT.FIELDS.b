* @ValidationCode : MjotMjA1NzI4NzM0MTpDcDEyNTI6MTYwMDQ4NDcyMDU2NDpBZG1pbmlzdHJhdGV1cjotMTotMTowOjE6dHJ1ZTpOL0E6UjIwX1NQNC4wOi0xOi0x
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
* <Rating>-1</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable2
SUBROUTINE BZ.POSTE.PRELEVEMENT.FIELDS
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
*-----------------------------------------------------------------------------
* Modification History :

*ZIT-UPG-R13-R19 : FM CHANGED TO @FM
*-----------------------------------------------------------------------------

*** <region name= Header>
*** <desc>Inserts and control logic</desc>
*ZIT-UPG-R13-R19/S
* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;
* $INSERT I_DataTypes - Not Used anymore;

    $USING EB.API
    $USING EB.SystemTables
    $USING EB.Template
*ZIT-UPG-R13-R19/E
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
    EB.Template.TableAddfielddefinition("MNT.PREL","15","AMT","")
    EB.Template.TableAddfielddefinition("NUM.PREL","7","A","")
    EB.Template.TableAddfielddefinition("RIB.PAYEUR", "20","A","")
    EB.Template.TableAddfielddefinition("CODE.DEST", "2","A","")
    EB.Template.TableAddfielddefinition("CODE.CENTRE.DEST", "3","A","")
    EB.Template.TableAddfielddefinition("RIB.CREANCIER", "20","A","")
    EB.Template.TableAddfielddefinition("CODE.EMETTEUR.PREL", "6","A","")
    EB.Template.TableAddfielddefinition("REF.CONTRAT", "20","A","")
    EB.Template.TableAddfielddefinition("LIBELLE.PREL", "50","A","")
    EB.Template.TableAddfielddefinition("DATE.CPS.INIT", "8","D","")
    EB.Template.TableAddfielddefinition("MOTIF.REJET", "8","A","")
    EB.Template.TableAddfielddefinition("DATE.ECHEANCE", "8","D","")
    EB.Template.TableAddfielddefinition("ZONE.LIBRE", "7","A","")

*SPECIFIQUE
    EB.Template.TableAddfielddefinition("STATUT", "20","A","")
    EB.Template.FieldSetcheckfile("BZ.TRAIT.STATUT")
    EB.Template.TableAddfielddefinition("DATE.SORT", "8","D","")
    EB.Template.TableAddfielddefinition("COMPTE.PAYEUR", "10","A","")
    EB.Template.FieldSetcheckfile("ACCOUNT")
    EB.Template.TableAddfielddefinition("FICHIER.EMIS", "65","A","")
    EB.Template.TableAddfielddefinition("FICHIER.RECU", "65","A","")
    EB.Template.TableAddfielddefinition("MONTANT.REG", "20","AMT","")
    EB.Template.TableAddfielddefinition("XX.FT.SORT", "16","A","")
*RESERVED
    EB.Template.TableAddfielddefinition("RESERVED.1","10","A" : @FM : "" : @FM : "NOINPUT","")
    EB.Template.TableAddfielddefinition("RESERVED.2","10","A" : @FM : "" : @FM : "NOINPUT","")
    EB.Template.TableAddfielddefinition("RESERVED.3","10","A" : @FM : "" : @FM : "NOINPUT","")
    EB.Template.TableAddfielddefinition("RESERVED.4","10","A" : @FM : "" : @FM : "NOINPUT","")
    EB.Template.TableAddfielddefinition("RESERVED.5","10","A" : @FM : "" : @FM : "NOINPUT","")
    EB.Template.TableAddfielddefinition("RESERVED.6","10","A" : @FM : "" : @FM : "NOINPUT","")
    EB.Template.TableAddfielddefinition("RESERVED.7","10","A" : @FM : "" : @FM : "NOINPUT","")
    EB.Template.TableAddfielddefinition("RESERVED.8","10","A" : @FM : "" : @FM : "NOINPUT","")
    EB.Template.TableAddfielddefinition("RESERVED.9","10","A" : @FM : "" : @FM : "NOINPUT","")
    EB.Template.TableAddfielddefinition("RESERVED.10","10","A" : @FM : "" : @FM :"NOINPUT","")
*-----------------------------------------------------------------------------
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
