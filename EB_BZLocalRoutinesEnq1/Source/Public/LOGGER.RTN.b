* Modification History :
*-----------------------
*ZIT-UPG-R13-R19    : NO CHANGES
*-----------------------------------------------------------------------------
* <Rating>100</Rating>
*-----------------------------------------------------------------------------
********************************************************************************                                                        *
********************************************************************************
$PACKAGE EB.BZLocalRoutinesEnq1
SUBROUTINE LOGGER.RTN (IN.PROCESS,IN.MESSAGE)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
********************************************************************************
* Insert Files *
****************
$INSERT I_COMMON
$INSERT I_EQUATE
$INSERT I_ENQUIRY.COMMON
$INSERT I_F.USER

X.SEQ = OCONV(TIME(), "MTS")
PREFIX = '<<<******':IN.PROCESS:' ':OPERATOR:' ':TODAY:' ':X.SEQ:'******>>>'

NOM.FICHIER = TODAY :'.log'

OPENSEQ './':IN.PROCESS:'/':NOM.FICHIER TO FICSEQ THEN
END ELSE
* $INSERT I_EQUATE - Not Used anymore;STOP
END


WRITESEQ PREFIX:IN.MESSAGE APPEND ON FICSEQ THEN
WEOFSEQ FICSEQ
END 
