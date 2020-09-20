*-----------------------------------------------------------------------------
* <Rating>0</Rating>
*-----------------------------------------------------------------------------
*------------------------------------------------------------------------
* Modification History :      
*ZIT-UPG-R13-R19 : removed BP's and changed INCLUDE to INSERT       
*-------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
      SUBROUTINE E.FORMAT.DATE
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3

$INSERT I_COMMON
$INSERT I_EQUATE    
$INSERT I_ENQUIRY.COMMON
$INSERT I_F.CURRENCY.PARAM  
*--------------------------------------------------------------------
      
	  
	  V.DATE = FMT(O.DATA, "D4/")  
	  
	  V.DATE = V.DATE[7,4] : V.DATE[1,2] : V.DATE[4,2]
      

      O.DATA = V.DATE

      RETURN  

   END
