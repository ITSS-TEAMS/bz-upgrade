*-----------------------------------------------------------------------------
* <Rating>0</Rating>
*-----------------------------------------------------------------------------
* ----------------------------------------------------------------------------------------------------- *
*                                                 ZITOUNA Project                                       *
* ----------------------------------------------------------------------------------------------------- *
* @desc Le LOAD du traitement Mult-Thread pour  pour Gestion Coffre Fort.
* ----------------------------------------------------------------------------------------------------- *
* @author Marwen Ben Nasr Marwen.BenNasr@banquezitouna.com
* @create 08/10/2012
* ----------------------------------------------------------------------------------------------------- *
* @revby
* ----------------------------------------------------------------------------------------------------- *
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.COFFRE.FACTURATION.LOAD
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3

    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
$INSERT BZ.COFFRE.FACTURATION.COMMON

    FN.CT='F.BZ.COFFRE.CONTRAT'
    F.CT=''

* $INSERT I_COMMON - Not Used anymore;OFFRE.LOYER'
    F.LOYER=''

    FN.CUR= "F.CURRENCY"
    F.CUR= ''

    FN.REG = "F.BZ.COFFRE.REGISTRE"
    F.REG = ''

    FN.TYP = "F.BZ.COFFRE.TYPE"
    F.TYP = ''

    FN.COM = "F.FT.COMMISSION.TYPE"
    F.COM = ''

    FN.AC= "F.ACCOUNT"
    F.AC = ''

    CALL OPF(FN.CT,F.CT)
tmp.R.NEW.FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusCUR.F.CUR = EB.SystemTables.getRNew(FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusCUR,F.CUR)
    CALL OPF(FN.LOYER,F.Ltmp.R.NEW.FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusCUR.F.CUR
EB.SystemTables.setRNew(FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusCUR,F.CUR, tmp.R.NEW.FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusCUR.F.CUR)
    CALL OPF(FN.REG,F.REG)
    CAFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusYP)
    CALL OPF(FN.COM,F.COM)
    CALL OPF(FN.AC,F.AC)

    RETURN
END
