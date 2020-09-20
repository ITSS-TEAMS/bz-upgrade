* @ValidationCode : MjotMzc1OTI5MjpDcDEyNTI6MTYwMDQ3OTE5NjMzOTpBZG1pbmlzdHJhdGV1cjotMTotMTowOjE6dHJ1ZTpOL0E6UjE5X0FNUi4wOi0xOi0x
* @ValidationInfo : Timestamp         : 19 Sep 2020 02:33:16
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
*----------------------
*ZIT-UPG-R13-R19    : FM CHANGED TO  @FM
*-----------------------------------------------------------------------------
* <Rating>-1</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable1
SUBROUTINE BZ.MDP.REMISE.CHQ.TEMP.FIELDS
*-----------------------------------------------------------------------------
*<doc>
* TODO add a description of the application here.
* @author BOUNOUARA Fehmi
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
    EB.Template.TableAddfielddefinition("NUM.REM", "16","A","")

    EB.Template.TableAddfielddefinition("ID.CLIENT","10","","")
    EB.Template.FieldSetcheckfile("CUSTOMER")

    EB.Template.TableAddfielddefinition("COMPTE.REM","10","ANY","")
    EB.Template.FieldSetcheckfile("ACCOUNT")

    EB.Template.TableAddfielddefinition("DEVISE.REM","3","ANY","")
    EB.Template.FieldSetcheckfile("CURRENCY")

    EB.Template.TableAddfielddefinition("RIB.BENEF","20","A","")

    EB.Template.TableAddfielddefinition("NOM.BENEF","35","A","")

    EB.Template.TableAddfielddefinition("SITUATION.BENEF","3","A","")
    EB.Template.FieldSetcheckfile("BZ.MDP.SITUATION.CLT")

    EB.Template.TableAddfielddefinition("NATURE.COMPTE","3","","")
    EB.Template.FieldSetcheckfile("BZ.MDP.NATURE.CPT")

    EB.Template.TableAddfielddefinition("NBRE.GLOBAL","10","","")

    EB.Template.TableAddamountfield("MNT.GLOBAL","15", T24_NUMERIC, "")

    EB.Template.TableAddfielddefinition("STATUT","2", "A", "")

    EB.Template.TableAddfielddefinition("DATE.REM","8", "D", "")

    EB.Template.TableAddfielddefinition("AGENCE.REM","3","A","")
    EB.Template.FieldSetcheckfile("DEPT.ACCT.OFFICER")
    EB.Template.TableAddfielddefinition("REF.FINALE","16","A","")


*-----------------------------------------------------------------------------
    EB.Template.TableAddoverridefield()
    EB.Template.TableAddlocalreferencefield("")
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition() ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
