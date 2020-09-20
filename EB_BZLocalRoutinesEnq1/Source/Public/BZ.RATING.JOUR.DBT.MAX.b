* Modification History:
* ZIT-UPG-R13-R19 : Converted $INCLUDE TO $INSERT, Variables initialized, Converted FM, VM to @FM, @VM, CONVERT to CHANGE

$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.RATING.JOUR.DBT.MAX
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

    BZ.SOLDE.MOYEN.REC=''
    R.BZ.SOLDE.MOYEN=''
* $INSERT I_COMMON - Not Used anymore;EN=''
* $INSERT I_EQUATE - Not Used anymore;SOLDE.MOYEN, F.BZ.SOLDE.MOYEN)
    
    
    
    MNT.DBT.IDS=''
    MNT.DBT.COUNT=''
    MNT.DBT.ERROR=''
    
    
RETURN
*-----------------------------------------------------
MAIN:

    SQL.MNT.DBT = "SELECT ":FN.BZ.SOLDE.MOYEN:" WITH @ID LIKE '":ID.ACCOUNT:"...' BY-DSND @ID"
    CALL EB.READLIST(SQL.MNT.DBT , MNT.DBT.IDS, '', MNT.DBT.COUNT, MNT.DBT.ERROR)

    Y.NBEB.SystemTables.getVFunction()
    Y.MAX.ALL  = ""

    LOOP
       FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus FROM MNT.DBT.IDS SETTING YPOS
    WHILE Y.MOFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus   Y.NBRE.STEP ++
        IF Y.NBRE.STEP LE 3 THEN
            CALL F.READ(FN.BZ.SOLDE.MOYEN, MNT.DBT.IDS<Y.NBRE.STEP>,BZ.SOLDE.MOYEN.REC, F.BZ.SOLDE.MOYEN, ERR.BZ.SOLDE.MOYEN)
            Y.SOLDES = BZ.SOLDE.MOYEN.REC<SOLDE.NBR.JOURS.DB>
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
        CHANGE @VM TO @FM IN Y.MAX.ALL
        Y.MAX.DEBIT=MAXIMUM(Y.MAX.ALL)
    END
    O.DATA = Y.MAX.DEBIT
END
