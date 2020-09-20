* @ValidationCode : MjotMjA3OTYyMTg2ODpDcDEyNTI6MTYwMDQ3ODk2MzE0MTpBZG1pbmlzdHJhdGV1cjotMTotMTowOjE6dHJ1ZTpOL0E6UjE5X0FNUi4wOi0xOi0x
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
*-----------------------------------------------------------------------------
* <Rating>-2</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable1
SUBROUTINE  BZ.CNP.HUISSIER.FIELDS
*-----------------------------------------------------------------------------
*<doc>
* TODO add a description of the application here.
* @JAAFAR NABIL
* 20120403
*
*
*-----------------------------------------------------------------------------
* TODO - You MUST write a .FIELDS routine for the field definitions
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------

*ZIT-UPG-R13-R19: CHANGED FM TO @FM
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
    EB.Template.TableDefineid("ID", "" : @FM : "6" : @FM : "A")
*RIB : NUM_CHEQUE
*-----------------------------------------------------------------------------

    VT.REGIME      = "BZ.CNP.HUIS.REG.FISC"
    EB.Template.LookupList(VT.REGIME)


    EB.Template.TableAddfielddefinition("NUM.ACCOUNT","12", "A", "")
    EB.Template.FieldSetcheckfile("ACCOUNT")
    EB.Template.TableAddfielddefinition("NOM.HUISSIER","25", "A", "")
    EB.Template.TableAddfielddefinition("REG.FISC","8", VT.REGIME, "")
    EB.Template.TableAddfielddefinition("MATRICULE.FIS","13", "A", "")

    EB.Template.TableAddfielddefinition("CA.INITIAL","15", "AMT", "")
    EB.Template.TableAddfielddefinition("CA.CUMUL","15", "AMT", "")
    EB.Template.TableAddfielddefinition("MVMT.SENS","1", "":@FM:"C_D", "")
    EB.Template.TableAddfielddefinition("MVMT.MNT","15", "AMT", "")
    EB.Template.TableAddfielddefinition("ADRESSE", "150", "A", "")

    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
