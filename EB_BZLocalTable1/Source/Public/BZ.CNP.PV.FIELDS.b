* @ValidationCode : MjotMTk0NzM5MzU2MzpDcDEyNTI6MTYwMDQ3ODk2MzQ4MjpBZG1pbmlzdHJhdGV1cjotMTotMTowOjE6dHJ1ZTpOL0E6UjE5X0FNUi4wOi0xOi0x
* @ValidationInfo : Timestamp         : 19 Sep 2020 02:29:23
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : Administrateur
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : true
* @ValidationInfo : Bypass GateKeeper : true
* @ValidationInfo : Compiler Version  : R19_AMR.0
*-------------------------------------------------------------------------
* <Rating>-1</Rating>
*-------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable1
SUBROUTINE BZ.CNP.PV.FIELDS
*-------------------------------------------------------------------------
*<doc>
* TODO add a description of the application here.
* @JAAFAR NABIL
* 20120403
*
*
*-------------------------------------------------------------------------
* TODO - You MUST write a .FIELDS routine for the field definitions
*-------------------------------------------------------------------------
* Modification History :
*-----------------------
*@Maroua Chikhaoui : Ajout d'in nouveau champ HUISSIER qui va contenir le nom du Huissier
*22-06-2017

*ZIT-UPG-R13-R19: CHANGED FM TO @FM
* ------------------------------------------------------------------------
*** <region name= Header>
*** <desc>Inserts and control logic</desc>
* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;
* $INSERT I_DataTypes - Not Used anymore;
    
    $USING EB.API
    $USING EB.SystemTables
    $USING EB.Template
        
*** </region>

*-------------------------------------------------------------------------
    EB.Template.TableDefineid("ID", "" : @FM : "50" : @FM : "A")
*-------------------------------------------------------------------------

    EB.Template.TableAddfielddefinition("REF.DOSSIER","30", "A", "")
    EB.Template.TableAddfielddefinition("SEQ.PV","3", "A", "")
    EB.Template.TableAddfielddefinition("REF.PV","25", "A", "")
    EB.Template.TableAddfielddefinition("ID.HUISSIER","25", "A", "")
    EB.Template.FieldSetcheckfile("BZ.CNP.HUISSIER")
    EB.Template.TableAddfielddefinition("DATE.SIGNIF","8", "D", "")
    EB.Template.TableAddfielddefinition("DATE.RCPT.PV","8", "D", "")
    EB.Template.TableAddfielddefinition("MONTANT.FRAIS","25", "AMT", "")
    EB.Template.TableAddfielddefinition("TYPE.PV","2", "" : @FM : "PP__PM_", "")
    EB.Template.TableAddfielddefinition("REF.PAI.PV","25", "A", "")
    EB.Template.TableAddfielddefinition("HUISSIER","25", "A", "")

    EB.Template.TableAddlocalreferencefield("")
    EB.Template.TableAddoverridefield()
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-------------------------------------------------------------------------
RETURN
*-------------------------------------------------------------------------
END
