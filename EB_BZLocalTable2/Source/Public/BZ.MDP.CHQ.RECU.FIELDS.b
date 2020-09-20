* @ValidationCode : MjotMjg4NjE1NjY1OkNwMTI1MjoxNjAwNDg0NzE5OTY3OkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTp0cnVlOk4vQTpSMjBfU1A0LjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 19 Sep 2020 04:05:19
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
* <Rating>-3</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable2
SUBROUTINE BZ.MDP.CHQ.RECU.FIELDS
*-----------------------------------------------------------------------------
*<doc>
* TODO add a description of the application here.
* @author ktalhaoui@temenos.com
* @stereotype H
*
*
*-----------------------------------------------------------------------------
* TODO - You MUST write a .FIELDS routine for the field definitions
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------
* 09 / 03 / 10 - ktalhaoui New Template changes
*ZIT-UPG-R13-R19- FM TO @FM
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
    EB.Template.TableDefineid("ID", "" : @FM : "35" : @FM : "A") ;* TODAY:CMC7 = 8 + 27
*-----------------------------------------------------------------------------
    EB.Template.TableAddfielddefinition("CODE.VAL", "2","A","")
    EB.Template.TableAddfielddefinition("NATURE.REMET", "1","A","")
    EB.Template.TableAddfielddefinition("CODE.REMET", "2","A","")
    EB.Template.TableAddfielddefinition("CODE.REGION", "3","A","")
    EB.Template.TableAddfielddefinition("DATE.OPERATION", "8","D","")
    EB.Template.TableAddfielddefinition("NUM.LOT", "4","","")
    EB.Template.TableAddfielddefinition("CODE.ENREG", "2","A","")
    EB.Template.TableAddfielddefinition("CODE.DEVISE","3","A","")
*CALL Field.setCheckFile("CURRENCY")

    EB.Template.TableAddamountfield("MNT.CHEQUE","15","AMT", "")

    EB.Template.TableAddfielddefinition("NUM.CHEQUE", "7","A","")

    EB.Template.TableAddfielddefinition("RIB.TIREUR", "20","A","")

    EB.Template.TableAddfielddefinition("CODE.DEST", "2","A","")

    EB.Template.TableAddfielddefinition("AGC.DEST", "3","A","")

    EB.Template.TableAddfielddefinition("RIB.BENEF", "20","A","")

    EB.Template.TableAddfielddefinition("NOM.BENEF", "35","A","")

    EB.Template.TableAddfielddefinition("DATE.EMISSION", "8","D","")

    EB.Template.TableAddfielddefinition("LIEU.EMISSION", "1","A","")

    EB.Template.TableAddfielddefinition("SITUATION.BENEF", "1","A","")

    EB.Template.TableAddfielddefinition("NATURE.COMPTE","3","A","")
*CALL Field.setCheckFile("BZ.MDP.NATURE.CPT")

    EB.Template.TableAddfielddefinition("ZONE.LIBRE", "18","A","")


*Champs specifiques
    EB.Template.TableAddfielddefinition("DATE.CNP", "8","D","")
    EB.Template.TableAddfielddefinition("NUM.CPT", "10","ACC","")

    EB.Template.TableAddfielddefinition("NUM.CNP", "4","","")

    EB.Template.TableAddfielddefinition("CODE.DEV.POS", "3","ANY","")
*CALL Field.setCheckFile("CURRENCY")

    EB.Template.TableAddamountfield("MNT.RECLAME","15", T24_NUMERIC, "")

    EB.Template.TableAddamountfield("MNT.REGUL.INT","15", T24_NUMERIC, "")

    EB.Template.TableAddfielddefinition("BLOCAGE.Y.N", "4", "" : @FM : "NULL_YES_", "")
    EB.Template.TableAddamountfield("MNT.BLOCAGE","15", T24_NUMERIC, "")
    EB.Template.TableAddfielddefinition("FT.BLOCAGE", "16","A","")

* Champs specifiques pour traitement
    EB.Template.TableAddfielddefinition("IMG.RECTO", "60","A","")
    EB.Template.TableAddfielddefinition("IMG.VERSO", "60","A","")
    EB.Template.TableAddfielddefinition("DATE.CHARGEMENT",  "8","D","")
    EB.Template.TableAddfielddefinition("STATUT", "2","A","")
    EB.Template.TableAddfielddefinition("CERTIFIE", "4", "" : @FM : "NULL_YES_", "")

    EB.Template.TableAddfielddefinition("XX.INEXPLOITABLE", "2","A","")
    EB.Template.TableAddfielddefinition("OPPOSITION", "2","A","")

    EB.Template.TableAddfielddefinition("CLOTURE", "2","A","")
    EB.Template.TableAddfielddefinition("XX.VICE.FORME", "2","A","")
    EB.Template.TableAddfielddefinition("PROVISION", "2","A","")

    EB.Template.TableAddfielddefinition("SEUIL.Y.N", "4", "" : @FM : "NULL_YES_", "")
    EB.Template.TableAddfielddefinition("VAL.CONSULTEE", "4", "" : @FM : "NULL_YES_", "")
    EB.Template.TableAddfielddefinition("DOC.REJ", "4", "" : @FM : "CNP_PAP_PRV_", "")
    EB.Template.TableAddfielddefinition("MOTIF.REJ", "16","A","")
    EB.Template.TableAddfielddefinition("FT.DECIS.PAI", "16","A","")

    EB.Template.TableAddfielddefinition("UNITE.GEST", "4","A","")
    EB.Template.FieldSetcheckfile("DEPT.ACCT.OFFICER")
    EB.Template.TableAddfielddefinition("FICHIER.RECU", "65","A","")
    EB.Template.TableAddfielddefinition("FICHIER.RENDU", "65","A","")
    EB.Template.TableAddfielddefinition("DATE.IMG", "8","D","")

*-----------------------------------------------------------------------------
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition() ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
