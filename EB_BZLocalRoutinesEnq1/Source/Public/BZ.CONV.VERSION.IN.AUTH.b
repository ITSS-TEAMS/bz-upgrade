*-----------------------------------------------------------------------------
* <Rating>0</Rating>
*-----------------------------------------------------------------------------
*** Modification History:
*** "ZIT-UPG-R13-R19"
*** Converted VM to @VM
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13  : Removed hardcoding in R.RECORD
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.CONV.VERSION.IN.AUTH
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
*ZIT-UPG-R09-R13/S

    $INSERT I_F.FUNDS.TRANSFER
*ZIT-UPG-R09-R13/E
    CANAL = O.DATA
*ZIT-UPG-R09-R13/S
*    STATUT=R.RECORD<171>
    STATUT=R.RECORD<FT.RECORD.STATUS>
*ZIT-UPG-R09-R13/E
* $INSERT I_COMMON - Not Used anymore;ES "2":@VM:3:@VM:4) AND (STATUT EQ 'IHLD')) THEN
* $INSERT I_EQUATE - Not Used anymore;S.TRANSFER,BZ.VIREMENT.TEL.0 I "
    END ELSE
* $INSERT I_F.AC.CHARGE.REQUEST - Not Used anymore;.VIREMENT.TEL A "
    END
    RETURN

END
