*-----------------------------------------------------------------------------
* <Rating>-5</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.IS.PW.CHECK.AUTO (ENQ.DATA)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*-----------------------------------------------------------------------------  

$INSERT I_COMMON
$INSERT I_EQUATE
$INSERT I_ENQUIRY.COMMON
$INSERT I_F.USER  
*-----------------------------------------------------------

    DAO = R.USER<EB.USE.DEPARTMENT.CODE>         
*    DAO = FMT(DAO,"R%5")


    CLEIS = 'IS'
    CMD.IS = '' ; N.IS  = '' ; SEL.IS  = '' ; E.IS = ''
    CMD.IS  = "SELECT F.PW.PARTICIPANT WITH @ID LIKE " : CLEIS : "... AND ACCT.OFFICER EQ " : DAO
    CALL EB.READLIST(CMD.IS , SEL.IS , '', N.IS , E.IS )



* $INSERT I_COMMON - Not Used anymore;Q.DATA<2>

* $INSERT I_ENQUIRY.COMMON - Not Used anymore;NQ,@VM)

    PROP = SEL.IS<1>

    IF PROP EQ '' THEN
        PROP = 'NONE'
    END


    ENQ.DATA<2,NB.SEL + 1> = 'OWNER'
    ENQ.DATA<3,NB.SEL + 1> = 'EQ'
    ENQ.DATA<4,NB.SEL + 1> = PROP  


* IF SEL.IS<1> EQ 'IS.AGENCE' THEN

*     ENQ.DATA<2,NB.SEL + 2> = 'USER'
*     ENQ.DATA<3,NFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus
*     ENQ.DATA<4,NB.SEL + 2> = DAO
*
* ENDFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus
