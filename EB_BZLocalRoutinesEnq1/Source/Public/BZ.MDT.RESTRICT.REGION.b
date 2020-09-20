***AUTHOR : FEHMI BOUNOUARA
*-----------------------------------------------------------------------------
* <Rating>-1</Rating>
*-----------------------------------------------------------------------------

$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.MDT.RESTRICT.REGION(ENQ.DATA)
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
*ZIT-UPG-R13-R19     :  No Changes.                       
*----------------------------------------------------------------------------
$INSERT  I_COMMON
$INSERT  I_EQUATE
$INSERT  I_ENQUIRY.COMMON
*ZIT-UPG-R09-R13/S   
*$INSERT BP I_F.BZ.CPT.LOT
$INSERT  I_F.BZ.CPT.LOT
*ZIT-UPG-R09-R13/E   
    NOM.FICHIER=R.NEW(LOT.COMMENTAIRE)

    ENQ.DATA<2,1>="REF.FICHIER"
    ENQ.DATA<3,1>="EQ"
* $INSERT I_COMMON - Not Used anymore;M.FICHIER

* $INSERT I_ENQUIRY.COMMON - Not Used anymore;ON"
    ENQ.DATA<3,2>="EQ"
    ENQ.DATA<4,2>=R.NEW(LOT.RESERVED2)

    RETURN
END
