*-----------------------------------------------------------------------------
* <Rating>0</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.USERS.DEPT(ENQ.DATA)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*---------------------------------------------------------------------------	
* Modification History :    
*ZITUNA-UPG-R13-R19 :  removed BP's and changed INCLUDE to INSERT  
*------------------------------------------------------------------------  

    $INSERT I_COMMON
    $INSERT I_EQUATE    
    $INSERT I_ENQUIRY.COMMON        
    $INSERT I_F.USER


    FN.USER="F.USER"
    F.USER=""
    REC.USER=""  
    ERR.USER=""  

    CALL OPF (FN.USER,F.USER)
    CALL F.READ (FN.USER,OPERATOR,REC.USER,F.USER,ERR.USER)  

* $INSERT I_COMMON - Not Used anymore;C.USER<EB.USE.DEPARTMENT.CODE>

* $INSERT I_ENQUIRY.COMMON - Not Used anymore;ENT.CODE'
    ENQ.DATA<3,1> = 'EQ'
    ENQ.DATA<4,1> = DEPART.CODE
    RETURN
END
