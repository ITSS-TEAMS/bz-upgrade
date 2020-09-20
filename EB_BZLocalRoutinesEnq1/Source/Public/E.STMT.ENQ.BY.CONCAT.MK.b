* Version 17 08/02/01  GLOBUS Release No. 200507 28/06/05
*-----------------------------------------------------------------------------
* <Rating>14585</Rating>
*-----------------------------------------------------------------------------
*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13  : $INSERT BP to $INCLUDE BZDEV.BP
*ZIT-UPG-R13-R19  : NOTICED RUNNING UNDER BATCH FOR ENQUIRY;OPERATIONS TO OPERANDS;GET.LOC.REF TO MULTI.GET.LOC.REF;CONVERT TO CHANGE;
*				  : HARCODED FILENAME REPLACED WITH VARIABLES;INTIALISED VARIABLES;DBR TO F.READ;
*				  : DBR TO CACHE.READ;FM,VM,SM TO @FM,@VM,@SM;READ TO F.READ;OLD FORM OF ID FOR ENQ.ERROR FOUND
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE E.STMT.ENQ.BY.CONCAT.MK(Y.ID.LIST)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*
* 23/12/91 - GB9100506
*            ACCT.STMT.PRINT can have null balance instead of zero. This
*            when <-1>d on the balance array causes the next balance to
*            be used as the opening balance.
*
* 21/01/92 - HY9200577
*            Replace -1 with := when building arrays
*
* 11/11/91 - HY9100310
*            Remove the addition of 1 to the booking date when matching
* $INSERT I_COMMON - Not Used anymore;
*
* 16/03/92 - HY9200699
* $INSERT I_F.AC.CHARGE.REQUEST - Not Used anymore;e (ACCOUNT.STATEMENT), if the account
*            is missing (it may have been closed), to determine the account
*            currency.
*
* 01/04/92 - HY9200755
*            Only use FQU2 balance for combined statements.
*
* 07/02/01 - GB0100297
*            Check for duplicate entry id's - can happen when running under
*            batch.
*
* 05/01/02 - GLOBUS_EN_10000302
*            Changes made to include forward value dated statement
*            entries in the enquiry
*
* 11/10/02 - GLOBUS_CI_10004129
*            CorrectionFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusthe error when running  the enq
*            FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusBOOKING.DATE with EQ operand.
*
* 21/10/02 - GLOBUS_EN_10001477
*            Changes made to adapt additional freqencies for the
*            account.statement.
* 19/12/02 - BG_100002917
*          - Shortened the name of STMT.FREQU.2 & FQU2.LAST.BAL.
*
* 27/02/03 - BG_100003504
*            Changes made for Multiple frequency account statement
*            enhancement.Existing code using the relationship field
*            is removed since statement-2 frequency made independent
*            of statement-1 frequency.
*
* 08/04/03 - CI_10008120
*            Wrong sorting of entries by BOOKING.DATE.
*
* 23/06/03 - BG_100004605
*            Bug fixes for the enquiry STMT.ENT.BOOK related to
*            multiple frequencies of account statement.
*
* 01/04/05 - BG_100008493
*            Double entries, remove the use of ACCT.ENT.TODAY as
*            ACCT.STMT.ENTRY is updated online.
*
* 19/04/05 - CI_10029376
*        EB.DataAccess.Opf Changes done to restrict the user to view only those
*        EB.DataAccess.Opf accounts thro STMT.ENT.BOOK enquiry which are pertaining
*            to the OTH.BOOK.ACCESS in USER profile.
*
* 11/07/05 - EN_10002592
*            Online Update of Statement concat files
*
* 25/10/05 - BG_10000FT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefEB.DataAccess.FReadeking for duplicate entries with ACCT.STMT.ENTRY in READ.EXTRA.IDS
*            section is removed as STMT.PRINTED is updated online itself.
*
* 24/11/06 - CI_10045618
*            Enq STMT.ENT.BOEB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyerrrect opening balance for Passbook
*            accounts when giving booking.date conditions as GT/GE/EQ
*           EB.SystemTables.setE()* Version 17 08/02/01  GLOBUS Release No. 200507 28/06/05
*-----------------------------------------------------------------------------
* <Rating>14585</Rating>
*-----------------------------------------------------------------------------
*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13  : $INSERT BP to $INCLUDE BZDEV.BP
*ZIT-UPG-R13-R19  : NOTICED RUNNING UNDER BATCH FOR ENQUIRY;OPERATIONS TO OPERANDS;GET.LOC.REF TO MULTI.GET.LOC.REF;CONVERT TO CHANGE;
*				  : HARCODED FILENAME REPLACED WITH VARIABLES;INTIALISED VARIABLES;DBR TO F.READ;
*				  : DBR TO CACHE.READ;FM,VM,SM TO @FM,@VM,@SM;READ TO F.READ;OLD FORM OF ID FOR ENQ.ERROR FOUND
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE E.STMT.ENQ.BY.CONCAT.MK(Y.ID.LIST)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*
* 23/12/91 - GB9100506
*            ACCT.STMT.PRINT can have null balance instead of zero. This
*            when <-1>d on the balance array causes the next balance to
*            be used as the opening balance.
*
* 21/01/92 - HY9200577
*            Replace -1 with := when building arrays
*
* 11/11/91 - HY9100310
*            Remove the addition of 1 to the booking date when matching
*            for EQ.
*
* 16/03/92 - HY9200699
*            Read the history file (ACCOUNT.STATEMENT), if the account
*            is missing (it may have been closed), to determine the account
*            currency.
*
* 01/04/92 - HY9200755
*            Only use FQU2 balance for combined statements.
*
* 07/02/01 - GB0100297
*            Check for duplicate entry id's - can happen when running under
*            batch.
*
* 05/01/02 - GLOBUS_EN_10000302
*            Changes made to include forward value dated statement
*            entries in the enquiry
*
* 11/10/02 - GLOBUS_CI_10004129
*            Correction made to rectify the error when running  the enq
*            by selecting the BOOKING.DATE with EQ operand.
*
* 21/10/02 - GLOBUS_EN_10001477
*            Changes made to adapt additional freqencies for the
*            account.statement.
* 19/12/02 - BG_100002917
*          - Shortened the name of STMT.FREQU.2 & FQU2.LAST.BAL.
*
* 27/02/03 - BG_100003504
*            Changes made for Multiple frequency account statement
*            enhancement.Existing code using the relationship field
*            is removed since statement-2 frequency made independent
*            of statement-1 frequency.
*
* 08/04/03 - CI_10008120
*            Wrong sorting of entries by BOOKING.DATE.
*
* 23/06/03 - BG_100004605
*            Bug fixes for the enquiry STMT.ENT.BOOK related to
*            multiple frequencies of account statement.
*
* 01/04/05 - BG_100008493
*            Double entries, remove the use of ACCT.ENT.TODAY as
*            ACCT.STMT.ENTRY is updated online.
*
* 19/04/05 - CI_10029376
*            Changes done to restrict the user to view only those
*            accounts thro STMT.ENT.BOOK enquiry which are pertaining
*            to the OTH.BOOK.ACCESS in USER profile.
*
* 11/07/05 - EN_10002592
*            Online Update of Statement concat files
*
* 25/10/05 - BG_100009585
*            Cheking for duplicate entries with ACCT.STMT.ENTRY in READ.EXTRA.IDS
*            section is removed as STMT.PRINTED is updated online itself.
*
* 24/11/06 - CI_10045618
*            Enq STMT.ENT.BOOK doesn't show correct opening balance for Passbook
*            accounts when giving booking.date conditions as GT/GE/EQ
*            Today/any date greater than booking date of the last printed transaction
*
* 01/03/07 - EN_1000EB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyer Modified to call DAS to select data.
*
* 27/04/07 - EEB.DataAccess.FWrite339
*            Pull in sub accounts for a master account
*
* 11/09/EB.SystemTables.setAf()* Version 17 08/02/01  GLOBUS Release No. 200507 28/06/05
*-----------------------------------------------------------------------------
* <Rating>14585</Rating>
*-----------------------------------------------------------------------------
*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13  : $INSERT BP to $INCLUDE BZDEV.BP
*ZIT-UPG-R13-R19  : NOTICED RUNNING UNDER BATCH FOR ENQUIRY;OPERATIONS TO OPERANDS;GET.LOC.REF TO MULTI.GET.LOC.REF;CONVERT TO CHANGE;
*				  : HARCODED FILENAME REPLACED WITH VARIABLES;INTIALISED VARIABLES;DBR TO F.READ;
*				  : DBR TO CACHE.READ;FM,VM,SM TO @FM,@VM,@SM;READ TO F.READ;OLD FORM OF ID FOR ENQ.ERROR FOUND
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE E.STMT.ENQ.BY.CONCAT.MK(Y.ID.LIST)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*
* 23/12/91 - GB9100506
*            ACCT.STMT.PRINT can have null balance instead of zero. This
*            when <-1>d on the balance array causes the next balance to
*            be used as the opening balance.
*
* 21/01/92 - HY9200577
*            Replace -1 with := when building arrays
*
* 11/11/91 - HY9100310
*            Remove the addition of 1 to the booking date when matching
*            for EQ.
*
* 16/03/92 - HY9200699
*            Read the history file (ACCOUNT.STATEMENT), if the account
*            is missing (it may have been closed), to determine the account
*            currency.
*
* 01/04/92 - HY9200755
*            Only use FQU2 balance for combined statements.
*
* 07/02/01 - GB0100297
*            Check for duplicate entry id's - can happen when running under
*            batch.
*
* 05/01/02 - GLOBUS_EN_10000302
*            Changes made to include forward value dated statement
*            entries in the enquiry
*
* 11/10/02 - GLOBUS_CI_10004129
*            Correction made to rectify the error when running  the enq
*            by selecting the BOOKING.DATE with EQ operand.
*
* 21/10/02 - GLOBUS_EN_10001477
*            Changes made to adapt additional freqencies for the
*            account.statement.
* 19/12/02 - BG_100002917
*          - Shortened the name of STMT.FREQU.2 & FQU2.LAST.BAL.
*
* 27/02/03 - BG_100003504
*            Changes made for Multiple frequency account statement
*            enhancement.Existing code using the relationship field
*            is removed since statement-2 frequency made independent
*            of statement-1 frequency.
*
* 08/04/03 - CI_10008120
*            Wrong sorting of entries by BOOKING.DATE.
*
* 23/06/03 - BG_100004605
*            Bug fixes for the enquiry STMT.ENT.BOOK related to
*            multiple frequencies of account statement.
*
* 01/04/05 - BG_100008493
*            Double entries, remove the use of ACCT.ENT.TODAY as
*            ACCT.STMT.ENTRY is updated online.
*
* 19/04/05 - CI_10029376
*            Changes done to restrict the user to view only those
*            accounts thro STMT.ENT.BOOK enquiry which are pertaining
*            to the OTH.BOOK.ACCESS in USER profile.
*
* 11/07/05 - EN_10002592
*            Online Update of Statement concat files
*
* 25/10/05 - BG_100009585
*            Cheking for duplicate entries with ACCT.STMT.ENTRY in READ.EXTRA.IDS
*            section is removed as STMT.PRINTED is updated online itself.
*
* 24/11/06 - CI_10045618
*            Enq STMT.ENT.BOOK doesn't show correct opening balance for Passbook
*            accounts when giving booking.date conditions as GT/GE/EQ
*            Today/any date greater than booking date of the last printed transaction
*
* 01/03/07 - EN_10003231
*            Modified to call DAS to select data.
*
* 27/04/07 - EN_10003339
*            Pull in sub accounts for a master account
*
* 11/09/07 FT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRef*       EB.SystemTables.setE()* Version 17 08/02/01  GLOBUS Release No. 200507 28/06/05
*-----------------------------------------------------------------------------
* <Rating>14585</Rating>
*-----------------------------------------------------------------------------
*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13  : $INSERT BP to $INCLUDE BZDEV.BP
*ZIT-UPG-R13-R19  : NOTICED RUNNING UNDER BATCH FOR ENQUIRY;OPERATIONS TO OPERANDS;GET.LOC.REF TO MULTI.GET.LOC.REF;CONVERT TO CHANGE;
*				  : HARCODED FILENAME REPLACED WITH VARIABLES;INTIALISED VARIABLES;DBR TO F.READ;
*				  : DBR TO CACHE.READ;FM,VM,SM TO @FM,@VM,@SM;READ TO F.READ;OLD FORM OF ID FOR ENQ.ERROR FOUND
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE E.STMT.ENQ.BY.CONCAT.MK(Y.ID.LIST)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*
* 23/12/91 - GB9100506
*            ACCT.STMT.PRINT can have null balance instead of zero. This
*            when <-1>d on the balance array causes the next balance to
*            be used as the opening balance.
*
* 21/01/92 - HY9200577
*            Replace -1 with := when building arrays
*
* 11/11/91 - HY9100310
*            Remove the addition of 1 to the booking date when matching
*            for EQ.
*
* 16/03/92 - HY9200699
*            Read the history file (ACCOUNT.STATEMENT), if the account
*            is missing (it may have been closed), to determine the account
*            currency.
*
* 01/04/92 - HY9200755
*            Only use FQU2 balance for combined statements.
*
* 07/02/01 - GB0100297
*            Check for duplicate entry id's - can happen when running under
*            batch.
*
* 05/01/02 - GLOBUS_EN_10000302
*            Changes made to include forward value dated statement
*            entries in the enquiry
*
* 11/10/02 - GLOBUS_CI_10004129
*            Correction made to rectify the error when running  the enq
*            by selecting the BOOKING.DATE with EQ operand.
*
* 21/10/02 - GLOBUS_EN_10001477
*            Changes made to adapt additional freqencies for the
*            account.statement.
* 19/12/02 - BG_100002917
*          - Shortened the name of STMT.FREQU.2 & FQU2.LAST.BAL.
*
* 27/02/03 - BG_100003504
*            Changes made for Multiple frequency account statement
*            enhancement.Existing code using the relationship field
*            is removed since statement-2 frequency made independent
*            of statement-1 frequency.
*
* 08/04/03 - CI_10008120
*            Wrong sorting of entries by BOOKING.DATE.
*
* 23/06/03 - BG_100004605
*            Bug fixes for the enquiry STMT.ENT.BOOK related to
*            multiple frequencies of account statement.
*
* 01/04/05 - BG_100008493
*            Double entries, remove the use of ACCT.ENT.TODAY as
*            ACCT.STMT.ENTRY is updated online.
*
* 19/04/05 - CI_10029376
*            Changes done to restrict the user to view only those
*            accounts thro STMT.ENT.BOOK enquiry which are pertaining
*            to the OTH.BOOK.ACCESS in USER profile.
*
* 11/07/05 - EN_10002592
*            Online Update of Statement concat files
*
* 25/10/05 - BG_100009585
*            Cheking for duplicate entries with ACCT.STMT.ENTRY in READ.EXTRA.IDS
*            section is removed as STMT.PRINTED is updated online itself.
*
* 24/11/06 - CI_10045618
*            Enq STMT.ENT.BOOK doesn't show correct opening balance for Passbook
*            accounts when giving booking.date conditions as GT/GE/EQ
*            Today/any date greater than booking date of the last printed transaction
*
* 01/03/07 - EN_10003231
*            Modified to call DAS to select data.
*
* 27/04/07 - EN_10003339
*            Pull in sub accounts for a master account
*
* 11/09/07 - CI_10051320
*            Enq STMT.ENT.BOOK doesn't show correct opening balance for Passbook
*            accounts when giving booking.date condition RG given.
*
* 13/11/07 - CI_10052434
*            Enq STMT.ENT.BOOK doesn't show correct opening balance for closed
*            accounts in some cases. Fix done to resolve this.
*
* 08/02/2008 - CI_10053652
*              On running enq , when requested date is GT the ACCOUNT.STATEMENT
*              frequency, wrong opening balance is fetched. So changes done to get
*              the opening balance from entry .
*
* 0-4/07/08 - CI_10056511(CSS REF:HD0815178)
*            When there are special statments printed,the last printed bal would get updated
*            with the latest balance in account statement. So when the requested date
*            is GT the ACCOUNT.STATEMENT frequency in the enquiry, now the balance is obtained
*            by calling the para GET.ENTRIES. Changes done such that if there are no more
*            entries to the account after the last updated freq bal, no need to process
*            the entries in STMT.PRINTED
*
* 30/09/08 - BG_100020208
*            While running the enquiry if we give the invalid account then it check if it is
*            valid account or not if it is not then it throws an error message.
*
* 28/11/08 - BG_100019132
*            Drill down is not working when there is a net entry.
*----------------------------------------------------------------------
*
$INSERT I_COMMON
$INSERT I_EQUATE
$INSERT I_F.STMT.ENTRY
$INSERT I_ENQUIRY.COMMON
$INSERT I_F.ACCOUNT.STATEMENT
$INSERT I_F.AC.STMT.PARAMETER
$INSERT I_F.ACCOUNT.PARAMETER
$INSERT I_F.ACCOUNT
$INSERT I_F.CUSTOMER
$INSERT I_F.USER
$INSERT I_F.TRANSACTION
$INSERT I_F.CURRENCY.PARAM
$INSERT I_F.COMPANY.SMS.GROUP
$INSERT I_DAS.COMMON
$INSERT I_DAS.ACCOUNT
*ZIT-UPG-R09-R13/S
*$INSERT BP I_F.BZ.CODE.POSTAL
 $INSERT I_F.BZ.CODE.POSTAL
*ZIT-UPG-R09-R13/E
    RUNNING.UNDER.BATCH=1
*
*-----------------------------------------------------------------------
MAIN.PARA:
*=========
*
* Find the position of ACCOUNT and BOOKING.BOOKING.DATE
*


    LOCATE "ACCOUNT" IN D.FIELDS<1> SETTING YACCOUNT.POS ELSE
        RETURN
    END
    LOCATE "BOOKING.DATE" IN D.FIELDS<1> SETTING YDATE.POS ELSE
        RETURN
    END
    YSORT.DETS = R.ENQ<4,1>
    SORT.FLD = FIELD(YSORT.DETS,' ',1,1)
    SORT.BY = FIELD(YSORT.DETS,' ',2,1)
*
    IF D.LOGICAL.OPERANDS<YDATE.POS> EQ '' OR D.RANGE.AND.VALUE<YDATE.POS> EQ "" OR D.RANGE.AND.VALUE<YDATE.POS> EQ "ALL" THEN
        RETURN
    END
    GOSUB OPEN.REQD.FILES
    GOSUB LIST.ACCT.NOS
    Y.CONCAT.REC = ""
    YOPEN.BAL = ""
    Y.AMOUNT = ""
    YOPERAND = D.LOGICAL.OPERANDS<YDATE.POS>
    YENQ.LIST.COPY = D.RANGE.AND.VALUE<YDATE.POS>
    YENQ.LIST = ""
    ENTRYID.LIST = ""         ;* Stores entry ids to check for duplicates
    YR.ACCT.STMT2.PRINT = ""
    YR.ENTRY.FILE = ""
    LOOP
        REMOVE YVALUE FROM YENQ.LIST.COPY SETTING YCODE
    UNTIL YVALUE EQ ''
        LOCATE YVALUE IN YENQ.LIST<1,1> BY 'AR' SETTING YPOS ELSE
            NULL
        END
        INS YVALUE BEFORE YENQ.LIST<1,YPOS>
    REPEAT

* KOLSI

    Y.PERIOD = D.RANGE.AND.VALUE<YDATE.POS>

    REMOVE Y.DATE.DEB FROM Y.PERIOD SETTING YCODE
    REMOVE Y.DATE.FIN FROM Y.PERIOD SETTING YCODE

    Y.TIME = TIMEDATE()

    Y.TIME = Y.TIME[1,8]

    CHANGE ':' TO '' IN Y.TIME

    OPENSEQ './CLEARING/RELEVES' : Y.TIME :TODAY TO FP.RELEVES ELSE CREATE FP.RELEVES ELSE
        TEXT = './CLEARING/RELEVES' : TODAY :' File Creation Error'
        RETURN
    END

    SEP ="#"

    MK.ACC.OLD = ''
    Y.NUMBER.LIGNE = 20
    CANAL0 = ''
    CANAL1 = ''
    CANAL2 =''
    CANAL3 = ''

*  FIN KOLSI


    FN.ACCOUNT = "F.ACCOUNT"
    F.ACCOUNT = ''
    K.ACCOUNT  = ''
    R.ACCOUNT  = ''
    E.ACCOUNT  = ''

    FN.TRANSACTION = "F.TRANSACTION"
    F.TRANSACTION = ''
    K.TRANSACTION  = ''
    R.TRANSACTION  = ''
    E.TRANSACTION  = ''

	FN.CODE.POSTAL="F.BZ.CODE.POSTAL"
    F.CODE.POSTAL=""
	R.CODE.POSTAL=""
	ERR1=""
	
    FN.CUSTOMER = "F.CUSTOMER"
    F.CUSTOMER = ''
    K.CUSTOMER  = ''
    R.CUSTOMER  = ''
    E.CUSTOMER  = ''
    NBRE.COMPTE = 0

	FN.CURRENCY.PARAM='F.CURRENCY.PARAM'
	F.CURRENCY.PARAM=''
	CALL OPF(FN.CURRENCY.PARAM,F.CURRENCY.PARAM)  ;*ADDED
   
    FN.AC.SUB.ACCOUNT='F.AC.SUB.ACCOUNT'
	F.AC.SUB.ACCOUNT=''
	CALL OPF(FN.AC.SUB.ACCOUNT,F.AC.SUB.ACCOUNT) ;*ADDED

    CALL OPF(FN.ACCOUNT , F.ACCOUNT)
	
    CALL OPF(FN.TRANSACTION  , F.TRANSACTION  )

    CALL OPF(FN.CUSTOMER , F.CUSTOMER)
	
	CALL OPF(FN.CODE.POSTAL,F.CODE.POSTAL)


*    CALL GET.LOC.REF("ACCOUNT","ADRESSE",LR.ADR.POS)
*    CALL GET.LOC.REF("ACCOUNT","CODE.POSTAL",LR.CODE.POSTAL.POS)
*    CALL GET.LOC.REF("ACCOUNT","BZ.GOUVERNORAT",LR.BZ.GOUVERNORAT.POS)

*ZIT-UPG-R13-R19 S 
		Y.APP='ACCOUNT'
		Y.FIELD='ADRESSE':@VM:'CODE.POSTAL':@VM:'BZ.GOUVERNORAT'
		Y.POS=''
		CALL MULTI.GET.LOC.REF(Y.APP,Y.FIELD,Y.POS)
		LR.ADR.POS=Y.POS<1,1>
		LR.CODE.POSTAL.POS=Y.POS<1,2>
		LR.BZ.GOUVERNORAT.POS=Y.POS<1,3>
*ZIT-UPG-R13-R19 E	

    LOOP
        Y.AC.NO = YACCT.LIST<1>


    UNTIL Y.AC.NO EQ "" DO

        DEL YACCT.LIST<1>
*        IF C$MULTI.BOOK THEN
        GOSUB CHECK.OTH.BOOK.ACCESS
        IF NEXT.ACCT.FLAG THEN
            GOSUB NEXT.ACCT
        END
*        END
        GOSUB BUILD.CONCAT.LIST
NEXT.ACCT:
    REPEAT
*

    Y.CONCAT.REC.SEP.ID = ""
    GOSUB CHECK.NET.ENTRY
    Y.ID.LIST = Y.CONCAT.REC.SEP.ID


* DERNIERE LIGNE

    Y.FIN.DEBIT = ""
    Y.FIN.CREDIT = ""

    Y.C3.SOLDE.FIN = Y.SOLDE.DEPART + Y.RUNNING.BAL
    Y.C3.SOLDE.FIN = FMT(Y.C3.SOLDE.FIN, V.FORMAT)

    IF Y.C3.SOLDE.FIN GE 0 THEN

        Y.FIN.CREDIT = Y.C3.SOLDE.FIN

        CHANGE '.' TO ',' IN Y.FIN.CREDIT


*--------------UPDATE 20100729--------------------


        Y.SOLDE.FIN =  Y.FIN.CREDIT

*-------------------------------------------------


    END ELSE

        Y.FIN.DEBIT = Y.C3.SOLDE.FIN
        CHANGE '.' TO ',' IN Y.FIN.DEBIT


*--------------UPDATE 20100729--------------------


        Y.SOLDE.FIN =  Y.FIN.DEBIT

*-------------------------------------------------
    END

    CHANGE '.' TO ',' IN Y.RUNNING.BAL.CRED
    CHANGE '.' TO ',' IN Y.RUNNING.BAL.DEB

    CANAL03 = "3" : SEP : Y.RUNNING.BAL.DEB : SEP : Y.RUNNING.BAL.CRED

    CANAL04 = "4" : SEP : Y.DATE.FIN : SEP : Y.SOLDE.FIN


    CANAL05 =  CANAL03  : CHARX(10) : CANAL04


*CANAL03 = "3": SEP : "SOLDE FIN" : SEP :  Y.FIN.DEBIT : SEP :  Y.FIN.CREDIT

    WRITESEQ CANAL05 TO FP.RELEVES ELSE
        TEXT = 'File Write Error Occurred During Writing LINE'
    END

    CLOSE FP.RELEVES
    RETURN
*
*------------------------------------------------------------------------
*
CHECK.NET.ENTRY:
*==============
*
* Check net entry, if not then form the concat list and return
*
    LOOP
        Y.CONCAT.REC.ID = Y.CONCAT.REC<1>

    UNTIL Y.CONCAT.REC.ID EQ '' DO
        DEL Y.CONCAT.REC<1>
        Y.ENTRY.ID = FIELD(Y.CONCAT.REC.ID,'*',2)
        Y.ENTRY.CHECK = COUNT(Y.ENTRY.ID,'!')
        IF Y.ENTRY.CHECK THEN
            GOSUB READ.STMT.ENTRY.DETAIL.XREF
        END ELSE
            R.STMT.ENTRY = ''
            YERR = ''
            CALL F.READ(YF.STMT.ENTRY,Y.ENTRY.ID,R.STMT.ENTRY,F.STMT.ENTRY,YERR)
            GOSUB BUILD.RETURN.LIST
        END
    REPEAT
    RETURN
*
*------------------------------------------------------------------------
*
BUILD.RETURN.LIST:
*=================

    IF R.STMT.ENTRY<AC.STE.AMOUNT.FCY> THEN
        Y.AMOUNT = R.STMT.ENTRY<AC.STE.AMOUNT.FCY>
    END ELSE
        Y.AMOUNT = R.STMT.ENTRY<AC.STE.AMOUNT.LCY>
    END

* KOLSI

    MK.ACC.CURR = FIELD(Y.CONCAT.REC.ID,"*",1)


    IF MK.ACC.CURR NE MK.ACC.OLD THEN

        NBRE.COMPTE = NBRE.COMPTE + 1

        IF NBRE.COMPTE GT 1 THEN

            Y.FIN.DEBIT = ""
            Y.FIN.CREDIT = ""

            Y.C3.SOLDE.FIN = Y.SOLDE.DEPART + Y.RUNNING.BAL
            Y.C3.SOLDE.FIN = FMT(Y.C3.SOLDE.FIN, V.FORMAT)

            IF Y.C3.SOLDE.FIN GE 0 THEN

                Y.FIN.CREDIT = Y.C3.SOLDE.FIN
                CHANGE '.' TO ',' IN Y.FIN.CREDIT

*--------------UPDATE 20100729--------------------

                Y.SOLDE.FIN = Y.FIN.CREDIT

*-------------------------------------------------


            END ELSE

                Y.FIN.DEBIT = Y.C3.SOLDE.FIN
                CHANGE '.' TO ',' IN Y.FIN.DEBIT

*--------------UPDATE 20100729--------------------


                Y.SOLDE.FIN =  Y.FIN.DEBIT

*-------------------------------------------------

            END



*CANAL03 = "3": SEP :  "SOLDE FIN" : SEP : Y.FIN.DEBIT : SEP :  Y.FIN.CREDIT

            Y.RUNNING.BAL.CRED = FMT(Y.RUNNING.BAL.CRED, V.FORMAT)
            Y.RUNNING.BAL.DEB = FMT(Y.RUNNING.BAL.DEB, V.FORMAT)

            CHANGE '.' TO ',' IN Y.RUNNING.BAL.CRED
            CHANGE '.' TO ',' IN Y.RUNNING.BAL.DEB

            CANAL03 = "3" : SEP : Y.RUNNING.BAL.DEB : SEP : Y.RUNNING.BAL.CRED

            CANAL04 = "4": SEP : Y.DATE.FIN : SEP : Y.SOLDE.FIN


            CANAL05 =  CANAL03  : CHARX(10) : CANAL04

            WRITESEQ CANAL05 TO FP.RELEVES ELSE
                TEXT = 'File Write Error Occurred During Writing LINE'
            END



        END


        MK.ACC.OLD = MK.ACC.CURR



        Y.MK.CURRENCY = ""
        Y.MK.RIB = ""
        Y.MK.CUS = ""
        V.FORMAT = ""
        V.NBRE = ""


        K.ACCOUNT = MK.ACC.CURR
        CALL F.READ(FN.ACCOUNT, K.ACCOUNT , R.ACCOUNT , F.ACCOUNT , E.ACCOUNT )
        IF E.ACCOUNT THEN
            RETURN
        END ELSE

            Y.MK.CURRENCY = R.ACCOUNT <AC.CURRENCY>
            Y.MK.RIB = R.ACCOUNT <AC.ALT.ACCT.ID>
            Y.MK.IBAN = "TN59" : SPACE(1) : Y.MK.RIB
            Y.MK.CUS = R.ACCOUNT <AC.CUSTOMER>

            Y.MK.NOM.COMPTE = R.ACCOUNT <AC.ACCOUNT.TITLE.1>


            Y.MK.ADRESSE = R.ACCOUNT <AC.LOCAL.REF,LR.ADR.POS>

* MODIF LE 28/02/2011

*            CONVERT @VM TO ' ' IN Y.MK.ADRESSE
*			CONVERT @SM TO ' ' IN Y.MK.ADRESSE
*            CONVERT ';' TO '.' IN Y.MK.ADRESSE
			CHANGE @VM TO ' ' IN Y.MK.ADRESSE
			CHANGE @SM TO ' ' IN Y.MK.ADRESSE
            CHANGE ';' TO '.' IN Y.MK.ADRESSE

* FIN MODIF

            Y.MK.CODE.POSTAL = R.ACCOUNT <AC.LOCAL.REF,LR.CODE.POSTAL.POS>
	
			Y.MK.CODE.POSTAL = FIELD(Y.MK.CODE.POSTAL,"-",1)
			
**************************
	SEL.LIST=''
	NO.OF.REC=''
	ERR0=''
    SEL.CMD="SELECT ":FN.CODE.POSTAL :" WITH KCPOST EQ ":Y.MK.CODE.POSTAL
    CALL EB.READLIST(SEL.CMD,SEL.LIST,"",NO.OF.REC,ERR0)
    IF SEL.LIST NE "" THEN
        REMOVE CP.ID FROM SEL.LIST SETTING POS

        CALL F.READ(FN.CODE.POSTAL,CP.ID,R.CODE.POSTAL,F.CODE.POSTAL,ERR1)

        IF ERR1 EQ "" THEN

            Y.MK.GOUVERNORAT=R.CODE.POSTAL<BZ.CP.LOCALITE>

        END ELSE
            *E = 'Code postale non existant en Tunisie'
            *CALL ERR

        END

    END

**************************
			
			
           * Y.MK.GOUVERNORAT= R.ACCOUNT <AC.LOCAL.REF,LR.BZ.GOUVERNORAT.POS>

*ZIT-UPG-R13-R19 S
*            CALL DBR('CURRENCY.PARAM':FM:EB.CUP.NO.OF.DECIMALS,Y.MK.CURRENCY,V.NBRE)
			
			R.CURRENCY.PARAM=''
			CUR.PAR.ERR=''
			CALL F.READ(FN.CURRENCY.PARAM,Y.MK.CURRENCY,R.CURRENCY.PARAM,F.CURRENCY.PARAM,CUR.PAR.ERR)
			IF R.CURRENCY.PARAM THEN
			V.NBRE=R.CURRENCY.PARAM<EB.CUP.NO.OF.DECIMALS>
			END
*ZIT-UPG-R13-R19 E
            V.FORMAT = "R" : V.NBRE

        END


        IF Y.MK.CUS NE '' THEN
            CANAL0 = "0" : SEP : Y.DATE.DEB : SEP : Y.DATE.FIN : SEP : Y.MK.RIB : SEP : Y.MK.CURRENCY :SEP : Y.MK.NOM.COMPTE :  SEP :Y.MK.ADRESSE : SEP : Y.MK.CODE.POSTAL : SEP : Y.MK.GOUVERNORAT : SEP : Y.MK.IBAN
            CANAL1 = '1' : SEP

            Y.SOLDE.DEPART = FIELD (Y.CONCAT.REC.ID,'*',3)

            Y.SOLDE.DEPART = FMT(Y.SOLDE.DEPART, V.FORMAT)




            Y.SOLDE.DEPART.DEBIT = ''
            Y.SOLDE.DEPART.CREDIT = ''

            IF Y.SOLDE.DEPART GE 0 THEN
                Y.SOLDE.DEPART.CREDIT  = Y.SOLDE.DEPART
                CHANGE '.' TO ',' IN Y.SOLDE.DEPART.CREDIT
            END ELSE

                Y.SOLDE.DEPART.DEBIT = Y.SOLDE.DEPART
                CHANGE '.' TO ',' IN Y.SOLDE.DEPART.DEBIT

            END



            CANAL2.0 = '2' : SEP : "SOLDE DEBUT" : SEP:  Y.SOLDE.DEPART.DEBIT : SEP : Y.SOLDE.DEPART.CREDIT
            CANAL01 = CANAL0 : CHARX(10) : CANAL1  : CHARX(10) : CANAL2.0
            WRITESEQ CANAL01 TO FP.RELEVES ELSE
                TEXT = 'File Write Error Occurred During Writing LINE'
            END
        END
        Y.NUM.PAGE = 1
        Y.COUNTER = 0
        Y.RUNNING.BAL = 0
        Y.RUNNING.BAL.DEB = 0
        Y.RUNNING.BAL.CRED = 0



    END


    Y.COUNTER = Y.COUNTER + 1
    Y.RUNNING.BAL= Y.RUNNING.BAL+ Y.AMOUNT
    Y.RUNNING.BAL = FMT(Y.RUNNING.BAL, V.FORMAT)

    IF Y.AMOUNT LT 0 THEN

        Y.RUNNING.BAL.DEB= Y.RUNNING.BAL.DEB +  Y.AMOUNT
        Y.RUNNING.BAL.DEB = FMT(Y.RUNNING.BAL.DEB, V.FORMAT)

    END ELSE

        Y.RUNNING.BAL.CRED= Y.RUNNING.BAL.CRED +  Y.AMOUNT
        Y.RUNNING.BAL.CRED = FMT(Y.RUNNING.BAL.CRED, V.FORMAT)

    END

* FIN KOLSI




*   IF DCOUNT(Y.CONCAT.REC.ID,'*') EQ 5 THEN
*      Y.CONCAT.REC.SEP.ID<-1> = Y.CONCAT.REC.ID:'*':R.STMT.ENTRY<AC.STE.TRANS.REFERENCE>:'*':Y.AMOUNT
*  END ELSE
*      Y.CONCAT.REC.SEP.ID<-1> = Y.CONCAT.REC.ID:'***':R.STMT.ENTRY<AC.STE.TRANS.REFERENCE>:'*':Y.AMOUNT
* END

* KOLSI

    IF DCOUNT(Y.CONCAT.REC.ID,'*') EQ 5 THEN



        Y.CONCAT.REC.SEP.ID<-1> = Y.CONCAT.REC.ID:'*':R.STMT.ENTRY<AC.STE.TRANS.REFERENCE>:'*':Y.AMOUNT : '*' : Y.RUNNING.BAL : '*' : Y.NUM.PAGE
    END ELSE
        Y.CONCAT.REC.SEP.ID<-1> = Y.CONCAT.REC.ID:'***' :R.STMT.ENTRY<AC.STE.TRANS.REFERENCE>:'*':Y.AMOUNT : '*' : Y.RUNNING.BAL : '*' : Y.NUM.PAGE


    END

    Y.C2.DEBIT = SPACE(1)
    Y.C2.CREDIT = SPACE(1)



    IF Y.AMOUNT GT 0 THEN

        Y.C2.CREDIT  = Y.AMOUNT
        Y.C2.CREDIT = FMT(Y.C2.CREDIT, V.FORMAT)

        CHANGE '.' TO ',' IN Y.C2.CREDIT
    END ELSE
        Y.C2.DEBIT = Y.AMOUNT
		
        Y.C2.DEBIT = FMT(Y.C2.DEBIT, V.FORMAT)

        CHANGE '.' TO ',' IN Y.C2.DEBIT

    END


    Y.C2.BOOKING.DATE = R.STMT.ENTRY<AC.STE.BOOKING.DATE>

    Y.C2.LIBELLE.CODE = R.STMT.ENTRY<AC.STE.TRANSACTION.CODE>

* LIBELLE

    K.TRANSACTION = Y.C2.LIBELLE.CODE
    CALL F.READ(FN.TRANSACTION, K.TRANSACTION , R.TRANSACTION , F.TRANSACTION , E.TRANSACTION )
    IF E.TRANSACTION THEN
        RETURN
    END ELSE

        Y.C2.LIBELLE = R.TRANSACTION <AC.TRA.NARRATIVE,1,1>




*FIN LIBELLE





        Y.C2.NARRATIVE =  R.STMT.ENTRY<AC.STE.NARRATIVE,1,1>

        IF Y.C2.NARRATIVE EQ '' THEN
            Y.C2.NARRATIVE =  R.STMT.ENTRY<AC.STE.THEIR.REFERENCE,1,1>
        END

        Y.C2.DATE.VALEUR = R.STMT.ENTRY<AC.STE.VALUE.DATE>



        Y.C2.SOLDE= Y.SOLDE.DEPART + Y.RUNNING.BAL

        Y.C2.SOLDE = FMT(Y.C2.SOLDE, V.FORMAT)


        Y.C2.NUM.PAGE = Y.NUM.PAGE

        CHANGE '.' TO ',' IN Y.C2.SOLDE

*CANAL2=  Y.CONCAT.REC.ID:'***' :R.STMT.ENTRY<AC.STE.TRANS.REFERENCE>:'*':Y.AMOUNT : '*' : Y.RUNNING.BAL : '*' : Y.NUM.PAGE



*--------------UPDATE 20100729--------------------
*CANAL2.1 = "2" : SEP : Y.C2.BOOKING.DATE : SEP : UPCASE(Y.C2.LIBELLE) : SEP : Y.C2.DATE.VALEUR : SEP: Y.C2.DEBIT  : SEP : Y.C2.CREDIT : SEP : Y.C2.SOLDE : SEP : Y.C2.NUM.PAGE
*CANAL2.2 = "2" : SEP : "" : SEP : UPCASE(Y.C2.NARRATIVE) : SEP : "" : SEP: ""  : SEP : "" : SEP : "" : SEP : Y.C2.NUM.PAGE

        CANAL2.1 = "2" : SEP : Y.C2.BOOKING.DATE : SEP : UPCASE(Y.C2.LIBELLE) : SPACE(2) : UPCASE(Y.C2.NARRATIVE) : SEP : Y.C2.DATE.VALEUR : SEP: Y.C2.DEBIT  : SEP : Y.C2.CREDIT : SEP : Y.C2.NUM.PAGE


*-------------------------------------------------



* CANAL2 = CANAL2.1 : CHARX(10) : CANAL2.2

        CANAL2 = CANAL2.1

        WRITESEQ CANAL2 TO FP.RELEVES ELSE
            TEXT = 'File Write Error Occurred During Writing LINE'
        END

        IF Y.COUNTER EQ Y.NUMBER.LIGNE THEN

            Y.NUM.PAGE = Y.NUM.PAGE + 1

            Y.COUNTER = 0

        END

*MK.ACC.OLD = MK.ACC.CURR

* FIN KOLSI


        RETURN
*
*------------------------------------------------------------------------
*
READ.STMT.ENTRY.DETAIL.XREF:
*==========================
*
* Remove the id from list and read the record from stmt.entry.detail.xref file
*
        STMT.CNT = 1
        LOOP
            STMT.XREF.ID = Y.ENTRY.ID:'-':STMT.CNT
            R.STMT.ENTRY.DETAIL.XREF = ''
            YERR = ''
            CALL F.READ(FN.STMT.ENTRY.DETAIL.XREF, STMT.XREF.ID, R.STMT.ENTRY.DETAIL.XREF, F.STMT.ENTRY.DETAIL.XREF, YERR)
        WHILE NOT(YERR)
            STMT.CNT + = 1
            GOSUB READ.STMT.ENTRY.DETAIL
        REPEAT

        RETURN
*------------------------------------------------------------------------
*
READ.STMT.ENTRY.DETAIL:
*=====================
*
* Remove the id from list and read the record from stmt.entry.detail file
*
        LOOP
            REMOVE STMT.ENTRY.DETAIL.ID FROM R.STMT.ENTRY.DETAIL.XREF SETTING POS
        WHILE STMT.ENTRY.DETAIL.ID:POS
            R.STMT.ENTRY = ''
            YERR = ''
            CALL F.READ(FN.STMT.ENTRY.DETAIL,STMT.ENTRY.DETAIL.ID,R.STMT.ENTRY,F.STMT.ENTRY.DETAIL,YERR)
            GOSUB BUILD.RETURN.LIST
        REPEAT

        RETURN
*
*------------------------------------------------------------------------
*
OPEN.REQD.FILES:
*===============
*
*		FN.ACCOUNT='F.ACCOUNT'
*        F.ACCOUNT = ''
*        CALL OPF(FN.ACCOUNT,F.ACCOUNT)  ;*ALREADY CALLED
*
        FN.COMP.SMS.GRP='F.COMPANY.SMS.GROUP'
		F.COMP.SMS.GRP = ''
        CALL OPF(FN.COMP.SMS.GRP,F.COMP.SMS.GRP)
*
		FN.ACCT.STMT.PRINT = 'F.ACCT.STMT.PRINT'
        F.ACCT.STMT.PRINT = ''
        CALL OPF(FN.ACCT.STMT.PRINT,F.ACCT.STMT.PRINT)
*
        FN.ACCT.STMT2.PRINT = 'F.ACCT.STMT2.PRINT'
		F.ACCT.STMT2.PRINT = ''
        CALL OPF(FN.ACCT.STMT2.PRINT,F.ACCT.STMT2.PRINT)
*
		FN.STMT2.PRINTED = 'F.STMT2.PRINTED'
        F.STMT2.PRINTED = ''
        CALL OPF(FN.STMT2.PRINTED,F.STMT2.PRINTED)
*
        FN.STMT.PRINTED = 'F.STMT.PRINTED'
		F.STMT.PRINTED = ''
		YENTRY.IDS=''
		ERR.STMT.PRINT=''
        CALL OPF(FN.STMT.PRINTED,F.STMT.PRINTED)
*
		FN.ACCOUNT.STATEMENT = 'F.ACCOUNT.STATEMENT'
        F.ACCOUNT.STATEMENT = ''
        CALL OPF(FN.ACCOUNT.STATEMENT,F.ACCOUNT.STATEMENT)
*
        FN.ACCOUNT.STATEMENT$HIS = 'F.ACCOUNT.STATEMENT$HIS'
		F.ACCOUNT.STATEMENT$HIS = ''
        CALL OPF(FN.ACCOUNT.STATEMENT$HIS,F.ACCOUNT.STATEMENT$HIS)
*
        YF.STMT.ENTRY = "F.STMT.ENTRY"
        F.STMT.ENTRY = ""
		R.ENTRY=""
		ERR.ENTRY=""
        CALL OPF(YF.STMT.ENTRY,F.STMT.ENTRY)
*
        FN.STMT.ENTRY.DETAIL.XREF = 'F.STMT.ENTRY.DETAIL.XREF'
        F.STMT.ENTRY.DETAIL.XREF = ''
        CALL OPF(FN.STMT.ENTRY.DETAIL.XREF,F.STMT.ENTRY.DETAIL.XREF)
*
        FN.STMT.ENTRY.DETAIL = 'F.STMT.ENTRY.DETAIL'
        F.STMT.ENTRY.DETAIL = ''
        CALL OPF(FN.STMT.ENTRY.DETAIL,F.STMT.ENTRY.DETAIL)
*
        FN.FWD.STMT1.PRINTED = 'F.FWD.STMT1.PRINTED'
		F.FWD.STMT1.PRINTED = ''
        CALL OPF(FN.FWD.STMT1.PRINTED, F.FWD.STMT1.PRINTED)

		FN.FWD.STMT2.PRINTED='F.FWD.STMT2.PRINTED'
        F.FWD.STMT2.PRINTED = ''
        CALL OPF(FN.FWD.STMT2.PRINTED,F.FWD.STMT2.PRINTED)
		
		FN.AC.STMT.PARAMETER='F.AC.STMT.PARAMETER'
		R.AC.STMT.PARAMETER=''
		E.AC.STMT.PARAMETER=''
		
        FWD.MVMT.FLAG = "" ; STMT.DATE.FIELD = "" ; FWD.STMT.LIST = "" ; FWD.STMT1.LIST = "" ; FWD.STMT2.LIST = ""
        FWD.MVMT.REQD = ""
        IF R.ACCOUNT.PARAMETER<AC.PAR.VALUE.DATED.ACCTNG> EQ 'Y' THEN
*            CALL DBR('AC.STMT.PARAMETER':FM:AC.STP.FWD.MVMT.REQD,'SYSTEM',FWD.MVMT.REQD)
			Y.AC.STMT.PARAMETER.ID='SYSTEM'
			CALL CACHE.READ(FN.AC.STMT.PARAMETER,Y.AC.STMT.PARAMETER.ID,R.AC.STMT.PARAMETER,E.AC.STMT.PARAMETER)
            IF R.AC.STMT.PARAMETER THEN
			FWD.MVMT.REQD=R.AC.STMT.PARAMETER<AC.STP.FWD.MVMT.REQD>
			END
			IF FWD.MVMT.REQD THEN
                FWD.MVMT.FLAG = 1       ;* Set forward movement flag
            END
        END

        RETURN
*
*------------------------------------------------------------------------
*
*
*------------------------------------------------------------------------
*
LIST.ACCT.NOS:
*=============
        YACCT.LIST = ""
        YOPERAND = D.LOGICAL.OPERANDS<YACCOUNT.POS>
        YENQ.LIST = D.RANGE.AND.VALUE<YACCOUNT.POS>
*
        IF YOPERAND EQ 1 AND YENQ.LIST NE "ALL" THEN
            YACCT.LIST = YENQ.LIST
*            CONVERT SM TO FM IN YACCT.LIST
			CHANGE @SM TO @FM IN YACCT.LIST
            RETURN
        END
*
*    modification majed 21/06/2010
* YACCT.ID.LIST = DAS.ACCOUNT$BY.ID
*  THE.ARGS = ''
*   TABLE.SUFFIX = ''
*    CALL DAS ('ACCOUNT', YACCT.ID.LIST, THE.ARGS, TABLE.SUFFIX)
 *       SQL.STATEMENT = 'SSELECT FBNK.ACCOUNT WITH CATEGORY NE 1010 AND CATEGORY GE 1000 AND CATEGORY LE 1999'
        Y.ACCT.ID.LIST=''
		SQL.STATEMENT = 'SSELECT FBNK.ACCOUNT WITH CATEGORY EQ 6010'
        CALL EB.READLIST(SQL.STATEMENT, YACCT.ID.LIST, '', '', '')
        GOSUB MATCH.RANGE
        RETURN
*
        ON YOPERAND GOSUB MATCH.EQUAL,
        MATCH.RANGE,
        MATCH.LESS.THAN,
        MATCH.GREATER.THAN,
        MATCH.NOT,
        MATCH.LIKE,
        MATCH.UNLIKE,
        MATCH.LE,
        MATCH.GE,
        MATCH.NR
        RETURN
*
*-----------------------------------------------------------------------
*
MATCH.EQUAL:
*===========
*
* For ALL Accounts
*
        YACCT.LIST = YACCT.ID.LIST
        RETURN
*
MATCH.RANGE:
*===========
        Y.END = ""
        LOOP
            YACC = YACCT.ID.LIST<1>
            YACC1 = TRIM(YACC,'0','L')
            BORN1 = YENQ.LIST<1,1,1>
            BORN2 = YENQ.LIST<1,1,2>
        UNTIL YACC EQ "" OR Y.END EQ "END" DO
            DEL YACCT.ID.LIST<1>
            IF YACC1 GE YENQ.LIST<1,1,1> AND YACC1 LE YENQ.LIST<1,1,2> THEN
                IF YACCT.LIST THEN
                    YACCT.LIST := @FM:YACC
                END ELSE
                    YACCT.LIST = YACC
                END
            END ELSE
                IF YACC1 GT YENQ.LIST<1,1,2> THEN
                    Y.END = "END"
                END
            END
        REPEAT
        RETURN
*
MATCH.LESS.THAN:
*===============
        Y.END = ""
        LOOP
            YACC = YACCT.ID.LIST<1>
        UNTIL YACC EQ "" OR Y.END EQ "END" DO
            DEL YACCT.ID.LIST<1>
            IF YACC LT YENQ.LIST<1,1,1> THEN
                IF YACCT.LIST THEN
                    YACCT.LIST := @FM:YACC
                END ELSE
                    YACCT.LIST = YACC
                END
            END ELSE
                Y.END = "END"
            END
        REPEAT
        RETURN
*
MATCH.GREATER.THAN:
*==================
        Y.END = ""
        LOOP
            YACC = YACCT.ID.LIST<1>
        UNTIL YACC EQ "" OR Y.END EQ "END" DO
            IF YACC GT YENQ.LIST<1,1,1> THEN
                YACCT.LIST = YACCT.ID.LIST
                Y.END = "END"
            END ELSE
                DEL YACCT.ID.LIST<1>
            END
        REPEAT
        RETURN
*
MATCH.NOT:
*=========
        LOOP
            YACC = YACCT.ID.LIST<1>
        UNTIL YACC EQ "" DO
            LOCATE YACC IN YENQ.LIST<1,1,1> SETTING YAC.LOC ELSE
                IF YACCT.LIST THEN
                    YACCT.LIST := @FM:YACC
                END ELSE
                    YACCT.LIST = YACC
                END
            END
            DEL YACCT.ID.LIST<1>
        REPEAT
        RETURN
*
MATCH.LIKE:
*==========
        LOOP
            YACC = YACCT.ID.LIST<1>
        UNTIL YACC EQ "" DO
            IF INDEX(YACC,YENQ.LIST<1,1>,1) GT 0 THEN
                IF YACCT.LIST THEN
                    YACCT.LIST := @FM:YACC
                END ELSE
                    YACCT.LIST = YACC
                END
            END
            DEL YACCT.ID.LIST<1>
        REPEAT
        RETURN
*
MATCH.UNLIKE:
*============
        LOOP
            YACC = YACCT.ID.LIST<1>
        UNTIL YACC EQ "" DO
            IF INDEX(YACC,YENQ.LIST<1,1>,1) EQ 0 THEN
                IF YACCT.LIST THEN
                    YACCT.LIST := @FM:YACC
                END ELSE
                    YACCT.LIST = YACC
                END
            END
            DEL YACCT.ID.LIST<1>
        REPEAT
        RETURN
*
MATCH.LE:
*========
        Y.END = ""
        LOOP
            YACC = YACCT.ID.LIST<1>
        UNTIL YACC EQ "" OR Y.END EQ "END" DO
            DEL YACCT.ID.LIST<1>
            IF YACC LE YENQ.LIST<1,1,1> THEN
                IF YACCT.LIST THEN
                    YACCT.LIST := @FM:YACC
                END ELSE
                    YACCT.LIST = YACC
                END
            END ELSE
                Y.END = "END"
            END
        REPEAT
        RETURN
*
MATCH.GE:
*========
        Y.END = ""
        LOOP
            YACC = YACCT.ID.LIST<1>
        UNTIL YACC EQ "" OR Y.END EQ "END" DO
            IF YACC GE YENQ.LIST<1,1,1> THEN
                YACCT.LIST = YACCT.ID.LIST
                Y.END = "END"
            END ELSE
                DEL YACCT.ID.LIST<1>
            END
        REPEAT
        RETURN
*
MATCH.NR:
*======== 
        LOOP
            YACC = YACCT.ID.LIST<1>
        UNTIL YACC EQ ""
            DEL YACCT.ID.LIST<1>
            IF YACC LE YENQ.LIST<1,1,1> OR YACC GE YENQ.LIST<1,1,2> THEN
                IF YACCT.LIST THEN
                    YACCT.LIST := @FM:YACC
                END ELSE
                    YACCT.LIST = YACC
                END
            END
        REPEAT
        RETURN
*
*-----------------------------------------------------------------------
*
*-----------------------------------------------------------------------
*
MATCH.DATE.EQUAL:
*================
*
* There may be more than 1 date in the list
*
        YSTORE.BAL.DATE = ''
        IF YSTORE.BAL.DATE EQ '' THEN
            YSTORE.BAL.DATE = YR.ACCOUNT.STATEMENT<AC.STA.FQU1.LAST.DATE>
        END
        YENQ.LIST = YENQ.LIST
        LOOP
*
* Get the booking date from the list specified
*
            REMOVE YBOOK.DATE FROM YENQ.LIST SETTING YCODE
        UNTIL YBOOK.DATE EQ ''
*
* Find the date nearest to the BOOKING DATE in ACCT.STMT.PRINTED
*
            Y.DATE = YBOOK.DATE
            LOCATE Y.DATE IN YACCT.STMT.DATES<1> BY 'AR' SETTING YPOS ELSE
                NULL
            END
            IF YACCT.STMT.DATES<YPOS> EQ '' THEN
* Existing code to refer fqu-2 if the relationship is combined is
* removed since each frequency is made independent and relationship
* field is made obsolate.

                GOSUB GET.ENTRIES
*
* Enquiry is for entries since the last statement, get entries from
* ACCT.STMT.ENTRY
*
            END ELSE
                IF YACCT.STMT.DATES<YPOS> LT YSTORE.BAL.DATE OR YSTORE.BAL.DATE EQ '' THEN
                    YSTORE.BAL.DATE = YACCT.STMT.DATES<YPOS>
                    YOPEN.BAL = YACCT.STMT.BAL<YPOS>
                    YOPEN.BAL = SUM(YOPEN.BAL)
                END

                IF YACCT.STMT.DATES<YPOS> EQ "PASSBOOK" THEN
                    GOSUB GET.LAST.PRINT.BAL
                END ELSE
                    YOPEN.BAL = YACCT.STMT.BAL<YPOS>
                END
*
* Use this date to read the STMT.PRINTED record
*
                LOOP
                    GOSUB READ.ENTRY.IDS
                    GOSUB GET.ENTRIES.EQ
                    YPOS +=1
                UNTIL YACCT.STMT.DATES<YPOS> EQ ''
                REPEAT
            END

            GOSUB GET.ENTRIES.EQ
*
        REPEAT
        RETURN
*
GET.ENTRIES.EQ:
*==============
        Y.END = ""
        LOOP
*
* Read in each entry and check the booking date against the chosen date
* THIS CAN BE MODIFIED TO FIND THE OPENING BALANCE
*
            REMOVE YENTRY.ID FROM YR.ENTRY.FILE SETTING YTYPE
        UNTIL YENTRY.ID EQ '' OR Y.END EQ "END"
            GOSUB READ.ENTRY
            IF YR.STMT.ENTRY THEN
                IF YR.STMT.ENTRY<AC.STE.BOOKING.DATE> EQ YBOOK.DATE THEN
                    ENTRY.FOUND = 1
                    IF Y.CONCAT.REC THEN
                        Y.CONCAT.REC := @FM:Y.AC.NO:"*":YENTRY.ID:"*":YOPEN.BAL
                    END ELSE
                        Y.CONCAT.REC = Y.AC.NO:"*":YENTRY.ID:"*":YOPEN.BAL
                    END
                END ELSE
                    IF YR.STMT.ENTRY<AC.STE.BOOKING.DATE> GT YBOOK.DATE THEN
                        Y.END = "END"
                    END ELSE
                        GOSUB OPENING.BALANCE
                    END
                END
            END
        REPEAT
        IF SORT.FLD EQ "BOOKING.DATE" THEN
            GOSUB SORT.ENT.BY.BOOKING.DATE
        END
        RETURN
*
*-----------------------------------------------------------------------
*
MATCH.DATE.RANGE:
*================
*
        YSTART.DATE = YENQ.LIST<1,1>
        IF YENQ.LIST<1,2> NE '' THEN
            YEND.DATE = YENQ.LIST<1,2>
        END ELSE
            YEND.DATE = YSTART.DATE
        END
        Y.END = ""
        LOCATE YSTART.DATE IN YACCT.STMT.DATES<1> BY 'AR' SETTING YPOS ELSE
            NULL
        END
        IF YACCT.STMT.DATES<YPOS> EQ '' THEN
            Y.DATE = YSTART.DATE
            GOSUB GET.ENTRIES
        END ELSE
            IF YACCT.STMT.DATES<YPOS> EQ "PASSBOOK" THEN
                GOSUB GET.LAST.PRINT.BAL
            END ELSE
                YOPEN.BAL = YACCT.STMT.BAL<YPOS>
            END
            LOOP
                GOSUB READ.ENTRY.IDS
                GOSUB GET.ENTRIES.RG
                YPOS += 1
            UNTIL YACCT.STMT.DATES<YPOS> EQ '' OR Y.END EQ "END"
            REPEAT
            IF Y.END EQ '' THEN
                GOSUB GET.ENTRIES.RG
            END
        END
        RETURN
*
GET.ENTRIES.RG:
*==============
        LOOP
            REMOVE YENTRY.ID FROM YR.ENTRY.FILE SETTING YCODE
        UNTIL YENTRY.ID EQ '' OR Y.END EQ 'END'
            GOSUB READ.ENTRY
            IF YR.STMT.ENTRY THEN
                IF YR.STMT.ENTRY<AC.STE.BOOKING.DATE> GT YEND.DATE THEN
                    Y.END = 'END'
                END ELSE
                    IF YR.STMT.ENTRY<AC.STE.BOOKING.DATE> GE YSTART.DATE THEN
                        ENTRY.FOUND = 1
                        IF Y.CONCAT.REC THEN
                            Y.CONCAT.REC := @FM:Y.AC.NO:"*":YENTRY.ID:"*":YOPEN.BAL
                        END ELSE
                            Y.CONCAT.REC = Y.AC.NO:"*":YENTRY.ID:"*":YOPEN.BAL
                        END
                    END ELSE
                        GOSUB OPENING.BALANCE
                    END
                END
            END
        REPEAT
        IF SORT.FLD EQ "BOOKING.DATE" THEN
            GOSUB SORT.ENT.BY.BOOKING.DATE
        END
        RETURN
*
*-----------------------------------------------------------------------
*
MATCH.DATE.LESS.THAN:
*====================
*
        IF YACCT.STMT.DATES EQ "" THEN
            GOSUB GET.LAST.PRINT.BAL
            GOSUB GET.ENTRIES.LT
        END ELSE
            LOCATE YENQ.LIST<1,1> IN YACCT.STMT.DATES<1> BY 'AR' SETTING YCOUNT ELSE
                NULL
            END
            YOPEN.BAL = YACCT.STMT.BAL<1>
            FOR YPOS = 1 TO YCOUNT
                GOSUB READ.ENTRY.IDS
                IF YCOUNT NE YPOS THEN
                    GOSUB EXTRACT.ENTRY.IDS
                END ELSE
                    GOSUB GET.ENTRIES.LT
                END
            NEXT YPOS
        END
        RETURN
*
GET.ENTRIES.LT:
*==============
        Y.END = ""
        LOOP
            REMOVE YENTRY.ID FROM YR.ENTRY.FILE SETTING YCODE
        UNTIL YENTRY.ID EQ "" OR Y.END EQ "END"
            GOSUB READ.ENTRY
            IF YR.STMT.ENTRY NE '' THEN
                IF YR.STMT.ENTRY<AC.STE.BOOKING.DATE> LT YENQ.LIST<1,1> THEN
                    ENTRY.FOUND = 1
                    IF Y.CONCAT.REC THEN
                        Y.CONCAT.REC := @FM:Y.AC.NO:"*":YENTRY.ID:"*":YOPEN.BAL
                    END ELSE
                        Y.CONCAT.REC = Y.AC.NO:"*":YENTRY.ID:"*":YOPEN.BAL
                    END
                END ELSE
                    Y.END = "END"
                END
            END
        REPEAT
        IF SORT.FLD EQ "BOOKING.DATE" THEN
            GOSUB SORT.ENT.BY.BOOKING.DATE
        END
        RETURN
*
*-----------------------------------------------------------------------
*
MATCH.DATE.NOT:
*==============
*
        IF YACCT.STMT.DATES<1> EQ "" THEN
            GOSUB GET.LAST.PRINT.BAL
        END ELSE
            YOPEN.BAL = YACCT.STMT.BAL<1>
        END
        YNO.STMTS = COUNT(YACCT.STMT.DATES,@FM) + (YACCT.STMT.DATES NE '')
        FOR YPOS = 1 TO YNO.STMTS
            GOSUB READ.ENTRY.IDS
            GOSUB GET.ENTRIES.NOT
        NEXT YPOS
        GOSUB GET.ENTRIES.NOT
        RETURN
*
GET.ENTRIES.NOT:
*===============
*
        LOOP
            REMOVE YENTRY.ID FROM YR.ENTRY.FILE SETTING YCODE
        UNTIL YENTRY.ID EQ ''
            GOSUB READ.ENTRY
            IF YR.STMT.ENTRY THEN
                LOCATE YR.STMT.ENTRY<AC.STE.BOOKING.DATE> IN YENQ.LIST<1,1> SETTING YCOUNT ELSE
                    ENTRY.FOUND = 1
                    IF Y.CONCAT.REC THEN
                        Y.CONCAT.REC := @FM:Y.AC.NO:"*":YENTRY.ID:"*":YOPEN.BAL
                    END ELSE
                        Y.CONCAT.REC = Y.AC.NO:"*":YENTRY.ID:"*":YOPEN.BAL
                    END
                END
            END
        REPEAT
        IF SORT.FLD EQ "BOOKING.DATE" THEN
            GOSUB SORT.ENT.BY.BOOKING.DATE
        END
        RETURN
*
*-----------------------------------------------------------------------
*
MATCH.DATE.LIKE:
*===============
*
        RETURN
*
MATCH.DATE.UNLIKE:
*=================
*
        RETURN
*
*-----------------------------------------------------------------------
*
*-----------------------------------------------------------------------
*
MATCH.DATE.LE:
*=============
*
        IF YACCT.STMT.DATES EQ "" THEN
            GOSUB GET.LAST.PRINT.BAL
            GOSUB GET.ENTRIES.LE
        END ELSE
            YLE.DATE = YENQ.LIST<1,1> + 1
            LOCATE YLE.DATE IN YACCT.STMT.DATES<1> BY 'AR' SETTING YCOUNT ELSE
                NULL
            END
            YOPEN.BAL = YACCT.STMT.BAL<1>
            FOR YPOS = 1 TO YCOUNT
                GOSUB READ.ENTRY.IDS
                IF YCOUNT NE YPOS THEN
                    GOSUB EXTRACT.ENTRY.IDS
                END ELSE
                    GOSUB GET.ENTRIES.LE
                END
            NEXT YPOS
        END
        RETURN
*
GET.ENTRIES.LE:
*==============
*
        Y.END = ""
        LOOP
            REMOVE YENTRY.ID FROM YR.ENTRY.FILE SETTING YCODE
        UNTIL YENTRY.ID EQ "" OR Y.END EQ "END"
            GOSUB READ.ENTRY
            IF YR.STMT.ENTRY NE '' THEN
                IF YR.STMT.ENTRY<AC.STE.BOOKING.DATE> LE YENQ.LIST<1,1> THEN
                    ENTRY.FOUND = 1
                    IF Y.CONCAT.REC THEN
                        Y.CONCAT.REC := @FM:Y.AC.NO:"*":YENTRY.ID:"*":YOPEN.BAL
                    END ELSE
                        Y.CONCAT.REC = Y.AC.NO:"*":YENTRY.ID:"*":YOPEN.BAL
                    END
                END ELSE
                    Y.END = "END"
                END
            END
        REPEAT
        IF SORT.FLD EQ "BOOKING.DATE" THEN
            GOSUB SORT.ENT.BY.BOOKING.DATE
        END
        RETURN
*
*-----------------------------------------------------------------------
*
MATCH.DATE.GREATER.THAN:
*=======================
*
        Y.DATE = YENQ.LIST<1,1> + 1
        LOCATE Y.DATE IN YACCT.STMT.DATES<1> BY 'AR' SETTING YPOS ELSE
            NULL
        END
        IF YACCT.STMT.DATES<YPOS> EQ "" THEN
            GOSUB GET.ENTRIES
        END ELSE
            IF YACCT.STMT.DATES<YPOS> EQ "PASSBOOK" THEN
                GOSUB GET.LAST.PRINT.BAL
            END ELSE
                YOPEN.BAL = YACCT.STMT.BAL<YPOS>
            END
            YCOUNT = YPOS
            LOOP
                GOSUB READ.ENTRY.IDS
                IF YCOUNT NE YPOS THEN
                    GOSUB EXTRACT.ENTRY.IDS
                END ELSE
                    GOSUB GET.ENTRIES.GT
                END
                YPOS += 1
            UNTIL YACCT.STMT.DATES<YPOS> EQ ""
            REPEAT
        END
        GOSUB GET.ENTRIES.GT
        RETURN
*
GET.ENTRIES.GT:
*==============
*
        LOOP
            REMOVE YENTRY.ID FROM YR.ENTRY.FILE SETTING YCODE
        UNTIL YENTRY.ID EQ ""
            GOSUB READ.ENTRY
            IF YR.STMT.ENTRY THEN
                IF YR.STMT.ENTRY<AC.STE.BOOKING.DATE> GT YENQ.LIST<1,1> THEN
                    ENTRY.FOUND = 1
                    IF Y.CONCAT.REC THEN
                        Y.CONCAT.REC := @FM:Y.AC.NO:"*":YENTRY.ID:"*":YOPEN.BAL
                    END ELSE
                        Y.CONCAT.REC = Y.AC.NO:"*":YENTRY.ID:"*":YOPEN.BAL
                    END
                END ELSE
                    GOSUB OPENING.BALANCE
                END
            END
        REPEAT
        IF SORT.FLD EQ "BOOKING.DATE" THEN
            GOSUB SORT.ENT.BY.BOOKING.DATE
        END
        RETURN
*
*-----------------------------------------------------------------------
*
MATCH.DATE.GE:
*=============
*
        LOCATE YENQ.LIST<1,1> IN YACCT.STMT.DATES<1> BY 'AR' SETTING YPOS ELSE
            NULL
        END
        IF YACCT.STMT.DATES<YPOS> EQ "" THEN
            Y.DATE = YENQ.LIST<1,1>
            GOSUB GET.ENTRIES
        END ELSE
            IF YACCT.STMT.DATES<YPOS> EQ "PASSBOOK" THEN
                GOSUB GET.LAST.PRINT.BAL
            END ELSE
                YOPEN.BAL = YACCT.STMT.BAL<YPOS>
                YOPEN.BAL = SUM(YOPEN.BAL)
            END
            YCOUNT = YPOS
            LOOP
                GOSUB READ.ENTRY.IDS
                IF YCOUNT NE YPOS THEN
                    GOSUB EXTRACT.ENTRY.IDS
                END ELSE
                    GOSUB GET.ENTRIES.GE
                END
                YPOS += 1
            UNTIL YACCT.STMT.DATES<YPOS> EQ ""
            REPEAT
        END
        GOSUB GET.ENTRIES.GE
        RETURN
*
GET.ENTRIES.GE:
*==============
*
        LOOP
            REMOVE YENTRY.ID FROM YR.ENTRY.FILE SETTING YCODE
        UNTIL YENTRY.ID EQ ""
            GOSUB READ.ENTRY
            IF YR.STMT.ENTRY THEN
                IF YR.STMT.ENTRY<AC.STE.BOOKING.DATE> GE YENQ.LIST<1,1> THEN
                    ENTRY.FOUND = 1
                    IF Y.CONCAT.REC THEN
                        Y.CONCAT.REC := @FM:Y.AC.NO:"*":YENTRY.ID:"*":YOPEN.BAL:"*":YR.STMT.ENTRY<AC.STE.BOOKING.DATE>:'*'
                    END ELSE
                        Y.CONCAT.REC = Y.AC.NO:"*":YENTRY.ID:"*":YOPEN.BAL:"*":YR.STMT.ENTRY<AC.STE.BOOKING.DATE>:'*'
                    END
                END ELSE
                    GOSUB OPENING.BALANCE
                END
            END
        REPEAT
        IF SORT.FLD EQ "BOOKING.DATE" THEN
            GOSUB SORT.ENT.BY.BOOKING.DATE
        END
        RETURN
*
*-----------------------------------------------------------------------
*
MATCH.DATE.NR:
*=============
*
        YSTART.DATE = YENQ.LIST<1,1>
        IF YENQ.LIST<1,2> NE '' THEN
            YEND.DATE = YENQ.LIST<1,2> + 1
        END ELSE
            YEND.DATE = YENQ.LIST<1,1> + 1
        END
        IF YACCT.STMT.DATES EQ "" THEN
            GOSUB GET.LAST.PRINT.BAL
        END ELSE
            LOCATE YSTART.DATE IN YACCT.STMT.DATES<1> BY 'AR' SETTING YCOUNT ELSE
                NULL
            END
            YOPEN.BAL = YACCT.STMT.BAL<1>
            YCOUNT -= 1
            FOR YPOS = 1 TO YCOUNT
                GOSUB READ.ENTRY.IDS
                GOSUB EXTRACT.ENTRY.IDS
            NEXT YPOS
            YPOS = YCOUNT + 1
            GOSUB READ.ENTRY.IDS
            GOSUB GET.ENTRIES.NR.PRE
            LOCATE YEND.DATE IN YACCT.STMT.DATES<1> BY 'AR' SETTING YPOS ELSE
                NULL
            END
            GOSUB READ.ENTRY.IDS
            GOSUB GET.ENTRIES.NR.POST
            YPOS += 1
            LOOP
            UNTIL YACCT.STMT.DATES<YPOS> EQ ''
                GOSUB READ.ENTRY.IDS
                GOSUB EXTRACT.ENTRY.IDS
                YPOS += 1
            REPEAT
        END
        GOSUB GET.ENTRIES.NR.PRE
        GOSUB GET.ENTRIES.NR.POST
        RETURN
*
GET.ENTRIES.NR.PRE:
*==================
*
        Y.END = ''
        LOOP
            REMOVE YENTRY.ID FROM YR.ENTRY.FILE SETTING YCODE
        UNTIL YENTRY.ID EQ '' OR Y.END EQ 'END'
            GOSUB READ.ENTRY
            IF YR.STMT.ENTRY THEN
                IF YR.STMT.ENTRY<AC.STE.BOOKING.DATE> LT YSTART.DATE THEN
                    ENTRY.FOUND = 1
                    IF Y.CONCAT.REC THEN
                        Y.CONCAT.REC := @FM:Y.AC.NO:"*":YENTRY.ID:"*":YOPEN.BAL
                    END ELSE
                        Y.CONCAT.REC = Y.AC.NO:"*":YENTRY.ID:"*":YOPEN.BAL
                    END
                END ELSE
                    Y.END = 'END'
                END
            END
        REPEAT
        IF SORT.FLD EQ "BOOKING.DATE" THEN
            GOSUB SORT.ENT.BY.BOOKING.DATE
        END
        RETURN
*
GET.ENTRIES.NR.POST:
*===================
*
        LOOP
            REMOVE YENTRY.ID FROM YR.ENTRY.FILE SETTING YCODE
        UNTIL YENTRY.ID EQ ''
            GOSUB READ.ENTRY
            IF YR.STMT.ENTRY THEN
                IF YR.STMT.ENTRY<AC.STE.BOOKING.DATE> GT YEND.DATE THEN
                    ENTRY.FOUND = 1
                    IF Y.CONCAT.REC THEN
                        Y.CONCAT.REC := @FM:Y.AC.NO:"*":YENTRY.ID:"*":YOPEN.BAL
                    END ELSE
                        Y.CONCAT.REC = Y.AC.NO:"*":YENTRY.ID:"*":YOPEN.BAL
                    END
                END
            END
        REPEAT
        IF SORT.FLD EQ "BOOKING.DATE" THEN
            GOSUB SORT.ENT.BY.BOOKING.DATE
        END
        RETURN
*
*-----------------------------------------------------------------------
*
EXTRACT.ENTRY.IDS:
*=================
*
        LOOP
            REMOVE YENTRY.ID FROM YR.ENTRY.FILE SETTING YCODE
        UNTIL YENTRY.ID EQ ''
            YSTMT.CHK = 1
*            READ R.ENTRY FROM F.STMT.ENTRY,YENTRY.ID THEN
			CALL F.READ(YF.STMT.ENTRY,YENTRY.ID,R.ENTRY,F.STMT.ENTRY,ERR.ENTRY)
			IF R.ENTRY THEN
                ENTRY.FOUND = 1
                ADD.DET = Y.AC.NO:"*":YENTRY.ID:"*":YOPEN.BAL:"*":R.ENTRY<AC.STE.BOOKING.DATE>:"*":R.ENTRY<AC.STE.ACCOUNT.NUMBER>
                IF Y.CONCAT.REC THEN
                    Y.CONCAT.REC := @FM:ADD.DET
                END ELSE
                    Y.CONCAT.REC = ADD.DET
                END
            END
        REPEAT
        RETURN
*
*-----------------------------------------------------------------------
*
GET.ENTRIES:
***********
        GOSUB GET.LAST.PRINT.BAL
        IF Y.DATE GT YACCT.STMT.DATES<YPOS-1> AND YACCT.STMT.DATES<YPOS-1> GT YR.ACCOUNT.STATEMENT<AC.STA.FQU1.LAST.DATE> THEN
*            READ YENTRY.IDS FROM F.STMT.PRINTED,Y.AC.NO:'-':YACCT.STMT.DATES<YPOS-1> ELSE YENTRY.IDS = ''
            Y.STMT.PRT.ID=Y.AC.NO:'-':YACCT.STMT.DATES<YPOS-1>
			CALL F.READ(FN.STMT.PRINTED,Y.STMT.PRT.ID,YENTRY.IDS,F.STMT.PRINTED,ERR.STMT.PRINT)
			IF ERR.STMT.PRINT THEN
			YENTRY.IDS=''
			END
			LOOP
                REMOVE YENTRY.ID FROM YENTRY.IDS SETTING ENT.POS
            UNTIL YENTRY.ID EQ ''
                GOSUB READ.ENTRY
                GOSUB OPENING.BALANCE
            REPEAT
            RETURN
        END
        RETURN
*
*-----------------------------------------------------------------------
*
BUILD.CONCAT.LIST:
*=================
*
*
* Read the ACCOUNT.STATEMENT record and ACCT.STMT.PRINTED
*
*
* Extract the dates only from YR.ACCT.STMT.PRINT to allow locate to work
*
        YR.ACCOUNT.STATEMENT = '' ; YERR = '' ; YACCT.NO = ''
        CALL F.READ(FN.ACCOUNT.STATEMENT,Y.AC.NO,YR.ACCOUNT.STATEMENT,F.ACCOUNT.STATEMENT,YERR)
        IF YERR THEN
            YERR = ''
            YACCT.NO = Y.AC.NO
            CALL EB.READ.HISTORY.REC(F.ACCOUNT.STATEMENT$HIS,YACCT.NO,YR.ACCOUNT.STATEMENT,YERR)
        END
        IF NOT(YERR) THEN
            IF YR.ACCOUNT.STATEMENT<AC.STA.CURRENCY> EQ LCCY THEN
                YAMOUNT.POS = AC.STE.AMOUNT.LCY
            END ELSE
                YAMOUNT.POS = AC.STE.AMOUNT.FCY
            END
        END ELSE
            YR.ACCOUNT.STATEMENT = ''
            YAMOUNT.POS=0     ;* eg. account closed; can be determined later by stmt entry
        END

        YACCT.STMT.DATES = "" ; YACCT.STMT.TYPE = "" ; YACCT.STMT.BAL = ""
        YLAST.DATE = "" ; YACCT.AC.NO = ""
        SAVE.Y.AC.NO = Y.AC.NO
        LOOP
            REMOVE ACC.NO FROM SUB.ACC.LIST SETTING POS
        WHILE ACC.NO:POS
            GOSUB BUILD.CONCAT
        REPEAT
*
* Existing code to refer stmt-2 fqu files removed since the frequencies
* are made independent and relationship concept is changed to allow
* multiple frequencies.
*
        IF FWD.MVMT.FLAG THEN
            STMT.DATE.FIELD = AC.STE.STMT1.DATE
        END
        ENTRY.FOUND = 0
        ON YOPERAND GOSUB MATCH.DATE.EQUAL,
        MATCH.DATE.RANGE,
        MATCH.DATE.LESS.THAN,
        MATCH.DATE.GREATER.THAN,
        MATCH.DATE.NOT,
        MATCH.DATE.LIKE,
        MATCH.DATE.UNLIKE,
        MATCH.DATE.LE,
        MATCH.DATE.GE,
        MATCH.DATE.NR
*
* CB8800866. If no entries found then pass a null value for the account
*
        Y.AC.NO = SAVE.Y.AC.NO
        IF NOT(ENTRY.FOUND)AND R.ACCT THEN
            Y.CONCAT.REC<-1> = Y.AC.NO:"*":"*":YOPEN.BAL
        END

        RETURN

************************************************************8
BUILD.CONCAT:
*************
*
* This was causing problems viz...
* Local currency accounts were having YAMOUNT.POS set to AC.STE.AMOUNT.FCY
* and thus opening balance was Allways Zero.

*        READ YR.ACCT.STMT.PRINT FROM F.ACCT.STMT.PRINT, ACC.NO ELSE
		R.ACCT.STMT.PRINT=''
		E.ACCT.STMT.PRINT=''
		CALL F.READ(FN.ACCT.STMT.PRINT,ACC.NO,R.ACCT.STMT.PRINT,F.ACCT.STMT.PRINT,E.ACCT.STMT.PRINT)
		IF E.ACCT.STMT.PRINT THEN
		YR.ACCT.STMT.PRINT = ''
        END
        LOOP
        UNTIL YR.ACCT.STMT.PRINT<1> EQ ''
*
* EB8800923. If a special statement has been produced on the same day as
* the frequency 1 statement there will be 2 entries on ACCT.STMT.PRINT
* for the same date. Do not include the second in the date array.
*
            YDATE = FIELD(YR.ACCT.STMT.PRINT<1>,"/",1)
* needs to be a locate

* need an array of dates and account numbers


            LOCATE YDATE IN YACCT.STMT.DATES BY 'AR' SETTING POS THEN
                YACCT.AC.NO<POS,-1> = ACC.NO
                YACCT.STMT.BAL<POS,-1> = FIELD(YR.ACCT.STMT.PRINT<1>,"/",2) *1
                YACCT.STMT.TYPE<POS,-1> = 1
            END ELSE
                INS YDATE BEFORE YACCT.STMT.DATES<POS>
                INS FIELD(YR.ACCT.STMT.PRINT<1>,"/",2) *1 BEFORE YACCT.STMT.BAL<POS>
                INS 1 BEFORE YACCT.STMT.TYPE<POS>
                INS ACC.NO BEFORE YACCT.AC.NO<POS>
            END
*
            DEL YR.ACCT.STMT.PRINT<1>

        REPEAT

        RETURN

*-----------------------------------------------------------------------
*
READ.ENTRY.IDS:
*==============
*
        YR.ENTRY.FILE = ""
        AC.COUNT = DCOUNT(YACCT.AC.NO<YPOS>,@VM)
        FOR AC.CNT = 1 TO AC.COUNT
            GOSUB READ.ENTRY.ID
        NEXT AC.CNT
*
        RETURN

*------------------------------------------------------------------------
READ.ENTRY.ID:
*=============

        ACC.NO =  YACCT.AC.NO<YPOS,AC.CNT>
        IF YACCT.STMT.TYPE<YPOS,AC.CNT> EQ 1 THEN
*
*** Change key to use '-' instead of '.' GB7900049
*
			YR.ENTRY.LIST=''
            ID.STMT.PRINTED = ACC.NO:'-':YACCT.STMT.DATES<YPOS>
*            READ YR.ENTRY.LIST FROM F.STMT.PRINTED, ID.STMT.PRINTED ELSE
			CALL F.READ(FN.STMT.PRINTED,ID.STMT.PRINTED,YR.ENTRY.LIST,F.STMT.PRINTED,ERR.STMT.PRINT)
			IF ERR.STMT.PRINT THEN
                YR.ENTRY.LIST = ''
            END
            IF YR.ENTRY.LIST THEN
                IF YR.ENTRY.FILE THEN
                    YR.ENTRY.FILE<-1> = YR.ENTRY.LIST
                END ELSE
                    YR.ENTRY.FILE = YR.ENTRY.LIST
                END
            END

* Add stmt entries from FWD.STMT1.PRINTED

            IF FWD.MVMT.FLAG THEN
      *          READ FWD.STMT1.LIST FROM F.FWD.STMT1.PRINTED, ACC.NO:'-':YACCT.STMT.DATES<YPOS> ELSE
                  Y.STMT1.PRT.ID=ACC.NO:'-':YACCT.STMT.DATES<YPOS>
				FWD.STMT1.LIST=''
				ERR.FWD.STMT1.PRINTED=''
				CALL F.READ(FN.FWD.STMT1.PRINTED,Y.STMT1.PRT.ID,FWD.STMT1.LIST,F.FWD.STMT1.PRINTED,ERR.FWD.STMT1.PRINTED)
					IF ERR.FWD.STMT1.PRINTED THEN
					FWD.STMT1.LIST = ''
                END
                IF FWD.STMT1.LIST THEN
                    YR.ENTRY.FILE<-1> = FWD.STMT1.LIST
                END
            END

        END ELSE
            IF YR.ACCOUNT.STATEMENT<AC.STA.STMT.FQU.2> NE "" THEN
                FREQ.NOS = DCOUNT(YR.ACCOUNT.STATEMENT<AC.STA.FREQ.NO>,@VM)

                FOR I = 1 TO FREQ.NOS
* If the freq is other than "2" then concatenate that freq with ac no.
                    IF YR.ACCOUNT.STATEMENT<AC.STA.FREQ.NO,I> EQ "2" THEN
                        STMT2.PRINTED.ID = ACC.NO:"-":YACCT.STMT.DATES<YPOS>
                    END ELSE
                        STMT2.PRINTED.ID = ACC.NO:".":YR.ACCOUNT.STATEMENT<AC.STA.FREQ.NO,I>:"-":YACCT.STMT.DATES<YPOS>
                    END
          *          READ REC.ENTRY.FILE FROM F.STMT2.PRINTED,STMT2.PRINTED.ID ELSE
                        REC.ENTRY.FILE=''
						ERR.STMT2.PRINTED=''
				CALL F.READ(FN.STMT2.PRINTED,STMT2.PRINTED.ID,REC.ENTRY.FILE,F.STMT2.PRINTED,ERR.STMT2.PRINTED)
					IF ERR.STMT2.PRINTED THEN
					REC.ENTRY.FILE = ''
                END
					

                    IF FWD.MVMT.FLAG THEN
*                        READ FWD.STMT2.LIST FROM F.FWD.STMT2.PRINTED,STMT2.PRINTED.ID ELSE
                        FWD.STMT2.LIST=''
						ERR.FWD.STMT2.PRINTED=''
				CALL F.READ(FN.FWD.STMT2.PRINTED,STMT2.PRINTED.ID,FWD.STMT2.LIST,F.FWD.STMT2.PRINTED,ERR.FWD.STMT2.PRINTED)
					IF ERR.FWD.STMT2.PRINTED THEN
					FWD.STMT2.LIST = ''
                END
                        IF FWD.STMT2.LIST THEN
                            IF YR.ENTRY.FILE THEN
                                YR.ENTRY.FILE<-1> = FWD.STMT2.LIST
                            END ELSE
                                YR.ENTRY.FILE = FWD.STMT2.LIST
                            END
                        END
                    END
                NEXT I
            END

* Add stmt entries from FWD.STMT2.PRINTED
        END

        RETURN
*-----------------------------------------------------------------------
*
GET.LAST.PRINT.BAL:
*==================
*
* Existing code to refer fqu-2 if the relationship is combined is
* removed since each frequency is made independent and relationship
* field is made obsolate.
*
        YOPEN.BAL = YR.ACCOUNT.STATEMENT<AC.STA.FQU1.LAST.BALANCE>
        IF FWD.MVMT.FLAG THEN
            STMT.DATE.FIELD = AC.STE.STMT1.DATE
        END

*
* EB8800496. If there is no last balance set this to zero
*
        IF YOPEN.BAL EQ "" THEN
            YOPEN.BAL = 0
        END
        RETURN
*
*-----OPENING BALANCE----------------------------------------------------
*
OPENING.BALANCE:
        IF NOT(YAMOUNT.POS) THEN
            BEGIN CASE
            CASE YR.STMT.ENTRY<AC.STE.CURRENCY> EQ LCCY
                YAMOUNT.POS=AC.STE.AMOUNT.LCY
            CASE YR.STMT.ENTRY<AC.STE.CURRENCY> EQ ''
                YAMOUNT.POS=AC.STE.AMOUNT.LCY
            CASE 1
                YAMOUNT.POS=AC.STE.AMOUNT.FCY
            END CASE
        END

* Amount of only those stmt entries which are not already printed
* should only be added to the opening balance because this would
* have already been added to account statement last balance.

        IF FWD.MVMT.FLAG THEN
            IF YR.STMT.ENTRY<STMT.DATE.FIELD> EQ "" THEN
                YOPEN.BAL +=YR.STMT.ENTRY<YAMOUNT.POS>
            END
        END ELSE
            YOPEN.BAL += YR.STMT.ENTRY<YAMOUNT.POS>
        END
        RETURN
*
*----------------------------------------------------------
READ.ENTRY:
* Read entry and check for duplicates which can happen during the eod.
*
        YR.STMT.ENTRY = ""    ;* Return null if can't read or duplicate

        LOCATE YENTRY.ID IN ENTRYID.LIST<1> SETTING POS ELSE
*            READ YR.STMT.ENTRY FROM F.STMT.ENTRY, YENTRY.ID ELSE
				YR.STMT.ENTRY=''
				ERR.ENTRY1=''
			CALL F.READ(YF.STMT.ENTRY,YENTRY.ID,YR.STMT.ENTRY,F.STMT.ENTRY,ERR.ENTRY1)
                IF ERR.ENTRY1 THEN 
				YR.STMT.ENTRY = ''
            END
            IF ENTRYID.LIST THEN
                ENTRYID.LIST:=@FM: YENTRY.ID
            END ELSE
                ENTRYID.LIST = YENTRY.ID
            END
        END

        RETURN
*-----------------------------------------------------------------------------
*
SORT.ENT.BY.BOOKING.DATE:
*------------------------
*
        BOOK.DATES = ""
        CONCAT.REC = Y.CONCAT.REC
        STMT.CNT = DCOUNT(CONCAT.REC,@FM)
        FOR K = 1 TO STMT.CNT
            STMT.ID = FIELD(CONCAT.REC<K>,"*",2)
 *           READ STMT.ENT.REC FROM F.STMT.ENTRY,STMT.ID ELSE
			STMT.ENT.REC=''
				ERR.ENTRY2=''
			CALL F.READ(YF.STMT.ENTRY,STMT.ID,STMT.ENT.REC,F.STMT.ENTRY,ERR.ENTRY2)
                IF ERR.ENTRY2 THEN
				STMT.ENT.REC = ""
            END
            IF STMT.ENT.REC THEN
                IF BOOK.DATES THEN
                    BOOK.DATES<-1> = STMT.ENT.REC<AC.STE.BOOKING.DATE>
                END ELSE
                    BOOK.DATES = STMT.ENT.REC<AC.STE.BOOKING.DATE>
                END
            END
        NEXT K
*
        IF SORT.BY NE 'DSND' THEN
            FOR I = 1 TO STMT.CNT-1
                FOR J = I+1 TO STMT.CNT
                    IF BOOK.DATES<I> GT BOOK.DATES<J> THEN
                        TEMP.CONCAT.REC = CONCAT.REC<I>
                        TEMP.DATE = BOOK.DATES<I>
                        CONCAT.REC<I> = CONCAT.REC<J>
                        BOOK.DATES<I> = BOOK.DATES<J>
                        CONCAT.REC<J> = TEMP.CONCAT.REC
                        BOOK.DATES<J> = TEMP.DATE
                    END
                NEXT J
            NEXT I
        END ELSE
            FOR I = 1 TO STMT.CNT-1
                FOR J = I+1 TO STMT.CNT
                    IF BOOK.DATES<I> LT BOOK.DATES<J> THEN
                        TEMP.CONCAT.REC = CONCAT.REC<I>
                        TEMP.CONCAT.REC = CONCAT.REC<I>
                        TEMP.DATE = BOOK.DATES<I>
                        CONCAT.REC<I> = CONCAT.REC<J>
                        BOOK.DATES<I> = BOOK.DATES<J>
                        CONCAT.REC<J> = TEMP.CONCAT.REC
                        BOOK.DATES<J> = TEMP.DATE
                    END
                NEXT J
            NEXT I
        END
*
        Y.CONCAT.REC = CONCAT.REC
        RETURN
*
*-----------------------------------------------------------------------------------------
*
CHECK.OTH.BOOK.ACCESS:
*---------------------
*
        NEXT.ACCT.FLAG = ''
        R.ACCT = '' ; AC.POS = '' ; SUB.ACC.LIST = Y.AC.NO
*        READ R.ACCT FROM F.ACCOUNT,Y.AC.NO THEN
			R.ACCT=''
			ERR.ACCT=''
			CALL F.READ(FN.ACCOUNT,Y.AC.NO,R.ACCT,F.ACCOUNT,ERR.ACCT)
			IF R.ACCT THEN
            IF R.ACCT<AC.CO.CODE> NE ID.COMPANY THEN
                LOCATE R.ACCT<AC.CO.CODE> IN R.USER<EB.USE.OTH.BOOK.ACCESS,1> SETTING AC.POS ELSE
                    Y.AC.POS = ''
                    Y.COMPANY.ID = R.USER<EB.USE.OTH.BOOK.ACCESS,1>
    *                READ R.CSG FROM F.COMP.SMS.GRP,Y.COMPANY.ID THEN
					R.CSG=''
					ERR.CSG=''
					CALL F.READ(FN.COMP.SMS.GRP,Y.COMPANY.ID,R.CSG,F.COMP.SMS.GRP,ERR.CSG)
					IF R.CSG THEN
                        LOCATE R.ACCT<AC.CO.CODE> IN R.CSG<CO.SMS.COMPANY.CODE,1> SETTING Y.AC.POS ELSE
                            Y.CONCAT.REC <-1>= Y.AC.NO:"**":0
                            NEXT.ACCT.FLAG = 1
                        END
                    END ELSE
                        Y.CONCAT.REC <-1>= Y.AC.NO:"**":0
                        NEXT.ACCT.FLAG = 1
                    END
                END
            END
            IF R.ACCT<AC.MAX.SUB.ACCOUNT> THEN
			R.SUB.ACC.LIST=''
			ER=''
                CALL F.READ(FN.AC.SUB.ACCOUNT,Y.AC.NO,R.SUB.ACC.LIST,F.AC.SUB.ACCOUNT,ER)
                IF R.SUB.ACC.LIST THEN
                    SUB.ACC.LIST := @FM:R.SUB.ACC.LIST
                END
            END
            IF ENQ.SELECTION<9> EQ "BOOKING.DATE" THEN
                SORT.FLD = "BOOKING.DATE"
            END
        END ELSE
            ENQ.ERROR = "AC.ACS.AC.DOES.NOT.EXIST.COMP"  ;*OLD FORM OF ID FOR ERR
        END
*
        RETURN
*-----------------------------------------------------------------------------------------
*
    END
