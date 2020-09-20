*-------------------------------------------------------------
*----------------------------------------------------------------------
* <Rating>-10</Rating>
*----------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.TT.TSF.AGENCE.CC(ENQ.DATA)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*-------------------------------------------------------------
* @author azdadou@temenos.com
* Routine permettant de restrindre l affichage de l'unite receptrice selon l'agence Utilisateur
*
*------------------------------------------------------------------------
* 26 / 03 / 2010
*ZIT-UPG-R13-R19 : Converted VM to @VM.
*-------------------------------------------------------------
$INSERT  I_COMMON
$INSERT  I_EQUATE
$INSERT  I_ENQUIRY.COMMON
$INSERT  I_F.USER
$INSERT  I_F.DEPT.ACCT.OFFICER
*-------------------------------------------------------------
    GOSUB MAIN
    RETURN
*-------------------------------------------------------------
MAIN:
* $INSERT I_COMMON - Not Used anymore;.ACCT.OFFICER"
    F.DAO = ""
* $INSERT I_ENQUIRY.COMMON - Not Used anymore;
    DEPART.CODE = R.USER<EB.USE.DEPARTMENT.CODE>
    R.DAO = ""
    ERR.DAO = ""
* $INSERT I_F.BZ.COFFRE.LOYER - Not Used anymore;ODE,R.DAO,F.DAO,ERR.DAO)
    USER.DEPT.LEVEL = R.DAO<EB.DAO.DEPT.LEVEL>

    IF (USER.DEPT.LEVEL EQ "55") THEN
        LEVEL = '70'
    END ELSE
        LEVEL = '55'
    END

    V.VM = DCOUNT(ENQ.DATA<2>,@VM) + 1

    ENQ.DATA<2,V.VM> = 'DEPT.LEVEL'
    ENQ.DATA<3,V.VM>FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusDATA<4,V.VM> = LEVEL
    RETURN
END 
