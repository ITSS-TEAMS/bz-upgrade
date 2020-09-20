*-----------------------------------------------------------------------------
* <Rating>-1</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
      SUBROUTINE CEC.CHANGE.FILE.NAME
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3

*---------------------------------------------------------------------
*
* This load routine program allows to remove unwanted characters from
* an inward file Id.
*
*---- Revision History ------------------------------------------------
*
* 04/01/2010 : First design by Edgard PIGNON
* ZIT_UPG_R13_TO_R19 : changed Arithematic operators
*                      changed FM
*---------------------------------------------------------------------

$INSERT I_COMMON
$INSERT I_ENQUIRY.COMMON
$INSERT I_EQUATE
$INSERT I_CECDIR

     F.FILE.PATH = ''

* $INSERT I_EQUATE - Not Used anymore;TO F.FILE.PATH ELSE 
* $INSERT I_ENQUIRY.COMMON - Not Used anymore;O.INWARD.LOADED':@FM:DIR.IDENT   ;*changed FM
* $INSERT I_F.AC.CHARGE.REQUEST - Not Used anymore;MESS.ERR,"")
        ETEXT = MESS.ERR ; RETURN
     END

     OLD.KEY.LIST = KEY.LIST
     KEY.LIST = '' ; IEK = 0

     LOOP
        REMOVE FILE.NAME FROM OLD.KEY.LIST SETTING POINT1
     WHILE FILE.NAME:POINT1
	 
		 IF COUNT(FILE.NAME," ") GT 0 THEN  ;*changed Arithematic operators
		
		
        EB.SystemTables.getVFunction()E.NAME = FILEEB.SystemTables.getVFunction()        CHANGE " "FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusAME
           READ FILE.DATA FROM F.FILE.PATFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusHEN
		   
              WRITE FILE.DATA TO F.FILE.PATH,FILE.NAME
              DELETE F.FILE.PATH,OLD.FILE.NAME
           END ELSE
              MESS.ERR = 'EB-CEC.NO.INWARD.LOADED':@FM:OLD.FILE.NAME   ;* changed FM
              CALL LOT.TRANSLATE.ERROR(MESS.ERR,"")
              ETEXT = MESS.ERR
           END 
        END 
       IEK += 1 

		KEY.LIST<IEK> = FILE.NAME 
     REPEAT


     RETURN

*-----------------------------------------------------------------------
   END
