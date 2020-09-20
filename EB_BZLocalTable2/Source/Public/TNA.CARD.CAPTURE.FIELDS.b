* @ValidationCode : MjotNDY5MjE2OTgzOkNwMTI1MjoxNjAwNTYwMTQyNTE4OkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTp0cnVlOk4vQTpSMjBfU1A0LjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 20 Sep 2020 01:02:22
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
$PACKAGE EB.BZLocalTable2
SUBROUTINE TNA.CARD.CAPTURE.FIELDS
*-----------------------------------------------------------------------------
*********************************************************************
*********************************************************************
*
* @author    RANIA

* @stereotype H
*********************************************************************
*-----------------------------------------------------------------------------
*Modification History:
*ZIT-UPG-R13-R19:FM converted to @FM
*-------------------------------------------------------------------------------
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

    EB.Template.TableDefineid("%TNA.CARD.CAPTURE", EB.Template.T24String) ;* Define Table id

    EB.Template.TableAddfielddefinition("CARD.NUMBER","19","A","");*
    EB.Template.TableAddfielddefinition("CARD.SEQ","3","A","");*
    EB.Template.TableAddfielddefinition("CLIENT.CODE","10","","");*
    EB.Template.FieldSetcheckfile("CUSTOMER")
    EB.Template.TableAddfielddefinition("BRANCH.CODE","10","A","");*
    EB.Template.FieldSetcheckfile("COMPANY")
    EB.Template.TableAddfielddefinition("PRODUCT.CODE","003.3","","");*
    EB.Template.FieldSetcheckfile("TNA.CARD.PRODUCT")
    EB.Template.TableAddfielddefinition("FEES.CODE","003","","");*
    EB.Template.FieldSetcheckfile("TNA.CARD.FEES")
    EB.Template.TableAddfieldwitheblookup("TITLE","TITLE","");*
    EB.Template.TableAddfielddefinition("FAMILY.NAME","35","A","");*
    EB.Template.TableAddfielddefinition("FIRST.NAME","35","A","");*
    EB.Template.TableAddfielddefinition("LANGUAGE","3","","");*
    EB.Template.FieldSetcheckfile("LANGUAGE")
    EB.Template.TableAddfielddefinition("XX.STREET","35","A","");*
    EB.Template.TableAddfielddefinition("XX.ADDRESS","35","A","");*
    EB.Template.TableAddfielddefinition("XX.POST.CODE","15","A","");*
    EB.Template.TableAddfielddefinition("XX.TOWN.COUNTRY","20","A","");*
    EB.Template.TableAddfielddefinition("XX.COUNTRY","20","A","");*
    EB.Template.TableAddfielddefinition("MNEMONIC","11","A","");*
    EB.Template.TableAddfielddefinition("START.DATE","15","D","");*
    EB.Template.TableAddfielddefinition("EXPIRY.DATE","15","D","");*
    EB.Template.TableAddfielddefinition("FORMER.DATE","15","D","");*
    EB.Template.TableAddfieldwitheblookup("RENEWAL.OPTION","CARD","");*
    EB.Template.TableAddfieldwitheblookup("DELIVERY.FLAG","CARD","");*
    EB.Template.TableAddfielddefinition("DELIVERY.MODE","7", "" : @FM : "AGENCE_CLIENT_SIEGE_", "")
    EB.Template.TableAddfielddefinition("LIMIT.INDEXES","003","","");*
    EB.Template.FieldSetcheckfile("TNA.CARD.LIMITS")
    EB.Template.TableAddfielddefinition("BATCH.NUM","35","A","");*
*CALL Field.setCheckFile("TNA.CARD.BATCH")
    EB.Template.TableAddfieldwitheblookup("ADD.BATCH","CARD","");*
    EB.Template.TableAddfielddefinition("SATUS.CODE","10","","");*
    EB.Template.FieldSetcheckfile("CARD.STATUS")
    EB.Template.TableAddfielddefinition("STATUS.DATE","15","D","");*
    EB.Template.TableAddfielddefinition("REASON.CODE","2","","");*
    EB.Template.FieldSetcheckfile("TNA.CARD.REASON")
    EB.Template.TableAddfielddefinition("ACCOUNT.OFFICER","7","","");*
    EB.Template.FieldSetcheckfile("DEPT.ACCT.OFFICER")
    EB.Template.TableAddfieldwitheblookup("SEND.RECORD","CARD","");*
    EB.Template.TableAddfieldwitheblookup("OPERATION.CODE","OPERATION","");*
    EB.Template.TableAddfielddefinition("ACCOUNT.NUM","35","A","");*
*CALL Field.setCheckFile("ACCOUNT")
    EB.Template.TableAddfieldwitheblookup("REPLACE.CARD","CARD","");*
    EB.Template.TableAddfielddefinition("NEW.CARD.NUMBER","35","A","");*
    EB.Template.TableAddfielddefinition("NEW.EXPIRY.DATE","15","D","");*
    EB.Template.TableAddfieldwitheblookup("CARD.TYPE.CAF","CARD.TYPE","");*
    EB.Template.TableAddfielddefinition("CARD.RENEW","4","","");*
    EB.Template.TableAddfielddefinition("FRAIS.DEDUITS","", "" : @FM : "CREEE_REMPLACEE_OPPOSITION_", "")
     
    EB.Template.TableAddlocalreferencefield("")
    EB.Template.TableAddoverridefield()
    EB.Template.TableSetauditposition() ;* Poputale audit information

RETURN
* ----------------------------------------------------------------------------
END
