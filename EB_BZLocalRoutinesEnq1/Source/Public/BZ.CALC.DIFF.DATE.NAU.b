*-----------------------------------------------------------------------------
* <Rating>0</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.CALC.DIFF.DATE.NAU
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*-------------------------------------------------------
*MODIFICATION HISTORY:
*ZIT-UPG-R13-R19-INITIALISED VARIABLES
********************************************************
$INSERT I_COMMON
$INSERT I_ENQUIRY.COMMON
$INSERT I_EQUATE
$INSERT I_F.LD.LOANS.AND.DEPOSITS


    FN.LD="F.LD.LOANS.AND.DEPOSITS$NAU"
    F.LD=""
    CALL OPF(FN.LD,F.LD)
	R.LD=''
	ERR.LD=''
    LD.ID=O.DATA
    CALL F.READ(FN.LD,LD.ID,R.LD,F.LD,ERR.LD)

    MAT.DATE=R.LD<LD.FIN.MAT.DATE>
* $INSERT I_COMMON - Not Used anymore;LD.VALUE.DATE>

* $INSERT I_ENQUIRY.COMMON - Not Used anymore;LUE.DATE,DIFF)

    NBR.MOIS = ABS(DIFF / 30)

    R.RECORD<86>=NBR.MOIS 

    RETURN

END
