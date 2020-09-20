* @ValidationCode : MjoxNTk2NTQ0MjI3OkNwMTI1MjoxNjAwNDc5MDM1NDE1OkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTp0cnVlOk4vQTpSMTlfQU1SLjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 19 Sep 2020 02:30:35
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
SUBROUTINE BZ.ETR.DOSSIER.TRA.FIELDS
*-----------------------------------------------------------------------------
*<doc>
* TODO add a description of the application here.
* @author FEHMI
* @stereotype H
**
*-----------------------------------------------------------------------------
* TODO - You MUST write a .FIELDS routine for the field definitions
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------
*ZIT-UPG-R13-R19      : Change FM to @FM
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
    EB.Template.TableDefineid("ID", "" : @FM : "16" : @FM : "A") ;
*-----------------------------------------------------------------------------
    EB.Template.TableAddfielddefinition("DATE.OPERATION","35", "A", "")
    EB.Template.TableAddfielddefinition("STATUT", "5", "A","")
    EB.Template.TableAddfielddefinition("REF.ACHEVEMENT", "20", "A","")
    EB.Template.TableAddfielddefinition("RESERVED.1","35", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED.2","35", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED.3","35", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED.4","35", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED.5","35", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED.6","35", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED.7","35", "A", "")

*-----------------------------------------------------------------------------

    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
