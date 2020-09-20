* @ValidationCode : MjotMTQ2NzU3MTk4OTpDcDEyNTI6MTYwMDQ3OTE4NDAwNzpBZG1pbmlzdHJhdGV1cjotMTotMTowOjE6dHJ1ZTpOL0E6UjE5X0FNUi4wOi0xOi0x
* @ValidationInfo : Timestamp         : 19 Sep 2020 02:33:04
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : Administrateur
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : true
* @ValidationInfo : Bypass GateKeeper : true
* @ValidationInfo : Compiler Version  : R19_AMR.0
* Modification History :
*-----------------------
*ZIT-UPG-R13-R19    : FM CHANGED TO @FM
*-----------------------------------------------------------------------------
* <Rating>-1</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable1
SUBROUTINE BZ.MDP.OPPOSITION.EFFET.FIELDS
*-----------------------------------------------------------------------------
*<doc>
* TODO add a description of the application here.
* @author Bounouara Fehmi
* @stereotype H
*
*
*-----------------------------------------------------------------------------
* TODO - You MUST write a .FIELDS routine for the field definitions
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
    EB.Template.TableDefineid("ID", "" : @FM : "12" : @FM : "A")
*-----------------------------------------------------------------------------
    EB.Template.TableAddfielddefinition("NUM.EFFET", "12","A","")
    EB.Template.TableAddfielddefinition("NUM.COMPTE", "10","ACC","")
    EB.Template.FieldSetcheckfile("ACCOUNT")
    EB.Template.TableAddfielddefinition("DATE.ECHEANCE", "8","D","")
    EB.Template.TableAddamountfield("MONTANT","15", T24_NUMERIC, "")
    EB.Template.TableAddfielddefinition("MOTIF", "2","A","")
    EB.Template.FieldSetcheckfile("PAYMENT.STOP.TYPE")
    EB.Template.TableAddfielddefinition("OBSERVATION", "30","A","")
    EB.Template.TableAddfielddefinition("DATE.CREATION", "8","D","")
    EB.Template.TableAddfielddefinition("STATUT", "2","A","")
    EB.Template.TableAddfielddefinition("DATE.MAIN.LEVEE", "8","D","")

*-----------------------------------------------------------------------------
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
