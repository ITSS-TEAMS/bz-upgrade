* @ValidationCode : MjotMjEyMTc0NzUxODpDcDEyNTI6MTYwMDQ3OTEzMzUwNjpBZG1pbmlzdHJhdGV1cjotMTotMTowOjE6dHJ1ZTpOL0E6UjE5X0FNUi4wOi0xOi0x
* @ValidationInfo : Timestamp         : 19 Sep 2020 02:32:13
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
SUBROUTINE BZ.MDP.ARP.EMIS.FIELDS
*-----------------------------------------------------------------------------
*<doc>
* TODO add a description of the application here.
* @author Anas KTALHAOUI
* @stereotype H
*
*
*-----------------------------------------------------------------------------
* TODO - You MUST write a .FIELDS routine for the field definitions
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------
* 12 / 04 / 2010 - KTALHAOUI@temenos.com New Template changes
*ZIT-UPG-R13-R19      : Converted FM TO @FM.
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
    EB.Template.TableDefineid("ID", "" : @FM : "27" : @FM : "A") ;* CMC7
*-----------------------------------------------------------------------------
    EB.Template.TableAddfielddefinition("DATE.OPERATION", "8", "D", "")

    EB.Template.TableAddfielddefinition("NUM.LOT","4", "", "")

    EB.Template.TableAddamountfield("MNT.CHQ", "15", T24_NUMERIC, "")

    EB.Template.TableAddfielddefinition("NUM.CHQ","7", "A", "")

    EB.Template.TableAddfielddefinition("RIB.TIREUR", "20", "A", "")
 
    EB.Template.TableAddfielddefinition("CPT.TIREUR", "10", "ANY", "")
    EB.Template.FieldSetcheckfile('ACCOUNT')

    EB.Template.TableAddfielddefinition("RIB.BENEF", "20", "A", "")

    EB.Template.TableAddfielddefinition("DATE.EMISS.CHQ","8", "D", "")

    EB.Template.TableAddfielddefinition("LIEU","1", "A", "")

    EB.Template.TableAddfielddefinition("DATE.CNP","8", "D", "")

    EB.Template.TableAddfielddefinition("NUM.CNP","4", "A", "")

    EB.Template.TableAddamountfield("MNT.REGUL.CHQ","15", T24_NUMERIC, "")

    EB.Template.TableAddamountfield("MNT.REGUL.INTERET","15", T24_NUMERIC, "")

    EB.Template.TableAddfielddefinition("ZONE.LIBRE","35", "A", "")

    EB.Template.TableAddfielddefinition("STATUT","2", "A", "")


*-----------------------------------------------------------------------------

    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition() ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
