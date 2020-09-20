*-----------------------------------------------------------------------------
* <Rating>-1</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.LD.PRODUCT.FIN(ENQ.DATA)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*-------------------------------------------------------------
* @author
*-------------------------------------------------------------
*MODIFICATION HISTORY:
*ZIT-UPG-R13-R19-VM,FM TO @VM,@FM;F.READ TO CACHE.READ;INITIALISED VARIABLES.
********************************************************
$INSERT I_COMMON
$INSERT I_EQUATE
$INSERT I_ENQUIRY.COMMON
$INSERT I_F.LIMIT.PARAMETER

    FN.LIMIT='F.LIMIT.PARAMETER'
    F.LIMIT=''
	LIMIT.REC=''
	ERR1=''

*    CALL OPF (FN.LIMIT,F.LIMIT)  ;*NOT NEEDED FOR CACHE.READ

    ID.LIMIT.PARAM = "SYSTEM"

* $INSERT I_EQUATE - Not Used anymore; "LD.LOANS.AND.DEPOSITS"

***** PRODUITS LD *******

*    CALL F.READ(FN.LIMIT,ID.LIMIT.PARAM,LIMIT.REC,F.LIMIT,ERR1)
	CALL CACHE.READ(FN.LIMIT,ID.LIMIT.PARAM,LIMIT.REC,ERR1)
* $INSERT I_F.BZ.COFFRE.LOYER - Not Used anymore;I.PAR.APPLICATION>

    Y.APPL.COUNT = DCOUNT(Y.APPLICATION,@VM)

    FOR K = 1 TO Y.APPL.COUNT

        Y.APPL = Y.APPLICATION<1,K>

        IF  Y.APPL EQ LD.APPLICATION THEN

        EB.SystemTables.getVFunction()UCT.NO.COURANEB.SystemTables.getVFunction()REC<LI.PAR.PEB.SystemTables.getRNew()TFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus        Y.PRODUCTS.NO = Y.PRODUCTS.NO : SPACE(FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus.COURANT

        END
        Y.PRODUCT.NO.COURANT = ""
    NEXT K




***********************************
    Y.SELECTION = ENQ.DATA<2>

*    CONVERT VM TO FM IN Y.SELECTION
	 CHANGE @VM TO @FM IN Y.SELECTION
    LOCATE 'LIMIT.PRODUCT' IN Y.SELECTION SETTING PRODUCT.POS THEN

        RETURN
    END ELSE


        ENQ.DATA<2,PRODUCT.POS> = 'LIMIT.PRODUCT'
        ENQ.DATA<3,PRODUCT.POS> = 'EQ'
        ENQ.DATA<4,PRODUCT.POS> = Y.PRODUCTS.NO
    END

***********************************



    REB.DataAccess.OpfB.DataAccess.Opf
END
