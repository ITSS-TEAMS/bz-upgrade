* @ValidationCode : MjoxNzc1ODUxMjY6Q3AxMjUyOjE2MDA1NjIxOTIwMzM6QWRtaW5pc3RyYXRldXI6LTE6LTE6MDoxOnRydWU6Ti9BOlIyMF9TUDQuMDotMTotMQ==
* @ValidationInfo : Timestamp         : 20 Sep 2020 01:36:32
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
* Modification History:
* ZIT-UPG-R13-R19 : CONVERTED FM TO @FM
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable3
SUBROUTINE BZ.EMISSION.CHQ.BQ.FIELDS

* @author BOUNOUARA FEHMI

* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;
* $INSERT I_DataTypes - Not Used anymore;
    $USING EB.API
    $USING EB.SystemTables
    $USING EB.Template


    EB.Template.TableDefineid("ID", "" : @FM : "35" : @FM : "A")

    EB.Template.TableAddfielddefinition("UNITE.EMISSION", "10", "A", "")
    EB.Template.FieldSetcheckfile('DEPT.ACCT.OFFICER')
    EB.Template.TableAddfielddefinition("DATE.EMISSION", "8", "D", "")

    EB.Template.TableAddfielddefinition("REF.BLOCAGE", "12", "A", "")


    EB.Template.TableAddfielddefinition("NUM.CHEQUE", "7", "A", "")
    EB.Template.TableAddfielddefinition("RIB", "20", "A", "")
    EB.Template.TableAddfielddefinition("CPT.CLIENT", "20", "A", "")
    EB.Template.FieldSetcheckfile('ACCOUNT')
    EB.Template.TableAddfielddefinition("MONTANT", "35", "AMT", "")
    EB.Template.TableAddfielddefinition("CPT.CHQ", "20", "A", "")
    EB.Template.FieldSetcheckfile('ACCOUNT')
    EB.Template.TableAddfielddefinition("OBJET.EMISSION", "35", "A", "")

    EB.Template.TableAddfielddefinition("STATUT", "10", "A", "")

    EB.Template.TableAddfielddefinition("DATE.SORT", "8", "D", "")
    EB.Template.TableAddfielddefinition("REF.PAIEMENT", "12", "A", "")
    EB.Template.TableAddfielddefinition("BENEFICIAIRE", "35", "A", "")

    EB.Template.TableAddfielddefinition("EDITION", "3", "":@FM:"OUI_NON", "")
    EB.Template.TableAddfielddefinition("ID.CHQ.RECU", "50","A", "")

    EB.Template.TableAddfielddefinition("DATE.BLOCAGE", "8", "D", "")
    EB.Template.TableAddfielddefinition("REF.ANNULATION", "12", "A", "")

    EB.Template.TableAddfielddefinition("ID.INS.CHQ.PAI", "16", "A", "")
*CALL Field.setCheckFile('BZ.IS.CHQ.FRS')

    EB.Template.TableAddfielddefinition("CPT.AVANCE", "12", "ACC", "")
    EB.Template.FieldSetcheckfile('ACCOUNT')

    EB.Template.TableAddfielddefinition("MNT.AVANCE", "19", "AMT", "")

    EB.Template.TableAddfielddefinition("ANTICIPE", "3", "":@FM:"OUI_NON", "")

    EB.Template.TableAddfielddefinition("CLIENT", "10", "CUS", "")
    EB.Template.FieldSetcheckfile('CUSTOMER')

    EB.Template.TableAddfielddefinition("DECISION", "12", "":@FM:"ACCEPTER_REJET", "")
    EB.Template.TableAddfielddefinition("COMMENTAIRE", "50", "A", "")

*-----------------------------------------------------------------------------
    EB.Template.TableAddlocalreferencefield("")
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
