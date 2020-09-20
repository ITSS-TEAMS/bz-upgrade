* @ValidationCode : MjotNTQ1NTYxMjYwOkNwMTI1MjoxNjAwNDg0NzIwMzUyOkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTp0cnVlOk4vQTpSMjBfU1A0LjA6LTE6LTE=
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
SUBROUTINE BZ.MDP.VIREMENT.RECU.FIELDS
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
*MODIFICATION HISTORY:
*ZIT-UPG-R13-R19-FM TO @FM
*----------------------------------------------------------------------------

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
    EB.Template.TableAddfielddefinition("RANG","2","A","")
    EB.Template.TableAddfielddefinition("MNT.VIREMENT","15","AMT","")
    EB.Template.TableAddfielddefinition("NUM.VIREMENT","7","A","")
    EB.Template.TableAddfielddefinition("RIB.DO", "20","A","")
    EB.Template.TableAddfielddefinition("NOM.RS.DO", "30","A","")
    EB.Template.TableAddfielddefinition("CODE.DEST", "2","A","")
    EB.Template.TableAddfielddefinition("CODE.CENTRE.DEST", "3","A","")
    EB.Template.TableAddfielddefinition("RIB.BENEF", "20","A","")
    EB.Template.TableAddfielddefinition("NOM.BENEF", "30","A","")
    EB.Template.TableAddfielddefinition("NUM.DOSS.PAI", "20","A","")
    EB.Template.TableAddfielddefinition("CODE.COMP.ASSIG", "1","A","")
    EB.Template.TableAddfielddefinition("NBR.ENREG.COMP", "2","A","")
    EB.Template.TableAddfielddefinition("MOTIF.OPERATION", "45","A","")
    EB.Template.TableAddfielddefinition("DATE.COMPENSATION", "8","D","")
    EB.Template.TableAddfielddefinition("MOTIF.REJET", "8","A","")
    EB.Template.TableAddfielddefinition("SITUATION.DO", "1","A","")
    EB.Template.TableAddfielddefinition("TYPE.CPT.DO", "1","A","")
    EB.Template.TableAddfielddefinition("NATURE.CPT.DO", "1","A","")
    EB.Template.TableAddfielddefinition("DOSSIER.CHANGE", "1","A","")
    EB.Template.TableAddfielddefinition("ZONE.LIBRE", "37","A","")
**SPECIFIQUE
    EB.Template.TableAddfielddefinition("XX.LIGNE.RECU", "280","A","")

    EB.Template.TableAddfielddefinition("STATUT", "20","A","")
    EB.Template.FieldSetcheckfile("BZ.TRAIT.STATUT")

    EB.Template.TableAddfielddefinition("DATE.CHARGEMENT", "8","D","")
    EB.Template.TableAddfielddefinition("UNITE.GESTION", "4","A","")
    EB.Template.FieldSetcheckfile("DEPT.ACCT.OFFICER")
    EB.Template.TableAddfielddefinition("COMPTE.BENEF", "10","A","")
*    CALL Field.setCheckFile("ACCOUNT")
    EB.Template.TableAddfielddefinition("CLOTURE", "3", "" : @FM : "NO_YES", "")
    EB.Template.TableAddfielddefinition("DECEDE", "3","":@FM:"NO_YES","")
    EB.Template.TableAddfielddefinition("ORIGINE.FONDS", "3","":@FM:"NO_YES","")
    EB.Template.TableAddfielddefinition("INEXPLOITABLE", "3","A","")
    EB.Template.FieldSetcheckfile("BZ.MDP.MOT.REJ")
    EB.Template.TableAddfielddefinition("FT.DECISION", "16","A","")
    EB.Template.TableAddfielddefinition("FICHIER.RECU", "65","A","")
    EB.Template.TableAddfielddefinition("FICHIER.RENDU", "65","A","")

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
