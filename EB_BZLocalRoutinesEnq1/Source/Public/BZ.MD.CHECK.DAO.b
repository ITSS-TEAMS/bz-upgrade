*-----------------------------------------------------------------------------
* <Rating>0</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.MD.CHECK.DAO (ENQ.DATA)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*-----------------------------------------------------------------------------
* Modification History :
*ZIT-UPG-R13-R19 :  removed BP's and changed INCLUDE to INSERT       
*                   VM converted to @VM       
*-----------------------------------------------------------------------------	

$INSERT I_COMMON
$INSERT I_EQUATE
$INSERT I_ENQUIRY.COMMON    
$INSERT I_F.USER

    FN.USER='F.USER'
    F.USER=''
    R.USER=''
    ERR1=''
    CALL OPF (FN.USER,F.USER)  
    CALL F.READ (FN.USER,OPERATOR,R.USER,F.USER,ERR1)

    DEPART.CODE = R.USER<EB.USE.DEPARTMENT.CODE>

* $INSERT I_EQUATE - Not Used anymore;Q.DATA<2>,@VM) + 1
* $INSERT I_ENQUIRY.COMMON - Not Used anymore;UNT.OFFICER'  
    ENQ.DATA<3,V.VM> = 'EQ'
    ENQ.DATA<4,V.VM> = DEPART.CODE  
    RETURN
END
