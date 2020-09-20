* @ValidationCode : MjotMTU1MzEyOTM4NzpDcDEyNTI6MTYwMDQ3OTA5NDU2OTpBZG1pbmlzdHJhdGV1cjotMTotMTowOjE6dHJ1ZTpOL0E6UjE5X0FNUi4wOi0xOi0x
* @ValidationInfo : Timestamp         : 19 Sep 2020 02:31:34
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : Administrateur
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : true
* @ValidationInfo : Bypass GateKeeper : true
* @ValidationInfo : Compiler Version  : R19_AMR.0
*-----------------------------------------------------------------------------
* <Rating>-1</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable1
SUBROUTINE BZ.IJR.CRT.PROVISOIRE.FIELDS
*-----------------------------------------------------------------------------
*<doc>
* TODO add a description of the application here.
* @ ZEKI BEN OTHMEN
* 20130513
*
*
*-----------------------------------------------------------------------------
* TODO - You MUST write a .FIELDS routine for the field definitions
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------
*ZIT-UPG-R13-R19   :  removed BP's and changed INCLUDE to INSERT
*                     FM covnerted to @FM
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
    EB.Template.TableDefineid("ID", "" : @FM : "15" : @FM : "A")
*-----------------------------------------------------------------------------
    EB.Template.TableAddfielddefinition("CLIENT","10", "A", "")
    EB.Template.FieldSetcheckfile("CUSTOMER")

    EB.Template.TableAddfielddefinition("PRODUIT","5", "A", "")
    EB.Template.FieldSetcheckfile("IS.H.PRODUCTS")

    EB.Template.TableAddfielddefinition("MONTANT.BIEN","19", "AMT", "")
    EB.Template.TableAddfielddefinition("MONTANT.ACOMPTE","19", "AMT", "")
    EB.Template.TableAddfielddefinition("MONTANT.FIN","19", "AMT", "")

    EB.Template.TableAddfielddefinition("DATE.VALEUR","8", "D", "")
    EB.Template.TableAddfielddefinition("DATE.ECHEANCE","8", "D", "")

    EB.Template.TableAddfielddefinition("PERIODE.GRACE","3", "A", "")

    EB.Template.TableAddfielddefinition("MARGE","5", "R", "")
    EB.Template.TableAddfielddefinition("TAUX","5", "R", "")

    EB.Template.TableAddfielddefinition("SUSP.TVA.CLIENT","3", "" : @FM : "Oui_Non_", "")
    EB.Template.TableAddfielddefinition("SUSP.TVA.CONTRAT","3", "" : @FM : "Oui_Non_", "")

    EB.Template.TableAddfielddefinition("PERIODICITE","15", "" : @FM : "Mensuelle_Trimestrielle_Semestrielle_Annuelle", "")

    EB.Template.TableAddfielddefinition("REF.LD","12", "A", "")

    EB.Template.TableAddfielddefinition("NBR.MOIS","3", "", "")

    EB.Template.TableAddfielddefinition("PRIME.TAKAFUL","19", "AMT", "")

    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
