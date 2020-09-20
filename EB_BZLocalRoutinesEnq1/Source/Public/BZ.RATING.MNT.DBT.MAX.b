$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.RATING.MNT.DBT.MAX
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*---------------------------------------------------
* Modification History :   	
*ZITUNA-UPG-R13-R19 :  removed BP's and changed INCLUDE to INSERT   
*                      FM,VM converted to @FM,@VM , CONVERT to CHANGE            	
*------------------------------------------------------------
	  
    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.BZ.SOLDE.MOYEN    

*-------------------------------------------------
    GOSUB INIT
    GOSUB MAIN
    GOSUB END.PROGRAM  

    RETURN
*------------------------------------------------
INIT:
    FN.BZ.SOLDE.MOYEN='F.BZ.SOLDE.MOYEN'
    F.BZ.SOLDE.MOYEN=''
    ID.ACCOUNT=O.DATA
  

    R.BZ.SOLDE.MOYEN=''
    ERR.BZ.SOLDE.MOYEN=''
    CALL OPF (FN.BZ.SOLDE.MOYEN, F.BZ.SOLDE.MOYEN)
    RETURN
*-----------------------------------------------------
MAIN:

    SQL.MNT.DBT = "SELECT ":FN.BZ.SOLDE.MOYEN:" WITH @ID LIKE '":ID.ACCOUNT:"...' BY-DSND @ID"
	MNT.DBT.IDS = '' ; MNT.DBT.COUNT = '' ; MNT.DBT.ERROR = ''  
    CALL EB.READLIST(SQL.MNT.DBT , MNT.DBT.IDS, '', MNT.DBT.COUNT, MNT.DBT.ERROR)

    Y.NBRE.STEP=0
    Y.MAX.ALL  = ""

    LOOP
        EB.SystemTables.getVFunction()OIS.ID FROM MEB.SystemTables.getVFunction() SETTING YPOEB.SystemTables.getRNew()FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusD:YPOS
        Y.NBRE.STEP ++
        IF Y.NFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusN
		    BZ.SOLDE.MOYEN.REC = '' ; ERR.BZ.SOLDE.MOYEN = ''  
            CALL F.READ(FN.BZ.SOLDE.MOYEN, MNT.DBT.IDS<Y.NBRE.STEP>,BZ.SOLDE.MOYEN.REC, F.BZ.SOLDE.MOYEN, ERR.BZ.SOLDE.MOYEN)
            Y.SOLDES = BZ.SOLDE.MOYEN.REC<SOLDE.SOLDE.DB>
            Y.MAX.ALL=Y.MAX.ALL:@VM:Y.SOLDES
        END ELSE
            GOSUB END.PROGRAM
        END
    REPEAT

    RETURN
END.PROGRAM:
  
    IF Y.MAX.ALL EQ "" THEN  
        Y.MAX.DEBIT = 0
    END ELSE
       * CONVERT VM TO FM IN Y.MAX.ALL
	     CHANGE @VM TO @FM IN Y.MAX.ALL  
        Y.MAX.DEBIT=MINIMUM(Y.MAX.ALL)
    END
    O.DATA = Y.MAX.DEBIT

END
