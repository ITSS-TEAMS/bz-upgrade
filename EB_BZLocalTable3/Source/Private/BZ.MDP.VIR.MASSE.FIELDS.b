* @ValidationCode : MjotMTcyODY2NDYwNDpDcDEyNTI6MTYwMDU2Mjc1Mjc3NDpBZG1pbmlzdHJhdGV1cjotMTotMTowOjE6dHJ1ZTpOL0E6UjIwX1NQNC4wOi0xOi0x
* @ValidationInfo : Timestamp         : 20 Sep 2020 01:45:52
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
SUBROUTINE BZ.MDP.VIR.MASSE.FIELDS
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
*Modification History :
*ZIT-UPG-R13-R19     : Converted FM to @FM.
* ----------------------------------------------------------------------------

*** <region name= Header>
*** <desc>Inserts and control logic</desc>
* $INSERT I_COMMON - Not Used anymore;N
* $INSERT I_EQUATE - Not Used anymore;E
* $INSERT I_DataTypes - Not Used anymore;s
    $USING EB.SystemTables
    $USING EB.API
    $USING EB.Template
*** </region>


*-----------------------------------------------------------------------------
    EB.Template.TableDefineid("ID", "" : @FM : "40" : @FM : "A")
*-----------------------------------------------------------------------------
    EB.Template.TableAddfielddefinition("RIB.PAYEUR", "20","A","")
    EB.Template.TableAddfielddefinition("RIB.BENEF", "20","A","")
    EB.Template.TableAddfielddefinition("NOM.BENEF", "30","A","")
    EB.Template.TableAddfielddefinition("NUM.REF.DOSS", "20","A","")
    EB.Template.TableAddfielddefinition("DATE.CREATION", "8","D","")
    EB.Template.TableAddfielddefinition("NUM.LOT", "4","A","")
    EB.Template.TableAddfielddefinition("NUM.SEQ", "7","A","")
    EB.Template.TableAddfielddefinition("ENREG.COMP", "1","A","")
    EB.Template.TableAddfielddefinition("NBR.ENREG.COMP", "2","A","")
    EB.Template.TableAddfielddefinition("MOTIF.OPERATION", "100","A","")
    EB.Template.TableAddfielddefinition("MONTANT", "18","A","")



*******************specifique
    EB.Template.TableAddfielddefinition("DATE.ECHEANCE", "8","D","")
    EB.Template.TableAddfielddefinition("REF.ENVOI", "20","A","")

    EB.Template.TableAddfielddefinition("LIGNE.RECU", "160","A","")
    EB.Template.TableAddfielddefinition("XX.MOTIF.DETECTE", "2","A","")
    EB.Template.FieldSetcheckfile("BZ.MDP.MOT.REJ")
    EB.Template.TableAddfielddefinition("STATUT", "20","A","")
    EB.Template.FieldSetcheckfile("BZ.TRAIT.STATUT")

    EB.Template.TableAddfielddefinition("COMPTE.DO", "10","A","")
    EB.Template.FieldSetcheckfile("ACCOUNT")
    EB.Template.TableAddfielddefinition("UNITE.GESTION", "4","A","")
    EB.Template.FieldSetcheckfile("DEPT.ACCT.OFFICER")
    EB.Template.TableAddfielddefinition("DATE.CHARGEMENT", "8","D","")

    EB.Template.TableAddfielddefinition("FT.DECISION", "16","A","")
    EB.Template.TableAddfielddefinition("FICHIER.RECU", "65","A","")
    EB.Template.TableAddfielddefinition("REF.GLOBAL", "40","A","")
    EB.Template.TableAddfielddefinition("REF.CHARGEMENT", "65","A","")

*******************RESERVED
    EB.Template.TableAddfielddefinition("SORT", "10","":@FM:"POSITIF_NEGATIF","")
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
