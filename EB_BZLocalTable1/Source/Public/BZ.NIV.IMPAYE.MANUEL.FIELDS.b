* @ValidationCode : MjotNDIyNzQ1OTAzOkNwMTI1MjoxNjAwNDc5MjI1ODMzOkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTp0cnVlOk4vQTpSMTlfQU1SLjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 19 Sep 2020 02:33:45
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
SUBROUTINE BZ.NIV.IMPAYE.MANUEL.FIELDS
*-----------------------------------------------------------------------------
*<doc>
* TODO add a description of the application here.
* @Zeki.benothmen@banquezitouna.com
* @stereotype H
*-----------------------------------------------------------------------------
* TODO - You MUST write a .FIELDS routine for the field definitions
* Modification History :
*-----------------------
*ZIT-UPG-R13-R19 :   removed BP's and changed INCLUDE to INSERT
*                    FM converted to @FM
*-----------------------------------------------------------------------------
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
    EB.Template.TableDefineid("ID", "" : @FM : "23" : @FM : "A")
*-----------------------------------------------------------------------------
    EB.Template.TableAddfielddefinition("ID.COMPTE", "10","A","")
    EB.Template.FieldSetcheckfile("ACCOUNT")

    EB.Template.TableAddfielddefinition("ID.CLIENT", "10","A": @FM :"" : @FM :"NOINPUT", "")
    EB.Template.FieldSetcheckfile("CUSTOMER")

    EB.Template.TableAddfielddefinition("XX<ID.IMPAYE", "3","A": @FM :"" : @FM :"NOINPUT", "")
    EB.Template.TableAddfielddefinition("XX-CONTRAT.LD", "12","A" : @FM :"" : @FM :"NOINPUT", "")
    EB.Template.TableAddfielddefinition("XX-DATE.ECHEANCE", "8","D": @FM :"" : @FM :"NOINPUT", "")
    EB.Template.TableAddfielddefinition("XX>MONTANT.IMPAYE", "19","A" : @FM :"" : @FM :"NOINPUT", "")
**RESERVED
    EB.Template.TableAddfielddefinition("DATE.EXECUTION", "8","D" ,"")
    EB.Template.TableAddfielddefinition("STATUT.GLOBAL","10", "" : @FM : "OK_KO_", "")

    EB.Template.TableAddfielddefinition("RESERVED.3", "10","A" ,"")
    EB.Template.TableAddfielddefinition("RESERVED.4", "10","A" ,"")
    EB.Template.TableAddfielddefinition("RESERVED.5", "10","A" ,"")

*-----------------------------------------------------------------------------
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
 