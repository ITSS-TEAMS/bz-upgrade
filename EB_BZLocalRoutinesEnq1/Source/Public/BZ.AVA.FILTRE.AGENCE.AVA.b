*-----------------------------------------------------------------------------
* <Rating>0</Rating>
*-----------------------------------------------------------------------------
*Modification History:                                                        
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13  : $INSERT GLOBUS.BP to $INCLUDE ../T24_BP   
 *ZIT-UPG-R13-R19    : COMMENTED F.READ FOR USER AS IT CONTAINS CURRENT USER                                   
*-----------------------------------------------------------------------------
   
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.AVA.FILTRE.AGENCE.AVA(ENQ.DATA)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3


*ZIT-UPG-R09-R13/S
    *$INSERT GLOBUS.BP I_COMMON
    *$INSERT GLOBUS.BP I_EQUATE
    *$INSERT GLOBUS.BP I_ENQUIRY.COMMON
    *$INSERT GLOBUS.BP I_F.USER
    
    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.USER
*ZIT-UPG-R09-R13/E    

* $INSERT I_EQUATE - Not Used anymore;'
*    F.USER=''
*    R.USER=''
*    ERR1=''
*    CALL OPF (FN.USER,F.USER)
*    CALL F.READ (FN.USER,OPERATOR,R.USER,F.USER,ERR1)
* $INSERT I_F.BZ.COFFRE.LOYER - Not Used anymore;.DEPARTMENT.CODE>

    ENQ.DATA<2,2> = 'CODE.AGENCE'
    ENQ.DATA<3,2> = 'EQ'
    ENQ.DATA<4,2> =  DEPART.CODE

    RETURN

END
