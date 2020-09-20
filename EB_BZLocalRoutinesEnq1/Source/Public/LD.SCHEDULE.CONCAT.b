* ---------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE LD.SCHEDULE.CONCAT
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*----------------------------------------------------------
* Modification History :
* ZIT-UPG-R13-R19 : $INCLUDE TO $INSERT
*-----------------------------------------------------------------------------

    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.DATES
    EXECUTE "COMO ON LD.SCHEDULE.CONCAT"

    GOSUB INITIALISE
    GOSUB PROCESS
*
    EXECUTE "COMO OFF LD.SCHEDULE.CONCAT"
RETURN

INITIALISE:

* DEBUG

* $INSERT I_COMMON - Not Used anymore;D_SCHEDULES_REPORT'
* $INSERT I_EQUATE - Not Used anymore;SCHED.CONCAT_':TODAY:'.csv'
RETURN
PROCESS:

*******************************************************
********* Concatenation du fichier ***********************
* $INSERT I_F.BZ.COFFRE.LOYER - Not Used anymore;************************


    PATH="./RELEVES.HA.OUT/"
*EXECUTE CHAR(255) : "k" : "cat " : PATH : FILE.PREFIX :"*.csv" : " > " : PATH : DATA.FILE
*EXECUTE CHAR(255) : "k" : "rm " : PATH : FILE.PREFIX :"*.csv"

    Y.TEMP = "cat ./RELEVES.HA.OUT/LD_SCHEDULES_REPORT* > ./RELEVES.HA.OUT/BZ.FIN.ECHEANCE.FUTUR.csv"
    Y.CMD = 'SH -c "' : Y.TEMP : '"'
    EXECUTE Y.CMD
END
