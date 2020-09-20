*-----------------------------------------------------------------------------
* <Rating>149</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.ALIM.CONCAT.POS.MVMT
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*----------------------------------------------------------------------------------- 
* Modification History :                                                             
*ZIT-UPG-R09-R13  :    INCLUDE BP CHANGED TO BZDEV.BP                
*ZIT-UPG-R13-R19  : Converted VM TO @VM and Removed journal.update for BATCH/VERSION.  
*                 : Used field name instead of field number in record variable.       
*------------------------------------------------------------------------------------
* @desc Cette routine permet de remplir la table
*       ZIT.POS.MVMT.DETAILS.
*
* @author Obenhalima
* @create 16 / 07 / 2010
*-------------------------------------------

$INSERT I_COMMON
$INSERT I_EQUATE
$INSERT I_ENQUIRY.COMMON
*ZIT-UPG-R09-R13/S 
$INSERT I_F.ZIT.POS.MVMT.DETAILS

* $INSERT I_COMMON - Not Used anymore;$INSERT I_F.POS.MVMT.TODAY
* $INSERT I_EQUATE - Not Used anymore;ANSFER


    GOSUB INITIALISE
    GOSUB OPEN.FILES
    GOSUB PROCESS.DATA

    RETURN
*-------------------------------------------
INITIALISE:
*---------

    FN.ZIT.POS.MVMT.DETAILS = "F.ZIT.POS.MVMT.DETAILS"
    F.ZIT.POS.MVMT.DETAILS = ""
    K.ZIT.POS.MVMT.DETAILS = ""
    R.ZIEB.SystemTables.getVFunction().DETAILS = ""
    E.ZIT.POS.MVMT.DETAILSFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusT = 'F.FUNDS.TRANSFER'
    F.FT = ''
    K.FFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus= ''
    R.FT = ''

    RETURN
*-------------------------------------------
OPEN.FILES:
*----------
    CALL OPF(FN.FT, F.FT)
    CALL OPF(FN.ZIT.POS.MVMT.DETAILS, F.ZIT.POS.MVMT.DETAILS)

    RETURN
*------------------------------------------
PROCESS.DATA:
*------------

    K.ZIT.POS.MVMT.DETAILS = FIELD(O.DATA,";",1)
    CALL F.READ(FN.ZIT.POS.MVMT.DETAILS, K.ZIT.POS.MVMT.DETAILS, R.ZIT.POS.MVMT.DETAILS, F.ZIT.POS.MVMT.DETAILS, E.ZIT.POS.MVMT.DETAILS)
  *  R.ZIT.POS.MVMT.DETAILS<1> := FIELD(O.DATA,";",2) : @VM
      R.ZIT.POS.MVMT.DETAILS<ZIT.POS.REQUETE> := FIELD(O.DATA,";",2) : @VM   ;* Used field name instead of field number.
    GOSUB CALCUL.DETAILS

    CALL F.WRITE(FN.ZIT.POS.MVMT.DETAILS, K.ZIT.POS.MVMT.DETAILS, R.ZIT.POS.MVMT.DETAILS)
	          
   * EB.DataAccess.OpfURNAL.UPDATE('')                ;* Removed journal.update.                                       
	 EB.DataAccess.Opf                 

    RETURN
*------------------------------------------
CALCUL.DETAILS:
*--------------
    R.ZFT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefAILS<ZIT.POS.MONTANT> = R.NEW + R.RECORD<PSE.AMOUNT.FCY>
    R.ZITEB.DataAccess.FReadVMT.DETAILS<ZIT.POS.ABS.MONTANT> = ABS(R.ZIT.POS.MVMT.DETAILS<ZIT.POS.MONTANT>)

    GOSUB GET.COMMISSION.AMOUNT         ;* Deduction de la Commission du Montant du FT Annulation

    R.ZIT.POS.MVMT.DETAILS<ZEB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyer= R.FT<FT.TREASURY.RATE>

    IF R.ZITEB.SystemTables.setE()*-----------------------------------------------------------------------------
* <Rating>149</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.ALIM.CONCAT.POS.MVMT
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*----------------------------------------------------------------------------------- 
* Modification History :                                                             
*ZIT-UPG-R09-R13  :    INCLUDE BP CHANGED TO BZDEV.BP                
*ZIT-UPG-R13-R19  : Converted VM TO @VM and Removed journal.update for BATCH/VERSION.  
*                 : Used field name instead of field number in record variable.       
*------------------------------------------------------------------------------------
* @desc Cette routine permet de remplir la table
*       ZIT.POS.MVMT.DETAILS.
*
* @author Obenhalima
* @create 16 / 07 / 2010
*-------------------------------------------

$INSERT I_COMMON
$INSERT I_EQUATE
$INSERT I_ENQUIRY.COMMON
*ZIT-UPG-R09-R13/S 
$INSERT I_F.ZIT.POS.MVMT.DETAILS

*ZIT-UPG-R09-R13/E
$INSERT I_F.POS.MVMT.TODAY
$INSERT I_F.FUNDS.TRANSFER


    GOSUB INITIALISE
    GOSUB OPEN.FILES
    GOSUB PROCESS.DATA

    RETURN
*-------------------------------------------
INITIALISE:
*---------

    FN.ZIT.POS.MVMT.DETAILS = "F.ZIT.POS.MVMT.DETAILS"
    F.ZIT.POS.MVMT.DETAILS = ""
    K.ZIT.POS.MVMT.DETAILS = ""
    R.ZIT.POS.MVMT.DETAILS = ""
    E.ZIT.POS.MVMT.DETAILS = ""

    FN.FT = 'F.FUNDS.TRANSFER'
    F.FT = ''
    K.FT = ''
    E.FT = ''
    R.FT = ''

    RETURN
*-------------------------------------------
OPEN.FILES:
*----------
    CALL OPF(FN.FT, F.FT)
    CALL OPF(FN.ZIT.POS.MVMT.DETAILS, F.ZIT.POS.MVMT.DETAILS)

    RETURN
*------------------------------------------
PROCESS.DATA:
*------------

    K.ZIT.POS.MVMT.DETAILS = FIELD(O.DATA,";",1)
    CALL F.READ(FN.ZIT.POS.MVMT.DETAILS, K.ZIT.POS.MVMT.DETAILS, R.ZIT.POS.MVMT.DETAILS, F.ZIT.POS.MVMT.DETAILS, E.ZIT.POS.MVMT.DETAILS)
  *  R.ZIT.POS.MVMT.DETAILS<1> := FIELD(O.DATA,";",2) : @VM
      R.ZIT.POS.MVMT.DETAILS<ZIT.POS.REQUETE> := FIELD(O.DATA,";",2) : @VM   ;* Used field name instead of field number.
    GOSUB CALCUL.DETAILS

    CALL F.WRITE(FN.ZIT.POS.MVMT.DETAILS, K.ZIT.POS.MVMT.DETAILS, R.ZIT.POS.MVMT.DETAILS)
	          
   * CALL JOURNAL.UPDATE('')                ;* Removed journal.update.                                       
	                     

    RETURN
*------------------------------------------
CALCUL.DETAILS:
*--------------
    R.ZIT.POS.MVMT.DETAILS<ZIT.POS.MONTANT> += R.RECORD<PSE.AMOUNT.FCY>
    R.ZIT.POS.MVMT.DETAILS<ZIT.POS.ABS.MONTANT> = ABS(R.ZIT.POS.MVMT.DETAILS<ZIT.POS.MONTANT>)

    GOSUB GET.COMMISSION.AMOUNT         ;* Deduction de la Commission du Montant du FT Annulation

    R.ZIT.POS.MVMT.DETAILS<ZIT.POS.EXCH.RATE> = R.FT<FT.TREASURY.RATE>

    IF R.ZIT.POS.MVMT.DETAILS<ZIT.POS.MONTANT>[1,1] EQ '-' THEN

        IF FT.COM THEB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyerDETAIEB.SystemTables.getIdNew().POS.MONTANT> = EB.SystemTables.getIdNew().POS.MONTANT> + FT.COM

        R.ZIT.POSEB.DataAccess.FWriteETAILS<ZIT.POS.MONTANT.CREDIT> = ABS(R.ZIT.POS.MVMT.DETAILS<ZIT.POS.MONTANT>)
        R.ZIT.POS.MVMT.DETAILS<ZIT.POS.MONTANT.DEBIT> = ''

        R.ZIT.POS.MVMT.DETAILS<ZIT.POS.DEVISE.DEBIT> = R.RECORD<PSE.OTHER.CCY>
        EB.SystemTables.setAf(R.RECORD<PSE.CURRENCY>)
        EB.SystemTables.setE(R.RECORD<PSE.OTHER.CCY> : "128100001")
        R.ZIT.POS.MVMT.DETAILS<ZIT.POS.COMPTE.CREDIT> = R.RECORD<PSE.CURRENCY> : "128100001"

    END ELSE

        IF FT.COM THEN R.ZIT.POS.MVMT.DETAILS<ZIT.POS.MONTANT> -= FT.COM

        R.ZIT.POS.MVMT.DETAILS<ZIT.POS.MONTANT.CREDIT> = ''
        R.ZIT.POS.MVMT.DETAILS<ZIT.POS.MONTANT.DEBIT> = ABS(R.ZIT.POS.MVMT.DETAILS<ZIT.POS.MONTANT>)

        R.ZIT.POS.MVMT.DETAILS<ZIT.POS.DEVISE.CREDIT> = R.RECORD<PSE.OTHER.CCY>
        R.ZIT.POS.MVMT.DETAILS<ZIT.POS.DEVISE.DEBIT> = R.RECORD<PSE.CURRENCY>
        R.ZIT.POS.MVMT.DETAILS<ZIT.POS.COMPTE.CREDIT> = R.RECORD<PSE.OTHER.CCY> : "128100001"
        R.ZIT.POS.MVMT.DETAILS<ZIT.POS.COMPTE.DEBIT> = R.RECORD<PSE.CURRENCY> : "128100001"

    END
    R.ZIT.POS.MVMT.DETAILS<ZIT.POS.DEALER.DESK> = "00"
    RETURN
*------------------------------------------
GET.COMMISSION.AMOUNT:
*---------------------

    K.FT = R.RECORD<PSE.OUR.REFERENCE>
    CALL F.READ(FN.FT, K.FT, R.FT, F.FT, E.FT)
    IF NOT(E.FT) THEN
        IF R.FT<FT.DEBIT.CURRENCY> EQ 'TND' THEN
            DRAWDOWN.CCY = R.FT<FT.CREDIT.CURRENCY>
            AMT.DEBIT = R.FT<FT.CREDIT.AMOUNT>
            CCY.DEBIT = DRAWDOWN.CCY
            CCY.CREDIT = 'TND'
        END ELSE
            DRAWDOWN.CCY = R.FT<FT.DEBIT.CURRENCY>
            AMT.DEBIT = R.FT<FT.DEBIT.AMOUNT>
            CCY.DEBIT = DRAWDOWN.CCY
            CCY.CREDIT = 'TND'
        END
        CALL CALCULATE.CHARGE("1",AMT.DEBIT,CCY.DEBIT,"1",R.FT<FT.TREASURY.RATE>,CCY.CREDIT,DRAWDOWN.CCY,R.FT<FT.COMMISSION.TYPE> : @VM : R.FT<FT.CHARGE.TYPE>,"",FT.COM.LCY,FT.COM.FCY)
        FT.COM = FT.COM.FCY
    END
    RETURN
