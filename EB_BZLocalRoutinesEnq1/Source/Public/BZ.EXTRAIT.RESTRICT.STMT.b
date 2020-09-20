*-----------------------------------------------------------------------------
* <Rating>199</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.EXTRAIT.RESTRICT.STMT(ENQ.DATA)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*-------------------------------------------------------------
* @author BounouaraFehmi
*-------------------------------------------------------------
* Modification History :                                                     
*ZIT-UPG-R09-R13  : $INSERT BP to $INCLUDE BZDEV.BP     
*ZIT-UPG-R13-R19     :  Converted FM,VM to @FM,@VM and CONVERT to CHANGE.                
*----------------------------------------------------------------------------
$INSERT I_COMMON
$INSERT I_EQUATE
$INSERT I_ENQUIRY.COMMON
$INSERT I_F.USER
$INSERT I_F.ACCOUNT
$INSERT I_F.CUSTOMER
*ZIT-UPG-R09-R13/S
*$INSERT BP I_F.BZ.CPT.USER
$INSERT I_F.BZ.CPT.USER
*ZIT-UPG-R09-R13/E

    FN.AC='F.ACCOUNT'
    F.AC=''
* $INSERT I_EQUATE - Not Used anymore;ER'
    F.CUS=''
    FN.COMPTE='F.BZ.CPT.USER'
    F.COMPTE=''
    AUTORISATION=0
    ERR1=''

    CALL OPF (FN.AC,F.AC)
    CALL OPF (FN.CUS,F.CUS)
    CALL OPF (FN.COMPTE,F.COMPTE)

    Y.SELECTION = ENQ.DATA<2>

    CHANGE @VM TO @FM IN Y.SELECTION

    LOCATE "STMT.ACCOUNT.NO" IN Y.SELECTION SETTING ACC.POS THEN
        EB.SystemTables.getVFunction() ENQ.DATA<4,AEB.SystemTables.getVFunction()   END ELSE
     FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus
        RETURN
    END


    CALL F.READ(FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus.REC,F.AC,ERR1)
    CLIENT=AC.REC<AC.CUSTOMER>
    CALL F.READ(FN.CUS,CLIENT,CUS.REC,F.CUS,CUS.ERR1)
    SECTEUR=CUS.REC<EB.CUS.SECTOR>

    IF SECTEUR EQ 8100 THEN
************
        CALL F.READ(FN.COMPTE,OPERATOR,COMPTE.REC,F.COMPTE,ERR2)
        IF COMPTE.REC THEN
            PERMISSION=COMPTE.REC<CPT.USER.ALL>
            COMPTES=COMPTE.REC<CPT.USER.COMPTE>
            DATE.VALIDITE=COMPTE.REC<CPT.USER.DATE.VALIDITE>

            IF (DATE.VALIDITE GE TODAY) OR (DATE.VALIDITE EQ "") THEN
                IF PERMISSION NE "YES" THEN
                    IF COMPTES NE "" THEN
                        CHANGE @VM TO @FM IN COMPTES
                        LOCATE Y.COMPTE IN COMPTES SETTING COMPTE.POS THEN
                            AUTORISATION=1
                        END
                    END
                END ELSE
         EB.DataAccess.Opf        AUTORISATION=1
         EB.DataAccess.Opf    END
            END
        END
************
        IF AUTORISATION NE 1 THEN
            ENQ.DAEB.SystemTables.getRNew()1FT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRef     ENQ.DATA<4,ACC.POS> = ""
        EEB.DataAccess.FRead  END

    RETURN
END
