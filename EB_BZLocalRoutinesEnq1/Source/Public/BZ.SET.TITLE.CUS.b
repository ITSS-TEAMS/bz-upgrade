*-----------------------------------------------------------------------------
* <Rating>-1</Rating>
*-----------------------------------------------------------------------------
*Modification History:                                                        
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13  : $INCLUDE GLOBUS.BP to $INCLUDE ../T24_BP
*ZIT-UPG-R13-R19  : NO CHANGES                           
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.SET.TITLE.CUS
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3

*ZIT-UPG-R09-R13 / S
    *INCLUDE GLOBUS.BP I_COMMON
    *INCLUDE GLOBUS.BP I_EQUATE
    *INCLUDE GLOBUS.BP I_ENQUIRY.COMMON    
    $INSERT I_COMMON         
    $INSERT I_EQUATE         
    $INSERT I_ENQUIRY.COMMON 
    
*ZIT-UPG-R09-R13 / E


    Y.TITLE=O.DATA

    BEGIN CASE

    CASE Y.TITLE EQ "Mr"
        O.DATA="01"

    CASE Y.TITLE EQ "Mme"
        O.DATA="02"

    CASE Y.TITLE EQ "Mlle"
        O.DATA="03"

    CASE 1
        O.DATA="04"

    END CASE

    RETURN
END
