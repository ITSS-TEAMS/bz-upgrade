*-----------------------------------------------------------------------------
* <Rating>0</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.MDP.CHQ.RECU.RESTRICT(ENQ.DATA)
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
*-------------------------------------------------------------
*Modification History:    
*ZIT-UPG-R13-R19 :  removed BP's and changed INCLUDE to INSERT       
* ----------------------------------------------------------------------------
$INSERT I_COMMON
$INSERT I_EQUATE
$INSERT I_ENQUIRY.COMMON
$INSERT I_F.USER  
$INSERT I_F.ACCOUNT    


*-------------------------------------------------------------
    FN.USER='F.USER'
    F.USER=''
    CALL OPF (FN.USER,F.USER)
    DEPART.CODE = R.USER<EB.USE.DEPARTMENT.CODE>  
    SEL=ENQ.DATA<4>
* $INSERT I_COMMON - Not Used anymore;,@VM)
* $INSERT I_EQUATE - Not Used anymore;    ENQ.DATA<2,ARGUM> = 'UNITE.GEST'
* $INSERT I_ENQUIRY.COMMON - Not Used anymore;
    ENQ.DATA<4,ARGUM> = DEPART.CODE
    RETURN
END
