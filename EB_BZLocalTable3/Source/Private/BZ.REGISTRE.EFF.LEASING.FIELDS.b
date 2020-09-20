* @ValidationCode : MjotMTE5ODYyNzUyMTpDcDEyNTI6MTYwMDU2Mjc1MzU0NzpBZG1pbmlzdHJhdGV1cjotMTotMTowOjE6dHJ1ZTpOL0E6UjIwX1NQNC4wOi0xOi0x
* @ValidationInfo : Timestamp         : 20 Sep 2020 01:45:53
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : Administrateur
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : true
* @ValidationInfo : Bypass GateKeeper : true
* @ValidationInfo : Compiler Version  : R20_SP4.0
*Modification History:
*-------------------------------------------------------------
*ZIT-UPG-R13-R19  : FM CHANGED TO @FM
*----------------------------------------------------------------------------
* <Rating>-1</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable3
SUBROUTINE BZ.REGISTRE.EFF.LEASING.FIELDS
*-----------------------------------------------------------------------------
*<doc>
* TODO add a description of the application here.
* @author FEHMI BOUNOUARA
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
    EB.Template.TableDefineid("ID", "" : @FM : "30" : @FM : "A")
*-----------------------------------------------------------------------------
    EB.Template.TableAddfielddefinition("CODE.VALEUR", "2","A","")
    EB.Template.TableAddfielddefinition("RIB.TIRE", "20","A","")
    EB.Template.TableAddfielddefinition("NOM.TIRE", "35","A","")
    EB.Template.TableAddfielddefinition("NUM.LCN", "12","A","")
    EB.Template.TableAddfielddefinition("DATE.ECHEANCE", "8","D","")
    EB.Template.TableAddfielddefinition("MONTANT", "15","AMT","")


**********CHAMPS TRAITEMENT

    EB.Template.TableAddfielddefinition("REF.REMISE", "35","A","")
    EB.Template.TableAddfielddefinition("REF.INTERNE", "35","A","")

    EB.Template.TableAddfielddefinition("RIB.BENEF", "20","A","")
    EB.Template.TableAddfielddefinition("NOM.BENEF", "35","A","")

    EB.Template.TableAddfielddefinition("STATUT", "20","A","")
    EB.Template.FieldSetcheckfile("BZ.TRAIT.STATUT")
    EB.Template.TableAddfielddefinition("REF.CHARGEMENT", "35","A","")
    EB.Template.TableAddfielddefinition("DATE.CHARGEMENT", "35","A","")
    EB.Template.TableAddfielddefinition("SCANNE", "35","A","")
    EB.Template.TableAddfielddefinition("MOTIF.REJET", "35","A","")
    EB.Template.TableAddfielddefinition("REF.FICHIER", "35","A","")
    EB.Template.TableAddfielddefinition("DATE.CAPTURE", "8","D","")
    EB.Template.TableAddfielddefinition("REF.CLET", "20","A","")
    EB.Template.TableAddfielddefinition("DATE.CREATION", "8","D","")
    EB.Template.TableAddfielddefinition("FICHIER.EMIS", "65","A","")
    EB.Template.TableAddfielddefinition("SORT", "20","":@FM:"POSITIF_NEGATIF","")
    EB.Template.TableAddfielddefinition("REF.CLASSEMENT","10","A","")
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
