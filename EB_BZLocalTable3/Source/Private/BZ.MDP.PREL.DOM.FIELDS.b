* @ValidationCode : MjotMTY3MzM3MjE4NTpDcDEyNTI6MTYwMDU2MjE5MjgzNDpBZG1pbmlzdHJhdGV1cjotMTotMTowOjE6dHJ1ZTpOL0E6UjIwX1NQNC4wOi0xOi0x
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
SUBROUTINE BZ.MDP.PREL.DOM.FIELDS
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
*ZIT-UPG-R13-R19     :Converted FM to @FM.
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
    EB.Template.TableAddfielddefinition("CODE.DEST", "2","A","")
    EB.Template.TableAddfielddefinition("RIB.PAYEUR", "20","A","")
    EB.Template.TableAddfielddefinition("REF.DOM", "35","A","")
    EB.Template.TableAddfielddefinition("TEL.PAYEUR", "10","A","")
    EB.Template.TableAddfielddefinition("CODE.PAYEUR", "1","","")
    EB.Template.TableAddfielddefinition("CODE.MAJ", "1","A","")
    EB.Template.TableAddfielddefinition("DATE.CONTRAT", "8","D","")
    EB.Template.TableAddfielddefinition("DATE.RESILIATION", "8","D","")
    EB.Template.TableAddfielddefinition("ZONE.LIBRE", "88","A","")

*******************specifique
    EB.Template.TableAddfielddefinition("LIGNE.RECU", "160","A","")
    EB.Template.TableAddfielddefinition("STATUT", "20","A","")
    EB.Template.FieldSetcheckfile("BZ.TRAIT.STATUT")

    EB.Template.TableAddfielddefinition("DATE.CHARGEMENT", "8","D","")

    EB.Template.TableAddfielddefinition("REF.GLOBAL", "40","A","")
    EB.Template.TableAddfielddefinition("REF.CHARGEMENT", "20","A","")
    EB.Template.TableAddfielddefinition("FICHIER.EMIS", "65","A","")
    EB.Template.TableAddfielddefinition("FICHIER.RECU", "65","A","")
    EB.Template.TableAddfielddefinition("DATE.OPERATION", "8","D","")
    EB.Template.TableAddfielddefinition("DATE.COMPENSATION", "8","D","")
    EB.Template.TableAddfielddefinition("NUM.LOT", "4","A","")
    EB.Template.TableAddfielddefinition("CODE.EMETTEUR","6","A","")
*******************RESERVED
    EB.Template.TableAddfielddefinition("CODE.RESTRICTED", "2","A","")
    EB.Template.TableAddfielddefinition("ANCIEN.RIB.PAY", "20","A","")
    EB.Template.TableAddfielddefinition("MOTIF.RESTRICT", "2","A","")
    EB.Template.TableAddfielddefinition("DTE.REST", "8","D","")
    EB.Template.TableAddfielddefinition("DTE.LEV.REST", "8","D","")
    EB.Template.TableAddfielddefinition("RESTRICTED", "3","":@FM:"YES_NO","")
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
