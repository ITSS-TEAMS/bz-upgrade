*-----------------------------------------------------------------------------
* <Rating>0</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.ENQ.RET.SOURCE.PRINC
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*Modification History:                                                         
*----------------------------------------------------------------------------- 
*ZIT-UPG-R09-R13  : INCLUDE GLOBUS.BP to $INCLUDE ../T24_BP  
*ZIT-UPG-R13-R19     :  No Changes.                  
*---------------------------------------------------------------------------- 
*ZIT-UPG-R09-R13/S 
    *$INSERT GLOBUS.BP I_COMMON
    *$INSERT GLOBUS.BP I_EQUATE
    *$INSERT GLOBUS.BP I_F.FUNDS.TRANSFER
    *$INSERT GLOBUS.BP I_ENQUIRY.COMMON
     $INSERT I_COMMON          
     $INSERT I_EQUATE          
     $INSERT I_F.FUNDS.TRANSFER
     $INSERT I_ENQUIRY.COMMON  
*ZIT-UPG-R09-R13/E
    FT.CREATION = O.DATA

    FN.FT="F.FUNDS.TRANSFER$HIS"
    F.FT=""

* $INSERT I_EQUATE - Not Used anymore;.FT)

* $INSERT I_F.AC.CHARGE.REQUEST - Not Used anymore;N , R.FT , F.FT , E.FT)

    RET.SOURCE.PRINC = R.FT<FT.COMMISSION.AMT><1,1>

* $INSERT I_F.BZ.COFFRE.LOYER - Not Used anymore;
    RETURN
END
