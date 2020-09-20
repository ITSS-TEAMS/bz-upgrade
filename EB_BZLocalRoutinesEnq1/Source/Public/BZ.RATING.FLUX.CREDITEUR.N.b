*Modification History:
*-------------------------------------------------------------
*ZIT-UPG-R13-R19  : NO CHANGES 
*-------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.RATING.FLUX.CREDITEUR.N
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
    $INSERT I_F.STMT.ENTRY


    GOSUB INIT
    GOSUB PROCESS

    RETURN
*******************************
INIT:
*******************************

    Y.COMPTE = O.DATA
    FROM.DATE = TODAY[1,4]:"0101"
    TO.DATE = TODAY
    RETURN

* $INSERT I_ENQUIRY.COMMON - Not Used anymore;***
PROCESS:
*******************************
    CALL BZ.RATING.FLUX.CREDITEUR(Y.COMPTE,FROM.DATE,TO.DATE,Y.FLUX.CREDIT.PERIOD)
    O.DATA=Y.FLUX.CREDIT.PERIOD
    RETURN
