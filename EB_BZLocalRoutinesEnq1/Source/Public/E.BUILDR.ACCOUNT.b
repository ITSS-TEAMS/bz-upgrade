*-----------------------------------------------------------------------------
* <Rating>0</Rating>
*-----------------------------------------------------------------------------
*Modification History:
*ZIT-UPG-R13-R19:CONVERT converted to CHANGE
*               :FM converted to @FM
*---------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
 SUBROUTINE E.BUILDR.ACCOUNT(ENQ.DATA)
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
$INSERT I_F.CUSTOMER.ACCOUNT
 *-------------------------------------------------------------------

     V.CUSTOMER.ID = ''
     V.CUSTOMER.ID = ENQ.DATA<4,1>
     V.CUSTOMER.ID = TRIM(V.CUSTOMER.ID,'0','L')
	 
     FN.CUS.ACC = "F.CUSTOMER.ACCOUNT"
     F.CUS.ACC = ''
     K.CUS.ACC  = V.CUSTOMER.ID
     R.CUS.ACC  = ''
* $INSERT I_COMMON - Not Used anymore;

* $INSERT I_ENQUIRY.COMMON - Not Used anymore;.CUS.ACC )
* $INSERT I_F.AC.CHARGE.REQUEST - Not Used anymore;US.ACC , R.CUS.ACC , F.CUS.ACC , E.CUS.ACC )

     IF E.CUS.ACC THEN
         ENQ.DATA<4,1> = ''
         RETURN
     END ELSE
         ACCOUNT.IDS = R.CUS.ACC
*ZIT-UPG-R13-R19 S
*        CONVERT FM TO ' ' IN ACCOUNT.IDS
		 CHANGE @FM TO ' ' IN ACCOUNT.IDS
*ZIT-UPG-R13-R19 E
         ENQ.DATA<4,1> = ACCOUNT.IDS
     END
