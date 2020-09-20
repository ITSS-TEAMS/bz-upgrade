*-----------------------------------------
* <Rating>156</Rating>
*-----------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.TT.JOURNAL.CAISSE(TABLEAU)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*---------------------------------------------------------------------    	
* Modification History :   	
*ZITUNA-UPG-R13-R19 :  removed BP's and changed INCLUDE to INSERT               
* ------------------------------------------------------------------------

    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON  
* $INSERT GLOBUS.BP I_F.ACCT.ENT.TODAY    
    $INSERT I_F.STMT.ENTRY      
    $INSERT I_F.USER
  **  $INSERT I_F.ACCT.ENT.LWORK.DAY

MAIN:

    GOSUB INIT
    GOSUB OPENFILES
    GOSUB PROCESS
    RETURN  
* $INSERT I_COMMON - Not Used anymore;*******************
INIT:    
* $INSERT I_ENQUIRY.COMMON - Not Used anymore;ODAY'
* $INSERT I_F.AC.CHARGE.REQUEST - Not Used anymore;K.DAY'    
    F.ACC.ENT=''
    FN.STMT='F.STMT.ENTRY'
    F.STMT=''
    FN.TID="F.TELLER.ID"
    F.TID=""
    TID.REC=""
    ACC.ENT.REC=''
    STMT.REC=''
    CPT.CAISSE1=""
    CPT.CAISSE2=""
    CATEG1=10001
    CATEG2=10002
    CATEG3=10052
    POS=EB.SystemTables.getVFunction()AM=""

    ERR1=''
    RETURN
*******FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus***************
OPENFILES:
    CALL OPF(FN.AFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus  
    CALL OPF(FN.STMT,F.STMT)
    CALL OPF(FN.TID,F.TID)
    RETURN
***************************************
PROCESS:

    NOM=R.USER<EB.USE.USER.NAME>
    SEL.COMMAND='SELECT ' :FN.TID: ' WITH USER EQ ' :OPERATOR: ' AND STATUS EQ OPEN'
	SEL.LIST = '' ; NO.OF.REC = '' ; ERR1 = ''      
    CALL EB.READLIST(SEL.COMMAND,SEL.LIST,'',NO.OF.REC,ERR1)



    IF SEL.LIST EQ '' THEN  
        E="Utilisateur ":NOM:" non affecte a une caisse"
        CALL ERR
    END ELSE
        LOOP
            REMOVE CAISSE FROM SEL.LIST SETTING POS
        WHILE CAISSE :POS
            IF PARAM NE "" THEN
         EB.DataAccess.Opf    PARAM = PARAM:" OR "
         EB.DataAccess.OpfEND
            CPT.CAISSE1="(@ID LIKE '3A":CATEG1:CAISSE:"') OR "
*CPT.CAISSE2="(@ID LIKE '3A":CATEG2:CAISSE:"')"
            CPT.CAISSE2="(@ID LIKE '3A":CATEG2:CAISSE:"') OR "
            CPT.CAISSE3="(@ID LIKE '3A":CATEG3:CAISSE:"')"
            PARAM=EB.SystemTables.getRNew():FT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRef:CPT.CAISSE2:" ":CPT.CAISSE3
            CMD='SELECT ':FN.ACC.ENT: ' WIEB.DataAccess.FReadARAM
			CMD.LIST = '' ; NBR.CPT = '' ; ERR1 = ''  
            CALL EB.READLIST(CMD,CMD.LIST,'',NBR.CPT,ERR1)
            IF CMD.LIST EQ '' THEN
                E="Aucune operation effectuee"  
                CALL ERR
  EB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyer
            EB.SystemTables.setE(1 TO NBR.CPT)
                    REMOVE COMPTE FROM CMD.LIST SETTING POS1  

* WHILE COMPTE :POEB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyer   EB.DataAccess.FWriteENT.REC = '' ; ERR = ''  
                    CALL F.READ(FN.ACC.ENT,COMPTE,ACC.ENT.REC,F.ACC.ENT,ERR)
                    NOMBRE.LINK=DCOUNT(ACC.ENT.REC,@FM)
                    FOR LINK=1 TO NOMBRE.LINK
        EB.SystemTables.setAf()*-----------------------------------------
* <Rating>156</Rating>
*-----------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.TT.JOURNAL.CAISSE(TABLEAU)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*---------------------------------------------------------------------    	
* Modification History :   	
*ZITUNA-UPG-R13-R19 :  removed BP's and changed INCLUDE to INSERT               
* ------------------------------------------------------------------------

    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON  
* $INSERT GLOBUS.BP I_F.ACCT.ENT.TODAY    
    $INSERT I_F.STMT.ENTRY      
    $INSERT I_F.USER
  **  $INSERT I_F.ACCT.ENT.LWORK.DAY

MAIN:

    GOSUB INIT
    GOSUB OPENFILES
    GOSUB PROCESS
    RETURN  
***************************************
INIT:    
    FN.ACC.ENT='F.ACCT.ENT.TODAY'
  **  FN.ACC.ENT='F.ACCT.ENT.LWORK.DAY'    
    F.ACC.ENT=''
    FN.STMT='F.STMT.ENTRY'
    F.STMT=''
    FN.TID="F.TELLER.ID"
    F.TID=""
    TID.REC=""
    ACC.ENT.REC=''
    STMT.REC=''
    CPT.CAISSE1=""
    CPT.CAISSE2=""
    CATEG1=10001
    CATEG2=10002
    CATEG3=10052
    POS=1
    PARAM=""

    ERR1=''
    RETURN
***************************************
OPENFILES:
    CALL OPF(FN.ACC.ENT,F.ACC.ENT)  
    CALL OPF(FN.STMT,F.STMT)
    CALL OPF(FN.TID,F.TID)
    RETURN
***************************************
PROCESS:

    NOM=R.USER<EB.USE.USER.NAME>
    SEL.COMMAND='SELECT ' :FN.TID: ' WITH USER EQ ' :OPERATOR: ' AND STATUS EQ OPEN'
	SEL.LIST = '' ; NO.OF.REC = '' ; ERR1 = ''      
    CALL EB.READLIST(SEL.COMMAND,SEL.LIST,'',NO.OF.REC,ERR1)



    IF SEL.LIST EQ '' THEN  
        E="Utilisateur ":NOM:" non affecte a une caisse"
        CALL ERR
    END ELSE
        LOOP
            REMOVE CAISSE FROM SEL.LIST SETTING POS
        WHILE CAISSE :POS
            IF PARAM NE "" THEN
                PARAM = PARAM:" OR "
            END
            CPT.CAISSE1="(@ID LIKE '3A":CATEG1:CAISSE:"') OR "
*CPT.CAISSE2="(@ID LIKE '3A":CATEG2:CAISSE:"')"
            CPT.CAISSE2="(@ID LIKE '3A":CATEG2:CAISSE:"') OR "
            CPT.CAISSE3="(@ID LIKE '3A":CATEG3:CAISSE:"')"
            PARAM=PARAM:CPT.CAISSE1:" ":CPT.CAISSE2:" ":CPT.CAISSE3
            CMD='SELECT ':FN.ACC.ENT: ' WITH ':PARAM
			CMD.LIST = '' ; NBR.CPT = '' ; ERR1 = ''  
            CALL EB.READLIST(CMD,CMD.LIST,'',NBR.CPT,ERR1)
            IF CMD.LIST EQ '' THEN
                E="Aucune operation effectuee"  
                CALL ERR
            END ELSE
                FOR COUNTER=1 TO NBR.CPT
                    REMOVE COMPTE FROM CMD.LIST SETTING POS1  

* WHILE COMPTE :POS1
                    ACC.ENT.REC = '' ; ERR = ''  
                    CALL F.READ(FN.ACC.ENT,COMPTE,ACC.ENT.REC,F.ACC.ENT,ERR)
                    NOMBRE.LINK=DCOUNT(ACC.ENT.REC,@FM)
                    FOR LINK=1 TO NOMBRE.LINK
           FT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefemTables.setE(ACC.ENT.REC<LINK>)
						STMT.REC = '' ; ERR = ''  
                        CALL F.READ(FN.STMT,LIEN.STMT,STMT.REC,F.STMT,ERR)
                        MNT.LCY=STMT.REC<AC.STE.AMOUNT.LCY>
                        CATEG=STMT.REC<AC.STE.PRODUCT.CATEGORY>
                        UNITE=STMT.REC<AC.STE.DEPARTMENT.CODE>
                        MNT.FCY=STMT.REC<AC.STE.AMOUNT.FCY>
                        REF=STMT.REC<AC.STE.TRANS.REFERENCE>
                        DEVISE=STMT.REC<AC.STE.CURRENCY>
                        CODE.TRANS=STMT.REC<AC.STE.TRANSACTION.CODE>
                        IF DEVISE EQ 'TND' THEN
                            MONTANT = MNT.LCY  
                        END ELSE
                            MONTANT=MNT.FCY
                        END
                        TABLEAU<-1>=UNITE: '*' :CAISSE:'*':OPERATOR: '*' :DEVISE:'*':CATEG:'*':REF:'*':CODE.TRANS:'*': MONTANT
                    NEXT LINK

                NEXT COUNTER  
            END
        REPEAT
    END

    RETURN

END
