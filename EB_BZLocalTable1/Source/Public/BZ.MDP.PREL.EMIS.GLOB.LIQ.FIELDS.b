* @ValidationCode : MjotMTk2NzY5Mzk0NTpDcDEyNTI6MTYwMDQ3OTE4NDUxNzpBZG1pbmlzdHJhdGV1cjotMTotMTowOjE6dHJ1ZTpOL0E6UjE5X0FNUi4wOi0xOi0x
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
*-----------------------------------------------------------------------------
* <Rating>-5</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable1
SUBROUTINE BZ.MDP.PREL.EMIS.GLOB.LIQ.FIELDS
*-----------------------------------------------------------------------------
*<doc>
* TODO add a description of the application here.
* @author Bounouara fehmi
* @stereotype H
*
*
*-----------------------------------------------------------------------------
* TODO - You MUST write a .FIELDS routine for the field definitions
*-----------------------------------------------------------------------------
* Modification History :

*ZIT-UPG-R13-R19 : FM CHANGED TO @FM
*----------------------------------------------------------------------------
*----------------------------------------------------------------------------

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
    EB.Template.TableDefineid("ID", "" : @FM : "40" : @FM : "A")
*-----------------------------------------------------------------------------
    EB.Template.TableAddfielddefinition("COMPTE", "35","A","")
    EB.Template.TableAddfielddefinition("TYPE.LIQ", "35","A","")

    EB.Template.TableAddfielddefinition("NBRE.ENCAIS", "10","A","")
    EB.Template.TableAddfielddefinition("MNT.ENCAIS", "35","AMT","")

    EB.Template.TableAddfielddefinition("NBRE.REJET", "10","A","")
    EB.Template.TableAddfielddefinition("MNT.REJET", "35","AMT","")

    EB.Template.TableAddfielddefinition("NBRE.REPRIS", "10","A","")
    EB.Template.TableAddfielddefinition("MNT.REPRIS", "35","AMT","")


**RESERVED
    EB.Template.TableAddfielddefinition("NBR.REP.TOT", "10","A","")
    EB.Template.TableAddfielddefinition("MNT.REP.TOT", "19","AMT","")
    EB.Template.TableAddfielddefinition("MNT.COM.ENC", "19","AMT","")
    EB.Template.TableAddfielddefinition("MNT.COM.REJ", "19","AMT","")

    EB.Template.TableAddfielddefinition("MNT.TVA.ENC", "19","AMT","")
    EB.Template.TableAddfielddefinition("MNT.TVA.REJ", "19","AMT","")


    EB.Template.TableAddfielddefinition("RESERVED.7", "10","A","")
    EB.Template.TableAddfielddefinition("RESERVED.8", "10","A","")
    EB.Template.TableAddfielddefinition("RESERVED.9", "10","A","")
    EB.Template.TableAddfielddefinition("RESERVED.10", "10","A","")
*-----------------------------------------------------------------------------
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
