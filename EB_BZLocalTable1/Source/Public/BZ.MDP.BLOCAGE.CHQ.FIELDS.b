* @ValidationCode : MjotMTU2NDgyMDA5MzpDcDEyNTI6MTYwMDQ3OTE0NzM1MjpBZG1pbmlzdHJhdGV1cjotMTotMTowOjE6dHJ1ZTpOL0E6UjE5X0FNUi4wOi0xOi0x
* @ValidationInfo : Timestamp         : 19 Sep 2020 02:32:27
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
* <Rating>-3</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable1
SUBROUTINE BZ.MDP.BLOCAGE.CHQ.FIELDS
*-----------------------------------------------------------------------------
*<doc>
* TODO add a description of the application here.
* @author ktalhaoui@temenos.com
* @stereotype H
*
*
*-----------------------------------------------------------------------------
* TODO - You MUST write a .FIELDS routine for the field definitions
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------
* 09 / 03 / 10 - ktalhaoui New Template changes

*ZIT-UPG-R13-R19 : FM TO @FM;
* ----------------------------------------------------------------------------

*** <region name= Header>
*** <desc>Inserts and control logic</desc>
*ZIT-UPG-R13-R19/S
* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;
* $INSERT I_DataTypes - Not Used anymore;

    $USING EB.API
    $USING EB.SystemTables
    $USING EB.Template
*ZIT-UPG-R13-R19/E
*** </region>
*-----------------------------------------------------------------------------
    EB.Template.TableDefineid("ID", "" : @FM : "27" : @FM : "A") ;* CMC7 =27
*-----------------------------------------------------------------------------
    EB.Template.TableAddfielddefinition("NUM.CHEQUE", "7","A","")
    EB.Template.TableAddamountfield("MNT.CHEQUE","15", T24_NUMERIC, "")

    EB.Template.TableAddfielddefinition("NUM.RIB", "20","A","")
    EB.Template.TableAddfielddefinition("NUM.CPT", "20","A","")
    EB.Template.TableAddfielddefinition("DEVISE.CPT","3","A","")
    EB.Template.FieldSetcheckfile("CURRENCY")


    EB.Template.TableAddfielddefinition("DATE.BLOCAGE","8","D","")
    EB.Template.TableAddamountfield("MNT.BLOCAGE","15", T24_NUMERIC, "")
    EB.Template.TableAddfielddefinition("IND.BLOCAGE","1" ,"A","")   ;* T:TOTAL, P:PARTIEL

    EB.Template.TableAddfielddefinition("STATUT","10" ,"A","")   ;* 'Cree':'Apure'

*-----------------------------------------------------------------------------
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition() ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
