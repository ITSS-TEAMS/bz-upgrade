*-----------------------------------------------------------------------------
* <Rating>0</Rating>
*-----------------------------------------------------------------------------
*Modification History:
*ZIT-UPG-R13-R19:CONVERT converted to CHANGE
*               :FM,VM converted to @FM,@VM
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.TRES.RAP.DEPASSEMENT.NEW
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
    $INSERT I_F.ENQUIRY
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.FX.PARAMETERS
    $INSERT I_F.BZ.POS.MVMT.TODAY


    GOSUB INIT
    GOSUB OPEN.FILES
    GOSUB PROCESS
    GOSUB WRITE.TO.FILE

INIT:

* $INSERT I_EQUATE - Not Used anymore;OS.MVMT.TODAY"
    F.POS = ""

    Y.LASTDAY = TODAY

    CALL CDT('',Y.LASTDAY,'-1W')
    DONNE.REC.FINAL =""

    Y.SPACE = SPACE(10)

    Y.TOT.DEP = 0

******************
    Y.REP.IN="BZ.TRES.REPORT"

    Y.FILE.NAME="DEPASSEMENT-REG-DU-":TODAY:".txt"

    OPENSEQ './' : Y.REP.IN :'/' : Y.FILE.NAME TO FP.FILEFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus FP.FILE.NAME ELSE
        TEXT = Y.FILE.NAMEFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus la creation du fichier des rejets'

        RETURN
    END
******************

    RETURN

OPEN.FILES:

    CALL OPF(FN.POS,F.POS)

    RETURN

PROCESS:

    SEL.CUR= "SELECT ":FN.POS:" WITH @ID LIKE '...":Y.LASTDAY:"'"
	SEL.CUR.IDS=''
	SEL.CUR.COUNT=''
	SEL.CUR.ERROR=''
    CALL EB.READLIST(SEL.CUR, SEL.CUR.IDS, '', SEL.CUR.COUNT,SEL.CUR.ERROR)

    IF SEL.CUR.IDS THEN

        FOR COMPTEUR.DVS = 1 TO SEL.CUR.COUNT

            DEVISE.TMP = SEL.CUR.IDS<COMPTEUR.DVS>

       EB.DataAccess.OpfB.DataAccess.OpfPOS.REC=''
			POS.ERR=''
            CALL F.READ(FN.POS,DEVISE.TMP,POS.REC,F.POS,POS.ERR)

            IF POS.REC THEN

                Y.DEP FT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefOUR.FP.NEW>

       EB.DataAccess.FRead   IF Y.DEP  THEN

                    Y.TOT.DEP = Y.TOT.DEP + Y.DEP

                    IF Y.DEB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyer         EB.SystemTables.setE(DEVISE.TMP[1,3]:Y.SPACE:Y.DEP)
                    END

                ENEB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyerNDEB.DataAccess.FWrite     NEXT COMPTEUR.DVS

      EB.SystemTables.setAf()*-----------------------------------------------------------------------------
* <Rating>0</Rating>
*-----------------------------------------------------------------------------
*Modification History:
*ZIT-UPG-R13-R19:CONVERT converted to CHANGE
*               :FM,VM converted to @FM,@VM
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.TRES.RAP.DEPASSEMENT.NEW
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
    $INSERT I_F.ENQUIRY
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.FX.PARAMETERS
    $INSERT I_F.BZ.POS.MVMT.TODAY


    GOSUB INIT
    GOSUB OPEN.FILES
    GOSUB PROCESS
    GOSUB WRITE.TO.FILE

INIT:

    FN.POS = "F.BZ.POS.MVMT.TODAY"
    F.POS = ""

    Y.LASTDAY = TODAY

    CALL CDT('',Y.LASTDAY,'-1W')
    DONNE.REC.FINAL =""

    Y.SPACE = SPACE(10)

    Y.TOT.DEP = 0

******************
    Y.REP.IN="BZ.TRES.REPORT"

    Y.FILE.NAME="DEPASSEMENT-REG-DU-":TODAY:".txt"

    OPENSEQ './' : Y.REP.IN :'/' : Y.FILE.NAME TO FP.FILE.NAME ELSE CREATE FP.FILE.NAME ELSE
        TEXT = Y.FILE.NAME:' Erreur lors de la creation du fichier des rejets'

        RETURN
    END
******************

    RETURN

OPEN.FILES:

    CALL OPF(FN.POS,F.POS)

    RETURN

PROCESS:

    SEL.CUR= "SELECT ":FN.POS:" WITH @ID LIKE '...":Y.LASTDAY:"'"
	SEL.CUR.IDS=''
	SEL.CUR.COUNT=''
	SEL.CUR.ERROR=''
    CALL EB.READLIST(SEL.CUR, SEL.CUR.IDS, '', SEL.CUR.COUNT,SEL.CUR.ERROR)

    IF SEL.CUR.IDS THEN

        FOR COMPTEUR.DVS = 1 TO SEL.CUR.COUNT

            DEVISE.TMP = SEL.CUR.IDS<COMPTEUR.DVS>

            POS.REC=''
			POS.ERR=''
            CALL F.READ(FN.POS,DEVISE.TMP,POS.REC,F.POS,POS.ERR)

            IF POS.REC THEN

                Y.DEP = POS.REC<POS.POUR.FP.NEW>

                IF Y.DEP  THEN

                    Y.TOT.DEP = Y.TOT.DEP + Y.DEP

                    IF Y.DEP GT 10 THEN
                        DONNE.REC.FINAL<-1> = DEVISE.TMP[1,3]:Y.SPACE:Y.DEP
                    END

                END

            END

        NEXT COMPTEUR.DVS

        EFT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefsetE()*-----------------------------------------------------------------------------
* <Rating>0</Rating>
*-----------------------------------------------------------------------------
*Modification History:
*ZIT-UPG-R13-R19:CONVERT converted to CHANGE
*               :FM,VM converted to @FM,@VM
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.TRES.RAP.DEPASSEMENT.NEW
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
    $INSERT I_F.ENQUIRY
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.FX.PARAMETERS
    $INSERT I_F.BZ.POS.MVMT.TODAY


    GOSUB INIT
    GOSUB OPEN.FILES
    GOSUB PROCESS
    GOSUB WRITE.TO.FILE

INIT:

    FN.POS = "F.BZ.POS.MVMT.TODAY"
    F.POS = ""

    Y.LASTDAY = TODAY

    CALL CDT('',Y.LASTDAY,'-1W')
    DONNE.REC.FINAL =""

    Y.SPACE = SPACE(10)

    Y.TOT.DEP = 0

******************
    Y.REP.IN="BZ.TRES.REPORT"

    Y.FILE.NAME="DEPASSEMENT-REG-DU-":TODAY:".txt"

    OPENSEQ './' : Y.REP.IN :'/' : Y.FILE.NAME TO FP.FILE.NAME ELSE CREATE FP.FILE.NAME ELSE
        TEXT = Y.FILE.NAME:' Erreur lors de la creation du fichier des rejets'

        RETURN
    END
******************

    RETURN

OPEN.FILES:

    CALL OPF(FN.POS,F.POS)

    RETURN

PROCESS:

    SEL.CUR= "SELECT ":FN.POS:" WITH @ID LIKE '...":Y.LASTDAY:"'"
	SEL.CUR.IDS=''
	SEL.CUR.COUNT=''
	SEL.CUR.ERROR=''
    CALL EB.READLIST(SEL.CUR, SEL.CUR.IDS, '', SEL.CUR.COUNT,SEL.CUR.ERROR)

    IF SEL.CUR.IDS THEN

        FOR COMPTEUR.DVS = 1 TO SEL.CUR.COUNT

            DEVISE.TMP = SEL.CUR.IDS<COMPTEUR.DVS>

            POS.REC=''
			POS.ERR=''
            CALL F.READ(FN.POS,DEVISE.TMP,POS.REC,F.POS,POS.ERR)

            IF POS.REC THEN

                Y.DEP = POS.REC<POS.POUR.FP.NEW>

                IF Y.DEP  THEN

                    Y.TOT.DEP = Y.TOT.DEP + Y.DEP

                    IF Y.DEP GT 10 THEN
                        DONNE.REC.FINAL<-1> = DEVISE.TMP[1,3]:Y.SPACE:Y.DEP
                    END

                END

            END

        NEXT COMPTEUR.DVS

        IF DONNE.REC.FINAL THEN
            DONNE.REC.FINAL<-1> ="---------------------"
            DONNE.REC.FINAL<-1> = "TOT":Y.SPACE:Y.TOT.DEP
        END ELSE
            DONNE.REC.FINAL = "ACUCUN DEPASSEMENT ENREGISTRE"
        END

    END ELSE
        DONNE.REC.FINAL = "NEANT"

    END

    RETURN
***************
WRITE.TO.FILE:
***************

*ZIT-UPG-R13-R19 S
*   CONVERT VM TO FM IN DONNE.REC.FINAL
*   CONVERT FM TO CHARX(10) IN DONNE.REC.FINAL
	
	CHANGE @VM TO @FM IN DONNE.REC.FINAL
    CHANGE @FM TO CHARX(10) IN DONNE.REC.FINAL
*ZIT-UPG-R13-R19 E

    WRITESEQ DONNE.REC.FINAL TO FP.FILE.NAME ELSE
        TEXT = 'Erreur lors de l ecriture des donnees'
    END


    RETURN
END
