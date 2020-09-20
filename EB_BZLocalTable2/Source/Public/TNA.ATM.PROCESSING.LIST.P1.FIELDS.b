* @ValidationCode : MjoxOTM4ODYyNjk0OkNwMTI1MjoxNjAwNTYwMTQxNDczOkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTp0cnVlOk4vQTpSMjBfU1A0LjA6LTE6LTE=
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
*ZIT-UPG-R13-R19  : VM CHANGED TO @VM
*-----------------------------------------------------------------------------

* <Rating>-2</Rating>
*-----------------------------------------------------------------------------

*-----------------------------------------------------------------------------

*<Rating></Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable2

SUBROUTINE TNA.ATM.PROCESSING.LIST.P1.FIELDS
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

    EB.Template.TableDefineid("LINE.ID", EB.Template.T24String)    ;* Define Table id
* ----------------------------------------------------------------------------

    EB.Template.TableAddfielddefinition("FULL.LINE","300","A","")
    EB.Template.TableAddfielddefinition("FT.REF","20","A","")
    EB.Template.TableAddfielddefinition("TRAITE","2","" : @VM : "Oui_Non","")
    EB.Template.TableAddfielddefinition("ERRORS","35","A","")
    EB.Template.TableAddfielddefinition("MAP.ID","15","A","")
    EB.Template.TableAddfielddefinition("ID.CHG","20","A","")
* ----------------------------------------------------------------------------

    EB.Template.TableAddlocalreferencefield("")
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------

    EB.Template.TableSetauditposition()         ;* Poputale audit information

*-----------------------------------------------------------------------------

RETURN
*-----------------------------------------------------------------------------

END
