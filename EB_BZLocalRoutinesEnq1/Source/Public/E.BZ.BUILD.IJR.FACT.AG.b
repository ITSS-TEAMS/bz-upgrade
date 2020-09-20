*---------------------------------------------------------------------------------------
* <Rating>0</Rating>
* Version 1 09/02/2018 Globus Release R13.55
*----------------------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE E.BZ.BUILD.IJR.FACT.AG(ENQ.DATA)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*----------------------------------------------------------------------------------------
* @author : fjmal@itssglobal.com/firasjmalt24@gmail.com
* @desc : build routine pour forcer la recherche des factures de meme agence(DAO)
*----------------------------------------------------------------------------------------
*Modification History:
*ZIT-UPG-R13-R19     :  No Changes.
*----------------------------------------------------------------------------------------
    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.USER

    LOCATE "ACCT.OFFICER" IN ENQ.DATA<2,1> SETTING POS.OFF THEN
        ENQ.DATA<4,POS.OFF> = R.USER<EB.USE.DEPARTMENT.CODE>
    END ELSE
        POS.OFF = DCOUNT(ENQ.DATA<2,1>,@VM) + 1
        ENQ.DATA<2,POS.OFF> = "ACCT.OFFICER"
        ENQ.DATA<4,POS.OFF> = R.USER<EB.USE.DEPARTMENT.CODE>
* $INSERT I_COMMON - Not Used anymore;OS.OFF> = "EQ"
    END
    RETURN
