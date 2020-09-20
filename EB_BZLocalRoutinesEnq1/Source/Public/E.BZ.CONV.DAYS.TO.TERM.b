*----------------------------------------------------------------------------------------
* <Rating>0</Rating>
* Version 1 20/11/2017 Globus Release R13.55
*----------------------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE E.BZ.CONV.DAYS.TO.TERM
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
* @desc utilisee dans la requete LD.SUIVI.PERF pour formater un nbr de jours en terme
*</doc>
*----------------------------------------------------------------------------------------
* Modification History :
* ZIT-UPG-R13-R19 : Converted $INCLUDE TO $INSERT, Variables initialized
*----------------------------------------------------------------------------------------
    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.LD.LOANS.AND.DEPOSITS

    IF O.DATA NE '' THEN
        FN.LD = 'F.LD.LOANS.AND.DEPOSITS'
        F.LD = ''
		R.LD=''
		E.LD=''
* $INSERT I_EQUATE - Not Used anymore;LD,F.LD)
* $INSERT I_ENQUIRY.COMMON - Not Used anymore;DATA,R.LD,F.LD,E.LD)
* $INSERT I_F.AC.CHARGE.REQUEST - Not Used anymore;T.DATE>
        VALUE.DATE = R.LD<LD.VALUE.DATE>
        T.Val = 'C'
        CALL CDD('',VALUE.DATE,MAT.DATE,T.Val)
        O.DATA = T.Val
    END
    RETURN

END
