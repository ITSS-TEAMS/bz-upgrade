* Modification History:
* ZIT-UPG-R13-R19 : Converted $INCLUDE TO $INSERT

$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.RATING.FLUX.CREDITEUR.N1
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
    Y.ANNEE = TODAY[1,4]
    Y.ANNEE = Y.ANNEE-1

    FROM.DATE = Y.ANNEE:"0101"
* $INSERT I_COMMON - Not Used anymore;E:"1231"



    RETURN


* $INSERT I_F.BZ.COFFRE.LOYER - Not Used anymore;
PROCESS:
*******************************
    CALL BZ.RATING.FLUX.CREDITEUR(Y.COMPTE,FROM.DATE,TO.DATE,Y.FLUX.CREDIT.PERIOD)
    O.DATA=Y.FLUX.CREDIT.PERIOD
    RETURN
