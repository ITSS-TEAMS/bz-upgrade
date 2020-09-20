*-----------------------------------------------------------------------------
*   @author Fahmi.abdeltif@banquezitouna.com 24/09/2019
*-----------------------------------------------------------------------------
*Modification Histroy :
* ZIT-UPG-R13-R19  : Converted STOP to FATAL.ERROR.
*                  : Converted CRT TO CALL OCOMO.
*                  : Converted GET.LOC.REF to MULTI.GET.LOC.
*----------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.CHECK.SIGNATAIRE
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
    $INSERT I_F.ACCOUNT
    $INSERT I_F.CUSTOMER
    $INSERT I_F.EB.SIGNATORY.GROUP
    $INSERT I_F.SECTOR
    $INSERT I_F.DEPT.ACCT.OFFICER
    $INSERT I_F.CATEGORY
    $INSERT I_F.POSTING.RESTRICT

MAIN:

    GOSUB INIT
* $INSERT I_EQUATE - Not Used anymore;
    GOSUB PROCESS
    RETURN
***************************************
INIT:

    FN.CUS="F.CUSTOMER"
    F.CUS=""
    FN.AC="F.ACCOUNT"
    F.AC=""
    FN.SG="F.EB.SIGNATORY.GROUP"
    F.SG=""
    FN.SEC="F.SECTOR"
    F.SEC=""
    FN.DEPT="F.DEPT.ACCT.OFFICER"
    F.DEPT=""
    FN.CEB.SystemTables.getVFunction()ATEGORY"
    F.CATEG=""
    FN.POS="F.PFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus
    F.POS=""
    CALL OPF(FN.POS,F.POS)
   FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus*******************************
OPENFILES:
    CALL OPF(FN.CUS,F.CUS)
    CALL OPF(FN.AC,F.AC)
    CALL OPF(FN.SG,F.SG)
    CALL OPF(FN.SEC,F.SEC)
    CALL OPF(FN.DEPT,F.DEPT)
    CALL OPF(FN.CATEG,F.CATEG)

    RETURN
***************************************
PROCESS:

    Y.TIME = OCONV(TIME(), "MTS")
    CHANGE ':' TO '' IN Y.TIME
    DIRFILE="./EXTRACTION.BI/LISTE.BZ.CHECK.SIGNATAIRE":TODAY:Y.TIME:".txt"
    OPENSEQ DIRFILE TO FICHIER.SEQ ELSE
        CREATE FICHIER.SEQ  ELSE
            * CRT "UNABLE TO CREATE FILE POINTER TO FILE ":DIRFILE
            * STOP
			CALL OCOMO("UNABLE TO CREATE FILE POINTER TO FILE ":DIRFILE)      ;* Converted CRT to OCOMO
				Y.MESSAGE="UNABLE TO CREATE ON THE FILE ":FICHIER.SEQ             ;* Converted STOP to fatal.error.
				EB.DataAccess.OpfESSAGE.INFO=''
				Y.MEEB.DataAccess.OpfGE.INFO<1> =''
				Y.MESSAGE.INFO<2> = ''
				Y.MESSAGE.INFO<3> =''
				Y.MESSAGE.INFO<4> = Y.MESSAGE
				Y.MESSAGE.INFO<5> = 'NO'
				Y.MESSAGE.INFO<6> = FT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefGE.INFOEB.SystemTables.getRNew()''
				CALL FATAL.ERROR(Y.MESSAGE.INFO)
        EEB.DataAccess.FRead  END
    LIGNE.ENTETE=""
    LIGNE.ENTETE = " Compte ; " : :  " Code Agence ; " : " Agence ; " : " Intitu du compte ; " : : " Code Categorie ;" : " Categorie du compte ; " : " Date ouverture ; " : " ID Client ; " : " Nom Client ; " : " Agent nomique ; " : " Restriction Client ; " : " Restriction Compte ; "
    IF LIGNE.ENTETE THEN
  EB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyerNE.ENTETE APPEND TO FICHIER.SEQ ELSE
            EB.SystemTables.setE()*-----------------------------------------------------------------------------
*   @author Fahmi.abdeltif@banquezitouna.com 24/09/2019
*-----------------------------------------------------------------------------
*Modification Histroy :
* ZIT-UPG-R13-R19  : Converted STOP to FATAL.ERROR.
*                  : Converted CRT TO CALL OCOMO.
*                  : Converted GET.LOC.REF to MULTI.GET.LOC.
*----------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.CHECK.SIGNATAIRE
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
    $INSERT I_F.ACCOUNT
    $INSERT I_F.CUSTOMER
    $INSERT I_F.EB.SIGNATORY.GROUP
    $INSERT I_F.SECTOR
    $INSERT I_F.DEPT.ACCT.OFFICER
    $INSERT I_F.CATEGORY
    $INSERT I_F.POSTING.RESTRICT

MAIN:

    GOSUB INIT
    GOSUB OPENFILES
    GOSUB PROCESS
    RETURN
***************************************
INIT:

    FN.CUS="F.CUSTOMER"
    F.CUS=""
    FN.AC="F.ACCOUNT"
    F.AC=""
    FN.SG="F.EB.SIGNATORY.GROUP"
    F.SG=""
    FN.SEC="F.SECTOR"
    F.SEC=""
    FN.DEPT="F.DEPT.ACCT.OFFICER"
    F.DEPT=""
    FN.CATEG=" F.CATEGORY"
    F.CATEG=""
    FN.POS="F.POSTING.RESTRICT"
    F.POS=""
    CALL OPF(FN.POS,F.POS)
    RETURN
***************************************
OPENFILES:
    CALL OPF(FN.CUS,F.CUS)
    CALL OPF(FN.AC,F.AC)
    CALL OPF(FN.SG,F.SG)
    CALL OPF(FN.SEC,F.SEC)
    CALL OPF(FN.DEPT,F.DEPT)
    CALL OPF(FN.CATEG,F.CATEG)

    RETURN
***************************************
PROCESS:

    Y.TIME = OCONV(TIME(), "MTS")
    CHANGE ':' TO '' IN Y.TIME
    DIRFILE="./EXTRACTION.BI/LISTE.BZ.CHECK.SIGNATAIRE":TODAY:Y.TIME:".txt"
    OPENSEQ DIRFILE TO FICHIER.SEQ ELSE
        CREATE FICHIER.SEQ  ELSE
            * CRT "UNABLE TO CREATE FILE POINTER TO FILE ":DIRFILE
            * STOP
			CALL OCOMO("UNABLE TO CREATE FILE POINTER TO FILE ":DIRFILE)      ;* Converted CRT to OCOMO
				Y.MESSAGE="UNABLE TO CREATE ON THE FILE ":FICHIER.SEQ             ;* Converted STOP to fatal.error.
				Y.MESSAGE.INFO=''
				Y.MESSAGE.INFO<1> =''
				Y.MESSAGE.INFO<2> = ''
				Y.MESSAGE.INFO<3> =''
				Y.MESSAGE.INFO<4> = Y.MESSAGE
				Y.MESSAGE.INFO<5> = 'NO'
				Y.MESSAGE.INFO<6> = ''
				Y.MESSAGE.INFO<7> = ''
				CALL FATAL.ERROR(Y.MESSAGE.INFO)
        END
    END
    LIGNE.ENTETE=""
    LIGNE.ENTETE = " Compte ; " : :  " Code Agence ; " : " Agence ; " : " Intitu du compte ; " : : " Code Categorie ;" : " Categorie du compte ; " : " Date ouverture ; " : " ID Client ; " : " Nom Client ; " : " Agent nomique ; " : " Restriction Client ; " : " Restriction Compte ; "
    IF LIGNE.ENTETE THEN
        WRITESEQ LIGNE.ENTETE APPEND TO FICHIER.SEQ ELSE
            * CRT "UNABLE TO PERFORM ENTETE"
			CALL OCOMO("UNABLE TO PERFORM ENTETE")
        END
    ENDEB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyer EB.DataAccess.FWrite.LRF.APP = "SECTOR"
	EB.SystemTables.setAf()*-----------------------------------------------------------------------------
*   @author Fahmi.abdeltif@banquezitouna.com 24/09/2019
*-----------------------------------------------------------------------------
*Modification Histroy :
* ZIT-UPG-R13-R19  : Converted STOP to FATAL.ERROR.
*                  : Converted CRT TO CALL OCOMO.
*                  : Converted GET.LOC.REF to MULTI.GET.LOC.
*----------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.CHECK.SIGNATAIRE
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
    $INSERT I_F.ACCOUNT
    $INSERT I_F.CUSTOMER
    $INSERT I_F.EB.SIGNATORY.GROUP
    $INSERT I_F.SECTOR
    $INSERT I_F.DEPT.ACCT.OFFICER
    $INSERT I_F.CATEGORY
    $INSERT I_F.POSTING.RESTRICT

MAIN:

    GOSUB INIT
    GOSUB OPENFILES
    GOSUB PROCESS
    RETURN
***************************************
INIT:

    FN.CUS="F.CUSTOMER"
    F.CUS=""
    FN.AC="F.ACCOUNT"
    F.AC=""
    FN.SG="F.EB.SIGNATORY.GROUP"
    F.SG=""
    FN.SEC="F.SECTOR"
    F.SEC=""
    FN.DEPT="F.DEPT.ACCT.OFFICER"
    F.DEPT=""
    FN.CATEG=" F.CATEGORY"
    F.CATEG=""
    FN.POS="F.POSTING.RESTRICT"
    F.POS=""
    CALL OPF(FN.POS,F.POS)
    RETURN
***************************************
OPENFILES:
    CALL OPF(FN.CUS,F.CUS)
    CALL OPF(FN.AC,F.AC)
    CALL OPF(FN.SG,F.SG)
    CALL OPF(FN.SEC,F.SEC)
    CALL OPF(FN.DEPT,F.DEPT)
    CALL OPF(FN.CATEG,F.CATEG)

    RETURN
***************************************
PROCESS:

    Y.TIME = OCONV(TIME(), "MTS")
    CHANGE ':' TO '' IN Y.TIME
    DIRFILE="./EXTRACTION.BI/LISTE.BZ.CHECK.SIGNATAIRE":TODAY:Y.TIME:".txt"
    OPENSEQ DIRFILE TO FICHIER.SEQ ELSE
        CREATE FICHIER.SEQ  ELSE
            * CRT "UNABLE TO CREATE FILE POINTER TO FILE ":DIRFILE
            * STOP
			CALL OCOMO("UNABLE TO CREATE FILE POINTER TO FILE ":DIRFILE)      ;* Converted CRT to OCOMO
				Y.MESSAGE="UNABLE TO CREATE ON THE FILE ":FICHIER.SEQ             ;* Converted STOP to fatal.error.
				Y.MESSAGE.INFO=''
				Y.MESSAGE.INFO<1> =''
				Y.MESSAGE.INFO<2> = ''
				Y.MESSAGE.INFO<3> =''
				Y.MESSAGE.INFO<4> = Y.MESSAGE
				Y.MESSAGE.INFO<5> = 'NO'
				Y.MESSAGE.INFO<6> = ''
				Y.MESSAGE.INFO<7> = ''
				CALL FATAL.ERROR(Y.MESSAGE.INFO)
        END
    END
    LIGNE.ENTETE=""
    LIGNE.ENTETE = " Compte ; " : :  " Code Agence ; " : " Agence ; " : " Intitu du compte ; " : : " Code Categorie ;" : " Categorie du compte ; " : " Date ouverture ; " : " ID Client ; " : " Nom Client ; " : " Agent nomique ; " : " Restriction Client ; " : " Restriction Compte ; "
    IF LIGNE.ENTETE THEN
        WRITESEQ LIGNE.ENTETE APPEND TO FICHIER.SEQ ELSE
            * CRT "UNABLE TO PERFORM ENTETE"
			CALL OCOMO("UNABLE TO PERFORM ENTETE")
        END
    END
    SEP=";"
 
    
	Y.LRF.APP = "SECTOR"
	Y.LFT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefAT.CLT"
	EB.SystemTables.setE('')
	CALL MULTI.GET.LOC.REF(Y.LRF.APP,Y.LRF.FIL,Y.MPOS)
	LIB.NAT.CLT.POS = Y.MPOS<1,1>


    SEL.COMMAND="SELECT ":FN.AC:" WITH CATEGORY GE 1000 AND CATEGORY LE 1999 "

    CALL EB.READLIST(SEL.COMMAND,SEL.LIST,'',NO.OF.REC,ERR1)

    IF SEL.LIST EQ '' THEN
        RETURN
    END ELSE
        LOOP
            REMOVE Y.ACCOUNT FROM SEL.LIST SETTING POS
        WHILE Y.ACCOUNT :POS
            CALL F.READ(FN.AC,Y.ACCOUNT,R.AC,F.AC,AC.ERR)

            Y.CATEGORY=R.AC<AC.CATEGORY>
            CALL F.READ(FN.CATEG,Y.CATEGORY,R.CATEG,F.CATEG,CATEG.ERR)
            CATEG.DESC=R.CATEG<EB.CAT.DESCRIPTION>
            ACCOUNT.OFFICER=R.AC<AC.ACCOUNT.OFFICER>
            ACCOUNT.TITLE=R.AC<AC.ACCOUNT.TITLE.1>
            OPENNING.DATE=R.AC<AC.OPENING.DATE>
            CALL F.READ(FN.DEPT,ACCOUNT.OFFICER,R.DAO,F.DEPT,YERR)
            AGENCE=R.DAO<EB.DAO.NAME>
            Y.CUS=R.AC<AC.CUSTOMER>
            CALL F.READ(FN.CUS,Y.CUS,R.CUS,F.CUS,CUS.ERR)
            CUS.NAME=R.CUS<EB.CUS.NAME.1>
            IF CUS.ERR EQ "" THEN
                Y.SECTOR=R.CUS<EB.CUS.SECTOR>
                CALL F.READ(FN.SEC,Y.SECTOR,R.SECTOR,F.SEC,SEC.ERR)
                SECTOR.LIB=R.SECTOR<EB.SEC.DESCRIPTION>

                CUS.POS.RECTRICT=R.CUS<EB.CUS.POSTING.RESTRICT>
                CALL F.READ(FN.POS,CUS.POS.RECTRICT,R.POS,F.POS,POS.ERR)
                CUS.POS.DESCR=R.POS<AC.POS.DESCRIPTION>
                POSTING.RESTRICT=R.AC<AC.POSTING.RESTRICT>
                CALL F.READ(FN.POS,POSTING.RESTRICT,R.POS,F.POS,POS.ERR)
                AC.POS.DESCR=R.POS<AC.POS.DESCRIPTION>


                * CALL GET.LOC.REF("SECTOR","LIB.NAT.CLT",LIB.NAT.CLT.POS)
                Y.NAT.CLT = R.SECTOR<EB.SEC.LOCAL.REF,LIB.NAT.CLT.POS>

            END

            IF Y.NAT.CLT EQ "PM" THEN
                GOSUB VERIFY.SIGNATAIRES
            END


        REPEAT
    END
    RETURN
*************************************
VERIFY.SIGNATAIRES:

    SEL.COMMAND.CUS="SELECT ":FN.SG:" WITH @ID LIKE '":Y.CUS:"...'"
    CALL EB.READLIST(SEL.COMMAND.CUS,SEL.LIST.CUS,'',NO.OF.SIG,ERR1)

    IF SEL.LIST.CUS EQ '' THEN
        LINESEQ=''
        LINESEQ=LINESEQ:Y.ACCOUNT:SEP
        LINESEQ=LINESEQ:ACCOUNT.OFFICER:SEP
        LINESEQ=LINESEQ:AGENCE:SEP
        LINESEQ=LINESEQ:ACCOUNT.TITLE:SEP
        LINESEQ=LINESEQ:Y.CATEGORY:SEP
        LINESEQ=LINESEQ:CATEG.DESC:SEP
        LINESEQ=LINESEQ:OPENNING.DATE:SEP
        LINESEQ=LINESEQ:Y.CUS:SEP
        LINESEQ=LINESEQ:CUS.NAME:SEP
        LINESEQ=LINESEQ:SECTOR.LIB:SEP
        LINESEQ=LINESEQ:CUS.POS.DESCR:SEP
        LINESEQ=LINESEQ:AC.POS.DESCR:SEP
        IF LINESEQ THEN
            WRITESEQ LINESEQ APPEND TO FICHIER.SEQ ELSE
               * CRT "UNABLE TO PERFORM WRITESEQ "
			   CALL OCOMO("UNABLE TO PERFORM WRITESEQ ")
            END
        END


    END

    RETURN
END
