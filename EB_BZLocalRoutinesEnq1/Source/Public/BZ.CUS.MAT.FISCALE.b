*-----------------------------------------------------------------------------
* <Rating>0</Rating>
* Modification History:
* ZIT-UPG-R13-R19 : Variables initialized, Converted GET.LOC.REF to MULTI.GET.LOC.REF
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.CUS.MAT.FISCALE
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
$INSERT I_F.CUSTOMER
$INSERT I_F.SECTOR


    FN.CUS="F.CUSTOMER"
    F.CUS=""
    R.CUS=''
    CUS.ERR=''
    FN.SEC= 'F.SECTOR'
    F.SEC=''
    ERR.SEC=''
    R.SEC=''

* $INSERT I_COMMON - Not Used anymore;F.CUS)
* $INSERT I_EQUATE - Not Used anymore;F.SEC)



    CUS.ID = O.DATA


    CALL F.READ(FN.CUS, CUS.ID ,R.CUS,F.CUS,CUS.ERR)


    Y.SECTOR=R.CUS<EB.CUS.SECTOR>

    CALL F.READ(FN.SEC,Y.SECTOR,R.SEC,F.SEC,ERR.SEC)
*    CALL GET.LOC.REF('SECTOR','LIB.NAT.CLT',POS.LIB.NAT.CLT)
    * ZIT-UPG-R13-R19/S
       Y.APP = "SECTOR"
       YEB.SystemTables.getVFunction()LIB.NAT.CLT"
       Y.POS = ''
tmp.V$FUFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusmTables.getVFunction()
       CALL MULTI.GET.LOC.REF(Y.APP, Y.FIELtmp.V$FUNCTION
EB.SystemTables.setVFunction(tmp.V$FUNCTION)
       POS.LIB.NAFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus>
    * ZIT-UPG-R13-R19/E 
    Y.CUST_TYPE= R.SEC<EB.SEC.LOCAL.REF,POS.LIB.NAT.CLT>



    Y.LEGAL.ID.DOCS=R.CUS<EB.CUS.LEGAL.DOC.NAME>

    NBR.LEGAL.DOCS=DCOUNT(Y.LEGAL.ID.DOCS,@VM)

    Y.DOCS.ID=""
    FOR  COUNTER=1 TO NBR.LEGAL.DOCS

        Y.DOCS.NAME=Y.LEGAL.ID.DOCS<1,COUNTER>
        IF Y.CUST_TYPE EQ "PM" OR Y.CUST_TYPE EQ "PF" THEN
            IF Y.DOCS.NAME EQ "MF" THEN
                Y.DOCS.ID=R.CUS<EB.CUS.LEGAL.ID><1,COUNTER>
            END
        END
        IF Y.CUST_TYPE EQ "PP" THEN

            IF Y.DOCS.NAME EQ "CIN" THEN
                Y.DOCS.ID=R.CUS<EB.CUS.LEGAL.ID><1,COUNTER>
            END
        END

    NEXT EB.DataAccess.OpfNTER



   EB.DataAccess.OpfDATA = Y.DOCS.ID

    RETURN

END
