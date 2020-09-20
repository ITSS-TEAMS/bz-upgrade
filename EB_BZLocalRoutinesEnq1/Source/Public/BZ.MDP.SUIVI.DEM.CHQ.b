*-----------------------------------------------------------------------------
* <Rating>-10</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.MDP.SUIVI.DEM.CHQ(ENQ.DATA)
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

* $INSERT I_COMMON - Not Used anymore;USER<EB.USE.DEPARTMENT.CODE>
* $INSERT I_EQUATE - Not Used anymore;

    IF SEL EQ '' THEN
        ARGUM =1
    END ELSE
        NOMBRE=COUNT(SEL,@VM)
        ARGUM=NOMBRE+2
    END

    ENQ.DATA<2,ARGUM> = 'UNITE.GESTION'
    ENQ.DATA<3,ARGUM> = 'EQ'
    ENQ.DATA<4,ARGUM> = DEPART.CODE     
    RETURN
END
