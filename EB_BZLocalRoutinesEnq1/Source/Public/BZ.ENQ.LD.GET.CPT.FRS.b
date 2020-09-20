*----------------------------------------------------------------------------------------
* <Rating>0</Rating>
* Version 1 13/11/2017 Globus Release R13.55
*----------------------------------------------------------------------------------------
* Modification History :
*-----------------------
*ZIT-UPG-R13-R19      : F.READV CHANGED TO F.READ
*-----------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.ENQ.LD.GET.CPT.FRS
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*----------------------------------------------------------------------------------------
*<doc>
* @author : fjmal@itssgloabla.com / firasjmalt24@gmail.com
* @desc utilisee dans la requete LD.SUIVI.PERF pour recuperer les info du payement de fin
*</doc>
*----------------------------------------------------------------------------------------
*Modification History:
*----------------------------------------------------------------------------------------
    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.FUNDS.TRANSFER

    IF O.DATA NE '' THEN
* $INSERT I_COMMON - Not Used anymore;ILES
* $INSERT I_EQUATE - Not Used anymore;
    END
    RETURN

***********
OPEN.FILES:
***********

    FN.FTHIS = 'F.FUNDS.TRANSFER$HIS'
    F.FTHIS = ''
    CALL OPF(FN.FTHIS,F.FTHIS)

    RETURN

*******
GET.FT:
*******

    REF.FT = O.DATA
    CMD.FTHIS  = "SELECT " FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusTH @ID EQ ": REF.FT : ";1"
    CALL EB.READLIFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusL.FTHIS , '', N.FTHIS , E.FTHIS )
    IF SEL.FTHIS NE '' THEN
*        CALL F.READV(FN.FTHIS,SEL.FTHIS<1>,R.AC,FT.DEBIT.ACCT.NO,F.FTHIS,E.FTHIS)
*		O.DATA = R.AC
CALL F.READ(FN.FTHIS,SEL.FTHIS<1>,R.AC,F.FTHIS,E.FTHIS)
Y.FT.DEBIT.ACCT.NO =R.AC<FT.DEBIT.ACCT.NO>
     O.DATA = Y.FT.DEBIT.ACCT.NO 
    END ELSE
        O.DATA = ''
    END

    RETURN
END
