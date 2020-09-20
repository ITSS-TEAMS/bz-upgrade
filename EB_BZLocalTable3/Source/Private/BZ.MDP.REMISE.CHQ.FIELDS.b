* @ValidationCode : MjoyODIwOTMyMzg6Q3AxMjUyOjE2MDA1NjI3NTI2NzQ6QWRtaW5pc3RyYXRldXI6LTE6LTE6MDoxOnRydWU6Ti9BOlIyMF9TUDQuMDotMTotMQ==
* @ValidationInfo : Timestamp         : 20 Sep 2020 01:45:52
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : Administrateur
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : true
* @ValidationInfo : Bypass GateKeeper : true
* @ValidationInfo : Compiler Version  : R20_SP4.0
*-----------------------------------------------------------------------------
* <Rating>-1</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable3
SUBROUTINE BZ.MDP.REMISE.CHQ.FIELDS
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

*ZIT-UPG-R13-R19:FM converted to @FM
* ----------------------------------------------------------------------------

*** <region name= Header>
*** <desc>Inserts and control logic</desc>
* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;
* $INSERT I_DataTypes - Not Used anymore;
    
    $USING EB.API
    $USING EB.SystemTables
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

    EB.Template.TableAddfielddefinition("DATE.CPS","8", "D", "")

    EB.Template.TableAddfielddefinition("AGENCE.REM","3","A","")
    EB.Template.FieldSetcheckfile("DEPT.ACCT.OFFICER")

    EB.Template.TableAddfielddefinition("REF.SCAN","65","A","")

    EB.Template.TableAddfielddefinition("REF.FICHIER", "60","A","")

    EB.Template.TableAddfielddefinition("FT.LIQ.REM", "16","A","")
    EB.Template.TableAddfielddefinition("REF.TEMP", "16","A","")

    EB.Template.TableAddfielddefinition("FT.COMM.REM", "16","A","")
    EB.Template.TableAddfielddefinition("CODE.VAL", "3","A","")

    EB.Template.TableAddfielddefinition("USER","10", "A", "")
    EB.Template.FieldSetcheckfile("USER")
    EB.Template.TableAddfielddefinition("DAO","10", "A", "")
    EB.Template.FieldSetcheckfile("DEPT.ACCT.OFFICER")

    EB.Template.TableAddfielddefinition("MNT.TOTAL.INT","19", "AMT", "")

*-----------------------------------------------------------------------------
    EB.Template.TableAddoverridefield()
    EB.Template.TableAddlocalreferencefield("")
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
