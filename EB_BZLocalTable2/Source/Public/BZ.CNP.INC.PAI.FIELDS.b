* @ValidationCode : Mjo5MDA5MjgyMDA6Q3AxMjUyOjE2MDA0ODQ3MTg3Mjg6QWRtaW5pc3RyYXRldXI6LTE6LTE6MDoxOnRydWU6Ti9BOlIyMF9TUDQuMDotMTotMQ==
* @ValidationInfo : Timestamp         : 19 Sep 2020 04:05:18
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
SUBROUTINE BZ.CNP.INC.PAI.FIELDS
*-----------------------------------------------------------------------------
*<doc>
* TODO add a description of the application here.
* @JAAFAR NABIL
* 20120403
*
*
*-----------------------------------------------------------------------------
* TODO - You MUST write a .FIELDS routine for the field definitions
*-----------------------------------------------------------------------------
*** Modification History:
*** "ZIT-UPG-R13-R19"
*** Converted FM to @FM
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
    EB.Template.TableDefineid("ID", "" : @FM : "30" : @FM : "A")
*RIB : NUM_CHEQUE
*-----------------------------------------------------------------------------
    VT.MOTIF="MOTIF.CNP"
    EB.Template.LookupList(VT.MOTIF)

    EB.Template.TableAddfielddefinition("DATE.PREAVIS","8", "D", "")
    EB.Template.TableAddfielddefinition("DATE.CNP","8", "D", "")
    EB.Template.TableAddfielddefinition("NUM.CHQ","7", "A", "")
    EB.Template.TableAddfielddefinition("NUM.DOC","25", "A", "")
    EB.Template.TableAddfielddefinition("RIB.TIRE","20", "A", "")
    EB.Template.TableAddfielddefinition("CODE.DEST","25", "A", "")
    EB.Template.TableAddfielddefinition("MNT.PROVISION","15", "AMT", "")
    EB.Template.TableAddfielddefinition("RIB.BENEFS","20", "A", "")
    EB.Template.TableAddfielddefinition("MOTIF.CNP","8",VT.MOTIF, "")


    EB.Template.TableAddfielddefinition("REF.ORIGINE","50", "A", "")
    EB.Template.TableAddfielddefinition("MNT.CHQ","15", "AMT", "")
    EB.Template.TableAddfielddefinition("MONTANT.INT","15", "AMT", "")
    EB.Template.TableAddfielddefinition("CODE.HUISSIER","15", "A", "")
    EB.Template.FieldSetcheckfile("BZ.CNP.HUISSIER")
    EB.Template.TableAddfielddefinition("DATE.DELIV","8", "D", "")
    EB.Template.TableAddfielddefinition("REF.PAI.CHQ","15", "A", "")
    EB.Template.TableAddfielddefinition("DATE.PAI.CHQ","8", "D", "")
    EB.Template.TableAddfielddefinition("NBRE.PV.A.REC","3", "", "")
    EB.Template.TableAddfielddefinition("NBRE.PV.RECU","3", "", "")
    EB.Template.TableAddfielddefinition("DATE.SIGNIF","8", "D", "")
    EB.Template.TableAddfielddefinition("REF.PAI.AMENE","25", "A", "")
    EB.Template.TableAddfielddefinition("MNT.AMENDE","15", "AMT", "")
    EB.Template.TableAddfielddefinition("DATE.PAI.AMEND","35", "D", "")
    EB.Template.TableAddfielddefinition("REF.ENV.PROC","20", "A", "")
    EB.Template.TableAddfielddefinition("STATUT.CNP","10", "A", "")
    EB.Template.TableAddfielddefinition("PAI.CHQ","3", "" : @FM : "OK__NOK_", "")
    EB.Template.TableAddfielddefinition("PAI.AMENDE","3", "" : @FM : "OK__NOK_", "")
    EB.Template.TableAddfielddefinition("PAI.FRAI.SIG","3", "" : @FM : "OK__NOK_", "")
    EB.Template.TableAddfielddefinition("DATE.ENV.PROC","25", "D", "")
    EB.Template.TableAddfielddefinition("ORIGINAL.CHQ","3", "" : @FM : "OK__NOK_", "")
    EB.Template.TableAddfielddefinition("DATE.ANR","8", "D", "")
    EB.Template.TableAddfielddefinition("REF.COM.ANR","12", "A", "")
    EB.Template.TableAddfielddefinition("XX.REF.PV","35", "A", "")
    EB.Template.TableAddfielddefinition("TYPE.DELIVRANCE","10", "" : @FM : "HUISSIER__AGENCE_", "")
    EB.Template.TableAddfielddefinition("REF.COM.REGUL","15", "A", "")
    EB.Template.TableAddfielddefinition("DATE.EMISSION","8", "D", "")
    EB.Template.TableAddfielddefinition("XX.SIGNATAIRE","10", "CUS", "")
    EB.Template.FieldSetcheckfile("CUSTOMER")

    EB.Template.TableAddfielddefinition("NOM.BENEF","35", "A", "")
    EB.Template.TableAddfielddefinition("NUM.QUITTANCE","20", "A", "")
    EB.Template.TableAddfielddefinition("NUM.ATTEST.CHQ","20", "A", "")
    EB.Template.TableAddfielddefinition("NUM.ATTEST.AMENDE","20", "A", "")
    EB.Template.TableAddfielddefinition("DATE.ATTEST.AMENDE","8", "D", "")
    EB.Template.TableAddfielddefinition("DATE.ATTEST.CHQ","8", "D", "")
    EB.Template.TableAddfielddefinition("TYPE.ATTEST.CHQ","20",  "" : @FM : "TRESOR__ACTE.LEGALISE_ACTE.OFFICER.PUB", "")
    EB.Template.TableAddfielddefinition("MNT.ATTEST.CHQ","19", "AMT", "")
    EB.Template.TableAddfielddefinition("MNT.ATTEST.AMENDE","19", "AMT", "")

    EB.Template.TableAddfielddefinition("DT.GEN.TRES.AMD","8", "D", "")
    EB.Template.TableAddfielddefinition("DATE.PRES.CHQ","8", "D", "")
    EB.Template.TableAddfielddefinition("DATE.DELIV.CHQ","8", "D", "")
    EB.Template.TableAddfielddefinition("GEN.VIR","3",  "" : @FM : "OK__NOK_", "")
    EB.Template.TableAddfielddefinition("MODE.ENV.PROC","20",  "" : @FM : "COURRIER__POSTE", "")
    EB.Template.TableAddfielddefinition("DATE.TRIBUNAL","8", "D", "")

    EB.Template.TableAddlocalreferencefield("")
    EB.Template.TableAddoverridefield()
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
