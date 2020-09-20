*-----------------------------------------------------------------------------
* <Rating>0</Rating>
*-----------------------------------------------------------------------------
*-----------------------------------------------------------
*-----------------------------------------------------------
* reconstitution des critres dynamiques
*** Modification History:
*** "ZIT-UPG-R13-R19"
*-----------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.IS.DEV.CHECK.CUS (ENQ.DATA)
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
$INSERT I_F.LETTER.OF.CREDIT
*-----------------------------------------------------------

    FN.LETTER.OF.CREDIT = 'F.LETTER.OF.CREDIT'
    F.LETTER.OF.CREDIT = ''
    K.LETTER.OF.CREDIT = ENQ.DATA<4,1>[1,12]
    R.LETTER.OF.CREDIT = ''
    E.LETTER.OF.CREDIT = ''

* $INSERT I_COMMON - Not Used anymore;ER.OF.CREDIT,F.LETTER.OF.CREDIT)
* $INSERT I_EQUATE - Not Used anymore;ETTER.OF.CREDIT,K.LETTER.OF.CREDIT,R.LETTER.OF.CREDIT,F.LETTER.OF.CREDIT,E.LETTER.OF.CREDIT)
* $INSERT I_ENQUIRY.COMMON - Not Used anymore; '' THEN

        ENQ.DATA<2,1> = 'CUSTOMER'
        ENQ.DATA<3,1> = 'EQ'
        ENQ.DATA<4,1> = R.LETTER.OF.CREDIT<TF.LC.APPLICANT.CUSTNO>


    END

    RETURN
