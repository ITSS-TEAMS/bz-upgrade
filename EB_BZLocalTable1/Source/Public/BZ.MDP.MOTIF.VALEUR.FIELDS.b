* @ValidationCode : MjotMzYwOTc3NjgxOkNwMTI1MjoxNjAwNDc5MTc2MzM4OkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTp0cnVlOk4vQTpSMTlfQU1SLjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 19 Sep 2020 02:32:56
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
SUBROUTINE BZ.MDP.MOTIF.VALEUR.FIELDS
*-------------------------------------------------------------------------
*<doc>
* TODO add a description of the application here.
* @author bououara fehmi
* @stereotype H
*
*
*-------------------------------------------------------------------------
* TODO - You MUST write a .FIELDS routine for the field definitions
*-------------------------------------------------------------------------
* Modification History :
*-----------------------
*ZIT-UPG-R13-R19    :FM CHANGED TO @FM
* ------------------------------------------------------------------------

*** <region name= Header>
*** <desc>Inserts and control logic</desc>
* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;
* $INSERT I_DataTypes - Not Used anymore;
    $USING EB.SystemTables
    $USING EB.API
    $USING EB.Template
*** </region>
*-------------------------------------------------------------------------
    EB.Template.TableDefineid("ID", "" : @FM : "5" : @FM : "A")
*-------------------------------------------------------------------------
    EB.Template.TableAddfielddefinition("CODE.VALEUR","2", "", "")
    EB.Template.FieldSetcheckfile('H.NATURE.STRUCTURE')
    EB.Template.TableAddfielddefinition("MOTIF","2", "A", "")
    EB.Template.FieldSetcheckfile('BZ.MDP.MOT.REJ')
    EB.Template.TableAddfielddefinition("CLASSE","20", "" : @FM : "01_02_03_04_05","")

    EB.Template.TableAddfielddefinition("CERTIFIE","3", "" : @FM : "YES_NO_", "")

    EB.Template.TableAddfielddefinition("BON.A.PAYER","3", "" : @FM : "YES_NO","")
    EB.Template.TableAddfielddefinition("MONTANT.MIN","15", "AMT", "")

*-------------------------------------------------------------------------
    EB.Template.TableAddoverridefield()
*-------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-------------------------------------------------------------------------
RETURN
*-------------------------------------------------------------------------
END
