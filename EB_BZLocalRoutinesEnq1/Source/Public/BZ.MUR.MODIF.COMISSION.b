*-----------------------------------------------------------------------------
* <Rating>-2</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.MUR.MODIF.COMISSION
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3

*-----------------------------------------------------------------------------
*Modification History:

*ZIT-UPG-R13-R19 :  SINCE GET.LOC.REF FIELDS VALUE NOT USED, COMMENTED
*-----------------------------------------------------------------------------------

*ZIT-UPG-R13-R19/S
$INSERT I_COMMON
$INSERT I_EQUATE
$INSERT I_ENQUIRY.COMMON
$INSERT I_F.LD.LOANS.AND.DEPOSITS
$INSERT I_F.IS.H.PARAMETER
*ZIT-UPG-R13-R19/E


*COMISSION=O.DATA

*ZIT-UPG-R13-R19/S
* $INSERT I_COMMON - Not Used anymore;D.LOANS.AND.DEPOSITS","MUR.EARLY.RATE",N.MUR.EARLY.RATE)
* $INSERT I_EQUATE - Not Used anymore;D.LOANS.AND.DEPOSITS","LOAN.TYPE",N.LOAN.TYPE)           ;* NOT USED IN CODE
*ZIT-UPG-R13-R19/E

    FN.IS.H.PARAMETER = 'F.IS.H.PARAMETER'
    F.IS.H.PARAMETER = ''
    K.IS.H.PARAMETER = O.DATA
    R.IS.H.PARAMETER = ''
    E.IS.H.PARAMETER = ''


    CALL OPF(FN.IS.H.PARAMETER,F.IS.H.PARAMETER)
  *  CALL F.READ(FN.IS.H.PARAMETER,K.IS.H.PARAMETER,R.IS.H.PARAMETER,F.IS.H.PARAMETER,E.IS.H.PARAMETER)
	CALL CACHE.READ(FN.IS.H.PARAMETER,K.IS.H.PARAMETER,R.IS.H.PARAMETER,E.IS.H.PARAMETER)


*ANCIENNE.COM = R.IS.H.PARAMETER<IS.PARM.EARLY.RATE>
*NOUVELLEB.SystemTables.getVFunction()NEW(LD.LOCAL.EB.SystemTables.getVFunction()UR.EARLY.RATEB.SystemTables.getRNew()
FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus.PARAMETER<IS.PARM.EARLY.RATE>

    RETURN
END
