* @ValidationCode : MjotNzEyODIwMjg0OkNwMTI1MjoxNjAwNTYwMTQxOTE4OkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTp0cnVlOk4vQTpSMjBfU1A0LjA6LTE6LTE=
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
*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R13-R19  : FM CHANGED TO @FM
*-----------------------------------------------------------------------------

* <Rating>-2</Rating>
*-----------------------------------------------------------------------------

*-----------------------------------------------------------------------------

*<Rating></Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable2
SUBROUTINE TNA.ATM.TXN.MAPPING.FIELDS
*-----------------------------------------------------------------------------

*<doc>
* TODO add a description of the application here
* @stereotype H
*
*
* ----------------------------------------------------------------------------

*** <region name= Header>
*** /**/
* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;
* $INSERT I_DataTypes - Not Used anymore;
    $USING EB.SystemTables
    $USING EB.API
    $USING EB.Template
*** </region>
* ----------------------------------------------------------------------------

    EB.Template.TableDefineid("CODE.OPE", EB.Template.T24String)   ;* Define Table id
* ----------------------------------------------------------------------------

    EB.Template.TableAddfielddefinition("DESCRIPTION","35","A","")
    EB.Template.TableAddfielddefinition("PRIORITY","1.1","" : @FM : "1_2","")
   
    EB.Template.TableAddfielddefinition("T24.APPLICATION","35","A","")
    EB.Template.FieldSetcheckfile("STANDARD.SELECTION")

    EB.Template.TableAddfielddefinition("T24.ECRAN","35","A","")
    EB.Template.FieldSetcheckfile("VERSION")

    EB.Template.TableAddfielddefinition("UTILISATEUR","20","A","")
    
    EB.Template.TableAddfielddefinition("PASSWORD","35","A","")

    EB.Template.TableAddfielddefinition("OFS.SOURCE","35","A","")
    EB.Template.FieldSetcheckfile("OFS.SOURCE")
    
    EB.Template.TableAddfielddefinition("OFS.FUNCTION","1","" : @FM : "I_R_A_D","")
    EB.Template.TableAddfielddefinition("ID.TXN","35","A" ,"")

    EB.Template.TableAddfielddefinition("XX<ATM.FIELD.NUM","2","","")
    EB.Template.TableAddfielddefinition("XX-T24.FIELD.NAME","35","A","")
    EB.Template.TableAddfielddefinition("XX-CONSTANTE","35","A","")
    EB.Template.TableAddfielddefinition("XX-CONVERSION.RTN","35","A","")
   
    EB.Template.TableAddfielddefinition("XX>CONTROL.RTN","35","A","")

* ----------------------------------------------------------------------------

    EB.Template.TableAddlocalreferencefield("")
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------

    EB.Template.TableSetauditposition()         ;* Poputale audit information

*-----------------------------------------------------------------------------

RETURN
*-----------------------------------------------------------------------------

END
