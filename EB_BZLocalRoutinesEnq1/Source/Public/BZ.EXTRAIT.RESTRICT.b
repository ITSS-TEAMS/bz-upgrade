*-----------------------------------------------------------------------------
* <Rating>350</Rating>
*-----------------------------------------------------------------------------
*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13  : $INSERT BP to $INCLUDE BZDEV.BP
*ZIT-UPG-R13-R19  :VM,FM TO @VM,@FM;INITIALISED F.READ VARIABLES;CONVERT TO CHANGE
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.EXTRAIT.RESTRICT(ENQ.DATA)
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
	AC.REC=''
	
    FN.CUS='F.CUSTOMER'
    F.CUS=''
    CUS.REC=''
	CUS.ERR1=''
	
    FN.COMPTE='F.BZ.CPT.USER'
    F.COMPTE=''
    AUTORISATION=0
    ERR1=''
	COMPTE.REC=''
	ERR2=''
	
    CALLEB.SystemTables.getVFunction()C,F.AC)
    CALL OPF (FN.CUS,F.CUS)
   FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusPTE,F.COMPTE)

    Y.SELECTION = ENQ.DATA<2>FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusVM TO FM IN Y.SELECTION
	 CHANGE @VM TO @FM IN Y.SELECTION
    LOCATE "ACCOUNT" IN Y.SELECTION SETTING ACC.POS THEN

        Y.COMPTE = ENQ.DATA<4,ACC.POS>
        Y.SPACE = SPACE(1)

        NBRE.SPACE = COUNT(Y.COMPTE,Y.SPACE)

        IF NBRE.SPACE GE 1 THEN
            ENQ.DATA<4,ACC.POS> = ""
        END

    END ELSE
        Y.COMPTE = ""
        RETURN
    END

    CALL F.READ(FN.AC,Y.COMPTE,AC.REC,F.AC,ERR1)
    CLIENT=AC.REC<AC.CUSTOMER>

    IF CLIENT THEN
        CALL F.READ(FN.CUS,CLIENT,CUS.REC,F.CUS,CUS.ERR1)
        SEB.DataAccess.OpfEUR=CUS.REC<EB.CUS.SECTOR>
        IEB.DataAccess.OpfECTEUR THEN
            IF SECTEUR EQ 8100 THEN
****
                CALL F.READ(FN.COMPTE,OPERATOR,COMPTE.REC,F.COMPTE,ERR2)
                IF COMPTE.REC THEN
                  EB.SystemTables.getRNew()MFT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefEC<CPT.USER.ALL>
                    COMPTES=COMPTE.REC<CPT.USER.COMPTE>
         EB.DataAccess.FRead     DATE.VALIDITE=COMPTE.REC<CPT.USER.DATE.VALIDITE>
                    IF (DATE.VALIDITE GE TODAY) OR (DATE.VALIDITE EQ "") THEN
                        IF PERMISSION NE "YES" THEN
                            IF COMPTES NE "" THEN
*                           EB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyer FM IN COMPTES
								CHANGE @VM TO @FM IN COMPTES
            EB.SystemTables.setE()*-----------------------------------------------------------------------------
* <Rating>350</Rating>
*-----------------------------------------------------------------------------
*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13  : $INSERT BP to $INCLUDE BZDEV.BP
*ZIT-UPG-R13-R19  :VM,FM TO @VM,@FM;INITIALISED F.READ VARIABLES;CONVERT TO CHANGE
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.EXTRAIT.RESTRICT(ENQ.DATA)
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
	AC.REC=''
	
    FN.CUS='F.CUSTOMER'
    F.CUS=''
    CUS.REC=''
	CUS.ERR1=''
	
    FN.COMPTE='F.BZ.CPT.USER'
    F.COMPTE=''
    AUTORISATION=0
    ERR1=''
	COMPTE.REC=''
	ERR2=''
	
    CALL OPF (FN.AC,F.AC)
    CALL OPF (FN.CUS,F.CUS)
    CALL OPF (FN.COMPTE,F.COMPTE)

    Y.SELECTION = ENQ.DATA<2>

*    CONVERT VM TO FM IN Y.SELECTION
	 CHANGE @VM TO @FM IN Y.SELECTION
    LOCATE "ACCOUNT" IN Y.SELECTION SETTING ACC.POS THEN

        Y.COMPTE = ENQ.DATA<4,ACC.POS>
        Y.SPACE = SPACE(1)

        NBRE.SPACE = COUNT(Y.COMPTE,Y.SPACE)

        IF NBRE.SPACE GE 1 THEN
            ENQ.DATA<4,ACC.POS> = ""
        END

    END ELSE
        Y.COMPTE = ""
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
*                                CONVERT VM TO FM IN COMPTES
								CHANGE @VM TO @FM IN COMPTES
                                LOCATE Y.COMPTE IN COMPTES SETTING COMPTE.POS THEN
                                    AUTORISATION=1
                    EB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyer                           END
                 EB.DataAccess.FWriteEND ELSE
                            AUTORISATION=1
                        END
                    END
        EB.SystemTables.setAf()*-----------------------------------------------------------------------------
* <Rating>350</Rating>
*-----------------------------------------------------------------------------
*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13  : $INSERT BP to $INCLUDE BZDEV.BP
*ZIT-UPG-R13-R19  :VM,FM TO @VM,@FM;INITIALISED F.READ VARIABLES;CONVERT TO CHANGE
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.EXTRAIT.RESTRICT(ENQ.DATA)
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
	AC.REC=''
	
    FN.CUS='F.CUSTOMER'
    F.CUS=''
    CUS.REC=''
	CUS.ERR1=''
	
    FN.COMPTE='F.BZ.CPT.USER'
    F.COMPTE=''
    AUTORISATION=0
    ERR1=''
	COMPTE.REC=''
	ERR2=''
	
    CALL OPF (FN.AC,F.AC)
    CALL OPF (FN.CUS,F.CUS)
    CALL OPF (FN.COMPTE,F.COMPTE)

    Y.SELECTION = ENQ.DATA<2>

*    CONVERT VM TO FM IN Y.SELECTION
	 CHANGE @VM TO @FM IN Y.SELECTION
    LOCATE "ACCOUNT" IN Y.SELECTION SETTING ACC.POS THEN

        Y.COMPTE = ENQ.DATA<4,ACC.POS>
        Y.SPACE = SPACE(1)

        NBRE.SPACE = COUNT(Y.COMPTE,Y.SPACE)

        IF NBRE.SPACE GE 1 THEN
            ENQ.DATA<4,ACC.POS> = ""
        END

    END ELSE
        Y.COMPTE = ""
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
*                                CONVERT VM TO FM IN COMPTES
								CHANGE @VM TO @FM IN COMPTES
                                LOCATE Y.COMPTE IN COMPTES SETTING COMPTE.POS THEN
                                    AUTORISATION=1
                                END
                            END
                        END ELSE
                            AUTORISATION=1
                        END
                    END
           FT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRef
  EB.SystemTables.setE()*-----------------------------------------------------------------------------
* <Rating>350</Rating>
*-----------------------------------------------------------------------------
*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13  : $INSERT BP to $INCLUDE BZDEV.BP
*ZIT-UPG-R13-R19  :VM,FM TO @VM,@FM;INITIALISED F.READ VARIABLES;CONVERT TO CHANGE
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.EXTRAIT.RESTRICT(ENQ.DATA)
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
	AC.REC=''
	
    FN.CUS='F.CUSTOMER'
    F.CUS=''
    CUS.REC=''
	CUS.ERR1=''
	
    FN.COMPTE='F.BZ.CPT.USER'
    F.COMPTE=''
    AUTORISATION=0
    ERR1=''
	COMPTE.REC=''
	ERR2=''
	
    CALL OPF (FN.AC,F.AC)
    CALL OPF (FN.CUS,F.CUS)
    CALL OPF (FN.COMPTE,F.COMPTE)

    Y.SELECTION = ENQ.DATA<2>

*    CONVERT VM TO FM IN Y.SELECTION
	 CHANGE @VM TO @FM IN Y.SELECTION
    LOCATE "ACCOUNT" IN Y.SELECTION SETTING ACC.POS THEN

        Y.COMPTE = ENQ.DATA<4,ACC.POS>
        Y.SPACE = SPACE(1)

        NBRE.SPACE = COUNT(Y.COMPTE,Y.SPACE)

        IF NBRE.SPACE GE 1 THEN
            ENQ.DATA<4,ACC.POS> = ""
        END

    END ELSE
        Y.COMPTE = ""
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
*                                CONVERT VM TO FM IN COMPTES
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
                    ENQ.DATA<4,ACC.POS> = ""
                END
            END
        END ELSE
            ENQ.DATA<4,ACC.POS> = ""
        END
    END

    RETURN
END
