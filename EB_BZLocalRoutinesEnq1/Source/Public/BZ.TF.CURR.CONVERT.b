*-----------------------------------------------------------------------------
* <Rating>0</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.TF.CURR.CONVERT
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
*ZITUNA-UPG-R13-R19 :  removed BP's and changed INCLUDE to INSERT               
*-------------------------------------------------------------------     	

$INSERT I_COMMON
$INSERT I_EQUATE  
$INSERT I_F.FUNDS.TRANSFER
$INSERT I_F.CURRENCY.PARAM     
$INSERT I_F.ENQUIRY    
$INSERT I_ENQUIRY.COMMON



    V.CUR= R.RECORD<FT.CREDIT.CURRENCY>      


    FN.EB = 'F.CURRENCY.PARAM'
    F.EB = ''
    K.EB = V.CUR
    R.EB = ''
    E.EB = ''


    CALL OPF(FN.EB , F.EB )
    CALL F.READ(FN.EB , V.CUR , R.EB , F.EB , E.EB )

    NBRE = R.EB<EB.CUP.NO.OF.DECIMALS>
    AMT.DEV = O.DATA * 10^NBRE


    FRM="R ### ### ### ###,#":NBRE
    AMT.DEV=FMT(AMT.DEV,FRM)  
    O.DATA = TRIM(AMT.DEV,'',"L")

    RETURN
