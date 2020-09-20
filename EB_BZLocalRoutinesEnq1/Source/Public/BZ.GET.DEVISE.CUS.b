*-----------------------------------------------------------------------------
* <Rating>100</Rating>
*-----------------------------------------------------------------------------
*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13  : INCLUDE GLOBUS.BP to $INCLUDE ../T24_BP
*ZIT-UPG-R09-R13  : Hardcoaded R.RECORD changed to field values
*ZIT-UPG-R13-R19  : GET.LOC.REF TO MULTI.GET.LOC.REF;INITIALISED F.READ VARIABLES;FM TO @FM
*				  : CHANGED THE INCREMENTED VARIABLE(NBRE.DEL TO COMPTER)
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.GET.DEVISE.CUS
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*ZIT-UPG-R09-R13/S
*INCLUDE GLOBUS.BP I_COMMON
*INCLUDE GLOBUS.BP I_EQUATE
*INCLUDE GLOBUS.BP I_ENQUIRY.COMMON
*INCLUDE GLOBUS.BP I_F.CUSTOMER
*INCLUDE GLOBUS.BP I_F.ACCOUNT
*INCLUDE GLOBUS.BP I_F.CURRENCY

    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.CUSTOMER
    * $INSERT I_COMMON - Not Used anymore;UNT
    * $INSERT I_EQUATE - Not Used anymore;ENCY

*ZIT-UPG-R09-R13/E

    FN.CUS.AC="F.CUSTOMER.ACCOUNT"
    F.CUS.AC=""
	CUS.AC.REC=""
	CUS.ERR=""
	
    FN.AC="F.ACCOUNT"
    F.AC=""
	AC.REC=""
	AC.ERR=""
	
    FN.CUR="F.CURRENCY"
    F.CUR=""
	EB.SystemTables.getVFunction()
	CUR.ERR=""
	
    CALL OPF(FN.CUS.AC,FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusLL OPF(FN.AC,F.AC)
    CALL OPF(FN.CUR,F.CUR)FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus-R19 S 
		Y.APP='ACCOUNT'
		Y.FIELD='CPTE.SPEC'
		Y.POS=''
		CALL MULTI.GET.LOC.REF(Y.APP,Y.FIELD,Y.POS)
		POS.CPTE.SPEC=Y.POS<1,1>
*    CALL GET.LOC.REF("ACCOUNT","CPTE.SPEC",POS.CPTE.SPEC)
*ZIT-UPG-R13-R19 E 
    Y.CUSTOMER=O.DATA

    CALL F.READ(FN.CUS.AC,Y.CUSTOMER,CUS.AC.REC,F.CUS.AC,CUS.ERR)

    IF CUS.AC.REC THEN

        NBRE.DEL=DCOUNT(CUS.AC.REC,@FM)

        FOR COMPTER=1 TO NBRE.DEL

            COMPTE=CUS.AC.REC<COMPTER>
            CALL F.READ(FN.AC,COMPTE,AC.REC,F.AC,AC.ERR)
            TYPE.COMPTE.SPEC=AC.REC<AC.LOCAL.REF,POS.CPTE.SPEC>
            DEVISE=AC.REC<AC.CURRENCY>
         EB.DataAccess.OpfCATEG=AC.REC<AC.CATEGORY>
         EB.DataAccess.OpfTYPE.COMPTE=""

            BEGIN CASE
            CASE (CATEG GE 1000) AND (CATEG LE 1999)
                TYPE.COMPTE="00"

            CASE (CATEFT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRef(CATEG LE 6999)

       EB.DataAccess.FRead   IF TYPE.COMPTE.SPEC EQ "1" THEN
                    TYPE.COMPTE="00"
                END ELSE
                    CONTINUEEB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyerEND

          EB.SystemTables.setE()*-----------------------------------------------------------------------------
* <Rating>100</Rating>
*-----------------------------------------------------------------------------
*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13  : INCLUDE GLOBUS.BP to $INCLUDE ../T24_BP
*ZIT-UPG-R09-R13  : Hardcoaded R.RECORD changed to field values
*ZIT-UPG-R13-R19  : GET.LOC.REF TO MULTI.GET.LOC.REF;INITIALISED F.READ VARIABLES;FM TO @FM
*				  : CHANGED THE INCREMENTED VARIABLE(NBRE.DEL TO COMPTER)
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.GET.DEVISE.CUS
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*ZIT-UPG-R09-R13/S
*INCLUDE GLOBUS.BP I_COMMON
*INCLUDE GLOBUS.BP I_EQUATE
*INCLUDE GLOBUS.BP I_ENQUIRY.COMMON
*INCLUDE GLOBUS.BP I_F.CUSTOMER
*INCLUDE GLOBUS.BP I_F.ACCOUNT
*INCLUDE GLOBUS.BP I_F.CURRENCY

    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.CUSTOMER
    $INSERT I_F.ACCOUNT
    $INSERT I_F.CURRENCY

*ZIT-UPG-R09-R13/E

    FN.CUS.AC="F.CUSTOMER.ACCOUNT"
    F.CUS.AC=""
	CUS.AC.REC=""
	CUS.ERR=""
	
    FN.AC="F.ACCOUNT"
    F.AC=""
	AC.REC=""
	AC.ERR=""
	
    FN.CUR="F.CURRENCY"
    F.CUR=""
	CUR.REC=""
	CUR.ERR=""
	
    CALL OPF(FN.CUS.AC,F.CUS.AC)
    CALL OPF(FN.AC,F.AC)
    CALL OPF(FN.CUR,F.CUR)
	
*ZIT-UPG-R13-R19 S 
		Y.APP='ACCOUNT'
		Y.FIELD='CPTE.SPEC'
		Y.POS=''
		CALL MULTI.GET.LOC.REF(Y.APP,Y.FIELD,Y.POS)
		POS.CPTE.SPEC=Y.POS<1,1>
*    CALL GET.LOC.REF("ACCOUNT","CPTE.SPEC",POS.CPTE.SPEC)
*ZIT-UPG-R13-R19 E 
    Y.CUSTOMER=O.DATA

    CALL F.READ(FN.CUS.AC,Y.CUSTOMER,CUS.AC.REC,F.CUS.AC,CUS.ERR)

    IF CUS.AC.REC THEN

        NBRE.DEL=DCOUNT(CUS.AC.REC,@FM)

        FOR COMPTER=1 TO NBRE.DEL

            COMPTE=CUS.AC.REC<COMPTER>
            CALL F.READ(FN.AC,COMPTE,AC.REC,F.AC,AC.ERR)
            TYPE.COMPTE.SPEC=AC.REC<AC.LOCAL.REF,POS.CPTE.SPEC>
            DEVISE=AC.REC<AC.CURRENCY>
            CATEG=AC.REC<AC.CATEGORY>
            TYPE.COMPTE=""

            BEGIN CASE
            CASE (CATEG GE 1000) AND (CATEG LE 1999)
                TYPE.COMPTE="00"

            CASE (CATEG GE 6000) AND (CATEG LE 6999)

                IF TYPE.COMPTE.SPEC EQ "1" THEN
                    TYPE.COMPTE="00"
                END ELSE
                    CONTINUE
                END

            CASE CATEG MATCHES 8025:@VM:8024:@VM:8105:@VM:8107:@VM:8108
                TYPEEB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyer          CASE EB.DataAccess.FWrite            CONTINUE
            END CASE

        EB.SystemTables.setAf()*-----------------------------------------------------------------------------
* <Rating>100</Rating>
*-----------------------------------------------------------------------------
*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13  : INCLUDE GLOBUS.BP to $INCLUDE ../T24_BP
*ZIT-UPG-R09-R13  : Hardcoaded R.RECORD changed to field values
*ZIT-UPG-R13-R19  : GET.LOC.REF TO MULTI.GET.LOC.REF;INITIALISED F.READ VARIABLES;FM TO @FM
*				  : CHANGED THE INCREMENTED VARIABLE(NBRE.DEL TO COMPTER)
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.GET.DEVISE.CUS
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*ZIT-UPG-R09-R13/S
*INCLUDE GLOBUS.BP I_COMMON
*INCLUDE GLOBUS.BP I_EQUATE
*INCLUDE GLOBUS.BP I_ENQUIRY.COMMON
*INCLUDE GLOBUS.BP I_F.CUSTOMER
*INCLUDE GLOBUS.BP I_F.ACCOUNT
*INCLUDE GLOBUS.BP I_F.CURRENCY

    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.CUSTOMER
    $INSERT I_F.ACCOUNT
    $INSERT I_F.CURRENCY

*ZIT-UPG-R09-R13/E

    FN.CUS.AC="F.CUSTOMER.ACCOUNT"
    F.CUS.AC=""
	CUS.AC.REC=""
	CUS.ERR=""
	
    FN.AC="F.ACCOUNT"
    F.AC=""
	AC.REC=""
	AC.ERR=""
	
    FN.CUR="F.CURRENCY"
    F.CUR=""
	CUR.REC=""
	CUR.ERR=""
	
    CALL OPF(FN.CUS.AC,F.CUS.AC)
    CALL OPF(FN.AC,F.AC)
    CALL OPF(FN.CUR,F.CUR)
	
*ZIT-UPG-R13-R19 S 
		Y.APP='ACCOUNT'
		Y.FIELD='CPTE.SPEC'
		Y.POS=''
		CALL MULTI.GET.LOC.REF(Y.APP,Y.FIELD,Y.POS)
		POS.CPTE.SPEC=Y.POS<1,1>
*    CALL GET.LOC.REF("ACCOUNT","CPTE.SPEC",POS.CPTE.SPEC)
*ZIT-UPG-R13-R19 E 
    Y.CUSTOMER=O.DATA

    CALL F.READ(FN.CUS.AC,Y.CUSTOMER,CUS.AC.REC,F.CUS.AC,CUS.ERR)

    IF CUS.AC.REC THEN

        NBRE.DEL=DCOUNT(CUS.AC.REC,@FM)

        FOR COMPTER=1 TO NBRE.DEL

            COMPTE=CUS.AC.REC<COMPTER>
            CALL F.READ(FN.AC,COMPTE,AC.REC,F.AC,AC.ERR)
            TYPE.COMPTE.SPEC=AC.REC<AC.LOCAL.REF,POS.CPTE.SPEC>
            DEVISE=AC.REC<AC.CURRENCY>
            CATEG=AC.REC<AC.CATEGORY>
            TYPE.COMPTE=""

            BEGIN CASE
            CASE (CATEG GE 1000) AND (CATEG LE 1999)
                TYPE.COMPTE="00"

            CASE (CATEG GE 6000) AND (CATEG LE 6999)

                IF TYPE.COMPTE.SPEC EQ "1" THEN
                    TYPE.COMPTE="00"
                END ELSE
                    CONTINUE
                END

            CASE CATEG MATCHES 8025:@VM:8024:@VM:8105:@VM:8107:@VM:8108
                TYPE.COMPTE="00"

            CASE 1
                CONTINUE
            END CASE

           FT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRef.CUR,DEVISE,CUR.REC,F.CUR,CUR.ERR)
        EB.SystemTables.setE(CUR.REC<EB.CUR.NUMERIC.CCY.CODE>)

            COMPTES=COMPTES:COMPTE:"*"
            DEVISES.CPT=DEVISES.CPT:DEVISE.CPT:"*"
            CATEGORYS=CATEGORYS:AC.REC<AC.CATEGORY>:"*"
            TYPES.COMPTE=TYPES.COMPTE:TYPE.COMPTE:"*"
            AGENCES=AGENCES:AC.REC<AC.ACCOUNT.OFFICER>:"*"
*        NEXT NBRE.DEL     ;*WRONG VARIABLE INCREMENTED
		 NEXT COMPTER
    END
*ZIT-UPG-R09-R13/S
*R.RECORD<33>=COMPTES
*R.RECORD<40>=DEVISES.CPT
*R.RECORD<56>=CATEGORYS
*R.RECORD<78>=TYPES.COMPTE
*R.RECORD<67>=AGENCES

    R.RECORD<EB.CUS.TEXT>=COMPTES
    R.RECORD<EB.CUS.OFF.PHONE>=DEVISES.CPT
    R.RECORD<EB.CUS.CUSTOMER.RATING>=CATEGORYS
    R.RECORD<EB.CUS.SALARY>=TYPES.COMPTE
    R.RECORD<EB.CUS.PHONE.1>=AGENCES
*ZIT-UPG-R09-R13/E

    RETURN
END
