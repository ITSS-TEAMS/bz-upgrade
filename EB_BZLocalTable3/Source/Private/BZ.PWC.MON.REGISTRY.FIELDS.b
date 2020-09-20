* @ValidationCode : MjotOTIwNjQ5Nzc6Q3AxMjUyOjE2MDA1NjI3NTMzNTU6QWRtaW5pc3RyYXRldXI6LTE6LTE6MDoxOnRydWU6Ti9BOlIyMF9TUDQuMDotMTotMQ==
* @ValidationInfo : Timestamp         : 20 Sep 2020 01:45:53
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
* Modification History :
*ZIT-UPG-R13-R19     :  Converted FM to @FM.
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable3
SUBROUTINE BZ.PWC.MON.REGISTRY.FIELDS

* @author BOUNOUARA FEHMI

* $INSERT I_COMMON - Not Used anymore;N
* $INSERT I_EQUATE - Not Used anymore;E
* $INSERT I_DataTypes - Not Used anymore;s
    $USING EB.SystemTables
    $USING EB.API
    $USING EB.Template

    EB.Template.TableDefineid("ID", "" : @FM : "70" : @FM : "A")

    EB.Template.TableAddfielddefinition("CODE.BQ", "2", "A", "")
    EB.Template.TableAddfielddefinition("NO.SEQ", "5", "A", "")
    EB.Template.TableAddfielddefinition("REF.LOT", "15", "A", "")
    EB.Template.TableAddfielddefinition("REF.CRE.PWC", "12", "A", "")
    EB.Template.TableAddfielddefinition("ID.CARTE", "19", "A", "")
    EB.Template.TableAddfielddefinition("DATE.TXN.MON", "8", "D", "")
    EB.Template.TableAddfielddefinition("BQ.EMET", "2", "A", "")
    EB.Template.TableAddfielddefinition("BQ.ACQ", "2", "A", "")
    EB.Template.TableAddfielddefinition("NUM.TERMINAL", "8", "A", "")
    EB.Template.TableAddfielddefinition("POINT.VENTE", "15", "A", "")
    EB.Template.TableAddfielddefinition("NOM.TERMINAL", "40", "A", "")
    EB.Template.TableAddfielddefinition("CODE.REPRES", "2", "A", "")
    EB.Template.TableAddfielddefinition("MOTIF.REV", "4", "A", "")
    EB.Template.TableAddfielddefinition("DATE.OPERATION", "8", "D", "")
    EB.Template.TableAddfielddefinition("CODE.EVT", "5", "A", "")
    EB.Template.FieldSetcheckfile('BZ.CPT.EVT')
    EB.Template.TableAddfielddefinition("CPT.CREDIT", "12", "ACC", "")
    EB.Template.FieldSetcheckfile('ACCOUNT')
    EB.Template.TableAddfielddefinition("DEVISE.CREDIT", "3", "A", "")
    EB.Template.FieldSetcheckfile('CURRENCY')
    EB.Template.TableAddfielddefinition("MONTANT.CREDIT", "19", "AMT", "")

    EB.Template.TableAddfielddefinition("CPT.DEBIT", "12", "ACC", "")
    EB.Template.FieldSetcheckfile('ACCOUNT')
    EB.Template.TableAddfielddefinition("DEVISE.DEBIT", "3", "A", "")
    EB.Template.FieldSetcheckfile('CURRENCY')
    EB.Template.TableAddfielddefinition("MONTANT.DEBIT", "19", "AMT", "")

    EB.Template.TableAddfielddefinition("SENS.MONTANT", "2 ", "" :@FM: "C_D", "")
    EB.Template.TableAddfielddefinition("COURS", "10", "A", "")
    EB.Template.TableAddfielddefinition("DAO.PL", "4", "A", "")
    EB.Template.FieldSetcheckfile('DEPT.ACCT.OFFICER')
    EB.Template.TableAddfielddefinition("CODE.COM", "35", "A", "")
    EB.Template.FieldSetcheckfile('FT.COMMISSION.TYPE')
    EB.Template.TableAddfielddefinition("MNT.COM", "19", "AMT", "")
    EB.Template.TableAddfielddefinition("DEVISE.COM", "3", "A", "")
    EB.Template.TableAddfielddefinition("SENS.COM", "2 ", "" :@FM: "C_D", "")
    EB.Template.TableAddfielddefinition("NARRATIF.DB", "12", "A", "")
    EB.Template.TableAddfielddefinition("NARRATIF.CR", "12", "A", "")
    EB.Template.TableAddfielddefinition("DATE.CHARGEMENT", "8", "D", "")
    EB.Template.TableAddfielddefinition("STATUT", "2", "A", "")
    EB.Template.TableAddfielddefinition("REF.OFS", "35", "A", "")


*-----------------------------------------------------------------------------
    EB.Template.TableAddlocalreferencefield("")
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
