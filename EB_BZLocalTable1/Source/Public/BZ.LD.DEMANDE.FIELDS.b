* @ValidationCode : MjotMTQ3NTM1OTk3NDpDcDEyNTI6MTYwMDQ3OTA5NzM0MjpBZG1pbmlzdHJhdGV1cjotMTotMTowOjE6dHJ1ZTpOL0E6UjE5X0FNUi4wOi0xOi0x
* @ValidationInfo : Timestamp         : 19 Sep 2020 02:31:37
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
SUBROUTINE BZ.LD.DEMANDE.FIELDS
*-----------------------------------------------------------------------------
*<doc>
* TODO add a description of the application here.
* Zeki.BenOthmen@banquezitouna.com
* 2013/04/08
*
*
*-----------------------------------------------------------------------------
* TODO - You MUST write a .FIELDS routine for the field definitions
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------
*ZIT-UPG-R13-R19:FM converted to @FM
* ----------------------------------------------------------------------------
*** <region name= Header>
*** <desc>Inserts and control logic</desc>
*ZIT-UPG-R13-R19 S
* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;
* $INSERT I_DataTypes - Not Used anymore;

    $USING EB.API
    $USING EB.SystemTables
    $USING EB.Template
*ZIT-UPG-R13-R19 E
*** </region>

*-----------------------------------------------------------------------------
    EB.Template.TableDefineid("ID", "" : @FM : "20" : @FM : "A")
*-----------------------------------------------------------------------------
    EB.Template.TableAddfielddefinition("REF.LD","25", "A", "")
    EB.Template.TableAddfielddefinition("AGENCE","4", "A", "")
    EB.Template.FieldSetcheckfile("DEPT.ACCT.OFFICER")
    EB.Template.TableAddfielddefinition("DATE.MEP","8", "D", "")
    EB.Template.TableAddfielddefinition("DATE.DECISION","8", "D", "")
    EB.Template.TableAddfielddefinition("SEG.FIN","3", "A", "")
    EB.Template.FieldSetcheckfile("BZ.SEGMENT.FINANCEMENT")


    EB.Template.TableAddfielddefinition("TYPE.PRODUIT","3", "A", "")
    EB.Template.FieldSetcheckfile("IS.H.PRODUCTS")

    EB.Template.TableAddfielddefinition("AMT.FIN","50", "A", "")
    EB.Template.TableAddfielddefinition("NIV.RISQUE","3", "A", "")
    EB.Template.FieldSetcheckfile("BZ.NIVEAU.RISQUE")


    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
