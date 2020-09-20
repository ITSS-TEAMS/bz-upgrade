$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.RATING.MANUAL.RISK.CLASS.12
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*------------------------------------------
* Modification History :  
*ZIT-UPG-R13-R19     :  No Changes.
*----------------------------------------
    $INSERT  I_COMMON
    $INSERT  I_EQUATE
    $INSERT  I_ENQUIRY.COMMON
    $INSERT  I_F.CUSTOMER
*-------------------------------
    GOSUB INITIALISE
    GOSUB OPENFILES
    GOSUB GET.MANUAL.RISK.CLASS
    GOSUB TRAITEMENT


    GOSUB END.PROGRAM
    RETURN
*------------------------
INITIALISE:
    FN.CUS = 'F.CUSTOMER$HIS'
    F.CUS = ""

* $INSERT I_COMMON - Not Used anymore;CUSTOMER'
* $INSERT I_EQUATE - Not Used anymore;
    Y.CUS=O.DATA

    Y.CUS.ID = Y.CUS

    R.CUS = ''
    Y.CUS.ERR = ''
    Y.DATA.FORM=TODAY
    Y.MAX=-1
    CALL CDT('',Y.DATA.FORM,'-365C')
    RETURN
*------------------------
OPENFILES:
    CALL OPF(FN.CUS,F.CUS)
    CALL OPF(FN.CUS.LIV,F.CUS.LIV)
    RETUEB.SystemTables.getVFunction()---------------------
TRAITEMENT:

tmpFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusSystemTables.getVFunction()
    CALL F.READ.HISTORY(FN.CUS,Y.CUS.Itmp.V$FUNCTIONF.CUS,Y.CUS.ERR)
EB.SystemTables.setVFunction(tmp.V$FUNCTION)
FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusEN
        Y.NOMBRE.HIS = FIELD(Y.CUS.ID,";",2)
        LOOP
            Y.CUS.ID.TMP = Y.CUS:";":Y.NOMBRE.HIS
            CALL F.READ(FN.CUS,Y.CUS.ID.TMP,CUS.REC,F.CUS,Y.CUS.ERR)
            IF CUS.REC THEN
                Y.DATE.REC = CUS.REC<EB.CUS.DATE.TIME>
                Y.DATE.REC = "20":Y.DATE.REC[1,6]
                Y.MANUAL.RISK.CLASS = CUS.REC<EB.CUS.MANUAL.RISK.CLASS>

                IF Y.MAX LT Y.MANUAL.RISK.CLASS THEN
                    Y.MAX=Y.MANUAL.RISK.CLASS
                END

                IF Y.DATE.REC LT Y.DATA.FORM THEN
                    GOSUB END.PROGRAM
                END

                Y.NOMBRE.HIS-=1

            END ELSE
                O.DATA = "ERROR"
                GOSUB END.PROGRAM
            END

       EB.DataAccess.OpfB.DataAccess.OpfE (Y.NOMBRE.HIS GE 1)

        REPEAT

    END ELSE
        GOSUB GET.EB.SystemTables.getRNew()LFT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRef  END

    RETEB.DataAccess.FRead
*---------------------------------------
GET.MANUAL.RISK.CLASS:

  EB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyermTables.setE()$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.RATING.MANUAL.RISK.CLASS.12
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*------------------------------------------
* Modification History :  
*ZIT-UPG-R13-R19     :  No Changes.
*----------------------------------------
    $INSERT  I_COMMON
    $INSERT  I_EQUATE
    $INSERT  I_ENQUIRY.COMMON
    $INSERT  I_F.CUSTOMER
*-------------------------------
    GOSUB INITIALISE
    GOSUB OPENFILES
    GOSUB GET.MANUAL.RISK.CLASS
    GOSUB TRAITEMENT


    GOSUB END.PROGRAM
    RETURN
*------------------------
INITIALISE:
    FN.CUS = 'F.CUSTOMER$HIS'
    F.CUS = ""

    FN.CUS.LIV = 'F.CUSTOMER'
    F.CUS.LIV = ''

    Y.CUS=O.DATA

    Y.CUS.ID = Y.CUS

    R.CUS = ''
    Y.CUS.ERR = ''
    Y.DATA.FORM=TODAY
    Y.MAX=-1
    CALL CDT('',Y.DATA.FORM,'-365C')
    RETURN
*------------------------
OPENFILES:
    CALL OPF(FN.CUS,F.CUS)
    CALL OPF(FN.CUS.LIV,F.CUS.LIV)
    RETURN
*--------------------------
TRAITEMENT:

    CALL F.READ.HISTORY(FN.CUS,Y.CUS.ID,CUS.REC,F.CUS,Y.CUS.ERR)
    IF CUS.REC THEN
        Y.NOMBRE.HIS = FIELD(Y.CUS.ID,";",2)
        LOOP
            Y.CUS.ID.TMP = Y.CUS:";":Y.NOMBRE.HIS
            CALL F.READ(FN.CUS,Y.CUS.ID.TMP,CUS.REC,F.CUS,Y.CUS.ERR)
            IF CUS.REC THEN
                Y.DATE.REC = CUS.REC<EB.CUS.DATE.TIME>
                Y.DATE.REC = "20":Y.DATE.REC[1,6]
                Y.MANUAL.RISK.CLASS = CUS.REC<EB.CUS.MANUAL.RISK.CLASS>

                IF Y.MAX LT Y.MANUAL.RISK.CLASS THEN
                    Y.MAX=Y.MANUAL.RISK.CLASS
                END

                IF Y.DATE.REC LT Y.DATA.FORM THEN
                    GOSUB END.PROGRAM
                END

                Y.NOMBRE.HIS-=1

            END ELSE
                O.DATA = "ERROR"
                GOSUB END.PROGRAM
            END

        WHILE (Y.NOMBRE.HIS GE 1)

        REPEAT

    END ELSE
        GOSUB GET.MANUAL.RISK.CLASS
    END

    RETURN

*---------------------------------------
GET.MANUAL.RISK.CLASS:

    CALL F.READ(FN.CUS.LIV,Y.CUS,CUS.REC,F.CUS.LIV,Y.CUS.ERR)
    Y.MANUAL.RISK.CLASS = CUS.REC<EB.CUS.MANUAL.RISK.CLASS>

    Y.MAX=Y.MANUALEB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyer RETURN
*--EB.DataAccess.FWrite-------------------------------
END.PROGRAM:
    O.DAEB.SystemTables.setAf(Y.MAX)
END
