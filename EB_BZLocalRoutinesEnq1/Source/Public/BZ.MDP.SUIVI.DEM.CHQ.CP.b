*-----------------------------------------------------------------------------
* <Rating>-10</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.MDP.SUIVI.DEM.CHQ.CP(ENQ.DATA)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*-------------------------------------------------------------
* @author DEPARTEMENT T24
* Modification History :
*ZIT-UPG-R13-R19 :  removed BP's and changed INCLUDE to INSERT     
*-------------------------------------------------------------
    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON  
    $INSERT I_F.USER  
    $INSERT I_F.ACCOUNT
*-------------------------------------------------------------
    LOCATE "ACCOUNT.NO" IN ENQ.DATA<2,1> SETTING POS THEN
        ACCT.NO = ENQ.DATA<4,POS>
        ENQ.DATA<2,POS> = "@ID"
        ENQ.DATA<3,POS> = "LK"
        ENQ.DATA<4,POS> = '"...':SQUOTE(ACCT.NO):'..."'     

    END

    RETURN
END  
