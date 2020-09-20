*-----------------------------------------------------------------------------
* <Rating>39</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.AG.CHECK.SIGNATURE(TABLEAU)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------  
*ZIT-UPG-R13-R19 :  FM,SM converted to @FM,@SM
* ----------------------------------------------------------------------------	

    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.IM.DOCUMENT.IMAGE
    $INSERT I_F.ACCOUNT        


MAIN:

    GOSUB INIT
    GOSUB OPENFILES
    GOSUB PROCESS
    RETURN
* $INSERT I_COMMON - Not Used anymore;*******************
INIT:


    FN.CUS.AC="F.CUSTOMER.ACCOUNT"
    F.CUS.AC=""
    FN.REF="F.IM.REFERENCE"
    F.REF=""
    FN.IMG="F.IM.DOCUMENT.IMAGE"
    F.IMG=""
    FN.AC="F.ACCOUNT"
    F.AC=""
    AGENCE=""

    LOCATE "AGENCE" IN D.FIELDS<1> SETTING AG.POS THEN
        AGENCE = D.RANGE.AND.VALUE<AG.POS>
    END

    CHANGE @SM TO " " IN AGENCE

    RETURN
**********FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus************
OPENFILES:
    CALL OPF(FN.CUS.FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus CALL OPF(FN.REF,F.REF)
    CALL OPF(FN.IMG,F.IMG)
    CALL OPF(FN.AC,F.AC)
    RETURN
***************************************
PROCESS:

    SEL.COMMAND="SELECT ": FN.AC : " WITH CATEGORY GE 1000 AND CATEGORY LT 2000 AND ACCOUNT.OFFICER EQ " : AGENCE
    CALL EB.READLIST(SEL.COMMAND,SEL.LIST,'',NO.OF.REC,ERR1)
    IF SEL.LIST EQ '' THEN
        RETURN
    END ELSE
        LOOP
            REMOVE AC FROM SEL.LIST SETTING POS
        WHILE AC :POS
            COMPTE = AC
            GOSUB VERIFY.SIGNATORY

        REPEAT
    END

    RETURN

VERIFY.EB.DataAccess.OpfB.DataAccess.OpfTORY:

    CALL F.READ(FN.REF,COMPTE,R.REF,F.REF,REF.ERR)
    CALL F.READ(FN.AC,COMPTE,R.AC,F.AC,AC.ERR)

    DAO=R.AC<AC.ACEB.SystemTables.getRNew().FT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefATEGORY=R.AC<AC.CATEGORY>


    IEB.DataAccess.FReadF NE '' THEN
        REFERENCES=R.REF
        NOMBRE.REFERENCES=DCEB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyerM)
        V.IMAGE = "KO"
        FOR EB.SystemTables.setE(1 TO NOMBRE.REFERENCES)
            REFERENCE=REFERENCES<REF.SEAQUENCE>
tmp.ID.NEW.MG.IMG.ERR = EB.SystemTables.getIdNew(MG,IMG.ERR)
            CALL F.REB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyerCE,R.tmp.ID.NEW.MG.IMG.ERR
EB.SystemTables.setIdNew(MG,IMG.ERR, tmp.ID.NEW.MG.IMG.ERR)
            TYPE.IMG=R.IMG<IM.DOC.IMAGE.TYPE>
            IMAGEEB.DataAccess.FWriteIM.DOC.IMAGE>
            IF TYPE.IMG EQ "SIGNATURES" AND IMAGE NE "" THEN
                V.IMAGE = "OK"                 
			END
        EB.SystemTables.setAf()*-----------------------------------------------------------------------------
* <Rating>39</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.AG.CHECK.SIGNATURE(TABLEAU)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------  
*ZIT-UPG-R13-R19 :  FM,SM converted to @FM,@SM
* ----------------------------------------------------------------------------	

    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.IM.DOCUMENT.IMAGE
    $INSERT I_F.ACCOUNT        


MAIN:

    GOSUB INIT
    GOSUB OPENFILES
    GOSUB PROCESS
    RETURN
***************************************
INIT:


    FN.CUS.AC="F.CUSTOMER.ACCOUNT"
    F.CUS.AC=""
    FN.REF="F.IM.REFERENCE"
    F.REF=""
    FN.IMG="F.IM.DOCUMENT.IMAGE"
    F.IMG=""
    FN.AC="F.ACCOUNT"
    F.AC=""
    AGENCE=""

    LOCATE "AGENCE" IN D.FIELDS<1> SETTING AG.POS THEN
        AGENCE = D.RANGE.AND.VALUE<AG.POS>
    END

    CHANGE @SM TO " " IN AGENCE

    RETURN
***************************************
OPENFILES:
    CALL OPF(FN.CUS.AC,F.CUS.AC)
    CALL OPF(FN.REF,F.REF)
    CALL OPF(FN.IMG,F.IMG)
    CALL OPF(FN.AC,F.AC)
    RETURN
***************************************
PROCESS:

    SEL.COMMAND="SELECT ": FN.AC : " WITH CATEGORY GE 1000 AND CATEGORY LT 2000 AND ACCOUNT.OFFICER EQ " : AGENCE
    CALL EB.READLIST(SEL.COMMAND,SEL.LIST,'',NO.OF.REC,ERR1)
    IF SEL.LIST EQ '' THEN
        RETURN
    END ELSE
        LOOP
            REMOVE AC FROM SEL.LIST SETTING POS
        WHILE AC :POS
            COMPTE = AC
            GOSUB VERIFY.SIGNATORY

        REPEAT
    END

    RETURN

VERIFY.SIGNATORY:

    CALL F.READ(FN.REF,COMPTE,R.REF,F.REF,REF.ERR)
    CALL F.READ(FN.AC,COMPTE,R.AC,F.AC,AC.ERR)

    DAO=R.AC<AC.ACCOUNT.OFFICER>
    CATEGORY=R.AC<AC.CATEGORY>


    IF R.REF NE '' THEN
        REFERENCES=R.REF
        NOMBRE.REFERENCES=DCOUNT(REFERENCES,@FM)
        V.IMAGE = "KO"
        FOR REF.SEAQUENCE = 1 TO NOMBRE.REFERENCES
            REFERENCE=REFERENCES<REF.SEAQUENCE>
            CALL F.READ(FN.IMG,REFERENCE,R.IMG,F.IMG,IMG.ERR)
            TYPE.IMG=R.IMG<IM.DOC.IMAGE.TYPE>
            IMAGE=R.IMG<IM.DOC.IMAGE>
            IF TYPE.IMG EQ "SIGNATURES" AND IMAGE NE "" THEN
                V.IMAGE = "OK"                 
			END
           FT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefemTables.setE()*-----------------------------------------------------------------------------
* <Rating>39</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.AG.CHECK.SIGNATURE(TABLEAU)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------  
*ZIT-UPG-R13-R19 :  FM,SM converted to @FM,@SM
* ----------------------------------------------------------------------------	

    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.IM.DOCUMENT.IMAGE
    $INSERT I_F.ACCOUNT        


MAIN:

    GOSUB INIT
    GOSUB OPENFILES
    GOSUB PROCESS
    RETURN
***************************************
INIT:


    FN.CUS.AC="F.CUSTOMER.ACCOUNT"
    F.CUS.AC=""
    FN.REF="F.IM.REFERENCE"
    F.REF=""
    FN.IMG="F.IM.DOCUMENT.IMAGE"
    F.IMG=""
    FN.AC="F.ACCOUNT"
    F.AC=""
    AGENCE=""

    LOCATE "AGENCE" IN D.FIELDS<1> SETTING AG.POS THEN
        AGENCE = D.RANGE.AND.VALUE<AG.POS>
    END

    CHANGE @SM TO " " IN AGENCE

    RETURN
***************************************
OPENFILES:
    CALL OPF(FN.CUS.AC,F.CUS.AC)
    CALL OPF(FN.REF,F.REF)
    CALL OPF(FN.IMG,F.IMG)
    CALL OPF(FN.AC,F.AC)
    RETURN
***************************************
PROCESS:

    SEL.COMMAND="SELECT ": FN.AC : " WITH CATEGORY GE 1000 AND CATEGORY LT 2000 AND ACCOUNT.OFFICER EQ " : AGENCE
    CALL EB.READLIST(SEL.COMMAND,SEL.LIST,'',NO.OF.REC,ERR1)
    IF SEL.LIST EQ '' THEN
        RETURN
    END ELSE
        LOOP
            REMOVE AC FROM SEL.LIST SETTING POS
        WHILE AC :POS
            COMPTE = AC
            GOSUB VERIFY.SIGNATORY

        REPEAT
    END

    RETURN

VERIFY.SIGNATORY:

    CALL F.READ(FN.REF,COMPTE,R.REF,F.REF,REF.ERR)
    CALL F.READ(FN.AC,COMPTE,R.AC,F.AC,AC.ERR)

    DAO=R.AC<AC.ACCOUNT.OFFICER>
    CATEGORY=R.AC<AC.CATEGORY>


    IF R.REF NE '' THEN
        REFERENCES=R.REF
        NOMBRE.REFERENCES=DCOUNT(REFERENCES,@FM)
        V.IMAGE = "KO"
        FOR REF.SEAQUENCE = 1 TO NOMBRE.REFERENCES
            REFERENCE=REFERENCES<REF.SEAQUENCE>
            CALL F.READ(FN.IMG,REFERENCE,R.IMG,F.IMG,IMG.ERR)
            TYPE.IMG=R.IMG<IM.DOC.IMAGE.TYPE>
            IMAGE=R.IMG<IM.DOC.IMAGE>
            IF TYPE.IMG EQ "SIGNATURES" AND IMAGE NE "" THEN
                V.IMAGE = "OK"                 
			END
            NEXT REF.SEAQUENCE
			IF V.IMAGE NE "OK" THEN
              TABLEAU<-1> = COMPTE
			END
        END ELSE
            TABLEAU<-1>=COMPTE  
        END

        RETURN

    END
