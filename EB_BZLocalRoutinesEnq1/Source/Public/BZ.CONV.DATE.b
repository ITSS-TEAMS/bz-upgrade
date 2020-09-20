*-----------------------------------------------------------------------------
* <Rating>0</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.CONV.DATE (DATE.IN,SEP)
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


    ANNEE   =  DATE.IN[1,4]
    MOIS    =  DATE.IN[5,2]
    JOUR    =  DATE.IN[7,2]
 
    

    DATE.IN = JOUR:SEP:MOIS:SEP:ANNEE  
    
END
