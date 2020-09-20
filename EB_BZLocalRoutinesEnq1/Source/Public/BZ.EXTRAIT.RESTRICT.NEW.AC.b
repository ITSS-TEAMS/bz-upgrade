*-----------------------------------------------------------------------------
* <Rating>350</Rating>
*-----------------------------------------------------------------------------
*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13  : $INSERT BP to $INCLUDE BZDEV.BP
*ZIT-UPG-R13-R19     :  Converted FM,VM to @FM,@VM and CONVERT to CHANGE.
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.EXTRAIT.RESTRICT.NEW.AC(ENQ.DATA)
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

* $INSERT I_EQUATE - Not Used anymore;'
    F.AC=''

    FN.CUS='F.CUSTOMER'
    F.CUS=''

* $INSERT I_F.BZ.COFFRE.LOYER - Not Used anymore;    F.COMPTE=''
    AUTORISATION=0
    ERR1=''

    CALL OPF (FN.AC,F.AC)
    CALL OPF (FN.CUS,F.CUS)
    CALL OPF (FN.COMPTE,F.COMPTE)

    Y.SELECTION = ENQ.DATA<2>

    CHANGE @VM TO @FM IN Y.SELECTION

    LOCATE "ACCOUFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusN SETTING ACC.POS THEN

        Y.COMPTE = EFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus>
        Y.SPACE = SPACE(1)

        NBRE.SPACE = COUNT(Y.COMPTE,Y.SPACE)

        IF NBRE.SPACE GE 1 THEN
            ENQ.DATA<4,ACC.POS> = "0"
        END

    END ELSE
        Y.COMPTE = "0"
        RETURN
    END

    CALL F.READ(FN.AC,Y.COMPTE,AC.REC,F.AC,ERR1)
    CLIENT=AC.REC<AC.CUSTOMER>

    IF CLIENT THEN
        CALL F.READ(FN.CUS,CLIENT,CUS.REC,F.CUS,CUS.ERR1)
        SECTEUR=CUS.REC<EB.CUS.SECTOR>
        IF SECTEUR THEN
            IF SECTEUR EQ 8100 THEN
****
                CALL F.READ(FN.COMPTE,OPERATOR,COMPTE.REC,F.COMPTE,ERR2)
         EB.DataAccess.Opf    IF COMPTE.REC THEN
         EB.DataAccess.Opf        PERMISSION=COMPTE.REC<CPT.USER.ALL>
                    COMPTES=COMPTE.REC<CPT.USER.COMPTE>
                    DATE.VALIDITE=COMPTE.REC<CPT.USER.DATE.VALIDITE>
                    IF (DATE.VALIDITE GE TODAY) OR (DATE.VALIDITE EQ "") THEN
                        IF PERMISSION NE "YES" THEN
                  EB.SystemTables.getRNew()FT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefNE "" THEN
                                CHANGE @VM TO @FM IN COMPTES
         EB.DataAccess.FRead                 LOCATE Y.COMPTE IN COMPTES SETTING COMPTE.POS THEN
                                    AUTORISATION=1
                                END
                            END
                        END EB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyer                AUTORISATION=1
            EB.SystemTables.setE()*-----------------------------------------------------------------------------
* <Rating>350</Rating>
*-----------------------------------------------------------------------------
*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13  : $INSERT BP to $INCLUDE BZDEV.BP
*ZIT-UPG-R13-R19     :  Converted FM,VM to @FM,@VM and CONVERT to CHANGE.
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.EXTRAIT.RESTRICT.NEW.AC(ENQ.DATA)
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

    FN.CUS='F.CUSTOMER'
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

    LOCATE "ACCOUNT" IN Y.SELECTION SETTING ACC.POS THEN

        Y.COMPTE = ENQ.DATA<4,ACC.POS>
        Y.SPACE = SPACE(1)

        NBRE.SPACE = COUNT(Y.COMPTE,Y.SPACE)

        IF NBRE.SPACE GE 1 THEN
            ENQ.DATA<4,ACC.POS> = "0"
        END

    END ELSE
        Y.COMPTE = "0"
        RETURN
    END

    CALL F.READ(FN.AC,Y.COMPTE,AC.REC,F.AC,ERR1)
    CLIENT=AC.REC<AC.CUSTOMER>

    IF CLIENT THEN
        CALL F.READ(FN.CUS,CLIENT,CUS.REC,F.CUS,CUS.ERR1)
        SECTEUR=CUS.REC<EB.CUS.SECTOR>
        IF SECTEUR THEN
            IF SECTEUR EQ 8100 THEN
****
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
                            AUTORISATION=1
                        END
                    END
                ENDEB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyer     IEB.DataAccess.FWriteISATION NE 1 THEN
                    ENQ.DATA<4,ACC.POS> = "0"
                END
            END
        EB.SystemTables.setAf()*-----------------------------------------------------------------------------
* <Rating>350</Rating>
*-----------------------------------------------------------------------------
*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13  : $INSERT BP to $INCLUDE BZDEV.BP
*ZIT-UPG-R13-R19     :  Converted FM,VM to @FM,@VM and CONVERT to CHANGE.
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.EXTRAIT.RESTRICT.NEW.AC(ENQ.DATA)
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

    FN.CUS='F.CUSTOMER'
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

    LOCATE "ACCOUNT" IN Y.SELECTION SETTING ACC.POS THEN

        Y.COMPTE = ENQ.DATA<4,ACC.POS>
        Y.SPACE = SPACE(1)

        NBRE.SPACE = COUNT(Y.COMPTE,Y.SPACE)

        IF NBRE.SPACE GE 1 THEN
            ENQ.DATA<4,ACC.POS> = "0"
        END

    END ELSE
        Y.COMPTE = "0"
        RETURN
    END

    CALL F.READ(FN.AC,Y.COMPTE,AC.REC,F.AC,ERR1)
    CLIENT=AC.REC<AC.CUSTOMER>

    IF CLIENT THEN
        CALL F.READ(FN.CUS,CLIENT,CUS.REC,F.CUS,CUS.ERR1)
        SECTEUR=CUS.REC<EB.CUS.SECTOR>
        IF SECTEUR THEN
            IF SECTEUR EQ 8100 THEN
****
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
                            AUTORISATION=1
                        END
                    END
                END
****
                IF AUTORISATION NE 1 THEN
                    ENQ.DATA<4,ACC.POS> = "0"
                END
            END
        ENDFT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefEB.SystemTables.setE("0")
        END
    END

    RETURN
END
