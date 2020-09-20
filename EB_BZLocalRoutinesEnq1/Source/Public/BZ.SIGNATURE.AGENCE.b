*-------------------------------------------------------------------------------
* @author Fahmi.abdeltif@banquezitouna.com 23/09/2019
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.SIGNATURE.AGENCE
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

*ZIT-UPG-R13-R19 : CRT CHANGED TO CALL OCOMO; STOP CHANGED TO FATAL.ERROR; VARIABLE INITIALSED                       
*----------------------------------------------------------------------------

*ZIT-UPG-R13-R19/S
    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.IM.DOCUMENT.IMAGE
    $INSERT I_F.ACCOUNT
    $INSERT I_F.CUSTOMER
    $INSERT I_F.POSTING.RESTRICT
    $INSERT I_F.DEPT.ACCT.OFFICER
*ZIT-UPG-R13-R19/E

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
	R.REF=""
	REF.ERR=""
	
    FN.IEB.SystemTables.getVFunction()OCUMENT.IMAGEEB.SystemTables.getVFunction()MG=""
	
    FN.AFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus  F.AC=""
	ERR.AC=""
	AC.ERR=""
	
    FN.CFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus    F.CUS=""

    FN.POS="F.POSTING.RESTRICT"
    F.POS=""
	R.POS=""
	POS.ERR=""

    FN.DEPT.ACCT.OFFICER = 'F.DEPT.ACCT.OFFICER'
    F.DEPT.ACCT.OFFICER = ''
	R.DEPT.ACCT.OFFICER = ''
	YERR = ''



    RETURN
***************************************
OPENFILES:
    CALL OPF(FN.CUS.AC,F.CUS.AC)
    CALL OPF(FN.REF,F.REF)
    CALL OPF(FN.IMG,F.IMG)
    EB.DataAccess.Opf(FN.AC,F.AC)
    EB.DataAccess.Opf(FN.CUS,F.CUS)
    CALL OPF(FN.POS,F.POS)
    CALL OPF(FN.DEPT.ACCT.OFFICER,F.DEPT.ACCT.OFFICER)
    RETURN
***************************************
PROCESS:


    Y.TEB.FT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefdOCONV(TIME(), "MTS")
    CHANGE ':' TO '' IN Y.TIME
    DIRFILE="./EXTRACTION.BI/BZ.SIGNATURE.AGENCE":TODAY:Y.TIME:".txt"
    OPENSEQ DIRFILE TO FICHIEB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyer   CREATE FICHIER.SEQ  ELSE
*ZIT-UPG-R13EB.SystemTables.setE()*-------------------------------------------------------------------------------
* @author Fahmi.abdeltif@banquezitouna.com 23/09/2019
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.SIGNATURE.AGENCE
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

*ZIT-UPG-R13-R19 : CRT CHANGED TO CALL OCOMO; STOP CHANGED TO FATAL.ERROR; VARIABLE INITIALSED                       
*----------------------------------------------------------------------------

*ZIT-UPG-R13-R19/S
    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.IM.DOCUMENT.IMAGE
    $INSERT I_F.ACCOUNT
    $INSERT I_F.CUSTOMER
    $INSERT I_F.POSTING.RESTRICT
    $INSERT I_F.DEPT.ACCT.OFFICER
*ZIT-UPG-R13-R19/E

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
	R.REF=""
	REF.ERR=""
	
    FN.IMG="F.IM.DOCUMENT.IMAGE"
    F.IMG=""
	
    FN.AC="F.ACCOUNT"
    F.AC=""
	ERR.AC=""
	AC.ERR=""
	
    FN.CUS="F.CUSTOMER"
    F.CUS=""

    FN.POS="F.POSTING.RESTRICT"
    F.POS=""
	R.POS=""
	POS.ERR=""

    FN.DEPT.ACCT.OFFICER = 'F.DEPT.ACCT.OFFICER'
    F.DEPT.ACCT.OFFICER = ''
	R.DEPT.ACCT.OFFICER = ''
	YERR = ''



    RETURN
***************************************
OPENFILES:
    CALL OPF(FN.CUS.AC,F.CUS.AC)
    CALL OPF(FN.REF,F.REF)
    CALL OPF(FN.IMG,F.IMG)
    CALL OPF(FN.AC,F.AC)
    CALL OPF(FN.CUS,F.CUS)
    CALL OPF(FN.POS,F.POS)
    CALL OPF(FN.DEPT.ACCT.OFFICER,F.DEPT.ACCT.OFFICER)
    RETURN
***************************************
PROCESS:


    Y.TIME = OCONV(TIME(), "MTS")
    CHANGE ':' TO '' IN Y.TIME
    DIRFILE="./EXTRACTION.BI/BZ.SIGNATURE.AGENCE":TODAY:Y.TIME:".txt"
    OPENSEQ DIRFILE TO FICHIER.SEQ ELSE
        CREATE FICHIER.SEQ  ELSE
*ZIT-UPG-R13-R19/S		
*            CRT"UNABLE TO CREATE FILE POINTER TO FILE ":DIRFILE
*            STOP
	EB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyerLE TO CREATE FILE POINTER TO FILE ":DIRFILEB.DataAccess.FWriteY.MESSAGE="UNABLE TO WRITE ON THE FILE ":DIRFILE
				Y.MESSAGE.INFO=''
				Y.MESSAGE.INFO<1> =''
				Y.MESSAFT.AdhocChargeRequests.AcChargeReqEB.SystemTables.setAf()*-------------------------------------------------------------------------------
* @author Fahmi.abdeltif@banquezitouna.com 23/09/2019
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.SIGNATURE.AGENCE
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

*ZIT-UPG-R13-R19 : CRT CHANGED TO CALL OCOMO; STOP CHANGED TO FATAL.ERROR; VARIABLE INITIALSED                       
*----------------------------------------------------------------------------

*ZIT-UPG-R13-R19/S
    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.IM.DOCUMENT.IMAGE
    $INSERT I_F.ACCOUNT
    $INSERT I_F.CUSTOMER
    $INSERT I_F.POSTING.RESTRICT
    $INSERT I_F.DEPT.ACCT.OFFICER
*ZIT-UPG-R13-R19/E

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
	R.REF=""
	REF.ERR=""
	
    FN.IMG="F.IM.DOCUMENT.IMAGE"
    F.IMG=""
	
    FN.AC="F.ACCOUNT"
    F.AC=""
	ERR.AC=""
	AC.ERR=""
	
    FN.CUS="F.CUSTOMER"
    F.CUS=""

    FN.POS="F.POSTING.RESTRICT"
    F.POS=""
	R.POS=""
	POS.ERR=""

    FN.DEPT.ACCT.OFFICER = 'F.DEPT.ACCT.OFFICER'
    F.DEPT.ACCT.OFFICER = ''
	R.DEPT.ACCT.OFFICER = ''
	YERR = ''



    RETURN
***************************************
OPENFILES:
    CALL OPF(FN.CUS.AC,F.CUS.AC)
    CALL OPF(FN.REF,F.REF)
    CALL OPF(FN.IMG,F.IMG)
    CALL OPF(FN.AC,F.AC)
    CALL OPF(FN.CUS,F.CUS)
    CALL OPF(FN.POS,F.POS)
    CALL OPF(FN.DEPT.ACCT.OFFICER,F.DEPT.ACCT.OFFICER)
    RETURN
***************************************
PROCESS:


    Y.TIME = OCONV(TIME(), "MTS")
    CHANGE ':' TO '' IN Y.TIME
    DIRFILE="./EXTRACTION.BI/BZ.SIGNATURE.AGENCE":TODAY:Y.TIME:".txt"
    OPENSEQ DIRFILE TO FICHIER.SEQ ELSE
        CREATE FICHIER.SEQ  ELSE
*ZIT-UPG-R13-R19/S		
*            CRT"UNABLE TO CREATE FILE POINTER TO FILE ":DIRFILE
*            STOP
			CALL OCOMO("UNABLE TO CREATE FILE POINTER TO FILE ":DIRFILE)
			Y.MESSAGE="UNABLE TO WRITE ON THE FILE ":DIRFILE
				Y.MESSAGE.INFO=''
				Y.MESSAGE.INFO<1> =''
				Y.MESSAFT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRef
				Y.MEB.SystemTables.setE('')
				Y.MESSAGE.INFO<4> = Y.MESSAGE
				Y.MESSAGE.INFO<5> = 'NO'
				Y.MESSAGE.INFO<6> = ''
				Y.MESSAGE.INFO<7> = ''
				CALL FATAL.ERROR(Y.MESSAGE.INFO)
*ZIT-UPG-R13-R19/E
        END
    END
    NOM_ETAT="BZ.SIGNATURE.AGENCE"
    IF NOM_ETAT THEN
        WRITESEQ NOM_ETAT APPEND TO FICHIER.SEQ ELSE
*ZIT-UPG-R13-R19/S
*            CRT "UNABLE TO PERFORM NOM ETAT"
			CALL OCOMO("UNABLE TO PERFORM NOM ETAT")
*ZIT-UPG-R13-R19/E
        END
    END
    LIGNE.ENTETE=""
    LIGNE.ENTETE =  " AGENCE | " : " NOM.AGENCE | " : " NUM COMPTE | " : " CUSTOMER.ID | " : " CUSTOMER.NAME | " : " CATEGORY |" : " DATE OUVERTURE | " : " RESTRICTION COMPTE | " : " RESTRICTION CLIENT | "
    IF LIGNE.ENTETE THEN
        WRITESEQ LIGNE.ENTETE APPEND TO FICHIER.SEQ ELSE
*ZIT-UPG-R13-R19/E
*            CRT "UNABLE TO PERFORM ENTETE"
			CALL OCOMO("UNABLE TO PERFORM ENTETE")
*ZIT-UPG-R13-R19/E
        END
    END
    SEP="|"


	SEL.LIST  = ''
	NO.OF.REC = ''
	ERR1      = ''
	AC        = ''
	POS       = ''
	
    SEL.COMMAND="SELECT ": FN.AC : " WITH CATEGORY GE 1000 AND CATEGORY LT 2000 OR CATEGORY EQ 6010"
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
    DATE.OUVERTURE = R.AC<AC.OPENING.DATE>
    DAO=R.AC<AC.ACCOUNT.OFFICER>
    CATEGORY=R.AC<AC.CATEGORY>
    CUSTOMER.ID = R.AC<AC.CUSTOMER>
    CUSTOMER.NAME = R.AC<AC.ACCOUNT.TITLE.1>
    CALL F.READ(FN.DEPT.ACCT.OFFICER,DAO,R.DEPT.ACCT.OFFICER,F.DEPT.ACCT.OFFICER,YERR)
    AGENCE = R.DEPT.ACCT.OFFICER<EB.DAO.NAME>
    AC.POS.RESTRICT=R.AC<AC.POSTING.RESTRICT>
    CALL F.READ(FN.POS,AC.POS.RESTRICT,R.POS,F.POS,POS.ERR)
    AC.POS.DESCR=R.POS<AC.POS.DESCRIPTION>
    NUM.CUS=R.AC<AC.CUSTOMER>
    CALL F.READ(FN.CUS,NUM.CUS,R.CUS,F.CUS,CUS.ERR)

    CUS.POS.RECTRICT=R.CUS<EB.CUS.POSTING.RESTRICT>
    CALL F.READ(FN.POS,CUS.POS.RECTRICT,R.POS,F.POS,POS.ERR)
    CUS.POS.DESCR=R.POS<AC.POS.DESCRIPTION>

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
            LINESEQ=LINESEQ:DAO:SEP
            LINESEQ=LINESEQ:AGENCE:SEP
            LINESEQ=LINESEQ:COMPTE:SEP
            LINESEQ=LINESEQ:CUSTOMER.ID:SEP
            LINESEQ=LINESEQ:CUSTOMER.NAME:SEP
            LINESEQ=LINESEQ:CATEGORY:SEP
            LINESEQ=LINESEQ:DATE.OUVERTURE:SEP
            LINESEQ=LINESEQ:AC.POS.DESCR:SEP
            LINESEQ=LINESEQ:CUS.POS.DESCR:SEP

            WRITESEQ LINESEQ APPEND TO FICHIER.SEQ ELSE
*ZIT-UPG-R13-R19/S
*                CRT "UNABLE TO PERFORM ENTETE"
				CALL OCOMO("UNABLE TO PERFORM ENTETE")
*ZIT-UPG-R13-R19/S
            END
        END
        LINESEQ=''

    END ELSE
        LINESEQ=LINESEQ:DAO:SEP
        LINESEQ=LINESEQ:AGENCE:SEP
        LINESEQ=LINESEQ:COMPTE:SEP
        LINESEQ=LINESEQ:CUSTOMER.ID:SEP
        LINESEQ=LINESEQ:CUSTOMER.NAME:SEP
        LINESEQ=LINESEQ:CATEGORY:SEP
        LINESEQ=LINESEQ:DATE.OUVERTURE:SEP
        LINESEQ=LINESEQ:AC.POS.DESCR:SEP
        LINESEQ=LINESEQ:CUS.POS.DESCR:SEP

        WRITESEQ LINESEQ APPEND TO FICHIER.SEQ ELSE
*ZIT-UPG-R13-R19/S
*            CRT "UNABLE TO PERFORM ENTETE"
			CALL OCOMO("UNABLE TO PERFORM ENTETE")
*ZIT-UPG-R13-R19/E
        END
    END
    LINESEQ=''

    RETURN

END
