* @ValidationCode : MjotMTA3Njk1NDA0MTpDcDEyNTI6MTYwMDU2MDEzNzQ0NzpBZG1pbmlzdHJhdGV1cjotMTotMTowOjE6dHJ1ZTpOL0E6UjIwX1NQNC4wOi0xOi0x
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
SUBROUTINE EDITIQUE.ANR.FIELDS
*-----------------------------------------------------------------------------
*<doc>
* TODO add a description of the application here.
* AUTHOR YENGUI FIRAS
*

*
*
*-----------------------------------------------------------------------------
* TODO - You MUST write a .FIELDS routine for the field definitions
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------
* 08 / 07 / 2010
*ZIT-UPG-R13-R19-FM TO @FM
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
    EB.Template.TableAddfielddefinition("DATE.EDITION", "8","D","")
    EB.Template.TableAddfielddefinition("CODE.BANQUE.TIREE", "5","A","")
    EB.Template.FieldSetcheckfile("BC.SORT.CODE")
    EB.Template.TableAddfielddefinition("LIB.BANQUE.TIREE", "30","A","")
    EB.Template.TableAddfielddefinition("CODE.AGENCE.TIREE", "5","A","")
    EB.Template.FieldSetcheckfile("BC.SORT.CODE")
    EB.Template.TableAddfielddefinition("LIB.AGENCE.TIREE", "30","A","")
    EB.Template.TableAddfielddefinition("CODE.BANQUE.PRES", "5","A","")
    EB.Template.FieldSetcheckfile("BC.SORT.CODE")
    EB.Template.TableAddfielddefinition("LIB.BANQUE.PRES", "30","A","")
    EB.Template.TableAddfielddefinition("CODE.AGENCE.PRES", "5","A","")
    EB.Template.FieldSetcheckfile("BC.SORT.CODE")
    EB.Template.TableAddfielddefinition("LIB.AGENCE.PRES", "30","A","")
    EB.Template.TableAddfielddefinition("NUMERO.CHEQUE", "7","A","")
    EB.Template.TableAddfielddefinition("XX<NAT.PIECE.IDENT", "2","A","")
    EB.Template.TableAddfielddefinition("XX-NNUM.PIECE.IDENT", "20","A","")
    EB.Template.TableAddfielddefinition("XX>NOM.PRENOM.SIGN", "50","A","")
    EB.Template.TableAddfielddefinition("NUMERO.RIB", "20","A","")
    EB.Template.TableAddfielddefinition("TITULAIRE.CMP", "50","A","")
    EB.Template.TableAddfielddefinition("MONTANT.CHEQUE", "20","A","")
    EB.Template.TableAddfielddefinition("NUMERO.CNP", "20","A","")
    EB.Template.TableAddfielddefinition("DATE.CNP", "8","D","")
    EB.Template.TableAddfielddefinition("DATE.PREAVIS",  "8","D","")
    EB.Template.TableAddfielddefinition("HUIS.DERNIER.PV", "50","A","")
    EB.Template.TableAddfielddefinition("NO.DERNIER.PV", "20","A","")
    EB.Template.TableAddfielddefinition("DATE.EXPLOIT",  "8","D","")
    EB.Template.TableAddfielddefinition("DATE.ANR",  "8","D","")

**********
    EB.Template.TableAddfielddefinition("DATE.CHARGEMENT",  "8","D","")
    EB.Template.TableAddfielddefinition("STATUT", "10","":@FM:"MAPPED_UNMAPPED","")
    EB.Template.TableAddfielddefinition("ID.SYNCHRO", "30","A","")
    EB.Template.TableAddfielddefinition("DATE.DERN.REGUL",  "8","D","")

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
