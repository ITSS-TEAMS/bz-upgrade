* @ValidationCode : MjoxODkxMzIwNzI2OkNwMTI1MjoxNjAwNTYwMTQzODgwOkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTp0cnVlOk4vQTpSMjBfU1A0LjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 20 Sep 2020 01:02:23
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
* <Rating>-24</Rating>
*-----------------------------------------------------------------------------
* Modification History :
*ZIT-UPG-R13-R19:FM converted to @FM
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable2
SUBROUTINE TNA.CARD.LIMITS.FIELDS
*-----------------------------------------------------------------------------
*********************************************************************
*********************************************************************

* @stereotype H
*********************************************************************
*-----------------------------------------------------------------------------
*** <region name= Header>
* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;
* $INSERT I_DataTypes - Not Used anymore;

    $USING EB.API
    $USING EB.SystemTables
    $USING EB.Template
*** </region>
*-----------------------------------------------------------------------------
* <Main controlling section>
*----------------------------------------------------------------------

    GOSUB INITIALISATION
    GOSUB MAIN.PROCESS

RETURN
*---------------------------------------------------------------------------
INITIALISATION:
*file opening, variable set up

RETURN
*---------------------------------------------------------------------------
MAIN.PROCESS:
*main subroutine processing

    EB.Template.TableDefineid("ID", EB.Template.T24String);* Define Table id
    EB.Template.TableAddfielddefinition("WORDING","30","A","");*
    EB.Template.TableAddfielddefinition("CURRENCY","3.3","A","");*
    EB.Template.FieldSetcheckfile("CURRENCY")
    EB.Template.TableAddamountfield("XX<DAILY.ONUS.AMT","CURRENCY","","");*
    EB.Template.TableAddfielddefinition("XX-DAILY.ONUS.NBR","4","","");*
    EB.Template.TableAddamountfield("XX-DAILY.NAT.AMT","CURRENCY","","");*
    EB.Template.TableAddfielddefinition("XX-DAILY.NAT.NBR","4","","");*
    EB.Template.TableAddamountfield("XX-DAILY.INT.AMT","CURRENCY","","");*
    EB.Template.TableAddfielddefinition("XX-DAILY.INT.NBR","4","","");*
    

    EB.Template.TableAddamountfield("XX-PER.ONUS.AMT","CURRENCY","","");*
    EB.Template.TableAddfielddefinition("XX-PER.ONUS.NBR","4","","");*
    EB.Template.TableAddamountfield("XX-PER.NAT.AMT","CURRENCY","","");*
    EB.Template.TableAddfielddefinition("XX-PER.NAT.NBR","4","","");*
    EB.Template.TableAddamountfield("XX-PER.INT.AMT","CURRENCY","","");*
    EB.Template.TableAddfielddefinition("XX-PER.INT.NBR","4","","");*
    EB.Template.TableAddfielddefinition("XX-PERIOD.VALUE","10", "" : @FM : "1 SEMAINE_1 MOIS_", "")

    EB.Template.TableAddfieldwitheblookup("XX-PRROCESSING.CODE","PROC","");*
    EB.Template.TableAddamountfield("XX-DAILY.TOTAL.AMT","CURRENCY","","");*
    EB.Template.TableAddfielddefinition("XX-DAILY.TOTAL.NBR","4","","");*
    EB.Template.TableAddamountfield("XX-PER.TOTAL.AMT","CURRENCY","","");*
    EB.Template.TableAddfielddefinition("XX>PER.TOTAL.NBR","15","","");*

    EB.Template.TableAddlocalreferencefield("")
    EB.Template.TableAddoverridefield()
    EB.Template.TableSetauditposition() ;* Poputale audit information

RETURN
* ----------------------------------------------------------------------------
END
