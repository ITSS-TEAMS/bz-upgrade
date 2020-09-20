* @ValidationCode : MjotMTI5MDA2MzIzOkNwMTI1MjoxNjAwNTYwMTM3NjUwOkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTp0cnVlOk4vQTpSMjBfU1A0LjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 20 Sep 2020 01:02:17
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
* <Rating>-1</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable2
SUBROUTINE EDITIQUE.AR.FIELDS
*-----------------------------------------------------------------------------
*<doc>
* TODO add a description of the application here.
* AUTHOR YENGUI FIRAS
*

*
*
*-----------------------------------------------------------------------------
* TODO - You MUST write a .FIELDS routine for the field definitions
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------
* 08 / 07 / 2010

*ZIT-UPG-R13-R19 : FM TO @FM;
* ----------------------------------------------------------------------------
*** <region name= Header>
*** <desc>Inserts and control logic</desc>
*ZIT-UPG-R13-R19/S
* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;
* $INSERT I_DataTypes - Not Used anymore;

    $USING EB.API
    $USING EB.SystemTables
    $USING EB.Template
*ZIT-UPG-R13-R19/E
*** </region>

*-----------------------------------------------------------------------------
    EB.Template.TableDefineid("ID", "" : @FM : "35" : @FM : "A")
*-----------------------------------------------------------------------------
    EB.Template.TableAddfielddefinition("CODE.BANQUE.TIREE" ,"5","A","")
    EB.Template.FieldSetcheckfile("BC.SORT.CODE")
    EB.Template.TableAddfielddefinition("LIB.BANQUE.TIREE"  ,"30","A","")
    EB.Template.TableAddfielddefinition("CODE.AGENCE.TIREE" ,"5","A","")
    EB.Template.FieldSetcheckfile("BC.SORT.CODE")
    EB.Template.TableAddfielddefinition("LIB.AGENCE.TIREE"  ,"30","A","")
    EB.Template.TableAddfielddefinition("CODE.BANQUE.PRES"  ,"5","A","")
    EB.Template.FieldSetcheckfile("BC.SORT.CODE")
    EB.Template.TableAddfielddefinition("LIB.BANQUE.PRES"   ,"30","A","")
    EB.Template.TableAddfielddefinition("CODE.AGENCE.PRES"  ,"5","A","")
    EB.Template.FieldSetcheckfile("BC.SORT.CODE")
    EB.Template.TableAddfielddefinition("LIB.AGENCE.PRES"   ,"30","A","")
    EB.Template.TableAddfielddefinition("XX<NOM.PRENOM.SIGN"   ,"50","A","")
    EB.Template.TableAddfielddefinition("XX-PIECE.IDENTITE"    ,"4","A","")
    EB.Template.TableAddfielddefinition("XX>NO.PIECE.IDEN"     ,"20","A","")
    EB.Template.TableAddfielddefinition("NUMERO.CHEQUE"     ,"7","A","")
    EB.Template.TableAddfielddefinition("NUMERO.CNP"        ,"20","A","")
    EB.Template.TableAddfielddefinition("DATE.CNP"          ,"8","D","")
    EB.Template.TableAddfielddefinition("MODAL.PAI.CHEQUE"  ,"20","A","")
    EB.Template.TableAddfielddefinition("MNT.COMPL.PROV"    ,"20","A","")
    EB.Template.TableAddfielddefinition("MNT.INT.RETARD"    ,"20","A","")
    EB.Template.TableAddfielddefinition("DATE.ANR"          ,"8","D","")
    EB.Template.TableAddfielddefinition("DTE.REG.CHQ.DEBIT" ,"8","D","")
    EB.Template.TableAddfielddefinition("DTE.REG.CHQ.ATTES" ,"8","D","")
    EB.Template.TableAddfielddefinition("DATE.ATTESTATION"  ,"8","D","")
    EB.Template.TableAddfielddefinition("NO.ATTESTATION"    ,"10","A","")
    EB.Template.TableAddfielddefinition("MNT.CHQ" ,"19","AMT","")
    EB.Template.TableAddfielddefinition("DATE.ANR.1"          ,"8","D","")
    EB.Template.TableAddfielddefinition("DTE.REG.CHQ.TRES"  ,"8","D","")
    EB.Template.TableAddfielddefinition("DTE.REG.CHQ.ATT.2" ,"8","D","")
    EB.Template.TableAddfielddefinition("NOM.BENEFICIAIRE"  ,"50","A","")
    EB.Template.TableAddfielddefinition("DATE.DE.SIGN.ACTE" ,"8","D","")
    EB.Template.TableAddfielddefinition("MNT.CHQ.1" ,"19","AMT","")
    EB.Template.TableAddfielddefinition("DATE.ANR.2"          ,"8","D","")
    EB.Template.TableAddfielddefinition("DTE.PAI.CHQ.BENEF" ,"8","D","")
    EB.Template.TableAddfielddefinition("XX<FRAIS.SIGNIF"      ,"20","A","")
    EB.Template.TableAddfielddefinition("XX-DTE.PAI.FRAIS.HUI" ,"8","D","")
    EB.Template.TableAddfielddefinition("XX-NOM.PREN.HUISSIER" ,"50","A","")
    EB.Template.TableAddfielddefinition("XX>DATE.SIGNIF"       ,"8","D","")
    EB.Template.TableAddfielddefinition("DT.ATT.PAI.AMD" ,"8","D","")
    EB.Template.TableAddfielddefinition("MONTANT.DE.AMENDE" ,"20","A","")
    EB.Template.TableAddfielddefinition("NUMERO.DE.LA.QUIT" ,"20","A","")
    EB.Template.TableAddfielddefinition("NOM.BENEF" ,"35","A","")
**********
    EB.Template.TableAddfielddefinition("DATE.CHARGEMENT" ,"8","D","")
    EB.Template.TableAddfielddefinition("STATUT", "10","":@FM:"MAPPED_UNMAPPED","")
    EB.Template.TableAddfielddefinition("ID.SYNCHRO", "30","A","")

    EB.Template.TableAddfielddefinition("NOM.PRENOM.TITUL"   ,"50","A","")
    EB.Template.TableAddfielddefinition("PID.TITUL"    ,"20","A","")
    EB.Template.TableAddfielddefinition("NUM.PID.TITUL"     ,"20","A","")
    EB.Template.TableAddfielddefinition("MNT.AMENDE.CHQ"     ,"20","AMT","")
    EB.Template.TableAddfielddefinition("DATE.AMENDE.CHQ"     ,"8","D","")
    EB.Template.TableAddfielddefinition("DT.REG.AMD.TRES"          ,"8","D","")
    EB.Template.TableAddfielddefinition("REF.AR","16","A","")
*-----------------------------------------------------------------------------
    EB.Template.TableAddlocalreferencefield("")
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
