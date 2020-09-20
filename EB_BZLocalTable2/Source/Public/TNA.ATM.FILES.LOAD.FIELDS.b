* @ValidationCode : MjoxNDU1MTI0OTY3OkNwMTI1MjoxNjAwNTYwMTQxMTIyOkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTp0cnVlOk4vQTpSMjBfU1A0LjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 20 Sep 2020 01:02:21
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
* <Rating>-2</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable2
SUBROUTINE TNA.ATM.FILES.LOAD.FIELDS
*-----------------------------------------------------------------------------
*<doc>
* @author aajouad@temenos.com
* @stereotype H
*
*
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------
* Version Initiale 13/08/2009 -- STD 0.1 23/06/09
*ZIT-UPG-R13-R19  : FM CHANGED TO @FM
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
    EB.Template.TableDefineid("ID.CHG",  "" : @FM : "20" : @FM : "A")  ;* Define Table id
*-----------------------------------------------------------------------------

    EB.Template.TableAddfielddefinition("DESCRIPTION","35", "A", "")
    EB.Template.TableAddfielddefinition("DOSSIER", "35", "A", "")
    EB.Template.TableAddfielddefinition("XX.FICHIERS", "35", "A": @FM : "" : @FM : "NOINPUT","")
    EB.Template.TableAddfielddefinition("NIVEAU.TRAITEMENT", "15.1", "" : @FM : "DONNEES_COMPTABILISATION_TERMINE","")
    EB.Template.TableAddfielddefinition("ACTION","10.1","" : @FM : "CHARGER_ANNULER","")
    EB.Template.TableAddfielddefinition("FILE.TOTAL.DB","15","AMT": @FM : "" : @FM : "NOINPUT","")
    EB.Template.TableAddfielddefinition("FILE.TOTAL.CR","15","AMT": @FM : "" : @FM : "NOINPUT","")
    EB.Template.TableAddfielddefinition("FT.TOTAL.DB","15","AMT": @FM : "" : @FM : "NOINPUT","")
    EB.Template.TableAddfielddefinition("FT.TOTAL.CR","15","AMT": @FM : "" : @FM : "NOINPUT","")
    EB.Template.TableAddfielddefinition("XX.LINES.WITH.ERRORS","2","": @FM : "" : @FM : "NOINPUT","")

*-----------------------------------------------------------------------------

    EB.Template.TableAddlocalreferencefield("")
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
