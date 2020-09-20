* @ValidationCode : MjoxMDk5NTEzMDpDcDEyNTI6MTYwMDQ3ODk1NjgzNjpBZG1pbmlzdHJhdGV1cjotMTotMTowOjE6dHJ1ZTpOL0E6UjE5X0FNUi4wOi0xOi0x
* @ValidationInfo : Timestamp         : 19 Sep 2020 02:29:16
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
SUBROUTINE BZ.CHARG.FICHIER.FIELDS
*-----------------------------------------------------------------------------
* TODO - You MUST write a .FIELDS routine for the field definitions
*** <region name= Header>
*** <desc>Inserts and control logic</desc>
*-----------------------------------------------------------------------------
*Modification History:
*-----------------------------------------------------------------------------
*ZITOUNA-UPG-R13-R19 :
*FM converted to @FM
*-----------------------------------------------------------------------------

* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;
* $INSERT I_DataTypes - Not Used anymore;
    $USING EB.API
    $USING EB.SystemTables
    $USING EB.Template

*** </region>
*-----------------------------------------------------------------------------
    EB.Template.TableDefineid("ID", "" : @FM : "20" : @FM : "A")
*-----------------------------------------------------------------------------
    EB.Template.TableAddfielddefinition("CODE.TRAITEMENT","20", "A", "")
    EB.Template.FieldSetcheckfile('BZ.TYPE.TRAITEMENT')
    EB.Template.TableAddfielddefinition("REF.FICHIER","65", "A", "")
    EB.Template.TableAddfielddefinition("STATUT","15", "" : @FM : "CHARGE_ANNULE_CONFIRME_COMPTABILISE", "")
    EB.Template.TableAddfielddefinition("DATE.CHARG","8", "D", "")
    EB.Template.TableAddfielddefinition("DATE.PEC","8", "D", "")
    EB.Template.TableAddfielddefinition("TOT.DEBIT","15","AMT", "")
    EB.Template.TableAddfielddefinition("TOT.CREDIT","15","AMT", "")
    EB.Template.TableAddfielddefinition("NBRE","10","","")
    EB.Template.TableAddfielddefinition("OBSERVATION","35","A","")
    EB.Template.TableAddfielddefinition("DATE.CONFIRMATION","8","D","")
*-----------------------------------------------------------------------------
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
