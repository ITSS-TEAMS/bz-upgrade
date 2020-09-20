*-----------------------------------------------------------------------------
* <Rating>300</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.IS.PW.CHECK.AUTO.1 (ENQ.DATA)
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
* ZITOUNA-UPG-R13-R19 : FM,VM converted to @FM,@VM    
*-----------------------------------------------------------------------------

$INSERT I_COMMON
$INSERT I_EQUATE
$INSERT I_ENQUIRY.COMMON
$INSERT I_F.USER
$INSERT I_F.PW.ACTIVITY.TXN      
$INSERT I_F.PW.PROCESS
$INSERT I_F.PW.PARTICIPANT    
*-----------------------------------------------------------
    FN.PW = 'F.PW.PROCESS'
    F.PW = ''
    ERR.PW = ''
  
    FN.PW.ACT = 'F.PW.ACTIVITY.TXN'  
    F.PW.ACT = ''
* $INSERT I_COMMON - Not Used anymore;

* $INSERT I_ENQUIRY.COMMON - Not Used anymore;ARTICIPANT'
    F.PARTICIPANT= ''

    CALL OPF(FN.PW,F.PW)
    CALL OPF(FN.PW.ACT,F.PW.ACT)
* $INSERT I_F.BZ.COFFRE.LOYER - Not Used anymore;ARTICIPANT)

    CLE.USER = 'IS.USER'
    DAO = R.USER<EB.USE.DEPARTMENT.CODE>
    CLEIS = 'IS'

    PW.ID  = ENQ.DATA<4,1>

    PW.ID  =PW.ID[1,12]

tmp.V$FUNCTION = EB.SystemTables.getVFunction()
    CALLEB.SystemTables.getVFunction().PW,PW.ID,R.Ptmp.V$FUNCTION.PW)
EB.SystemTables.setVFunction(tmp.V$FUNCTION)

    IF ERRFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus
    ACTIVITY.TXN = R.PW<PW.PROC.ACTIVITY.TXNFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus= DCOUNT(ACTIVITY.TXN,@VM)


    FOR I = 1 TO NBR.TXN
        UTILISATEUR = ''
        ID.ACT.TXN = ACTIVITY.TXN<1,I>

        CALL F.READ(FN.PW.ACT,ID.ACT.TXN,R.PW.ACT,F.PW.ACT ,ERR.PW.ACT)

        OWNER.ACT = R.PW.ACT<PW.ACT.TXN.OWNER>

        CALL F.READ(FN.PARTICIPANT,OWNER.ACT,R.PARTICIPANT,F.PARTICIPANT ,ERR.PARTICIPANT)


        IF OWNER.ACT[1,7] EQ CLE.USER THEN


            UTILISATEUR=R.PARTICIPANT<PW.PART.USER>

            CHANGE @VM TO @FM IN UTILISATEUR

            LOCATE OPERATOR IN UTILISATEUR SETTING POS.OP ELSE POS.OP=0

         EB.DataAccess.OpfIF POS.OP NE 0 THEN

       EB.DataAccess.Opf      V.LIST.TXN<-1> = ID.ACT.TXN

            END


        END ELSE

  FT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefess.FReadTILISATEUR=R.PARTICIPANT<PW.PART.ACCT.OFFICER>

            CHANGE @VM TO @FM IN UTILISATEUR

            LOCATE DAO IN EB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyerG POS.OP ELSE POS.OP=0

          EB.SystemTables.setE()*-----------------------------------------------------------------------------
* <Rating>300</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.IS.PW.CHECK.AUTO.1 (ENQ.DATA)
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
* ZITOUNA-UPG-R13-R19 : FM,VM converted to @FM,@VM    
*-----------------------------------------------------------------------------

$INSERT I_COMMON
$INSERT I_EQUATE
$INSERT I_ENQUIRY.COMMON
$INSERT I_F.USER
$INSERT I_F.PW.ACTIVITY.TXN      
$INSERT I_F.PW.PROCESS
$INSERT I_F.PW.PARTICIPANT    
*-----------------------------------------------------------
    FN.PW = 'F.PW.PROCESS'
    F.PW = ''
    ERR.PW = ''
  
    FN.PW.ACT = 'F.PW.ACTIVITY.TXN'  
    F.PW.ACT = ''
    ERR.PW.ACT = ''

    FN.PARTICIPANT = 'F.PW.PARTICIPANT'
    F.PARTICIPANT= ''

    CALL OPF(FN.PW,F.PW)
    CALL OPF(FN.PW.ACT,F.PW.ACT)
    CALL OPF(FN.PARTICIPANT,F.PARTICIPANT)

    CLE.USER = 'IS.USER'
    DAO = R.USER<EB.USE.DEPARTMENT.CODE>
    CLEIS = 'IS'

    PW.ID  = ENQ.DATA<4,1>

    PW.ID  =PW.ID[1,12]

    CALL F.READ(FN.PW,PW.ID,R.PW,F.PW,ERR.PW)

    IF ERR.PW THEN RETURN

    ACTIVITY.TXN = R.PW<PW.PROC.ACTIVITY.TXN>

    NBR.TXN = DCOUNT(ACTIVITY.TXN,@VM)


    FOR I = 1 TO NBR.TXN
        UTILISATEUR = ''
        ID.ACT.TXN = ACTIVITY.TXN<1,I>

        CALL F.READ(FN.PW.ACT,ID.ACT.TXN,R.PW.ACT,F.PW.ACT ,ERR.PW.ACT)

        OWNER.ACT = R.PW.ACT<PW.ACT.TXN.OWNER>

        CALL F.READ(FN.PARTICIPANT,OWNER.ACT,R.PARTICIPANT,F.PARTICIPANT ,ERR.PARTICIPANT)


        IF OWNER.ACT[1,7] EQ CLE.USER THEN


            UTILISATEUR=R.PARTICIPANT<PW.PART.USER>

            CHANGE @VM TO @FM IN UTILISATEUR

            LOCATE OPERATOR IN UTILISATEUR SETTING POS.OP ELSE POS.OP=0

            IF POS.OP NE 0 THEN

                V.LIST.TXN<-1> = ID.ACT.TXN

            END


        END ELSE

            UTILISATEUR=R.PARTICIPANT<PW.PART.ACCT.OFFICER>

            CHANGE @VM TO @FM IN UTILISATEUR

            LOCATE DAO IN UTILISATEUR SETTING POS.OP ELSE POS.OP=0

            IF POS.OP NE 0 THEN

                V.EB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyerACT.TXN

            ENDEB.DataAccess.FWrite     END


    EB.SystemTables.setAf()*-----------------------------------------------------------------------------
* <Rating>300</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.IS.PW.CHECK.AUTO.1 (ENQ.DATA)
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
* ZITOUNA-UPG-R13-R19 : FM,VM converted to @FM,@VM    
*-----------------------------------------------------------------------------

$INSERT I_COMMON
$INSERT I_EQUATE
$INSERT I_ENQUIRY.COMMON
$INSERT I_F.USER
$INSERT I_F.PW.ACTIVITY.TXN      
$INSERT I_F.PW.PROCESS
$INSERT I_F.PW.PARTICIPANT    
*-----------------------------------------------------------
    FN.PW = 'F.PW.PROCESS'
    F.PW = ''
    ERR.PW = ''
  
    FN.PW.ACT = 'F.PW.ACTIVITY.TXN'  
    F.PW.ACT = ''
    ERR.PW.ACT = ''

    FN.PARTICIPANT = 'F.PW.PARTICIPANT'
    F.PARTICIPANT= ''

    CALL OPF(FN.PW,F.PW)
    CALL OPF(FN.PW.ACT,F.PW.ACT)
    CALL OPF(FN.PARTICIPANT,F.PARTICIPANT)

    CLE.USER = 'IS.USER'
    DAO = R.USER<EB.USE.DEPARTMENT.CODE>
    CLEIS = 'IS'

    PW.ID  = ENQ.DATA<4,1>

    PW.ID  =PW.ID[1,12]

    CALL F.READ(FN.PW,PW.ID,R.PW,F.PW,ERR.PW)

    IF ERR.PW THEN RETURN

    ACTIVITY.TXN = R.PW<PW.PROC.ACTIVITY.TXN>

    NBR.TXN = DCOUNT(ACTIVITY.TXN,@VM)


    FOR I = 1 TO NBR.TXN
        UTILISATEUR = ''
        ID.ACT.TXN = ACTIVITY.TXN<1,I>

        CALL F.READ(FN.PW.ACT,ID.ACT.TXN,R.PW.ACT,F.PW.ACT ,ERR.PW.ACT)

        OWNER.ACT = R.PW.ACT<PW.ACT.TXN.OWNER>

        CALL F.READ(FN.PARTICIPANT,OWNER.ACT,R.PARTICIPANT,F.PARTICIPANT ,ERR.PARTICIPANT)


        IF OWNER.ACT[1,7] EQ CLE.USER THEN


            UTILISATEUR=R.PARTICIPANT<PW.PART.USER>

            CHANGE @VM TO @FM IN UTILISATEUR

            LOCATE OPERATOR IN UTILISATEUR SETTING POS.OP ELSE POS.OP=0

            IF POS.OP NE 0 THEN

                V.LIST.TXN<-1> = ID.ACT.TXN

            END


        END ELSE

            UTILISATEUR=R.PARTICIPANT<PW.PART.ACCT.OFFICER>

            CHANGE @VM TO @FM IN UTILISATEUR

            LOCATE DAO IN UTILISATEUR SETTING POS.OP ELSE POS.OP=0

            IF POS.OP NE 0 THEN

                V.LIST.TXN<-1> = ID.ACT.TXN

            END

        END


    NEEFT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefsetE()*-----------------------------------------------------------------------------
* <Rating>300</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.IS.PW.CHECK.AUTO.1 (ENQ.DATA)
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
* ZITOUNA-UPG-R13-R19 : FM,VM converted to @FM,@VM    
*-----------------------------------------------------------------------------

$INSERT I_COMMON
$INSERT I_EQUATE
$INSERT I_ENQUIRY.COMMON
$INSERT I_F.USER
$INSERT I_F.PW.ACTIVITY.TXN      
$INSERT I_F.PW.PROCESS
$INSERT I_F.PW.PARTICIPANT    
*-----------------------------------------------------------
    FN.PW = 'F.PW.PROCESS'
    F.PW = ''
    ERR.PW = ''
  
    FN.PW.ACT = 'F.PW.ACTIVITY.TXN'  
    F.PW.ACT = ''
    ERR.PW.ACT = ''

    FN.PARTICIPANT = 'F.PW.PARTICIPANT'
    F.PARTICIPANT= ''

    CALL OPF(FN.PW,F.PW)
    CALL OPF(FN.PW.ACT,F.PW.ACT)
    CALL OPF(FN.PARTICIPANT,F.PARTICIPANT)

    CLE.USER = 'IS.USER'
    DAO = R.USER<EB.USE.DEPARTMENT.CODE>
    CLEIS = 'IS'

    PW.ID  = ENQ.DATA<4,1>

    PW.ID  =PW.ID[1,12]

    CALL F.READ(FN.PW,PW.ID,R.PW,F.PW,ERR.PW)

    IF ERR.PW THEN RETURN

    ACTIVITY.TXN = R.PW<PW.PROC.ACTIVITY.TXN>

    NBR.TXN = DCOUNT(ACTIVITY.TXN,@VM)


    FOR I = 1 TO NBR.TXN
        UTILISATEUR = ''
        ID.ACT.TXN = ACTIVITY.TXN<1,I>

        CALL F.READ(FN.PW.ACT,ID.ACT.TXN,R.PW.ACT,F.PW.ACT ,ERR.PW.ACT)

        OWNER.ACT = R.PW.ACT<PW.ACT.TXN.OWNER>

        CALL F.READ(FN.PARTICIPANT,OWNER.ACT,R.PARTICIPANT,F.PARTICIPANT ,ERR.PARTICIPANT)


        IF OWNER.ACT[1,7] EQ CLE.USER THEN


            UTILISATEUR=R.PARTICIPANT<PW.PART.USER>

            CHANGE @VM TO @FM IN UTILISATEUR

            LOCATE OPERATOR IN UTILISATEUR SETTING POS.OP ELSE POS.OP=0

            IF POS.OP NE 0 THEN

                V.LIST.TXN<-1> = ID.ACT.TXN

            END


        END ELSE

            UTILISATEUR=R.PARTICIPANT<PW.PART.ACCT.OFFICER>

            CHANGE @VM TO @FM IN UTILISATEUR

            LOCATE DAO IN UTILISATEUR SETTING POS.OP ELSE POS.OP=0

            IF POS.OP NE 0 THEN

                V.LIST.TXN<-1> = ID.ACT.TXN

            END

        END


    NEXT I

    CHANGE @FM TO SPACE(1) IN V.LIST.TXN       

    ENQ.DATA<3,1> = 'EQ'
    ENQ.DATA<4,1> = V.LIST.TXN   

    RETURN
END
