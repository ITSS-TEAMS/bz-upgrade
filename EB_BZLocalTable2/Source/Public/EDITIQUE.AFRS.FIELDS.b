* @ValidationCode : MjoyMjM4MzkzMzpDcDEyNTI6MTYwMDU2MDEzNzIxNDpBZG1pbmlzdHJhdGV1cjotMTotMTowOjE6dHJ1ZTpOL0E6UjIwX1NQNC4wOi0xOi0x
* @ValidationInfo : Timestamp         : 20 Sep 2020 01:02:17
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
SUBROUTINE EDITIQUE.AFRS.FIELDS
*-----------------------------------------------------------------------------
*<doc>
* TODO add a description of the application here.
* AUTHOR FEHMI BOUNOUARA
*

*
*
*-----------------------------------------------------------------------------
* TODO - You MUST write a .FIELDS routine for the field definitions
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------
* 08 / 07 / 2010
*ZIT-UPG-R13-R19    : FM CHANGED TO @FM
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
    EB.Template.TableAddfielddefinition("DATE.AVIS", "8","D","")
    EB.Template.TableAddfielddefinition("BQ.TIRE", "5","A","")
    EB.Template.FieldSetcheckfile("BC.SORT.CODE")
    EB.Template.TableAddfielddefinition("BQ.TIRE.TXT", "30","A","")
    EB.Template.TableAddfielddefinition("BQ.PRES", "5","A","")
    EB.Template.FieldSetcheckfile("BC.SORT.CODE")
    EB.Template.TableAddfielddefinition("BQ.PRES.TXT", "30","A","")
    EB.Template.TableAddfielddefinition("AG.TIRE", "5","A","")
    EB.Template.FieldSetcheckfile("BC.SORT.CODE")
    EB.Template.TableAddfielddefinition("AG.TIRE.TXT", "30","A","")
    EB.Template.TableAddfielddefinition("AG.PRES", "5","A","")
    EB.Template.FieldSetcheckfile("BC.SORT.CODE")
    EB.Template.TableAddfielddefinition("AG.PRES.TXT", "30","A","")
    EB.Template.TableAddfielddefinition("NUM.CHQ", "7","A","")
    EB.Template.TableAddfielddefinition("NUM.TIRE", "35","A","")
    EB.Template.TableAddfielddefinition("DATE.AFRS", "8","D","")
    EB.Template.TableAddfielddefinition("XX<MNT.FRAIS", "19","AMT","")
    EB.Template.TableAddfielddefinition("XX-NOM.HUISSIER", "35","A","")
    EB.Template.TableAddfielddefinition("XX-NUM.EXPLOIT", "15","A","")
    EB.Template.TableAddfielddefinition("XX>DATE.EXPLOIT", "8","D","")
    EB.Template.TableAddfielddefinition("NUM.CNP", "15","A","")
    EB.Template.TableAddfielddefinition("DATE.CNP", "8","D","")
**********
    EB.Template.TableAddfielddefinition("STATUT", "10","":@FM:"MAPPED_UNMAPPED","")
    EB.Template.TableAddfielddefinition("ID.SYNCHRO", "30","A","")
    EB.Template.TableAddfielddefinition("TITULAIRE", "35","A","")
    EB.Template.TableAddfielddefinition("DATE.CHARGEMENT", "8","D","")
*-----------------------------------------------------------------------------
    EB.Template.TableAddlocalreferencefield("")
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
