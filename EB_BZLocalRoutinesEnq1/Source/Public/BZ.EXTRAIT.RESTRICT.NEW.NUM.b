*-----------------------------------------------------------------------------
* <Rating>350</Rating>
*-----------------------------------------------------------------------------
*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13  : $INSERT BP to $INCLUDE BZDEV.BP
*ZIT-UPG-R13-R19  :VM,FM CHANGED TO @VM,@FM
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.EXTRAIT.RESTRICT.NEW.NUM(ENQ.DATA)
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

    CHANGE @VM TO @FM IN Y.SELECTION   ;*CHANGED 

    FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusUMBER" IN Y.SELECTION SETTING ACC.POS THEN

FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus= ENQ.DATA<4,ACC.POS>
        Y.SPACE = SPACE(1)

        NBRE.SPACE = COUNT(Y.COMPTE,Y.SPACE)

        IF NBRE.SPACE GE 1 THEN
            ENQ.DATA<4,ACC.POS> = "0"
        END

    END ELSE
        Y.COMPTE = "0"
        RETURN
    END
AC.REC =''
ERR1 =''
    CALL F.READ(FN.AC,Y.COMPTE,AC.REC,F.AC,ERR1)
    CLIENT=AC.REC<AC.CUSTOMER>

    IF CLIENT THEN
	CUS.ERR =''
	CUS.ERR1 =''
        CALL F.READ(FN.CUS,CLIENT,CUS.REC,F.CUS,CUS.ERR1)
        SECTEUR=CUS.REC<EB.CUS.SECTOR>
        IF SECTEUR THEN
         EB.DataAccess.OpfIF SECTEUR EQ 8100 THEN
****
COMEB.DataAccess.Opf.REC =''
ERR2 =''
                CALL F.READ(FN.COMPTE,OPERATOR,COMPTE.REC,F.COMPTE,ERR2)
                IF COMPTE.REC THEN
                  EB.SystemTables.getRNew()MFT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefEC<CPT.USER.ALL>
                    COMPTES=COMPTE.REC<CPT.USER.COMPTE>
         EB.DataAccess.FRead     DATE.VALIDITE=COMPTE.REC<CPT.USER.DATE.VALIDITE>
                    IF (DATE.VALIDITE GE TODAY) OR (DATE.VALIDITE EQ "") THEN
                        IF PERMISSION NE "YES" THEN
                            IF COMPTES NE "" THEN
                            EB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyer@FM IN COMPTES
                                LOCATE Y.COMPTE IN COMPTES SETTING COMPTE.POS THEN
            EB.SystemTables.setE(1)
                                END
                    EB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyer                   END ELSE
                 EB.DataAccess.FWrite    AUTORISATION=1
                        END
                    END
                END
****
  EB.SystemTables.setAf()*-----------------------------------------------------------------------------
* <Rating>350</Rating>
*-----------------------------------------------------------------------------
*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13  : $INSERT BP to $INCLUDE BZDEV.BP
*ZIT-UPG-R13-R19  :VM,FM CHANGED TO @VM,@FM
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.EXTRAIT.RESTRICT.NEW.NUM(ENQ.DATA)
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

    CHANGE @VM TO @FM IN Y.SELECTION   ;*CHANGED 

    LOCATE "ACCOUNT.NUMBER" IN Y.SELECTION SETTING ACC.POS THEN

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
AC.REC =''
ERR1 =''
    CALL F.READ(FN.AC,Y.COMPTE,AC.REC,F.AC,ERR1)
    CLIENT=AC.REC<AC.CUSTOMER>

    IF CLIENT THEN
	CUS.ERR =''
	CUS.ERR1 =''
        CALL F.READ(FN.CUS,CLIENT,CUS.REC,F.CUS,CUS.ERR1)
        SECTEUR=CUS.REC<EB.CUS.SECTOR>
        IF SECTEUR THEN
            IF SECTEUR EQ 8100 THEN
****
COMPTE.REC =''
ERR2 =''
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
     FT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefles.setE()*-----------------------------------------------------------------------------
* <Rating>350</Rating>
*-----------------------------------------------------------------------------
*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13  : $INSERT BP to $INCLUDE BZDEV.BP
*ZIT-UPG-R13-R19  :VM,FM CHANGED TO @VM,@FM
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.EXTRAIT.RESTRICT.NEW.NUM(ENQ.DATA)
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

    CHANGE @VM TO @FM IN Y.SELECTION   ;*CHANGED 

    LOCATE "ACCOUNT.NUMBER" IN Y.SELECTION SETTING ACC.POS THEN

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
AC.REC =''
ERR1 =''
    CALL F.READ(FN.AC,Y.COMPTE,AC.REC,F.AC,ERR1)
    CLIENT=AC.REC<AC.CUSTOMER>

    IF CLIENT THEN
	CUS.ERR =''
	CUS.ERR1 =''
        CALL F.READ(FN.CUS,CLIENT,CUS.REC,F.CUS,CUS.ERR1)
        SECTEUR=CUS.REC<EB.CUS.SECTOR>
        IF SECTEUR THEN
            IF SECTEUR EQ 8100 THEN
****
COMPTE.REC =''
ERR2 =''
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
        END ELSE
            ENQ.DATA<4,ACC.POS> = "0"
        END
    END

    RETURN
END
