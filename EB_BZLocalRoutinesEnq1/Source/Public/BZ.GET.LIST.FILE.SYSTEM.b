*-----------------------------------------------------------------------------
* <Rating>-53</Rating>
*-----------------------------------------------------------------------------

$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.GET.LIST.FILE.SYSTEM(TABLEAU)
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
*ZIT-UPG-R09-R13  : $INSERT BP to $INCLUDE BZDEV.BP 
*ZIT_UPG_R13_TO_R19 : NO CHANGES                          
*-----------------------------------------------------------------------------

$INSERT I_COMMON
$INSERT I_EQUATE
$INSERT I_ENQUIRY.COMMON
$INSERT I_F.ACCOUNT

*ZIT-UPG-R09-R13/S
*$INSERT BP I_F.BZ.STRUCT.FILE
$INSERT I_F.BZ.STRUCT.FILE
*ZIT-UPG-R09-R13/E

MAIN:
    GOSUB INIT
* $INSERT I_COMMON - Not Used anymore;
    GOSUB PROCESS
    RETURN


INIT:
    FN.STRUCT.FILE="F.BZ.STRUCT.FILE"
    F.STRUCT.FILE=""

    SEL.LIST=''
    LOCATE "SYSTEM" IN D.FIELDS<1> SETTING REP.POS THEN
        SYSTEME = D.RANGE.AND.VALUE<REP.POS>
    END
    RETURN

OPENFILES:

tmp.V$FUNCTION = EB.SystemTables.getVFunction()
    CALLEB.SystemTables.getVFunction()RUCT.FILE,F.Stmp.V$FUNCTION)
EB.SystemTables.setVFunction(tmp.V$FUNCTION)

    RETURN
FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusST =''
NO.OF.REC =''
ERR1  =''
    SEL.COMMFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusSTRUCT.FILE:" WITH SYSTEM EQ ":SYSTEME
    CALL EB.READLIST(SEL.COMMAND,SEL.LIST,'',NO.OF.REC,ERR1)

    IF SEL.LIST EQ '' THEN
        TABLEAU<-1>="Aucun fichier trouve":'*'
    END ELSE

        LOOP
            REMOVE Y.STRUCT.ID FROM SEL.LIST SETTING POS
        WHILE Y.STRUCT.ID  :POS
		R.STRUCT.FILE =''
		ERR5 =''
		
            CALL F.READ(FN.STRUCT.FILE, Y.STRUCT.ID ,R.STRUCT.FILE,F.STRUCT.FILE,ERR5)

            Y.IN.FOLDER=R.STRUCT.FILE<BZ.STR.IN.FOLDER>
            Y.PREFIX=R.STRUCT.FILE<BZ.STR.PREFIX>
            Y.ECRAN=R.STRUCT.FILE<BZ.STR.ECRAN>
            GOSUB RECHERCHE.FILE

        REPEAT
    END
EB.DataAccess.Opf   RETEB.DataAccess.Opf

RECHERCHE.FILE:

    CONDITION.FICHEB.SystemTables.getRNew()FT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRef:Y.PREFIX:"..."

    SEL.CEB.DataAccess.FRead.FILE="SELECT ":Y.IN.FOLDER:CONDITION.FICHIER
    CALL EB.READLIST(SEL.COMMAND.FILE,SEL.LIST.FILE,'',NO.OF.REC,ERR1)


    LOOP
        REMOVE FICEB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyer.FILE SETTING POS
    WHILE FIEB.SystemTables.setE()*-----------------------------------------------------------------------------
* <Rating>-53</Rating>
*-----------------------------------------------------------------------------

$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.GET.LIST.FILE.SYSTEM(TABLEAU)
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
*ZIT-UPG-R09-R13  : $INSERT BP to $INCLUDE BZDEV.BP 
*ZIT_UPG_R13_TO_R19 : NO CHANGES                          
*-----------------------------------------------------------------------------

$INSERT I_COMMON
$INSERT I_EQUATE
$INSERT I_ENQUIRY.COMMON
$INSERT I_F.ACCOUNT

*ZIT-UPG-R09-R13/S
*$INSERT BP I_F.BZ.STRUCT.FILE
$INSERT I_F.BZ.STRUCT.FILE
*ZIT-UPG-R09-R13/E

MAIN:
    GOSUB INIT
    GOSUB OPENFILES
    GOSUB PROCESS
    RETURN


INIT:
    FN.STRUCT.FILE="F.BZ.STRUCT.FILE"
    F.STRUCT.FILE=""

    SEL.LIST=''
    LOCATE "SYSTEM" IN D.FIELDS<1> SETTING REP.POS THEN
        SYSTEME = D.RANGE.AND.VALUE<REP.POS>
    END
    RETURN

OPENFILES:

    CALL OPF(FN.STRUCT.FILE,F.STRUCT.FILE)

    RETURN

PROCESS:
SEL.LIST =''
NO.OF.REC =''
ERR1  =''
    SEL.COMMAND="SELECT ":FN.STRUCT.FILE:" WITH SYSTEM EQ ":SYSTEME
    CALL EB.READLIST(SEL.COMMAND,SEL.LIST,'',NO.OF.REC,ERR1)

    IF SEL.LIST EQ '' THEN
        TABLEAU<-1>="Aucun fichier trouve":'*'
    END ELSE

        LOOP
            REMOVE Y.STRUCT.ID FROM SEL.LIST SETTING POS
        WHILE Y.STRUCT.ID  :POS
		R.STRUCT.FILE =''
		ERR5 =''
		
            CALL F.READ(FN.STRUCT.FILE, Y.STRUCT.ID ,R.STRUCT.FILE,F.STRUCT.FILE,ERR5)

            Y.IN.FOLDER=R.STRUCT.FILE<BZ.STR.IN.FOLDER>
            Y.PREFIX=R.STRUCT.FILE<BZ.STR.PREFIX>
            Y.ECRAN=R.STRUCT.FILE<BZ.STR.ECRAN>
            GOSUB RECHERCHE.FILE

        REPEAT
    END

    RETURN

RECHERCHE.FILE:

    CONDITION.FICHIER=" WITH @ID LIKE ":Y.PREFIX:"..."

    SEL.COMMAND.FILE="SELECT ":Y.IN.FOLDER:CONDITION.FICHIER
    CALL EB.READLIST(SEL.COMMAND.FILE,SEL.LIST.FILE,'',NO.OF.REC,ERR1)


    LOOP
        REMOVE FICHIER FROM SEL.LIST.FILE SETTING POS
    WHILE FICHIER :POS
        TABLEAU<-1>= Y.PREFIX: '*' :FICHIER: '*' :Y.STRUCT.ID: '*' :Y.ECRAN: '*':SYSTEME: '*'
    REPEAT

    RETURN

END
