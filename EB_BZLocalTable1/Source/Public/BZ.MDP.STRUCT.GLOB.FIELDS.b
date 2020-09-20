* @ValidationCode : MjoxNTA3MDc3MjM3OkNwMTI1MjoxNjAwNDc5MTk3Mjg1OkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTp0cnVlOk4vQTpSMTlfQU1SLjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 19 Sep 2020 02:33:17
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
SUBROUTINE BZ.MDP.STRUCT.GLOB.FIELDS
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
*ZIT-UPG-R13-R19  : FM CHANGES TO @FM
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
    EB.Template.TableDefineid("ID", "" : @FM : "2" : @FM : "") ;* DOIT APPARTENIR A LA TABLE H.NATURE.STRUCTURE
    EB.SystemTables.setIdCheckfile("H.NATURE.STRUCTURE")
*-----------------------------------------------------------------------------
    EB.Template.TableAddfielddefinition("POS.MNT.GLOBAL","4","","")
    EB.Template.TableAddfielddefinition("LNG.MNT.GLOBAL","4","","")
    EB.Template.TableAddfielddefinition("POS.NBR.GLOBAL","4","","")
    EB.Template.TableAddfielddefinition("LNG.NBR.GLOBAL","4","","")
    EB.Template.TableAddfielddefinition("POS.RANG","4","","")
    EB.Template.TableAddfielddefinition("LNG.RANG","4","","")
    EB.Template.TableAddfielddefinition("POS.MNT.1","4","","")
    EB.Template.TableAddfielddefinition("LNG.MNT.1","4","","")
    EB.Template.TableAddfielddefinition("POS.MNT.2","4","","")
    EB.Template.TableAddfielddefinition("LNG.MNT.2","4","","")
    EB.Template.TableAddfielddefinition("POS.DATE.OP","4","","")
    EB.Template.TableAddfielddefinition("DELAI.PRES","4","","")
    EB.Template.TableAddfielddefinition("LNG.LIGNE.GLOBAL","4","","")
    EB.Template.TableAddfielddefinition("LNG.LIGNE.DETAIL","4","","")
    EB.Template.TableAddfielddefinition("POS.MNT.3","4","","")
    EB.Template.TableAddfielddefinition("LNG.MNT.3","4","","")
*-----------------------------------------------------------------------------
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition() ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
