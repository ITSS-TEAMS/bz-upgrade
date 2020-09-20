*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R13-R19    : CONVERT CHANGED TO CHANGE
*                     FM CHANGED TO @FM
*-----------------------------------------------------------------------------
* <Rating>0</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE E.BUILDR.ACCOUNT.NEW(ENQ.DATA)
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
    $INSERT I_F.CUSTOMER.ACCOUNT
    $INSERT I_F.ACCOUNT
*-------------------------------------------------------------------

    V.CUSTOMER.ID = ''
    V.CUSTOMER.ID = ENQ.DATA<4,1>
    V.CUSTOMER.ID = TRIM(V.CUSTOMER.ID,'0','L')
    FN.CUS.ACC = "F.CUSTOMER.ACCOUNT"
    F.CUS.ACC = ''

    FN.AC="F.ACCOUNT"
    F.AC=""

* $INSERT I_ENQUIRY.COMMON - Not Used anymore;ID
    R.CUS.ACC  = ''
    E.CUS.ACC  = ''


* $INSERT I_F.BZ.COFFRE.LOYER - Not Used anymore;.ACC )
    CALL OPF(FN.AC , F.AC )


    CALL F.READ(FN.CUS.ACC , K.CUS.ACC , R.CUS.ACC , F.CUS.ACC , E.CUS.ACC )



    IF E.CUS.ACC THEN
        ENQ.DATA<4,1> = ''
        EB.SystemTables.getVFunction()  END ELSE
        ACCOUNT.IDS = R.CUS.AFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusE.COMPTE= DCOUNT(ACCOUNT.IDS,@FM)

        FFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusTO NBRE.COMPTE
            IDENTIF.CPT=ACCOUNT.IDS<COMPTEUR.AC>
            CALL F.READ(FN.AC , IDENTIF.CPT , R.AC, F.AC, E.AC )
            CATEG.AC=R.AC<AC.CATEGORY>

            IF (CATEG.AC GE 1000 AND CATEG.AC LT 1400) OR (CATEG.AC GE 6000 AND CATEG.AC LT 7000) OR (CATEG.AC EQ 8025) OR (CATEG.AC EQ 8024) OR (CATEG.AC EQ 8105) OR (CATEG.AC EQ 8108) THEN
                AC.RST<-1>=IDENTIF.CPT
            END

        NEXT COMPTEUR.AC

 *       CONVERT FM TO ' ' IN AC.RST
        CHANGE @FM TO ' ' IN AC.RST

        ENQ.DATA<4,1> = AC.RST
    END

    RETURN

END
