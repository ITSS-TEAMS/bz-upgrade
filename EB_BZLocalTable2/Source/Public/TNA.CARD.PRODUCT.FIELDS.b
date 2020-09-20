* @ValidationCode : MjoxNTM5NjU2NjkzOkNwMTI1MjoxNjAwNTYwMTQ0MzI3OkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTp0cnVlOk4vQTpSMjBfU1A0LjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 20 Sep 2020 01:02:24
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
* Modification History :
* ZIT-UPG-R13-R19 : Converted $INCLUDE TO $INSERT, Converted FM to @FM
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable2
SUBROUTINE TNA.CARD.PRODUCT.FIELDS
*-----------------------------------------------------------------------------
*********************************************************************
*                      PROJET CHALLENGE 24
*********************************************************************
*
* @author    RANIA
*MODIFICATION RACHID :RAJOUT DU CHAMPS NUMERO DE TRAITE POUR DECLARATION ASSURANCE
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

    EB.Template.TableDefineid("ID", EB.Template.T24String:@FM:"003.003")      ;* Define Table id

    EB.Template.TableAddfielddefinition("WORDING","30","A","")    ;*
    EB.Template.TableAddfieldwitheblookup("NETWORK.CODE","NETWORK","")      ;*

    EB.Template.TableAddfielddefinition("MNEMONIC","4.1","A","")  ;*
    EB.Template.FieldSetcheckfile("CARD.TYPE")
    EB.Template.TableAddfieldwitheblookup("PRODUCT.TYPE","PRODUCT.TYPE","") ;*

    EB.Template.TableAddfielddefinition("SERVICE.CODE","3.3","A","")        ;*
    EB.Template.TableAddfielddefinition("LIMITS.INDEX","003.003","A","")    ;*
    EB.Template.FieldSetcheckfile("TNA.CARD.LIMITS")
    EB.Template.TableAddfieldwitheblookup("DELIVERY.FLAG","CARD","")        ;*
    EB.Template.TableAddfieldwitheblookup("VALIDITY.PERIOD","PERIOD","")    ;*
    EB.Template.TableAddfieldwitheblookup("PRODUCTION.FLAG","CARD","")      ;*
    EB.Template.TableAddfielddefinition("PRIM.FEES.CODE","003.003","A","")  ;*
    EB.Template.FieldSetcheckfile("TNA.CARD.FEES")
    EB.Template.TableAddfielddefinition("SEC.FEES.CODE","003","A","")       ;*
    EB.Template.FieldSetcheckfile("TNA.CARD.FEES")
    EB.Template.TableAddfielddefinition("LANGUAGE","4","","")     ;*
    EB.Template.FieldSetcheckfile("LANGUAGE")
    EB.Template.TableAddfieldwitheblookup("RENEWAL.OPTION","CARD","")       ;*
    EB.Template.TableAddfieldwitheblookup("CARD.TYPE.CAF","CARD.TYPE","")   ;*
    EB.Template.TableAddfielddefinition("NUM.TRAITE","8","","")   ;*
    EB.Template.TableAddfielddefinition("TYPE.CARTE","4","A","")  ;*
    EB.Template.TableAddfielddefinition("XX.CATEGORY","35","A","")          ;*
    EB.Template.FieldSetcheckfile("CATEGORY") ;*
    EB.Template.TableAddfielddefinition("INTERNATIONAL", "3", "" : @FM : "Oui_Non_","")          ;*
    EB.Template.TableAddlocalreferencefield("")
    EB.Template.TableAddoverridefield()
    EB.Template.TableSetauditposition()         ;* Poputale audit information

RETURN
* ----------------------------------------------------------------------------
END
