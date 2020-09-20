* @ValidationCode : MjotMTY1NjEwOTkyOkNwMTI1MjoxNjAwNTYyNzUyNDgyOkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTp0cnVlOk4vQTpSMjBfU1A0LjA6LTE6LTE=
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
* <Rating>-3</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable3
SUBROUTINE BZ.MDP.REGISTRE.CHQ.FIELDS
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
*ZIT-UPG-R13-R19 :  removed BP's and changed INCLUDE to INSERT
*                   FM converted to @FM
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
    EB.Template.TableDefineid("ID", "" : @FM : "35" : @FM : "A")
*-----------------------------------------------------------------------------
    EB.Template.TableAddfielddefinition("CODE.VAL", "35","A","")

    EB.Template.TableAddfielddefinition("DATE.OPERATION", "8","D","")

    EB.Template.TableAddfielddefinition("CODE.DEVISE","3","ANY","")
    EB.Template.FieldSetcheckfile("CURRENCY")

    EB.Template.TableAddamountfield("MNT.CHEQUE","15", T24_NUMERIC, "")

    EB.Template.TableAddfielddefinition("NUM.CHEQUE", "7","A","")

    EB.Template.TableAddfielddefinition("RIB.TIREUR", "20","A","")

    EB.Template.TableAddfielddefinition("CODE.DEST", "2","A","")


    EB.Template.TableAddfielddefinition("RIB.BENEF", "20","A","")

    EB.Template.TableAddfielddefinition("NOM.BENEF", "35","A","")

    EB.Template.TableAddfielddefinition("SITUATION.BENEF", "2","A","")

    EB.Template.TableAddfielddefinition("NATURE.COMPTE","3","","")
    EB.Template.FieldSetcheckfile("BZ.MDP.NATURE.CPT")


    EB.Template.TableAddfielddefinition("DATE.EMISSION", "8","D","")

    EB.Template.TableAddfielddefinition("LIEU.EMISSION", "1","A","")

*Champs specifiques pour 31/32
    EB.Template.TableAddfielddefinition("DATE.CNP", "8","D","")

    EB.Template.TableAddfielddefinition("NUM.CNP", "4","","")

    EB.Template.TableAddfielddefinition("CODE.DEV.POS", "3","ANY","")
    EB.Template.FieldSetcheckfile("CURRENCY")

    EB.Template.TableAddamountfield("MNT.RECLAME","15", T24_NUMERIC, "")

    EB.Template.TableAddamountfield("MNT.REGUL.INT","15", T24_NUMERIC, "")

* Champs specifiques pour traitement
    EB.Template.TableAddfielddefinition("REF.BORD", "12","A","")
*CALL Field.setCheckFile("BZ.MDP.REMISE.CHQ")

    EB.Template.TableAddfielddefinition("NUM.REM", "16","A","")

    EB.Template.TableAddfielddefinition("IDENTIFIANT.CLT","6","","")
    EB.Template.FieldSetcheckfile("CUSTOMER")

    EB.Template.TableAddfielddefinition("CPT.REMETTANT","10","ANY","")
    EB.Template.FieldSetcheckfile("ACCOUNT")

    EB.Template.TableAddfielddefinition("DATE.REMISE", "8","D","")

    EB.Template.TableAddfielddefinition("UNITE.GESTION","3","A","")
    EB.Template.FieldSetcheckfile("DEPT.ACCT.OFFICER")

    EB.Template.TableAddfielddefinition("STATUT", "2","A","")

    EB.Template.TableAddfielddefinition("DATE.COMPENSATION", "8","D","")

    EB.Template.TableAddfielddefinition("REF.FICHIER", "60","A","")

    EB.Template.TableAddfielddefinition("IMAGE.COLLECTE", "3", "" : @FM : "YES_NO_", "")

    EB.Template.TableAddfielddefinition("TYPE.REJET", "3","A","")

    EB.Template.TableAddfielddefinition("PREAVISE", "3", "" : @FM : "YES_NO_", "")

    EB.Template.TableAddfielddefinition("DATE.LIQUIDATION", "8","D","")

    EB.Template.TableAddfielddefinition("FT.ENV.RECOUV", "16","A","")


    EB.Template.TableAddfielddefinition("FT.LIQ.REM", "16","A","")


    EB.Template.TableAddfielddefinition("FT.CHQ.REPRIS", "16","A","")


    EB.Template.TableAddfielddefinition("FT.CHQ.PRV", "16","A","")


    EB.Template.TableAddfielddefinition("FT.LIQ.APRES.PR.1", "16","A","")

    EB.Template.TableAddfielddefinition("FT.LIQ.APRES.PR.2", "16","A","")


    
*-----------------------------------------------------------------------------
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition() ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
