*-----------------------------------------------------------------------------
* <Rating>-6</Rating>
*AUTH :
*-----------------------------------------------------------------------------
*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13  : INCLUDE GLOBUS.BP to $INCLUDE ../T24_BP
*      CHEQUES.PRESENTED to CHEQUE.REGISTER.SUPPLEMENT
* Modif 06/08/2019 ajout control CNP (FM2764)
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.CHEQUE.NON.PRESENTER.LIST
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
    $INSERT I_F.CHEQUE.ISSUE  
    $INSERT I_F.CHEQUE.REGISTER.SUPPLEMENT  
$INSERT I_F.BZ.CNP.INC.PAI


    ID.CHEQUIER = O.DATA

    FN.ISSUE='F.CHEQUE.ISSUE'
    F.ISSUE=''

* $INSERT I_EQUATE - Not Used anymore;ER.SUPPLEMENT='F.CHEQUE.REGISTER.SUPPLEMENT'
* $INSERT I_ENQUIRY.COMMON - Not Used anymore;MENT=''
* $INSERT I_F.AC.CHARGE.REQUEST - Not Used anymore;UPPLEMENT,F.CHEQUE.REGISTER.SUPPLEMENT)

******
    FN.BZ.CNP.INC.PAI='F.BZ.CNP.INC.PAI'
    F.BZ.CNP.INC.PAI =''
    CALL OPF(FN.BZ.CNP.INC.PAI,F.BZ.CNP.INC.PAI)
******


    NUM.COMPTE=ID.CHEQUIER[5,10]

    CALL OPF(FN.ISSUE,F.ISSUE)
    CALL F.READ(FN.ISSUE,ID.CHEQUIER,R.ISSUE.REC,F.ISSUE,ERR)


    NO.START = R.ISSUE.REC<CHEQUE.IS.CHQ.NO.START>
    NFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusISSUE.REC<CHEQUE.IS.NUMBER.ISSUED>


    V.FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus + NUMBER.ISSUED - 1

    V.NOMBRE.CHEQUE.NON.PRESENTER = 0
    FOR CHQ.NO = NO.START TO V.NO.FIN
        ID.CHEQUE.PRESENTED= ID.CHEQUIER[1,15]:'.':CHQ.NO
        CALL F.READ(FN.CHEQUE.REGISTER.SUPPLEMENT,ID.CHEQUE.PRESENTED,R.CHEQUE.REGISTER.SUPPLEMENT,F.CHEQUE.REGISTER.SUPPLEMENT,CRS.ERR)

        Y.STATUS = R.CHEQUE.REGISTER.SUPPLEMENT<CC.CRS.STATUS>

*****************************

        SQL.CMD='SELECT ':FN.BZ.CNP.INC.PAI:' WITH @ID LIKE ...':CHQ.NO:'..':NUM.COMPTE:'...'
        CALL EB.READLIST(SQL.CMD,CNP.ID,"",NUM.REC,"")

******************************

        IF CRS.ERR OR (Y.STATUS NE 'PRESENTED' AND Y.STATUS NE 'CLEARED') AND CNP.ID EQ '' THEN

            CHQ.NO = FMT(CHQ.NO,"R%7")
            V.NOMBRE.CHEQUE.NON.PRESENTER = V.NOMBRE.CHEQUE.NON.PRESENTER +1
            IF V.CHEQUES EQ '' THEN
                V.CHEQUES = CHQ.NO
            END ELSE
                V.CHEQUES = V.CHEQUES : '*'  :  CHQ.NO
         EB.DataAccess.OpfEND
        EEB.DataAccess.Opf
    NEXT CHQ.NO

    O.DATA = V.CHEQUES : 'A' : V.NOMBRE.CHEQUE.NON.PRESENTER

    RETURN

END
