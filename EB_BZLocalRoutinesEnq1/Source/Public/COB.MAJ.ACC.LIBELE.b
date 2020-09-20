*-------------------------------------------------------------
*----------------------------------------------------------------------
* <Rating>-6</Rating>
*----------------------------------------------------------------------

$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE COB.MAJ.ACC.LIBELE (SEL.ID)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
	
*-----------------------------------------------------------------------------
* Modification History :

*ZIT-UPG-R13-R19 : VARIABLE INITIALISED
*-----------------------------------------------------------------------------
* @author azdadou@temenos.com
*
*------------------------------------------------------------------------
* 05 / 02 / 10  par azdadou
*-------------------------------------------------------------
*ZIT-UPG-R13-R19/S
$INSERT I_COMMON
$INSERT I_EQUATE
$INSERT I_ENQUIRY.COMMON
$INSERT I_F.ACCOUNT
$INSERT I_COB.MAJ.ACC.LIBELE.COMMON
* $INSERT I_COMMON - Not Used anymore;*------------------------------------------------------------------------

		R.ACC = ''
		ERR.ACC = ''
		
        CALL F.READ(FN.ACC,SEL.ID,R.ACC,F.ACC,ERR.ACC) ;* Lire les donnees du compte saisi

* $INSERT I_F.BZ.COFFRE.LOYER - Not Used anymore;ENCY> ;* Reccuperer la devise
        CATEG = R.ACC<AC.CATEGORY> ;* Reccuperer la categorie    AC.CO.CODE 
        * 00001
        COMPANIE = R.ACC<AC.CO.CODE> ;* Reccuperer la companie
        COMPTE.PRINCIPAL = "TND":CATEG:"00001":COMPANIE
		
		R.ACC = ''
		ERR.ACC = ''
		
        EB.SystemTables.getVFunction()D(FN.ACC,COMPTE.PRINCIPAL,R.ACC,F.ACC,ERRFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus donnees du compteEB.SystemTables.getVFunction()
        LIBELE =FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusITLE>
        IF LIBELE NE "" THEN
           R.INS<AC.SHORT.TITLE> = LIBELE
           CALL F.WRITE(FN.ACC,SEL.ID,R.INS)
        END
    RETURN
    END
