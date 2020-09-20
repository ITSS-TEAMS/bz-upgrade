*-----------------------------------------------------------------------------
* <Rating>1004</Rating>
*** Modification History:
*** "ZIT-UPG-R13-R19"
*** Converted Arithmatic operation
*** Converted DCOUNT
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
      SUBROUTINE SIT.VIEW.ENTRIES(Y.LIST)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3

*---- Revision History ------------------------------------------------
*
* 16/09/2006 - First Release
*              Developed for KBF (Paris)
*              Edgard Pignon
*
*---------------------------------------------------------------------

$INSERT I_COMMON
$INSERT I_ENQUIRY.COMMON
$INSERT I_EQUATE
$INSERT I_F.DATES
$INSERT I_F.COMPANY
$INSERT I_F.USER
* $INSERT I_COMMON - Not Used anymore;RY
* $INSERT I_EQUATE - Not Used anymore;TRY

* $INSERT I_F.AC.CHARGE.REQUEST - Not Used anymore;-

      GOSUB INITIALISE
      IF TXT.ER EQ '' THEN GOSUB SELECT.LIST
* $INSERT I_F.BZ.COFFRE.LOYER - Not Used anymore;B PROCESS

      IF TXT.ER THEN
 ***        FOR IJK = 1 TO DCOUNT(TXT.ER,FM)
            CNT = DCOUNT(TXT.ER,@FM)
            FOR IJK = 1 TO CNT
                
            Y.LIST<-1> = '[[[[[ERROR[':TXT.ER<IJK>:'[['
         NEXT IJK
      END ELSE
        EB.SystemTables.getVFunction()RECORD.LIST
      END

      RETURN
FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus**********************************************FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus.LIST:
***********************************************************************

      LOCATE 'ENTRY.ID' IN D.FIELDS<1> SETTING ID.POS THEN
         N.ENTRY.ID = D.RANGE.AND.VALUE<ID.POS>
      END ELSE TXT.ER = 'La cle manque'
      
      RETURN

***********************************************************************
PROCESS:
***********************************************************************

      N.ENTRY.ROOT = N.ENTRY.ID
      IF N.ENTRY.ROOT THEN
     
         FOR CTR = 1 TO 100
            YR.STMT.ENTRY.ID = N.ENTRY.ROOT:FMT(CTR,'4"0"R')
            ER = '' ; STMT.REC = ''
            CALL F.READ(FN.STMT.ENTRY,YR.STMT.ENTRY.ID,STMT.REC,F.STMT.ENTRY,ER)
            IF NOT(ER) THEN 
               N.LINE = ''
               N.LINE = YR.STMT.ENTRY.ID:"[":'STMT.ENTRY':"["
         EB.DataAccess.Opf   N.LINE := STMT.REC<AC.STE.ACCOUNT.NUMBER>:"["
         EB.DataAccess.Opf   N.LINE := STMT.REC<AC.STE.VALUE.DATE>:"["
               N.LINE := STMT.REC<AC.STE.BOOKING.DATE>:"["
               N.LINE := STMT.REC<AC.STE.AMOUNT.LCY>:"["
               N.LINE := STMT.REC<AC.STE.AMOUNT.FCY>:"["
               IF STMT.REC<AC.STE.CURRENCY> NE LCCY THEN
                  EB.SystemTables.getRNew()EFT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRef.STE.CURRENCY>:"["
               END ELSE
         EB.DataAccess.FRead   N.LINE := "["
               END
               N.LINE := STMT.REC<AC.STE.TRANS.REFERENCE>:"["
               N.LINE := STMT.REC<AC.STE.OUR.REFERENCE>:"["
               RECORD.LIST<-EB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyer       END ELSE EXIT
         NEXEB.SystemTables.setE()*-----------------------------------------------------------------------------
* <Rating>1004</Rating>
*** Modification History:
*** "ZIT-UPG-R13-R19"
*** Converted Arithmatic operation
*** Converted DCOUNT
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
      SUBROUTINE SIT.VIEW.ENTRIES(Y.LIST)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3

*---- Revision History ------------------------------------------------
*
* 16/09/2006 - First Release
*              Developed for KBF (Paris)
*              Edgard Pignon
*
*---------------------------------------------------------------------

$INSERT I_COMMON
$INSERT I_ENQUIRY.COMMON
$INSERT I_EQUATE
$INSERT I_F.DATES
$INSERT I_F.COMPANY
$INSERT I_F.USER
$INSERT I_F.STMT.ENTRY
$INSERT I_F.CATEG.ENTRY

*---- Main processing section ----

      GOSUB INITIALISE
      IF TXT.ER EQ '' THEN GOSUB SELECT.LIST
      IF TXT.ER EQ '' THEN GOSUB PROCESS

      IF TXT.ER THEN
 ***        FOR IJK = 1 TO DCOUNT(TXT.ER,FM)
            CNT = DCOUNT(TXT.ER,@FM)
            FOR IJK = 1 TO CNT
                
            Y.LIST<-1> = '[[[[[ERROR[':TXT.ER<IJK>:'[['
         NEXT IJK
      END ELSE
         Y.LIST = RECORD.LIST
      END

      RETURN

***********************************************************************
SELECT.LIST:
***********************************************************************

      LOCATE 'ENTRY.ID' IN D.FIELDS<1> SETTING ID.POS THEN
         N.ENTRY.ID = D.RANGE.AND.VALUE<ID.POS>
      END ELSE TXT.ER = 'La cle manque'
      
      RETURN

***********************************************************************
PROCESS:
***********************************************************************

      N.ENTRY.ROOT = N.ENTRY.ID
      IF N.ENTRY.ROOT THEN
     
         FOR CTR = 1 TO 100
            YR.STMT.ENTRY.ID = N.ENTRY.ROOT:FMT(CTR,'4"0"R')
            ER = '' ; STMT.REC = ''
            CALL F.READ(FN.STMT.ENTRY,YR.STMT.ENTRY.ID,STMT.REC,F.STMT.ENTRY,ER)
            IF NOT(ER) THEN 
               N.LINE = ''
               N.LINE = YR.STMT.ENTRY.ID:"[":'STMT.ENTRY':"["
               N.LINE := STMT.REC<AC.STE.ACCOUNT.NUMBER>:"["
               N.LINE := STMT.REC<AC.STE.VALUE.DATE>:"["
               N.LINE := STMT.REC<AC.STE.BOOKING.DATE>:"["
               N.LINE := STMT.REC<AC.STE.AMOUNT.LCY>:"["
               N.LINE := STMT.REC<AC.STE.AMOUNT.FCY>:"["
               IF STMT.REC<AC.STE.CURRENCY> NE LCCY THEN
                  N.LINE := STMT.REC<AC.STE.CURRENCY>:"["
               END ELSE
                  N.LINE := "["
               END
               N.LINE := STMT.REC<AC.STE.TRANS.REFERENCE>:"["
               N.LINE := STMT.REC<AC.STE.OUR.REFERENCE>:"["
               RECORD.LIST<-1> = N.LINE
            END ELSE EXIT
         NEXT CTR

         FOR CTR = 1EB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyer   YR.CATEG.ENTRY.ID = N.ENTRY.ROOT:FMT(CTR,'4"0"R')
            ER = EB.DataAccess.FWriteTEG.REC = ''
            CALL F.READ(FN.CATEG.ENTRY,YR.CATEG.ENTRY.ID,CATEG.REC,F.CATEG.ENTRY,ER)
            IF NOT(ER) THEN
               N.LINE = ''
        EB.SystemTables.setAf()*-----------------------------------------------------------------------------
* <Rating>1004</Rating>
*** Modification History:
*** "ZIT-UPG-R13-R19"
*** Converted Arithmatic operation
*** Converted DCOUNT
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
      SUBROUTINE SIT.VIEW.ENTRIES(Y.LIST)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3

*---- Revision History ------------------------------------------------
*
* 16/09/2006 - First Release
*              Developed for KBF (Paris)
*              Edgard Pignon
*
*---------------------------------------------------------------------

$INSERT I_COMMON
$INSERT I_ENQUIRY.COMMON
$INSERT I_EQUATE
$INSERT I_F.DATES
$INSERT I_F.COMPANY
$INSERT I_F.USER
$INSERT I_F.STMT.ENTRY
$INSERT I_F.CATEG.ENTRY

*---- Main processing section ----

      GOSUB INITIALISE
      IF TXT.ER EQ '' THEN GOSUB SELECT.LIST
      IF TXT.ER EQ '' THEN GOSUB PROCESS

      IF TXT.ER THEN
 ***        FOR IJK = 1 TO DCOUNT(TXT.ER,FM)
            CNT = DCOUNT(TXT.ER,@FM)
            FOR IJK = 1 TO CNT
                
            Y.LIST<-1> = '[[[[[ERROR[':TXT.ER<IJK>:'[['
         NEXT IJK
      END ELSE
         Y.LIST = RECORD.LIST
      END

      RETURN

***********************************************************************
SELECT.LIST:
***********************************************************************

      LOCATE 'ENTRY.ID' IN D.FIELDS<1> SETTING ID.POS THEN
         N.ENTRY.ID = D.RANGE.AND.VALUE<ID.POS>
      END ELSE TXT.ER = 'La cle manque'
      
      RETURN

***********************************************************************
PROCESS:
***********************************************************************

      N.ENTRY.ROOT = N.ENTRY.ID
      IF N.ENTRY.ROOT THEN
     
         FOR CTR = 1 TO 100
            YR.STMT.ENTRY.ID = N.ENTRY.ROOT:FMT(CTR,'4"0"R')
            ER = '' ; STMT.REC = ''
            CALL F.READ(FN.STMT.ENTRY,YR.STMT.ENTRY.ID,STMT.REC,F.STMT.ENTRY,ER)
            IF NOT(ER) THEN 
               N.LINE = ''
               N.LINE = YR.STMT.ENTRY.ID:"[":'STMT.ENTRY':"["
               N.LINE := STMT.REC<AC.STE.ACCOUNT.NUMBER>:"["
               N.LINE := STMT.REC<AC.STE.VALUE.DATE>:"["
               N.LINE := STMT.REC<AC.STE.BOOKING.DATE>:"["
               N.LINE := STMT.REC<AC.STE.AMOUNT.LCY>:"["
               N.LINE := STMT.REC<AC.STE.AMOUNT.FCY>:"["
               IF STMT.REC<AC.STE.CURRENCY> NE LCCY THEN
                  N.LINE := STMT.REC<AC.STE.CURRENCY>:"["
               END ELSE
                  N.LINE := "["
               END
               N.LINE := STMT.REC<AC.STE.TRANS.REFERENCE>:"["
               N.LINE := STMT.REC<AC.STE.OUR.REFERENCE>:"["
               RECORD.LIST<-1> = N.LINE
            END ELSE EXIT
         NEXT CTR

         FOR CTR = 1 TO 100
            YR.CATEG.ENTRY.ID = N.ENTRY.ROOT:FMT(CTR,'4"0"R')
            ER = '' ; CATEG.REC = ''
            CALL F.READ(FN.CATEG.ENTRY,YR.CATEG.ENTRY.ID,CATEG.REC,F.CATEG.ENTRY,ER)
            IF NOT(ER) THEN
               N.LINE = ''
           FT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRef.CATEG.ENTRY.ID:"[":'CATEG.ENTRY':"["
        EB.SystemTables.setE(EB.SystemTables.getE()N.LINE : CATEG.REC<AC.CAT.PL.CATEGORY>:"[")
               N.LINE := CATEG.REC<AC.CAT.VALUE.DATE>:"["
               N.LINE := CATEG.REC<AC.CAT.BOOKING.DATE>:"["
               N.LINE := CATEG.REC<AC.CAT.AMOUNT.LCY>:"["
               N.LINE := CATEG.REC<AC.CAT.AMOUNT.FCY>:"["
               IF CATEG.REC<AC.CAT.CURRENCY> NE LCCY THEN
                  N.LINE := CATEG.REC<AC.CAT.CURRENCY>:"["
               END ELSE
                  N.LINE := "["
               END
               N.LINE := CATEG.REC<AC.CAT.TRANS.REFERENCE>:"["
               N.LINE := CATEG.REC<AC.CAT.OUR.REFERENCE>
               RECORD.LIST<-1> = N.LINE
            END ELSE EXIT
         NEXT CTR
      END

      IF RECORD.LIST EQ '' THEN TXT.ER = 'Aucune entree comptable'

      RETURN

***********************************************************************
INITIALISE:
***********************************************************************

      REC.DATA = '' ; REC.KEY = ''
      RECORD.LIST = '' ; Y.LIST = '' ; TXT.ER = ''

      FN.STMT.ENTRY = 'F.STMT.ENTRY'
      F.STMT.ENTRY = ''
      CALL OPF(FN.STMT.ENTRY, F.STMT.ENTRY)
      YR.STMT.ENTRY.ID = ''
      R.STMT.ENTRY = ''

      FN.CATEG.ENTRY = 'F.CATEG.ENTRY'
      F.CATEG.ENTRY = ''
      CALL OPF(FN.CATEG.ENTRY, F.CATEG.ENTRY)
      YR.CATEG.ENTRY.ID = ''
      R.CATEG.ENTRY = ''

      RETURN

*-----------------------------------------------------------------------
   END
