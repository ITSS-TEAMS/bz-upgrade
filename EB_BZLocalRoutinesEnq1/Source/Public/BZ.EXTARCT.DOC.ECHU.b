*-----------------------------------------------------------------------------*
* <Rating>-41</Rating>
* ----------------------------------------------------------------------------------------------------- *
*Modification History:
*ZIT-UPG-R13-R19:CRT converted to OCOMO(),STOP converted to FATAL.ERROR
*               :CONVERT converted to CHANGE,FM,VM converted to @FM,@VM
*-----------------------------------------------------------------------------*
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.EXTARCT.DOC.ECHU
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
    $INSERT I_F.CUSTOMER.ACCOUNT
    $INSERT I_F.USER
    $INSERT I_F.DEPT.ACCT.OFFICER

    GOSUB INITIALISATION
    GOSUB OPEN.FILES
    GOSUB PROCESS
    GOSUB GET.COMPTE

    RETURN

* $INSERT I_EQUATE - Not Used anymore;---------------------------------------------------------*
INITIALISATION:
* $INSERT I_F.AC.CHARGE.REQUEST - Not Used anymore;--------------------------------------------*

    FN.CUS = 'F.CUSTOMER'
    F.CUS = ''

    FN.CUS.AC="F.CUSTOMER.ACCOUNT"
    F.CUS.AC=""

    FN.DEPT.ACCT.OFFICER = 'F.DEPT.ACCT.OFFICER'
    F.DEPT.ACCT.OFFICER = ''


    FN.USER='F.USER'
    F.USER=''
    PS='EB.SystemTables.getVFunction()S='CS'
    CC='CC'
    XN='XN'
    LOCFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusLDS<1> SETTING ID.POS THEN
        ID.CUS = DFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusID.POS>
    END

    RETURN

*----------------------------------------------------------------------------*
OPEN.FILES:
*----------------------------------------------------------------------------*
    CALL OPF(FN.CUS,F.CUS)
    CALL OPF(FN.CUS.AC,F.CUS.AC)
    CALL OPF(FN.USER,F.USER)
    CALL OPF(FN.DEPT.ACCT.OFFICER,F.DEPT.ACCT.OFFICER)
    RETURN
*----------------------------------------------------------------------------*
PROCESS:


    Y.TIME = OCONV(TIME(), "MTS")
    CHANGE ':' TO '' IN Y.TIME

*DIRFILE="./TEMP.BP/BZ.EXTRACT.DOC.ECHU.csv"
    DIRFILE="./REPORTING.CONTROL.PERMANENT/ETAT.DOC.ECHU":TODAY:Y.TIME:".txt"
    OPENSEQ DIRFILE TO FICHIER.SEQ ELSE
        CREATE FICHIER.SEQ  ELSE
         EB.DataAccess.Opf
*ZIT-UPG-EB.DataAccess.Opf-R19 S 
*           CRT"UNABLE TO CREATE FILE POINTER TO FILE ":DIRFILE
*           STOP
			CALL OCOMO("UNABLE TO CREATE FILE POINTER TO FILE ":DIRFILE)
			Y.MESSAGE="UNABLE TO CREATE FILE POINTER TO FILE ":DIRFIFT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefGE.INFO=''
				Y.MEEB.DataAccess.FReadINFO<1> =''
				Y.MESSAGE.INFO<2> = ''
				Y.MESSAGE.INFO<3> =''
				Y.MESSAGE.INFO<4> = Y.MESSAGE
				Y.MESSAGE.INFO<5> = 'NO'
EB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyer<6> = ''
				Y.MESSAGE.INFO<7> = ''

		    CALLEB.SystemTables.setE()*-----------------------------------------------------------------------------*
* <Rating>-41</Rating>
* ----------------------------------------------------------------------------------------------------- *
*Modification History:
*ZIT-UPG-R13-R19:CRT converted to OCOMO(),STOP converted to FATAL.ERROR
*               :CONVERT converted to CHANGE,FM,VM converted to @FM,@VM
*-----------------------------------------------------------------------------*
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.EXTARCT.DOC.ECHU
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
    $INSERT I_F.CUSTOMER.ACCOUNT
    $INSERT I_F.USER
    $INSERT I_F.DEPT.ACCT.OFFICER

    GOSUB INITIALISATION
    GOSUB OPEN.FILES
    GOSUB PROCESS
    GOSUB GET.COMPTE

    RETURN

*----------------------------------------------------------------------------*
INITIALISATION:
*----------------------------------------------------------------------------*

    FN.CUS = 'F.CUSTOMER'
    F.CUS = ''

    FN.CUS.AC="F.CUSTOMER.ACCOUNT"
    F.CUS.AC=""

    FN.DEPT.ACCT.OFFICER = 'F.DEPT.ACCT.OFFICER'
    F.DEPT.ACCT.OFFICER = ''


    FN.USER='F.USER'
    F.USER=''
    PS='PS'
    CS='CS'
    CC='CC'
    XN='XN'
    LOCATE "ID" IN D.FIELDS<1> SETTING ID.POS THEN
        ID.CUS = D.RANGE.AND.VALUE<ID.POS>
    END

    RETURN

*----------------------------------------------------------------------------*
OPEN.FILES:
*----------------------------------------------------------------------------*
    CALL OPF(FN.CUS,F.CUS)
    CALL OPF(FN.CUS.AC,F.CUS.AC)
    CALL OPF(FN.USER,F.USER)
    CALL OPF(FN.DEPT.ACCT.OFFICER,F.DEPT.ACCT.OFFICER)
    RETURN
*----------------------------------------------------------------------------*
PROCESS:


    Y.TIME = OCONV(TIME(), "MTS")
    CHANGE ':' TO '' IN Y.TIME

*DIRFILE="./TEMP.BP/BZ.EXTRACT.DOC.ECHU.csv"
    DIRFILE="./REPORTING.CONTROL.PERMANENT/ETAT.DOC.ECHU":TODAY:Y.TIME:".txt"
    OPENSEQ DIRFILE TO FICHIER.SEQ ELSE
        CREATE FICHIER.SEQ  ELSE
            
*ZIT-UPG-R13-R19 S 
*           CRT"UNABLE TO CREATE FILE POINTER TO FILE ":DIRFILE
*           STOP
			CALL OCOMO("UNABLE TO CREATE FILE POINTER TO FILE ":DIRFILE)
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
*ZIT-UPG-R13-R19 E
EB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyerND

    NOEB.DataAccess.FWrite"ETAT DOC ECHU"

    IF NEB.SystemTables.setAf()*-----------------------------------------------------------------------------*
* <Rating>-41</Rating>
* ----------------------------------------------------------------------------------------------------- *
*Modification History:
*ZIT-UPG-R13-R19:CRT converted to OCOMO(),STOP converted to FATAL.ERROR
*               :CONVERT converted to CHANGE,FM,VM converted to @FM,@VM
*-----------------------------------------------------------------------------*
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.EXTARCT.DOC.ECHU
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
    $INSERT I_F.CUSTOMER.ACCOUNT
    $INSERT I_F.USER
    $INSERT I_F.DEPT.ACCT.OFFICER

    GOSUB INITIALISATION
    GOSUB OPEN.FILES
    GOSUB PROCESS
    GOSUB GET.COMPTE

    RETURN

*----------------------------------------------------------------------------*
INITIALISATION:
*----------------------------------------------------------------------------*

    FN.CUS = 'F.CUSTOMER'
    F.CUS = ''

    FN.CUS.AC="F.CUSTOMER.ACCOUNT"
    F.CUS.AC=""

    FN.DEPT.ACCT.OFFICER = 'F.DEPT.ACCT.OFFICER'
    F.DEPT.ACCT.OFFICER = ''


    FN.USER='F.USER'
    F.USER=''
    PS='PS'
    CS='CS'
    CC='CC'
    XN='XN'
    LOCATE "ID" IN D.FIELDS<1> SETTING ID.POS THEN
        ID.CUS = D.RANGE.AND.VALUE<ID.POS>
    END

    RETURN

*----------------------------------------------------------------------------*
OPEN.FILES:
*----------------------------------------------------------------------------*
    CALL OPF(FN.CUS,F.CUS)
    CALL OPF(FN.CUS.AC,F.CUS.AC)
    CALL OPF(FN.USER,F.USER)
    CALL OPF(FN.DEPT.ACCT.OFFICER,F.DEPT.ACCT.OFFICER)
    RETURN
*----------------------------------------------------------------------------*
PROCESS:


    Y.TIME = OCONV(TIME(), "MTS")
    CHANGE ':' TO '' IN Y.TIME

*DIRFILE="./TEMP.BP/BZ.EXTRACT.DOC.ECHU.csv"
    DIRFILE="./REPORTING.CONTROL.PERMANENT/ETAT.DOC.ECHU":TODAY:Y.TIME:".txt"
    OPENSEQ DIRFILE TO FICHIER.SEQ ELSE
        CREATE FICHIER.SEQ  ELSE
            
*ZIT-UPG-R13-R19 S 
*           CRT"UNABLE TO CREATE FILE POINTER TO FILE ":DIRFILE
*           STOP
			CALL OCOMO("UNABLE TO CREATE FILE POINTER TO FILE ":DIRFILE)
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
*ZIT-UPG-R13-R19 E
        END
    END

    NOM_ETAT="ETAT DOC ECHU"

    IF NOM_FT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRef    EB.SystemTables.setE()*-----------------------------------------------------------------------------*
* <Rating>-41</Rating>
* ----------------------------------------------------------------------------------------------------- *
*Modification History:
*ZIT-UPG-R13-R19:CRT converted to OCOMO(),STOP converted to FATAL.ERROR
*               :CONVERT converted to CHANGE,FM,VM converted to @FM,@VM
*-----------------------------------------------------------------------------*
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.EXTARCT.DOC.ECHU
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
    $INSERT I_F.CUSTOMER.ACCOUNT
    $INSERT I_F.USER
    $INSERT I_F.DEPT.ACCT.OFFICER

    GOSUB INITIALISATION
    GOSUB OPEN.FILES
    GOSUB PROCESS
    GOSUB GET.COMPTE

    RETURN

*----------------------------------------------------------------------------*
INITIALISATION:
*----------------------------------------------------------------------------*

    FN.CUS = 'F.CUSTOMER'
    F.CUS = ''

    FN.CUS.AC="F.CUSTOMER.ACCOUNT"
    F.CUS.AC=""

    FN.DEPT.ACCT.OFFICER = 'F.DEPT.ACCT.OFFICER'
    F.DEPT.ACCT.OFFICER = ''


    FN.USER='F.USER'
    F.USER=''
    PS='PS'
    CS='CS'
    CC='CC'
    XN='XN'
    LOCATE "ID" IN D.FIELDS<1> SETTING ID.POS THEN
        ID.CUS = D.RANGE.AND.VALUE<ID.POS>
    END

    RETURN

*----------------------------------------------------------------------------*
OPEN.FILES:
*----------------------------------------------------------------------------*
    CALL OPF(FN.CUS,F.CUS)
    CALL OPF(FN.CUS.AC,F.CUS.AC)
    CALL OPF(FN.USER,F.USER)
    CALL OPF(FN.DEPT.ACCT.OFFICER,F.DEPT.ACCT.OFFICER)
    RETURN
*----------------------------------------------------------------------------*
PROCESS:


    Y.TIME = OCONV(TIME(), "MTS")
    CHANGE ':' TO '' IN Y.TIME

*DIRFILE="./TEMP.BP/BZ.EXTRACT.DOC.ECHU.csv"
    DIRFILE="./REPORTING.CONTROL.PERMANENT/ETAT.DOC.ECHU":TODAY:Y.TIME:".txt"
    OPENSEQ DIRFILE TO FICHIER.SEQ ELSE
        CREATE FICHIER.SEQ  ELSE
            
*ZIT-UPG-R13-R19 S 
*           CRT"UNABLE TO CREATE FILE POINTER TO FILE ":DIRFILE
*           STOP
			CALL OCOMO("UNABLE TO CREATE FILE POINTER TO FILE ":DIRFILE)
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
*ZIT-UPG-R13-R19 E
        END
    END

    NOM_ETAT="ETAT DOC ECHU"

    IF NOM_ETAT THEN

        WRITESEQ NOM_ETAT APPEND TO FICHIER.SEQ ELSE
       
*ZIT-UPG-R13-R19 S
*           CRT "UNABLE TO PERFORM NOM ETAT"
			CALL OCOMO("UNABLE TO PERFORM NOM ETAT")
*ZIT-UPG-R13-R19 E
        END
    END

    LIGNE.ENTETE=""
    LIGNE.ENTETE = " Agence | " : " ID client  | " : " Nom client  | " :  " Type Document | " : " Date Fin Validite | " : " Compte | "
    WRITESEQ LIGNE.ENTETE APPEND TO FICHIER.SEQ ELSE
      
*ZIT-UPG-R13-R19 S
*           CRT "UNABLE TO PERFORM ENTETE"
			CALL OCOMO("UNABLE TO PERFORM ENTETE")
*ZIT-UPG-R13-R19 E
    END

    SEP="|"

    SEL.CUS = "SELECT ":FN.CUS:" WITH LEGAL.EXP.DATE LT TODAY AND LEGAL.EXP.DATE GE 20100101"
    CALL EB.READLIST(SEL.CUS,SEL.LIST,'',NO.SEL,SEL.ERR)

    LOOP
        REMOVE ID.CUS FROM SEL.LIST SETTING POS UNTIL ID.CUS = ''
        CALL F.READ(FN.CUS,ID.CUS,R.CUS,F.CUS,ERR.CUS)
        Y.MIS.ACCT.OFFICER = R.CUS<EB.CUS.ACCOUNT.OFFICER>
POS.Y.MIS.ACCT.OFFICER = Y.MIS.ACCT.OFFICER[1,1]
IF POS.Y.MIS.ACCT.OFFICER NE 1 THEN CONTINUE
        CALL F.READ(FN.DEPT.ACCT.OFFICER,Y.MIS.ACCT.OFFICER,R.DEPT.ACCT.OFFICER,F.DEPT.ACCT.OFFICER,YERR)
        NAME.DAO = R.DEPT.ACCT.OFFICER<EB.DAO.NAME>
        NOM.CLIENT=R.CUS<EB.CUS.NAME.1>
        TYPE.DOC=R.CUS<EB.CUS.LEGAL.DOC.NAME>
        
*ZIT-UPG-R13-R19 S 
*          CONVERT VM TO FM IN TYPE.DOC
           CHANGE @VM TO @FM IN TYPE.DOC
*ZIT-UPG-R13-R19 E
        NB.DOC=DCOUNT(TYPE.DOC,@FM)
        DATE.FIN=R.CUS<EB.CUS.LEGAL.EXP.DATE>
*ZIT-UPG-R13-R19 S 
*          CONVERT VM TO FM IN DATE.FIN
           CHANGE @VM TO @FM IN DATE.FIN
*ZIT-UPG-R13-R19 E
        
        NB.DATE=DCOUNT(DATE.FIN,@FM)
        LOCATE PS IN TYPE.DOC SETTING POS.PS ELSE POS.PS='0'
        LOCATE CS IN TYPE.DOC SETTING POS.CS ELSE POS.CS='0'
        LOCATE CC IN TYPE.DOC SETTING POS.CC ELSE POS.CC='0'
        LOCATE XN IN TYPE.DOC SETTING POS.XN ELSE POS.XN='0'
        IF POS.PS NE '0' THEN
            TYPE.IDENT=R.CUS<EB.CUS.LEGAL.DOC.NAME><1,POS.PS>
            V.DATE.FIN=R.CUS<EB.CUS.LEGAL.EXP.DATE><1,POS.PS>
            GOSUB GET.COMPTE
            END ELSE IF POS.CS NE '0' THEN
                TYPE.IDENT=R.CUS<EB.CUS.LEGAL.DOC.NAME><1,POS.CS>
                V.DATE.FIN=R.CUS<EB.CUS.LEGAL.EXP.DATE><1,POS.CS>
                GOSUB GET.COMPTE
                END ELSE IF POS.CC NE '0' THEN
                    TYPE.IDENT=R.CUS<EB.CUS.LEGAL.DOC.NAME><1,POS.CC>
                    V.DATE.FIN=R.CUS<EB.CUS.LEGAL.EXP.DATE><1,POS.CC>
                    GOSUB GET.COMPTE

                    END ELSE IF POS.XN NE '0' THEN
                        TYPE.IDENT=R.CUS<EB.CUS.LEGAL.DOC.NAME><1,POS.XN>
                        V.DATE.FIN=R.CUS<EB.CUS.LEGAL.EXP.DATE><1,POS.XN>
                        GOSUB GET.COMPTE
                    END

                REPEAT

GET.COMPTE:
                ID.CLIENT=ID.CUS
                CALL F.READ(FN.CUS.AC,ID.CLIENT,R.CUS.AC,F.CUS.AC,E.CUS.AC)
                LOOP
                    REMOVE AC.ID FROM R.CUS.AC SETTING AC.POS
                WHILE AC.ID:AC.POS
                    V.COMPTE=AC.ID
                    IF V.DATE.FIN LT TODAY THEN

                        LINESEQ=""
                        LINESEQ=LINESEQ:Y.MIS.ACCT.OFFICER:SEP
                        LINESEQ=LINESEQ:ID.CUS:SEP
                        LINESEQ=LINESEQ:NOM.CLIENT:SEP
                        LINESEQ=LINESEQ:TYPE.IDENT:SEP
                        LINESEQ=LINESEQ:V.DATE.FIN:SEP
                        LINESEQ=LINESEQ:V.COMPTE:SEP

                        IF LINESEQ THEN
                            WRITESEQ LINESEQ APPEND TO FICHIER.SEQ ELSE
                                
*ZIT-UPG-R13-R19 S
*                               CRT"UNABLE TO PERFORM WRITESEQ "
			                    CALL OCOMO("UNABLE TO PERFORM WRITESEQ ")
*ZIT-UPG-R13-R19 E
                            END
                        END

                    END
                REPEAT

                RETURN
*--------------------------------------------------------------------------------*
                RETURN
            END
