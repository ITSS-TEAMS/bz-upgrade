*---------------------------------------------------------------------------------------
* <Rating>0</Rating>
* Version 1 01/11/2017 Globus Release R13.55
*---------------------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.ENQ.GET.DATE.TIME
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*---------------------------------------------------------------------------------------
*<doc>
* @author : firasjmalt24@gmail.com
* @desc routine de conversion qui sert � afficher datetime dans l'entete d'une requete
*</doc>
*---------------------------------------------------------------------------------------
*Modification History:
*---------------------------------------------------------------------------------------

    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON

    IF O.DATA THEN

        BEGIN CASE

        CASE O.DATA EQ "DATE.TIME"
* $INSERT I_COMMON - Not Used anymore; DATE() : " " : TIME()

* $INSERT I_ENQUIRY.COMMON - Not Used anymore;"
            O.DATA = DATE()

        CASE O.DATA EQ "TIME"
            O.DATA = OCONV(TIME(),'MTS')

        END CASE
    END
    RETURN 
