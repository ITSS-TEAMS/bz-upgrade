*-----------------------------------------------------------------------------
* <Rating>0</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.TRES.CONV.NATURE.CLT
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
  
    CODE.NATURE= O.DATA


    BEGIN CASE

    CASE CODE.NATURE EQ 10
        O.DATA = "DOM"

    CASE CODE.NATURE EQ 20
        O.DATA = "NON DOM"

* $INSERT I_EQUATE - Not Used anymore; EQ 30
        O.DATA = "INTER"

    CASE CODE.NATURE EQ 41
        O.DATA = "WU"

    CASE CODE.NATURE EQ 42
        O.DATA = "CC"

    CASE CODE.NATURE EQ 43    
        O.DATA = "MON"


    END CASE

    RETURN

END
