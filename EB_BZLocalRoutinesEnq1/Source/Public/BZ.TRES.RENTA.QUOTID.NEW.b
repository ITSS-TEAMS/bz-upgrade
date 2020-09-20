*-----------------------------------------------------------------------------
* <Rating>0</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.TRES.RENTA.QUOTID.NEW
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
*                      FM converted to @FM , CONVERT to CHANGE
*                      PRINT converted to OCOMO       
*--------------------------------------------------------------------
  
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

* $INSERT I_F.AC.CHARGE.REQUEST - Not Used anymore;"
    F.POS = ""

    Y.LASTDAY = TODAY

    CALL CDT('',Y.LASTDAY,'-1W')
    Y.LIGNE =""

    Y.SPACE = SPACE(10)

    Y.TOT.DEP = 0

******************

    Y.REEB.SystemTables.getVFunction()RES.REPORT"


    NOM.FICHIER= "RESULTFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusLASTDAY:".txt"

    OPENSEQ './' : Y.REP.IN FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusR TO FP.ENREG ELSE CREATE FP.ENREG ELSE
        TEXT = NOM.FICHIER:' Erreur lors de la creation du fichier'
        RETURN
    END
******************
    Y.LIGNE = "Date : ":Y.LASTDAY
    Y.LIGNE<-1> = "Devise":Y.SPACE:"Resultat"
    Y.TOTAL = 0
    RETURN

OPEN.FILES:

    CALL OPF(FN.POS,F.POS)

    RETURN

PROCESS:

    SEL.CUR= "SELECT ":FN.POS:" WITH @ID LIKE '...":Y.LASTDAY:"'"
	SEL.CUR.IDS = '' ; SEL.CUR.COUNT = '' ; SEL.CUR.ERROR = ''    
    CALL EB.READLIST(SEL.CUR, SEL.CUR.IDS, '', SEL.CUR.COUNT,SEL.CUR.ERROR)

    IF SEL.CUR.IDS THEN

        FEB.DataAccess.OpfCOMPTEUR.DVS = 1 TO SEL.CUR.COUNT

       EB.DataAccess.Opf  DEVISE.TMP = SEL.CUR.IDS<COMPTEUR.DVS>
            POS.REC = '' ; POS.ERR = ''  
            CALL F.READ(FN.POS,DEVISE.TMP,POS.REC,F.POS,POS.ERR)

            IF POSEB.SystemTables.getRNew()TFT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRef EB.DataAccess.FRead Y.RES = POS.REC<POS.RESULTAT.NEW>
                Y.DEVISE = DEVISE.TMP[1,3]
                Y.TOTAL = Y.TOTAL + Y.RES
                Y.LIGNE<-1> = DEVISE.TMP[1,3]:Y.SPACE: Y.RES

            END

       EB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyer.setE()*-----------------------------------------------------------------------------
* <Rating>0</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.TRES.RENTA.QUOTID.NEW
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
*                      FM converted to @FM , CONVERT to CHANGE
*                      PRINT converted to OCOMO       
*--------------------------------------------------------------------
  
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
    Y.LIGNE =""

    Y.SPACE = SPACE(10)

    Y.TOT.DEP = 0

******************

    Y.REP.IN="BZ.TRES.REPORT"


    NOM.FICHIER= "RESULTAT-DEVISE-DU-":Y.LASTDAY:".txt"

    OPENSEQ './' : Y.REP.IN :'/' : NOM.FICHIER TO FP.ENREG ELSE CREATE FP.ENREG ELSE
        TEXT = NOM.FICHIER:' Erreur lors de la creation du fichier'
        RETURN
    END
******************
    Y.LIGNE = "Date : ":Y.LASTDAY
    Y.LIGNE<-1> = "Devise":Y.SPACE:"Resultat"
    Y.TOTAL = 0
    RETURN

OPEN.FILES:

    CALL OPF(FN.POS,F.POS)

    RETURN

PROCESS:

    SEL.CUR= "SELECT ":FN.POS:" WITH @ID LIKE '...":Y.LASTDAY:"'"
	SEL.CUR.IDS = '' ; SEL.CUR.COUNT = '' ; SEL.CUR.ERROR = ''    
    CALL EB.READLIST(SEL.CUR, SEL.CUR.IDS, '', SEL.CUR.COUNT,SEL.CUR.ERROR)

    IF SEL.CUR.IDS THEN

        FOR COMPTEUR.DVS = 1 TO SEL.CUR.COUNT

            DEVISE.TMP = SEL.CUR.IDS<COMPTEUR.DVS>
            POS.REC = '' ; POS.ERR = ''  
            CALL F.READ(FN.POS,DEVISE.TMP,POS.REC,F.POS,POS.ERR)

            IF POS.REC THEN

                Y.RES = POS.REC<POS.RESULTAT.NEW>
                Y.DEVISE = DEVISE.TMP[1,3]
                Y.TOTAL = Y.TOTAL + Y.RES
                Y.LIGNE<-1> = DEVISE.TMP[1,3]:Y.SPACE: Y.RES

            END

        NEXT COMPTEUR.DVS
        Y.LIGNE<-1> EB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyer-------"
        Y.LIGNE<-1> = "Total :":Y.SPACE: Y.TOTAL
    END

    REEB.DataAccess.FWrite**************
WRITE.TOEB.SystemTables.setAf()*-----------------------------------------------------------------------------
* <Rating>0</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.TRES.RENTA.QUOTID.NEW
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
*                      FM converted to @FM , CONVERT to CHANGE
*                      PRINT converted to OCOMO       
*--------------------------------------------------------------------
  
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
    Y.LIGNE =""

    Y.SPACE = SPACE(10)

    Y.TOT.DEP = 0

******************

    Y.REP.IN="BZ.TRES.REPORT"


    NOM.FICHIER= "RESULTAT-DEVISE-DU-":Y.LASTDAY:".txt"

    OPENSEQ './' : Y.REP.IN :'/' : NOM.FICHIER TO FP.ENREG ELSE CREATE FP.ENREG ELSE
        TEXT = NOM.FICHIER:' Erreur lors de la creation du fichier'
        RETURN
    END
******************
    Y.LIGNE = "Date : ":Y.LASTDAY
    Y.LIGNE<-1> = "Devise":Y.SPACE:"Resultat"
    Y.TOTAL = 0
    RETURN

OPEN.FILES:

    CALL OPF(FN.POS,F.POS)

    RETURN

PROCESS:

    SEL.CUR= "SELECT ":FN.POS:" WITH @ID LIKE '...":Y.LASTDAY:"'"
	SEL.CUR.IDS = '' ; SEL.CUR.COUNT = '' ; SEL.CUR.ERROR = ''    
    CALL EB.READLIST(SEL.CUR, SEL.CUR.IDS, '', SEL.CUR.COUNT,SEL.CUR.ERROR)

    IF SEL.CUR.IDS THEN

        FOR COMPTEUR.DVS = 1 TO SEL.CUR.COUNT

            DEVISE.TMP = SEL.CUR.IDS<COMPTEUR.DVS>
            POS.REC = '' ; POS.ERR = ''  
            CALL F.READ(FN.POS,DEVISE.TMP,POS.REC,F.POS,POS.ERR)

            IF POS.REC THEN

                Y.RES = POS.REC<POS.RESULTAT.NEW>
                Y.DEVISE = DEVISE.TMP[1,3]
                Y.TOTAL = Y.TOTAL + Y.RES
                Y.LIGNE<-1> = DEVISE.TMP[1,3]:Y.SPACE: Y.RES

            END

        NEXT COMPTEUR.DVS
        Y.LIGNE<-1> ="-----------------------"
        Y.LIGNE<-1> = "Total :":Y.SPACE: Y.TOTAL
    END

    RETURN
***************
WRITE.TO.FIFT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRef.SystemTables.setE()*-----------------------------------------------------------------------------
* <Rating>0</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.TRES.RENTA.QUOTID.NEW
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
*                      FM converted to @FM , CONVERT to CHANGE
*                      PRINT converted to OCOMO       
*--------------------------------------------------------------------
  
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
    Y.LIGNE =""

    Y.SPACE = SPACE(10)

    Y.TOT.DEP = 0

******************

    Y.REP.IN="BZ.TRES.REPORT"


    NOM.FICHIER= "RESULTAT-DEVISE-DU-":Y.LASTDAY:".txt"

    OPENSEQ './' : Y.REP.IN :'/' : NOM.FICHIER TO FP.ENREG ELSE CREATE FP.ENREG ELSE
        TEXT = NOM.FICHIER:' Erreur lors de la creation du fichier'
        RETURN
    END
******************
    Y.LIGNE = "Date : ":Y.LASTDAY
    Y.LIGNE<-1> = "Devise":Y.SPACE:"Resultat"
    Y.TOTAL = 0
    RETURN

OPEN.FILES:

    CALL OPF(FN.POS,F.POS)

    RETURN

PROCESS:

    SEL.CUR= "SELECT ":FN.POS:" WITH @ID LIKE '...":Y.LASTDAY:"'"
	SEL.CUR.IDS = '' ; SEL.CUR.COUNT = '' ; SEL.CUR.ERROR = ''    
    CALL EB.READLIST(SEL.CUR, SEL.CUR.IDS, '', SEL.CUR.COUNT,SEL.CUR.ERROR)

    IF SEL.CUR.IDS THEN

        FOR COMPTEUR.DVS = 1 TO SEL.CUR.COUNT

            DEVISE.TMP = SEL.CUR.IDS<COMPTEUR.DVS>
            POS.REC = '' ; POS.ERR = ''  
            CALL F.READ(FN.POS,DEVISE.TMP,POS.REC,F.POS,POS.ERR)

            IF POS.REC THEN

                Y.RES = POS.REC<POS.RESULTAT.NEW>
                Y.DEVISE = DEVISE.TMP[1,3]
                Y.TOTAL = Y.TOTAL + Y.RES
                Y.LIGNE<-1> = DEVISE.TMP[1,3]:Y.SPACE: Y.RES

            END

        NEXT COMPTEUR.DVS
        Y.LIGNE<-1> ="-----------------------"
        Y.LIGNE<-1> = "Total :":Y.SPACE: Y.TOTAL
    END

    RETURN
***************
WRITE.TO.FILE:
***************

    IF Y.LIGNE THEN
       * CONVERT FM TO CHARX(10) IN Y.LIGNE  
	     CHANGE @FM TO CHARX(10) IN Y.LIGNE    

      *  CRT Y.LIGNE
	     CALL OCOMO(Y.LIGNE)  
        WRITESEQ Y.LIGNE TO FP.ENREG ELSE
            TEXT = 'Erreur lors de l ecriture'
        END
    END


    RETURN
END
