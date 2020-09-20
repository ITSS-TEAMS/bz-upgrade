*-----------------------------------------------------------------------------
* <Rating>0</Rating>
*-----------------------------------------------------------------------------
*-------------------------------------------------------------------------
*-------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE  BZ.CPT.NEG.CODE.DOUANE
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
$INSERT I_F.ACCOUNT
$INSERT I_F.CUSTOMER

    FN.AC = "F.ACCOUNT"
    F.AC = ""
    AC.REC=''
    ERR.AC=''

    FN.CUS = "F.CUSTOMER"
    F.CUS = ""
    CUS.REC=''
    ERR.CUS=''

* $INSERT I_COMMON - Not Used anymore;F.AC)
* $INSERT I_EQUATE - Not Used anymore; F.CUS)


    Y.CUSTOMER=O.DATA
    CALL F.READ(FN.CUS,Y.CUSTOMER, CUS.REC,F.CUS, ERR.CUS)
    Y.LEGAL.ID.DOCS=CUS.REC<EB.CUS.LEGAL.DOC.NAME>
* $INSERT I_F.BZ.COFFRE.LOYER - Not Used anymore;AL.ID.DOCS,@VM)

    FOR COUNTER=1 TO NBR.LEGAL.DOCS
        Y.DOCS.NAME=Y.LEGAL.ID.DOCS<1,COUNTER>

        IF Y.DOCS.NAME EQ "MF" THEN
            Y.MAT.FIS=CUS.REC<EB.CUS.LEGAL.ID><1,COUNTER>
*Y.MAT.FIS=LEFT(Y.MAT.FIS,8)
            O.DATA=Y.MAT.FIS
        END
    NEXTEB.SystemTables.getVFunction()
    RETURN
END
