* Modification History:
* ZIT-UPG-R13-R19 : Converted $INCLUDE TO $INSERT, Converted GET.LOC.REF to MULTI.GET.LOC.REF
*                   Converted COVERT to CHANGE
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.FIAB.CUS.REGIME.MATRI
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
   $INSERT I_F.CUSTOMER
*-----------------------------------------------------------------------------
    IF MESSAGE EQ 'VAL' THEN RETURN

    GOSUB INITIALISATION
    GOSUB MAIN.PROCESS
    RETURN
*-----------------------------------------------------------------------------

INITIALISATION:
*file opening, variable set up

    FN.CUST= 'F.CUSTOMER'
    F.CUST=''
    R.CUST=''
    ERR.CUST=''

    CALL OPF(FN.CUST,F.CUST)

    RETURN
* $INSERT I_F.BZ.COFFRE.LOYER - Not Used anymore;-----------------------------------------------
MAIN.PROCESS:
*main subroutine processing
    ETAT.CIVIL=COMI
*    CALL GET.LOC.REF("CUSTOMER","BZ.REGIME.MATRI",POS.MATRI)
    * ZIT-UPG-R13-R19/S
       Y.APP = "CUSTOMER"
       Y.FIELD = "BZ.REGIME.MATRI":@VM:"BZ.ACTIV"
       Y.POS = ''
       CALL MULTI.GET.LOC.REF(Y.APP, Y.FIELD, Y.POS)
       PEB.SystemTables.getVFunction() Y.POS<1,1>
       POS.BZ.ACTIV = Y.POS<FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusPG-R13-R19/E 

    IF ETAT.CIVIL NE 'MARIE' FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusOCREF<POS.MATRI,7>= "NOINPUT"
    END ELSE
        R.NEW(EB.CUS.LOCAL.REF)<1,POS.MATRI>=""
    END
*-----------------------------------------------------------------------------
*    CALL GET.LOC.REF("CUSTOMER","BZ.ACTIV",POS.BZ.ACTIV)
     
    CLASSE.ACTIVITE = R.NEW(EB.CUS.LOCAL.REF)<1,POS.BZ.ACTIV>
    IF CLASSE.ACTIVITE EQ '69' THEN
        T(EB.CUS.JOB.TITLE)<3> = 'NOINPUT'
    END
*-----------------------------------------------------------------------------
*----------------------------------------------------------*
V.DOC=R.NEW(EB.CUS.LEGAL.DOC.NAME)
    CHANGE @VM TO @FM IN V.DOC
    NB.DOC=DCOUNT(V.DOC,@FM)
    FOR I = 1 TO NB.DOC
        BEGIN CASE
        CASE V.DOC<I> EQ 'CIN'
            T(EB.CUS.LEGAL.EXP.DATE)<3> = 'NOINPUT'
        CASE V.DOC<I> EQ 'MF'
            T(EB.CUS.LEGAL.EXP.DATE)<3> = 'NOINPUT'
        CASE V.DOC<I> EQ 'RC'
            T(EB.CUS.LEGAL.EXP.DATE)<3> = 'NOINPUT'
        CEB.DataAccess.Opf 1
         EB.DataAccess.OpfT(EB.CUS.LEGAL.EXP.DATE)<3> = ''
        END CASE
    NEXT I
*----------------------------------------------------------*
    RETURN
END
