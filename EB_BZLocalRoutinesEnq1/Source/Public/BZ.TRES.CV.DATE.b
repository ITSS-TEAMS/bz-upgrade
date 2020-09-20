*-----------------------------------------------------------------------------
* <Rating>0</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.TRES.CV.DATE
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*---------------------------------------------------
* Modification History :   	
*ZITUNA-UPG-R13-R19 :  removed BP's and changed INCLUDE to INSERT 
*--------------------------------------------------------------------     	

    $INSERT I_COMMON
    $INSERT I_EQUATE    
    $INSERT I_ENQUIRY.COMMON    

    DATE.IN = FIELD(O.DATA," ",1)

    GOSUB FORMAT
   
    DATE.AFF = "Periode du ":DATE.IN:" au "  

    DATE.IN = FIELD(O.DATA," ",2)
  
    GOSUB FORMAT

* $INSERT I_COMMON - Not Used anymore;IN

    O.DATA = DATE.AFF  

    RETURN

FORMAT:
    IF DATE.IN NE '' THEN
        SEP ="/"
        CALL BZ.CONV.DATE(DATE.IN,SEP)  
    END

    RETURN

END
