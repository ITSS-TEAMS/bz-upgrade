* @ValidationCode : MjotMjA0MTcyNTgzMDpDcDEyNTI6MTYwMDQ3OTM3NTE0NjpBZG1pbmlzdHJhdGV1cjotMTotMTowOjE6dHJ1ZTpOL0E6UjE5X0FNUi4wOi0xOi0x
* @ValidationInfo : Timestamp         : 19 Sep 2020 02:36:15
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : Administrateur
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : true
* @ValidationInfo : Bypass GateKeeper : true
* @ValidationInfo : Compiler Version  : R19_AMR.0
$PACKAGE EB.BZLocalTable1
SUBROUTINE BZ.ZIT.TAMKEEN.REGISTRE.FIELDS
	
	
*Modification histroy :
*ZIT-UPG-R13-R19     :  FM converted to @FM.
*------------------------------------------------
* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;
* $INSERT I_DataTypes - Not Used anymore;
    $USING EB.SystemTables
    $USING EB.API
    $USING EB.Template
*** </region>
*-----------------------------------------------------------------------------
    EB.Template.TableDefineid("ID", "" : @FM : "25" : @FM : "A")
*-----------------------------------------------------------------------------
    EB.Template.TableAddfield("PIECE.ID", EB.Template.T24String,'', '')
    EB.Template.TableAddfield("CODE.PJT", EB.Template.T24String,'', '')
    EB.Template.TableAddfield("NOM.PRENOM", ANY,'', '')
    EB.Template.TableAddfield("REFERENCE.FICHIER", EB.Template.T24String,'', '')
    EB.Template.TableAddfield("STATUT", EB.Template.T24String,'', '')
**RESERVED
    EB.Template.TableAddfielddefinition("RESERVED.1", "10","A","")
    EB.Template.TableAddfielddefinition("RESERVED.2", "10","A","")
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
