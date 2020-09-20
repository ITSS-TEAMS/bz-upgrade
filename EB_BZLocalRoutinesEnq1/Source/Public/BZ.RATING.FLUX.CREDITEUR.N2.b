$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.RATING.FLUX.CREDITEUR.N2
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
*------------------------------------------------------------	

    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON  
    $INSERT I_F.STMT.ENTRY

     
    GOSUB INIT
    GOSUB PROCESS  
  
    RETURN
*******************************
INIT:  
*******************************
    Y.COMPTE = O.DATA
    Y.ANNEE = TODAY[1,4]
    Y.ANNEE = Y.ANNEE-2  

* $INSERT I_COMMON - Not Used anymore;NEE:"0101"    
* $INSERT I_EQUATE - Not Used anymore;E:"1231"
    RETURN

*******************************
PROCESS:
*******************************
* $INSERT I_F.BZ.COFFRE.LOYER - Not Used anymore;UR(Y.COMPTE,FROM.DATE,TO.DATE,Y.FLUX.CREDIT.PERIOD)  
    O.DATA=Y.FLUX.CREDIT.PERIOD
    RETURN
