*-----------------------------------------------------------------------------
* <Rating>-2</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.CPT.LOT.STATUT
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*----------------------------------------------------------------------------
* Modification History :                                                     
*----------------------------------------------------------------------------
*ZIT-UPG-R09-R13  : $INSERT BP to $INCLUDE BZDEV.BP                          
*----------------------------------------------------------------------------
   *INCLUDE GLOBUS.BP I_COMMON
   *INCLUDE GLOBUS.BP I_EQUATE
   *INCLUDE GLOBUS.BP I_ENQUIRY.COMMON
    $INSERT I_COMMON   
    $INSERT I_EQUATE                
    $INSERT I_F.ACCOUNT
    *INCLUDE GLOBUS.BP I_F.ACCOUNT
    $INSERT  I_ENQUIRY.COMMON
*ZIT-UPG-R09-R13/S 
*$INSERT BP I_F.BZ.CPT.GEN.COMPTA
$INSERT I_F.BZ.CPT.GEN.COMPTA
*ZIT-UPG-R09-R13/E
    FN.GEN= 'F.BZ.CPT.GEN.COMPTA'
    R.GEN=''
    F.GEN=''
    E.GEN=''
* $INSERT I_ENQUIRY.COMMON - Not Used anymore;    STATUT.EXECUTE = 3

    ID.LOT = R.RECORD<0>

* $INSERT I_F.BZ.COFFRE.LOYER - Not Used anymore;N:" WITH STATUT NE ":STATUT.EXECUTE:" AND ID.CPT.LOT EQ ":ID.LOT

    CALL EB.READLIST(SEL.COMMAND,SEL.LIST,'',NO.OF.REC,ERR1)

    IF NO.OF.REC EQ 0 THEN

        O.DATA = "COMPLETED"
    END ELSE

        O.DATA = "NOT COMPLETED"      


    END

    RETURN
END
