*-----------------------------------------------------------------------------
* <Rating>873</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE Y.FT.AUTH(FT.REC.ID,R.FT.REC)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
	
*----------------------------------------------------------------------
* Modification History :

*ZIT-UPG-R13-R19 : VM CHANGED TO @VM; OPERATOR TO OPERANDS; VARIABLE INITIALISED
*                  Using F.RELEASE for ACCOUNT & LIMIT without passing ID will release all locked records and not a standard way to use F.RELEASE.
*----------------------------------------------------------------------
* Validates and authorises a FUNDS.TRANSFER in batch.
*----------------------------------------------------

*ZIT-UPG-R13-R19/S
$INSERT I_COMMON
$INSERT I_ENQUIRY.COMMON
$INSERT I_EQUATE
$INSERT I_F.SPF
$INSERT I_F.USER
$INSERT I_F.COMPANY
$INSERT I_F.AGENCY
$INSERT I_F.FUNDS.TRANSFER
* $INSERT I_COMMON - Not Used anymore;.CLEARING
* $INSERT I_EQUATE - Not Used anymore;RAMETER
$INSERT I_FT.LOCAL.COMMON
$INSERT I_F.TRANSACTION
$INSERT I_F.STMT.ENTRY
$INSERT I_F.CUSTOMER
$INSERT I_F.FT.APPL.DEFAULT
* $INSERT I_F.BZ.COFFRE.LOYER - Not Used anymore;
$INSERT I_F.FT.CHARGE.TYPE
$INSERT I_F.TAX.TYPE
$INSERT I_F.FT.TXN.TYPE.CONDITION
$INSERT I_F.FT.GROUP.CONDITION
$INSERT I_F.CUSTOMER.CHARGE
$INSERT I_F.ACCOUNT
$INSERT I_F.FTCOM
$INSERT I_F.DATES
$INSERT I_F.CURRENCY
$INSERT EB.SystemTables.getVFunction()$INSERT I_F.LOT.PARAMETER
$INSERT I_LOTPFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus.COMMON
*ZIT-UPG-R13-R19/E

*---- Revision FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus---------------------------------------
*
*----------------------------------------------------------------------

    IF FT.REC.ID MATCH "'FT'5N0X" 
	ELSE 
		RETURN
	END

    IF RUNNING.UNDER.BATCH 
	ELSE 
		CALL JOURNAL.UPDATE(ID.NEW)
	END

    GOSUB INITIALISE

    SAVE.ID.NEW = ID.NEW
    ID.NEW = FT.REC.ID
    SAVE.V = V
    FULL.FNAME.SAVE = FULL.FNAME
    F.FILE.SAVE = F.FILE
    SAVE.APPLICATION = APPLICATION
    MAT R.SAVE.NEW = MAT R.NEW

    APPEB.DataAccess.OpfB.DataAccess.OpfION = 'FUNDS.TRANSFER'
    V = FT.AUDIT.DATE.TIME
    FULL.FNAME = FN.FUNDS.TRANSFER

*     Seting up of a concatenate override class with these applications

    OLD.OVERRIDE.APPL FT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRef
    NEW.OEB.DataAccess.FReadE.APPL = APPLICATION:@VM:'ACCOUNT':@VM:'FUNDS.TRANSFER'
    IF NEW.OVERRIDE.APPL NE OLD.OVERRIDE.APPL THEN
        OLD.T.OV.CLASS = T.OV.CLASS
        OVERRIDE.APPL = NEW.OVERRIDE.APPL
        CALL SIT.T.OV.CLASSEB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyerT R.EB.SystemTables.setE(''); ER = ''

    IF R.FT.REC EQEB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyerIF R.LOT.EB.DataAccess.FWriteER<LOT.PAR.NO.F.READU> THEN
            CALL F.MATREAD(FN.FUNDS.TRANSFER$NAU,ID.NEW,MAT R.NEW,V,F.FUNDS.TRANSFER$NAU,ER)
        END ELSE
            CALL F.MATREADU(FN.FUNDS.TRANSFER$NAU,ID.NEW,MAT R.NEW,V,F.FUNDS.TRANSFER$NAU,ER,"")
        EB.SystemTables.setAf()*-----------------------------------------------------------------------------
* <Rating>873</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE Y.FT.AUTH(FT.REC.ID,R.FT.REC)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
	
*----------------------------------------------------------------------
* Modification History :

*ZIT-UPG-R13-R19 : VM CHANGED TO @VM; OPERATOR TO OPERANDS; VARIABLE INITIALISED
*                  Using F.RELEASE for ACCOUNT & LIMIT without passing ID will release all locked records and not a standard way to use F.RELEASE.
*----------------------------------------------------------------------
* Validates and authorises a FUNDS.TRANSFER in batch.
*----------------------------------------------------

*ZIT-UPG-R13-R19/S
$INSERT I_COMMON
$INSERT I_ENQUIRY.COMMON
$INSERT I_EQUATE
$INSERT I_F.SPF
$INSERT I_F.USER
$INSERT I_F.COMPANY
$INSERT I_F.AGENCY
$INSERT I_F.FUNDS.TRANSFER
$INSERT I_F.FT.LOCAL.CLEARING
$INSERT I_F.FT.BC.PARAMETER
$INSERT I_FT.LOCAL.COMMON
$INSERT I_F.TRANSACTION
$INSERT I_F.STMT.ENTRY
$INSERT I_F.CUSTOMER
$INSERT I_F.FT.APPL.DEFAULT
$INSERT I_F.FT.COMMISSION.TYPE
$INSERT I_F.FT.CHARGE.TYPE
$INSERT I_F.TAX.TYPE
$INSERT I_F.FT.TXN.TYPE.CONDITION
$INSERT I_F.FT.GROUP.CONDITION
$INSERT I_F.CUSTOMER.CHARGE
$INSERT I_F.ACCOUNT
$INSERT I_F.FTCOM
$INSERT I_F.DATES
$INSERT I_F.CURRENCY
$INSERT I_SITOVA
$INSERT I_F.LOT.PARAMETER
$INSERT I_LOTPAR
$INSERT I_OVE.COMMON
*ZIT-UPG-R13-R19/E

*---- Revision History ------------------------------------------------
*
*----------------------------------------------------------------------

    IF FT.REC.ID MATCH "'FT'5N0X" 
	ELSE 
		RETURN
	END

    IF RUNNING.UNDER.BATCH 
	ELSE 
		CALL JOURNAL.UPDATE(ID.NEW)
	END

    GOSUB INITIALISE

    SAVE.ID.NEW = ID.NEW
    ID.NEW = FT.REC.ID
    SAVE.V = V
    FULL.FNAME.SAVE = FULL.FNAME
    F.FILE.SAVE = F.FILE
    SAVE.APPLICATION = APPLICATION
    MAT R.SAVE.NEW = MAT R.NEW

    APPLICATION = 'FUNDS.TRANSFER'
    V = FT.AUDIT.DATE.TIME
    FULL.FNAME = FN.FUNDS.TRANSFER

*     Seting up of a concatenate override class with these applications

    OLD.OVERRIDE.APPL = OVERRIDE.APPL
    NEW.OVERRIDE.APPL = APPLICATION:@VM:'ACCOUNT':@VM:'FUNDS.TRANSFER'
    IF NEW.OVERRIDE.APPL NE OLD.OVERRIDE.APPL THEN
        OLD.T.OV.CLASS = T.OV.CLASS
        OVERRIDE.APPL = NEW.OVERRIDE.APPL
        CALL SIT.T.OV.CLASS
    END

    MAT R.NEW = '' ; ER = ''

    IF R.FT.REC EQ '' THEN
        IF R.LOT.PARAMETER<LOT.PAR.NO.F.READU> THEN
            CALL F.MATREAD(FN.FUNDS.TRANSFER$NAU,ID.NEW,MAT R.NEW,V,F.FUNDS.TRANSFER$NAU,ER)
        END ELSE
            CALL F.MATREADU(FN.FUNDS.TRANSFER$NAU,ID.NEW,MAT R.NEW,V,F.FUNDS.TRANSFER$NAU,ER,"")
        ENDFT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefstemTables.setE()*-----------------------------------------------------------------------------
* <Rating>873</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE Y.FT.AUTH(FT.REC.ID,R.FT.REC)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
	
*----------------------------------------------------------------------
* Modification History :

*ZIT-UPG-R13-R19 : VM CHANGED TO @VM; OPERATOR TO OPERANDS; VARIABLE INITIALISED
*                  Using F.RELEASE for ACCOUNT & LIMIT without passing ID will release all locked records and not a standard way to use F.RELEASE.
*----------------------------------------------------------------------
* Validates and authorises a FUNDS.TRANSFER in batch.
*----------------------------------------------------

*ZIT-UPG-R13-R19/S
$INSERT I_COMMON
$INSERT I_ENQUIRY.COMMON
$INSERT I_EQUATE
$INSERT I_F.SPF
$INSERT I_F.USER
$INSERT I_F.COMPANY
$INSERT I_F.AGENCY
$INSERT I_F.FUNDS.TRANSFER
$INSERT I_F.FT.LOCAL.CLEARING
$INSERT I_F.FT.BC.PARAMETER
$INSERT I_FT.LOCAL.COMMON
$INSERT I_F.TRANSACTION
$INSERT I_F.STMT.ENTRY
$INSERT I_F.CUSTOMER
$INSERT I_F.FT.APPL.DEFAULT
$INSERT I_F.FT.COMMISSION.TYPE
$INSERT I_F.FT.CHARGE.TYPE
$INSERT I_F.TAX.TYPE
$INSERT I_F.FT.TXN.TYPE.CONDITION
$INSERT I_F.FT.GROUP.CONDITION
$INSERT I_F.CUSTOMER.CHARGE
$INSERT I_F.ACCOUNT
$INSERT I_F.FTCOM
$INSERT I_F.DATES
$INSERT I_F.CURRENCY
$INSERT I_SITOVA
$INSERT I_F.LOT.PARAMETER
$INSERT I_LOTPAR
$INSERT I_OVE.COMMON
*ZIT-UPG-R13-R19/E

*---- Revision History ------------------------------------------------
*
*----------------------------------------------------------------------

    IF FT.REC.ID MATCH "'FT'5N0X" 
	ELSE 
		RETURN
	END

    IF RUNNING.UNDER.BATCH 
	ELSE 
		CALL JOURNAL.UPDATE(ID.NEW)
	END

    GOSUB INITIALISE

    SAVE.ID.NEW = ID.NEW
    ID.NEW = FT.REC.ID
    SAVE.V = V
    FULL.FNAME.SAVE = FULL.FNAME
    F.FILE.SAVE = F.FILE
    SAVE.APPLICATION = APPLICATION
    MAT R.SAVE.NEW = MAT R.NEW

    APPLICATION = 'FUNDS.TRANSFER'
    V = FT.AUDIT.DATE.TIME
    FULL.FNAME = FN.FUNDS.TRANSFER

*     Seting up of a concatenate override class with these applications

    OLD.OVERRIDE.APPL = OVERRIDE.APPL
    NEW.OVERRIDE.APPL = APPLICATION:@VM:'ACCOUNT':@VM:'FUNDS.TRANSFER'
    IF NEW.OVERRIDE.APPL NE OLD.OVERRIDE.APPL THEN
        OLD.T.OV.CLASS = T.OV.CLASS
        OVERRIDE.APPL = NEW.OVERRIDE.APPL
        CALL SIT.T.OV.CLASS
    END

    MAT R.NEW = '' ; ER = ''

    IF R.FT.REC EQ '' THEN
        IF R.LOT.PARAMETER<LOT.PAR.NO.F.READU> THEN
            CALL F.MATREAD(FN.FUNDS.TRANSFER$NAU,ID.NEW,MAT R.NEW,V,F.FUNDS.TRANSFER$NAU,ER)
        END ELSE
            CALL F.MATREADU(FN.FUNDS.TRANSFER$NAU,ID.NEW,MAT R.NEW,V,F.FUNDS.TRANSFER$NAU,ER,"")
        END
    END ELSE
        FOR IJK = 1 TO V
            R.NEW(IJK) = R.FT.REC<IJK>
        NEXT IJK
    END
    IF NOT(ER) THEN
        GOSUB PROCESS.VALAUT
        IF SW.OK THEN
            CALL F.DELETE(FN.FUNDS.TRANSFER$NAU,ID.NEW)
        END ELSE
            IF R.NEW(FT.RECORD.STATUS) EQ '' THEN
				R.NEW(FT.RECORD.STATUS) = 'IHLD'
			END
            CALL F.MATWRITE(FN.FUNDS.TRANSFER$NAU,ID.NEW,MAT R.NEW,FT.AUDIT.DATE.TIME)
            CALL F.RELEASE(FN.FUNDS.TRANSFER, ID.NEW, F.FUNDS.TRANSFER)
            CALL F.RELEASE(FN.ACCOUNT,"",F.ACCOUNT)                                  ;*Not a standard way to release all records
            CALL F.RELEASE(FN.LIMIT,"",F.LIMIT)                                      ;*Not a standard way to release all records
        END                                                                      
    END

    FOR IJK = 1 TO V
        R.FT.REC<IJK> = R.NEW(IJK)
    NEXT IJK

    ID.NEW = SAVE.ID.NEW
    FULL.FNAME = FULL.FNAME.SAVE
    F.FILE = F.FILE.SAVE
    V = SAVE.V
    MAT R.NEW = MAT R.SAVE.NEW
    APPLICATION = SAVE.APPLICATION

    IF NEW.OVERRIDE.APPL NE OLD.OVERRIDE.APPL THEN
        OVERRIDE.APPL = OLD.OVERRIDE.APPL
        T.OV.CLASS = OLD.T.OV.CLASS
    END

    IF RUNNING.UNDER.BATCH 
	ELSE 
		CALL JOURNAL.UPDATE(ID.NEW)
	END

    RETURN

*************************************************************************
PROCESS.VALAUT:
*************************************************************************
*
    ETEXT = '' ; TEXT = '' ; END.ERROR = '' ; SW.OK = 1

    SAVE.RUNNING.UNDER.BATCH = RUNNING.UNDER.BATCH
    RUNNING.UNDER.BATCH = 1

    R.NEW(FT.RECORD.STATUS) = ''
    R.NEW(FT.INPUTTER) = TNO:"_":OPERATOR
    R.NEW(FT.DATE.TIME) = DT
    R.NEW(FT.CO.CODE) = ID.COMPANY
    R.NEW(FT.DEPT.CODE) = R.USER<EB.USE.DEPARTMENT.CODE>
*
    CALL FT.COMPLETE.XVALIDATION("","","")
    IF END.ERROR OR ETEXT THEN
        SW.OK = 0
    END ELSE

*        Accounting

        SAVE.RUNNING.UNDER.BATCH = RUNNING.UNDER.BATCH
        RUNNING.UNDER.BATCH = 1
*        SAVE.OVE$FORCE.OVERRIDES = OVE$FORCE.OVERRIDES
*        OVE$FORCE.OVERRIDES = 1
        CALL FT.INPUT.ACCOUNTING("","","")
        RUNNING.UNDER.BATCH = SAVE.RUNNING.UNDER.BATCH
*        OVE$FORCE.OVERRIDES = SAVE.OVE$FORCE.OVERRIDES
        IF ETEXT OR TEXT EQ "NO" THEN
            SW.OK = 0
        END ELSE

*           Write to Authorised file

            R.NEW(FT.CURR.NO) = 1
            R.NEW(FT.AUTHORISER) = TNO:"_":OPERATOR
            CALL EB.ACCOUNTING('FT','AUT','','')
            CALL FT.DELIVERY
            CALL F.MATWRITE(FN.FUNDS.TRANSFER,ID.NEW,MAT R.NEW,FT.AUDIT.DATE.TIME)
            CALL F.RELEASE(FN.FUNDS.TRANSFER$NAU, ID.NEW, F.FUNDS.TRANSFER$NAU)
        END
    END

    RUNNING.UNDER.BATCH = SAVE.RUNNING.UNDER.BATCH

    RETURN

***********************************************************************
INITIALISE:
***********************************************************************

    DIM R.SAVE.NEW(C$SYSDIM)

    E = '' ; ETEXT = '' ; TEXT = ''

    END.ERROR = '' ;  HOLD = ''

    REGION = R.COMPANY(EB.COM.LOCAL.COUNTRY):R.COMPANY(EB.COM.LOCAL.REGION)
    IF LEN(REGION) EQ 2 THEN 
		REGION = REGION:'00'
	END

    TIME.STAMP = TIMEDATE()
    X = OCONV(DATE(),"D-")
    DT = X[9,2]:X[1,2]:X[4,2]:TIME.STAMP[1,2]:TIME.STAMP[4,2]

    F.FUNDS.TRANSFER$NAU = ''
    FN.FUNDS.TRANSFER$NAU = 'F.FUNDS.TRANSFER$NAU'
    CALL OPF(FN.FUNDS.TRANSFER$NAU,F.FUNDS.TRANSFER$NAU)
    IF ETEXT THEN 
		RETURN
	END

    F.FUNDS.TRANSFER = ''
    FN.FUNDS.TRANSFER = 'F.FUNDS.TRANSFER'
    CALL OPF(FN.FUNDS.TRANSFER,F.FUNDS.TRANSFER)
    IF ETEXT THEN 
		RETURN
	END

    F.LIMIT = ''
	FN.LIMIT = 'F.LIMIT'
    CALL OPF(FN.LIMIT, F.LIMIT)

    F.ACCOUNT = ''
	FN.ACCOUNT = 'F.ACCOUNT'
    CALL OPF(FN.ACCOUNT, F.ACCOUNT)

    MAT FTLC$LOCAL.CLEARING = '' ; ER = ''
    FN.FT.LOCAL.CLEARING = 'F.FT.LOCAL.CLEARING' ; F.FT.LOCAL.CLEARING = '';  K.FT.LOCAL.CLEARING = 'SYSTEM'
    CALL OPF(FN.FT.LOCAL.CLEARING, F.FT.LOCAL.CLEARING)
	
    CALL F.MATREAD(FN.FT.LOCAL.CLEARING,K.FT.LOCAL.CLEARING,MAT FTLC$LOCAL.CLEARING,FT.LC.AUDIT.DATE.TIME,F.FT.LOCAL.CLEARING,ER)
*
**    Decide on the Debit and Credit markets here to save an unecessary
**    overhead.
*
    FTMKT.CRED = "" ; FTMKT.DEB = ""
    MVMT.ID = "" ; CCY.MKT = "" ; RETURN.CODE = "" ; YERR = ""
    CALL FIND.CCY.MKT("FT",1,MVMT.ID,CCY.MKT,"",RETURN.CODE,YERR)
    IF MVMT.ID EQ "FT" THEN
        FTMKT.CRED = 1 ; FTMKT.DEB = 1
    END ELSE
        MVMT.ID = "FTDEBIT" ; CCY.MKT = ""
        CALL FIND.CCY.MKT("FT",2,MVMT.ID,CCY.MKT,"",RETURN.CODE,YERR)
        IF CCY.MKT THEN 
			FTMKT.CRED = CCY.MKT
		END
        MVMT.ID = "FTCREDIT" ; CCY.MKT = ""
        CALL FIND.CCY.MKT("FT",2,MVMT.ID,CCY.MKT,"",RETURN.CODE,YERR)
        IF CCY.MKT THEN 
			FTMKT.DEB = CCY.MKT
		END
    END

    RETURN

END
