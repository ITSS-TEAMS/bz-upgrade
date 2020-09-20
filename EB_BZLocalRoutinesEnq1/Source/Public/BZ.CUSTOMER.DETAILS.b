*-------------------------------------------------------------------------------
* @author Fahmi.abdeltif@banquezitouna.com 23/09/2019
*-----------------------------------------------------------------------------
**Modification History:
**ZIT-UPG-R13-R19:Changed CRT to OCOMO
**               :Changed STOP to FATAL.ERROR
**               :Changed GET.LOC.REF to MULTI.GET.LOC.REF,Used reference from I_F file
*---------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.CUSTOMER.DETAILS
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
    $INSERT I_F.ACCOUNT
    $INSERT I_F.POSTING.RESTRICT
    $INSERT I_F.INDUSTRY
    $INSERT I_F.DEPT.ACCT.OFFICER
    $INSERT I_F.SECTOR


MAIN:

    GOSUB INIT
* $INSERT I_EQUATE - Not Used anymore;
    GOSUB PROCESS
    RETURN
***************************************
INIT:



    FN.CUS="F.CUSTOMER"
    F.CUS=""

    FN.POS="F.POSTING.RESTRICT"
    F.POS=""

    FN.DEPT.ACCT.OFFICER = 'F.DEPT.ACCT.OFFICER'
    F.DEPT.ACCT.OFFICER = ''

    FN.SECTOR = 'F.SECTOR'
    F.SECTOR = ''

    FN.IFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusSTRY'
    F.INDUSTRY = ''

    FN.AC = 'F.AFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus = ''

    RETURN
***************************************
OPENFILES:

    CALL OPF(FN.CUS,F.CUS)
    CALL OPF(FN.POS,F.POS)
    CALL OPF(FN.DEPT.ACCT.OFFICER,F.DEPT.ACCT.OFFICER)
    CALL OPF(FN.INDUSTRY,F.INDUSTRY)
    CALL OPF(FN.SECTOR,F.SECTOR)
    CALL OPF(FN.AC,F.AC)
    RETURN
***************************************
PROCESS:
    Y.TIME = OCONV(TIME(), "MTS")
    CHANGE ':' TO '' IN Y.TIME
    DIRFILE="./EXTRACTION.BI/LISTE.BZ.CUSTOMER.DETAILS":TODAY:Y.TIME:".txt"
    OPENSEQ DIRFILE TO FICHIER.SEQ ELSE
        CREATE FICHIER.SEQ  ELSE
**          CRT"UNABLE TO CREATE FILE POINTER TO FILE ":DIRFILE
**       EB.DataAccess.OpfSTOP
         EB.DataAccess.OpfY.MESSAGE="UNABLE TO CREATE FILE POINTER TO FILE ":DIRFILE
				Y.MESSAGE.INFO=''
				Y.MESSAGE.INFO<1> =''
				Y.MESSAGE.INFO<2> = ''
				Y.MESSAGE.INFO<3> =FT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefGE.INFO<4> = YEB.SystemTables.getRNew()AGE
				Y.MESSAEB.DataAccess.FReadO<5> = 'NO'
				Y.MESSAGE.INFO<6> = ''
				Y.MESSAGE.INFO<7> = ''

				CALL FATAL.ERROR(Y.MESSAGE.INFO)
		    
      EB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyer EB.SystemTables.setE("")
    LIGNE.ENTETE =  EB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyernemo EB.SystemTables.getIdNew()" Nom complet ; " : " Type Doc Identite ; " : " Num Doc Identite ; " : " Titre ;" : " Date de naissaance ; " : " Code Agence ; " : " Agence ; " : " Apporteur affaire  ; " : " Nationalite  ; " : " Residence  ; " : " Code Ag Eco  ; " : " Lib Ag Eco  ; " : " Classe activite  ; " : " Libelle Activite  ; " : " Adresse  ; " : " Gouvernorat  ; " : " Restriction "
    IF LIGNE.ENTETE THEN
        WRITESEQ EB.DataAccess.FWriteNTETE APPEND TO FICHIER.SEQ ELSE
**          CRT "UNABLE TO PERFORM ENTETE"
            CALL OCOMO("UNABLE TO PERFORM ENTETE":FICHIER.SEQ)
        END
    ENDEB.SystemTables.setAf()*-------------------------------------------------------------------------------
* @author Fahmi.abdeltif@banquezitouna.com 23/09/2019
*-----------------------------------------------------------------------------
**Modification History:
**ZIT-UPG-R13-R19:Changed CRT to OCOMO
**               :Changed STOP to FATAL.ERROR
**               :Changed GET.LOC.REF to MULTI.GET.LOC.REF,Used reference from I_F file
*---------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.CUSTOMER.DETAILS
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
    $INSERT I_F.ACCOUNT
    $INSERT I_F.POSTING.RESTRICT
    $INSERT I_F.INDUSTRY
    $INSERT I_F.DEPT.ACCT.OFFICER
    $INSERT I_F.SECTOR


MAIN:

    GOSUB INIT
    GOSUB OPENFILES
    GOSUB PROCESS
    RETURN
***************************************
INIT:



    FN.CUS="F.CUSTOMER"
    F.CUS=""

    FN.POS="F.POSTING.RESTRICT"
    F.POS=""

    FN.DEPT.ACCT.OFFICER = 'F.DEPT.ACCT.OFFICER'
    F.DEPT.ACCT.OFFICER = ''

    FN.SECTOR = 'F.SECTOR'
    F.SECTOR = ''

    FN.INDUSTRY = 'F.INDUSTRY'
    F.INDUSTRY = ''

    FN.AC = 'F.ACCOUNT'
    F.AC = ''

    RETURN
***************************************
OPENFILES:

    CALL OPF(FN.CUS,F.CUS)
    CALL OPF(FN.POS,F.POS)
    CALL OPF(FN.DEPT.ACCT.OFFICER,F.DEPT.ACCT.OFFICER)
    CALL OPF(FN.INDUSTRY,F.INDUSTRY)
    CALL OPF(FN.SECTOR,F.SECTOR)
    CALL OPF(FN.AC,F.AC)
    RETURN
***************************************
PROCESS:
    Y.TIME = OCONV(TIME(), "MTS")
    CHANGE ':' TO '' IN Y.TIME
    DIRFILE="./EXTRACTION.BI/LISTE.BZ.CUSTOMER.DETAILS":TODAY:Y.TIME:".txt"
    OPENSEQ DIRFILE TO FICHIER.SEQ ELSE
        CREATE FICHIER.SEQ  ELSE
**          CRT"UNABLE TO CREATE FILE POINTER TO FILE ":DIRFILE
**          STOP
            Y.MESSAGE="UNABLE TO CREATE FILE POINTER TO FILE ":DIRFILE
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
    LIGNE.ENTETE =  " Client ; " : " Mnemo ; " : " Nom complet ; " : " Type Doc Identite ; " : " Num Doc Identite ; " : " Titre ;" : " Date de naissaance ; " : " Code Agence ; " : " Agence ; " : " Apporteur affaire  ; " : " Nationalite  ; " : " Residence  ; " : " Code Ag Eco  ; " : " Lib Ag Eco  ; " : " Classe activite  ; " : " Libelle Activite  ; " : " Adresse  ; " : " Gouvernorat  ; " : " Restriction "
    IF LIGNE.ENTETE THEN
        WRITESEQ LIGNE.ENTETE APPEND TO FICHIER.SEQ ELSE
**          CRT "UNABLE TO PERFORM ENTETE"
            CALL OCOMO("UNABLE TO PERFORM ENTETE":FICHIER.SEQ)
        END
    END
  FT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefTables.setE()*-------------------------------------------------------------------------------
* @author Fahmi.abdeltif@banquezitouna.com 23/09/2019
*-----------------------------------------------------------------------------
**Modification History:
**ZIT-UPG-R13-R19:Changed CRT to OCOMO
**               :Changed STOP to FATAL.ERROR
**               :Changed GET.LOC.REF to MULTI.GET.LOC.REF,Used reference from I_F file
*---------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.CUSTOMER.DETAILS
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
    $INSERT I_F.ACCOUNT
    $INSERT I_F.POSTING.RESTRICT
    $INSERT I_F.INDUSTRY
    $INSERT I_F.DEPT.ACCT.OFFICER
    $INSERT I_F.SECTOR


MAIN:

    GOSUB INIT
    GOSUB OPENFILES
    GOSUB PROCESS
    RETURN
***************************************
INIT:



    FN.CUS="F.CUSTOMER"
    F.CUS=""

    FN.POS="F.POSTING.RESTRICT"
    F.POS=""

    FN.DEPT.ACCT.OFFICER = 'F.DEPT.ACCT.OFFICER'
    F.DEPT.ACCT.OFFICER = ''

    FN.SECTOR = 'F.SECTOR'
    F.SECTOR = ''

    FN.INDUSTRY = 'F.INDUSTRY'
    F.INDUSTRY = ''

    FN.AC = 'F.ACCOUNT'
    F.AC = ''

    RETURN
***************************************
OPENFILES:

    CALL OPF(FN.CUS,F.CUS)
    CALL OPF(FN.POS,F.POS)
    CALL OPF(FN.DEPT.ACCT.OFFICER,F.DEPT.ACCT.OFFICER)
    CALL OPF(FN.INDUSTRY,F.INDUSTRY)
    CALL OPF(FN.SECTOR,F.SECTOR)
    CALL OPF(FN.AC,F.AC)
    RETURN
***************************************
PROCESS:
    Y.TIME = OCONV(TIME(), "MTS")
    CHANGE ':' TO '' IN Y.TIME
    DIRFILE="./EXTRACTION.BI/LISTE.BZ.CUSTOMER.DETAILS":TODAY:Y.TIME:".txt"
    OPENSEQ DIRFILE TO FICHIER.SEQ ELSE
        CREATE FICHIER.SEQ  ELSE
**          CRT"UNABLE TO CREATE FILE POINTER TO FILE ":DIRFILE
**          STOP
            Y.MESSAGE="UNABLE TO CREATE FILE POINTER TO FILE ":DIRFILE
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
    LIGNE.ENTETE =  " Client ; " : " Mnemo ; " : " Nom complet ; " : " Type Doc Identite ; " : " Num Doc Identite ; " : " Titre ;" : " Date de naissaance ; " : " Code Agence ; " : " Agence ; " : " Apporteur affaire  ; " : " Nationalite  ; " : " Residence  ; " : " Code Ag Eco  ; " : " Lib Ag Eco  ; " : " Classe activite  ; " : " Libelle Activite  ; " : " Adresse  ; " : " Gouvernorat  ; " : " Restriction "
    IF LIGNE.ENTETE THEN
        WRITESEQ LIGNE.ENTETE APPEND TO FICHIER.SEQ ELSE
**          CRT "UNABLE TO PERFORM ENTETE"
            CALL OCOMO("UNABLE TO PERFORM ENTETE":FICHIER.SEQ)
        END
    END
    SEP=";"

    SEL.COMMAND="SELECT ": FN.CUS :
    CUS.LIST = ''
    LIST.NAME = ''
    SELECTED = ''
    SYSTEM.RETURN.CODE = ''
    CALL EB.READLIST(SEL.COMMAND,CUS.LIST,LIST.NAME,SELECTED,SYSTEM.RETURN.CODE)

**ZIT-UPG-R13-R19  S	
    
	Y.APPLICATION.NAME ="CUSTOMER"
    Y.FIELD.NAME ="BZ.APPORT.AFFAI":@VM:"BZ.GOUVERNORAT" 
    Y.POS = ''
	CALL MULTI.GET.LOC.REF(Y.APPLICATION.NAME,Y.FIELD.NAME,Y.POS)
	APP.POS=Y.POS<1,1>
	GOV.POS=Y.POS<1,2>

**ZIT-UPG-R13-R19  E	

    FOR I = 1 TO SELECTED
        CLIENT = CUS.LIST<I>
        CALL F.READ(FN.CUS,CLIENT,R.CUS,F.CUS,CUS.ERR)
        MNEMONIC=R.CUS<EB.CUS.MNEMONIC>
        SHORT.NAME=R.CUS<EB.CUS.SHORT.NAME>
        LEGAL.DOC.NAME=R.CUS<EB.CUS.LEGAL.DOC.NAME>
        LEGAL.ID=R.CUS<EB.CUS.LEGAL.ID>
        TITLE=R.CUS<EB.CUS.TITLE>
        DATE.OF.BIRTH=R.CUS<EB.CUS.DATE.OF.BIRTH>
        ACCOUNT.OFFICER=R.CUS<EB.CUS.ACCOUNT.OFFICER>
        CALL F.READ(FN.DEPT.ACCT.OFFICER,ACCOUNT.OFFICER,R.DAO,F.DEPT.ACCT.OFFICER,YERR)
        AGENCE=R.DAO<EB.DAO.NAME>
**ZIT-UPG-R13-R19 S 
	
**      CALL GET.LOC.REF("CUSTOMER","BZ.APPORT.AFFAI",APP.POS)

**ZIT-UPG-R13-R19  E	
        Y.APPORT.AFFAI = R.CUS<EB.CUS.LOCAL.REF,APP.POS>  ;*Used reference from I_F file
        NATIONALITY=R.CUS<EB.CUS.NATIONALITY>
        RESIDENCE=R.CUS<EB.CUS.RESIDENCE>
        SECTOR=R.CUS<EB.CUS.SECTOR>
        CALL F.READ(FN.SECTOR,SECTOR,R.SECTOR,F.SECTOR,SECTOR.ERR)
        SECTOR.LIB=R.SECTOR<EB.SEC.DESCRIPTION>
        INDUSTRY=R.CUS<EB.CUS.INDUSTRY>
        CALL F.READ(FN.INDUSTRY,INDUSTRY,R.INDUSTRY,F.INDUSTRY,INDUSTRY.ERR)
        INDUSTRY.LIB=R.INDUSTRY<EB.IND.DESCRIPTION>
        ADDRESS=R.CUS<EB.CUS.ADDRESS>
		
**      CALL GET.LOC.REF("CUSTOMER","BZ.GOUVERNORAT",GOV.POS)
        Y.BZ.GOUVERNORAT = R.CUS<EB.CUS.LOCAL.REF,GOV.POS>   ;*Used reference from I_F file
        CUS.POS.RECTRICT=R.CUS<EB.CUS.POSTING.RESTRICT>
        CALL F.READ(FN.POS,CUS.POS.RECTRICT,R.POS,F.POS,POS.ERR)
        CUS.POS.DESCR=R.POS<AC.POS.DESCRIPTION>

        SEL.CMD="SELECT ": FN.AC : " WITH CUSTOMER EQ " :CLIENT: " AND CATEGORY EQ 8028 "
        AC.LIST = ''
        LIST.AC = ''
        SELECTED.AC = ''
        SYSTEM.RETURN.CODE.AC = ''
        CALL EB.READLIST(SEL.CMD,AC.LIST,LIST.AC,SELECTED.AC,SYSTEM.RETURN.CODE.AC)

        IF AC.LIST EQ '' THEN

            LINESEQ=''
            LINESEQ=LINESEQ:CLIENT:SEP
            LINESEQ=LINESEQ:MNEMONIC:SEP
            LINESEQ=LINESEQ:SHORT.NAME:SEP
            LINESEQ=LINESEQ:LEGAL.DOC.NAME:SEP
            LINESEQ=LINESEQ:LEGAL.ID:SEP
            LINESEQ=LINESEQ:TITLE:SEP
            LINESEQ=LINESEQ:DATE.OF.BIRTH:SEP
            LINESEQ=LINESEQ:ACCOUNT.OFFICER:SEP
            LINESEQ=LINESEQ:AGENCE:SEP
            LINESEQ=LINESEQ:Y.APPORT.AFFAI:SEP
            LINESEQ=LINESEQ:NATIONALITY:SEP
            LINESEQ=LINESEQ:RESIDENCE:SEP
            LINESEQ=LINESEQ:SECTOR:SEP
            LINESEQ=LINESEQ:SECTOR.LIB:SEP
            LINESEQ=LINESEQ:INDUSTRY:SEP
            LINESEQ=LINESEQ:INDUSTRY.LIB:SEP
            LINESEQ=LINESEQ:ADDRESS:SEP
            LINESEQ=LINESEQ:Y.BZ.GOUVERNORAT:SEP
            LINESEQ=LINESEQ:CUS.POS.DESCR:SEP

            IF LINESEQ THEN
                WRITESEQ LINESEQ APPEND TO FICHIER.SEQ ELSE
**                  CRT"UNABLE TO PERFORM WRITESEQ "
                    CALL OCOMO("UNABLE TO PERFORM WRITESEQ ":FICHIER.SEQ)
                END
            END

        END
    NEXT I
    RETURN

END
