* @ValidationCode : MjotNDMxMTI0NTk3OkNwMTI1MjoxNjAwNDc5MzQzNzM3OkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTp0cnVlOk4vQTpSMThfQU1SLjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 19 Sep 2020 02:35:43
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : Administrateur
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : true
* @ValidationInfo : Bypass GateKeeper : true
* @ValidationInfo : Compiler Version  : R18_AMR.0
*-------------------------------------------------------------------------
*-----------------------------------------------------------------------------
* <Rating>-2</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable1
SUBROUTINE BZ.TRES.COURS.CHANGE.FIELDS
*-------------------------------------------------------------------------
*<doc>
* TODO add a description of the application here.
* @author bounouara fehmi
* @stereotype H
*
*-------------------------------------------------------------------------
* Modification History :
*-----------------------
*ZIT-UPG-R13-R19-FM TO @FM
*-------------------------------------------------------------------------

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
    EB.Template.TableDefineid("ID", "" : @FM : "35" : @FM : "A")    ;* Define Table id
*-------------------------------------------------------------------------
    EB.Template.TableAddfielddefinition("XX.MARCHE","6","A","")
    EB.Template.FieldSetcheckfile("CURRENCY.MARKET")
    EB.Template.TableAddfielddefinition("DATE.CHARGEMENT","8","D","")
    EB.Template.TableAddfielddefinition("STATUT","10","A","")
    EB.Template.TableAddfielddefinition("XX.MESSAGE","40","A","")
    EB.Template.TableAddfielddefinition("RESERVED.2","10","A","")
    EB.Template.TableAddfielddefinition("RESERVED.3","10","A","")
    EB.Template.TableAddfielddefinition("RESERVED.4","10","A","")
*-------------------------------------------------------------------------
    EB.Template.TableAddlocalreferencefield("")
    EB.Template.TableAddoverridefield()
*-------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-------------------------------------------------------------------------
RETURN
*-------------------------------------------------------------------------
END
