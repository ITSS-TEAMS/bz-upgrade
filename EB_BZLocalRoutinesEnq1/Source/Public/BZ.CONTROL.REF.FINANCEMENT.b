*-----------------------------------------------------------------------------
* <Rating>-24</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.CONTROL.REF.FINANCEMENT
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*-----------------------------------------------------------------------------
*** Modification History:
*** "ZIT-UPG-R13-R19"
*** Converted GET.LOC.REF to MULTI.GET.LOC.REF

*ZIT-UPG-R09-R13  : $INSERT BP to $INCLUDE BZDEV.BP
*-----------------------------------------------------------------------------
* @author   AKROUTE REDOUANE
* @Mail     rakroute@temenos.com
*
* @desc
*
* @create   04/04/2012
*
* @param
*
* @calls
*
* @error
*
* @change
*
* @revby
*********************************************************************
*-----------------------------------------------------------------------------
    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.FUNDS.TRANSFER
    $INSERT I_F.ACCOUNT
*ZIT-UPG-R09-R13/S
*$INSERT BP I_F.BZ.TAKAFUL.PRODUIT
$INSERT I_F.BZ.TAKAFUL.PRODUIT
*ZIT-UPG-R09-R13/E
    $INSERT I_F.LD.LOANS.AND.DEPOSITS
    $INSERT I_GTS.COMMON
$INSERT EB.SystemTables.getVFunction()RODUCTS
*-------------------------------FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus-----------------------------
* <Main controlFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus---------------------------------------------------------------------
*

    GOSUB INITIALISATION
    GOSUB MAIN.PROCESS

*
    RETURN
*---------------------------------------------------------------------------
*
INITIALISATION:
*file opening, variable set up

    FN.FT = 'F.FUNDS.TRANSFER'
    F.FT = ''
    R.FT = ''
    ERR.FT = ''
    CALL OPF(FN.FT, F.FT)

    FN.PRD.TAKAFUL = 'F.BZ.TAKAFUL.PRODUIT'
    F.PRD.TAKAFUL = ''
    R.PRD.TAKAFUL = ''
    E.PRD.TAKAFUL = ''
    CALL OPF(FN.PRD.TAKAFUL , F.PRD.TAKAFUL)


    FN.LDEB.DataAccess.Opf'F.LD.LOANS.AND.DEPOSITS'
    F.LD EB.DataAccess.Opf'
    K.LD = ''
    R.LD = ''
    E.LD = ''
    CALL OPF(FN.LD,F.LD)

    FN.LD.NAU = 'F.LD.FT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefITS$NAU'
    F.LD.EB.DataAccess.FRead''
    K.LD.NAU = ''
    R.LD.NAU = ''
    E.LD.NAU = ''
    CALL OPF(FN.LD.NAU,F.LD.EB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyerT EB.SystemTables.setE()*-----------------------------------------------------------------------------
* <Rating>-24</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.CONTROL.REF.FINANCEMENT
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*-----------------------------------------------------------------------------
*** Modification History:
*** "ZIT-UPG-R13-R19"
*** Converted GET.LOC.REF to MULTI.GET.LOC.REF

*ZIT-UPG-R09-R13  : $INSERT BP to $INCLUDE BZDEV.BP
*-----------------------------------------------------------------------------
* @author   AKROUTE REDOUANE
* @Mail     rakroute@temenos.com
*
* @desc
*
* @create   04/04/2012
*
* @param
*
* @calls
*
* @error
*
* @change
*
* @revby
*********************************************************************
*-----------------------------------------------------------------------------
    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.FUNDS.TRANSFER
    $INSERT I_F.ACCOUNT
*ZIT-UPG-R09-R13/S
*$INSERT BP I_F.BZ.TAKAFUL.PRODUIT
$INSERT I_F.BZ.TAKAFUL.PRODUIT
*ZIT-UPG-R09-R13/E
    $INSERT I_F.LD.LOANS.AND.DEPOSITS
    $INSERT I_GTS.COMMON
$INSERT I_F.IS.H.PRODUCTS
*-----------------------------------------------------------------------------
* <Main controlling section>
*----------------------------------------------------------------------
*

    GOSUB INITIALISATION
    GOSUB MAIN.PROCESS

*
    RETURN
*---------------------------------------------------------------------------
*
INITIALISATION:
*file opening, variable set up

    FN.FT = 'F.FUNDS.TRANSFER'
    F.FT = ''
    R.FT = ''
    ERR.FT = ''
    CALL OPF(FN.FT, F.FT)

    FN.PRD.TAKAFUL = 'F.BZ.TAKAFUL.PRODUIT'
    F.PRD.TAKAFUL = ''
    R.PRD.TAKAFUL = ''
    E.PRD.TAKAFUL = ''
    CALL OPF(FN.PRD.TAKAFUL , F.PRD.TAKAFUL)


    FN.LD = 'F.LD.LOANS.AND.DEPOSITS'
    F.LD = ''
    K.LD = ''
    R.LD = ''
    E.LD = ''
    CALL OPF(FN.LD,F.LD)

    FN.LD.NAU = 'F.LD.LOANS.AND.DEPOSITS$NAU'
    F.LD.NAU = ''
    K.LD.NAU = ''
    R.LD.NAU = ''
    E.LD.NAU = ''
    CALL OPF(FN.LD.NAU,F.LD.NAU)

    FN.ACCT = 'F.ACCOUNT'
    F.ACCT = ''
    K.ACCT = ''
   EB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyerE.ACCT = ''
EB.DataAccess.FWriteL OPF(FN.ACCT,F.ACCT)


    FN.PEB.SystemTables.setAf()*-----------------------------------------------------------------------------
* <Rating>-24</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.CONTROL.REF.FINANCEMENT
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*-----------------------------------------------------------------------------
*** Modification History:
*** "ZIT-UPG-R13-R19"
*** Converted GET.LOC.REF to MULTI.GET.LOC.REF

*ZIT-UPG-R09-R13  : $INSERT BP to $INCLUDE BZDEV.BP
*-----------------------------------------------------------------------------
* @author   AKROUTE REDOUANE
* @Mail     rakroute@temenos.com
*
* @desc
*
* @create   04/04/2012
*
* @param
*
* @calls
*
* @error
*
* @change
*
* @revby
*********************************************************************
*-----------------------------------------------------------------------------
    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.FUNDS.TRANSFER
    $INSERT I_F.ACCOUNT
*ZIT-UPG-R09-R13/S
*$INSERT BP I_F.BZ.TAKAFUL.PRODUIT
$INSERT I_F.BZ.TAKAFUL.PRODUIT
*ZIT-UPG-R09-R13/E
    $INSERT I_F.LD.LOANS.AND.DEPOSITS
    $INSERT I_GTS.COMMON
$INSERT I_F.IS.H.PRODUCTS
*-----------------------------------------------------------------------------
* <Main controlling section>
*----------------------------------------------------------------------
*

    GOSUB INITIALISATION
    GOSUB MAIN.PROCESS

*
    RETURN
*---------------------------------------------------------------------------
*
INITIALISATION:
*file opening, variable set up

    FN.FT = 'F.FUNDS.TRANSFER'
    F.FT = ''
    R.FT = ''
    ERR.FT = ''
    CALL OPF(FN.FT, F.FT)

    FN.PRD.TAKAFUL = 'F.BZ.TAKAFUL.PRODUIT'
    F.PRD.TAKAFUL = ''
    R.PRD.TAKAFUL = ''
    E.PRD.TAKAFUL = ''
    CALL OPF(FN.PRD.TAKAFUL , F.PRD.TAKAFUL)


    FN.LD = 'F.LD.LOANS.AND.DEPOSITS'
    F.LD = ''
    K.LD = ''
    R.LD = ''
    E.LD = ''
    CALL OPF(FN.LD,F.LD)

    FN.LD.NAU = 'F.LD.LOANS.AND.DEPOSITS$NAU'
    F.LD.NAU = ''
    K.LD.NAU = ''
    R.LD.NAU = ''
    E.LD.NAU = ''
    CALL OPF(FN.LD.NAU,F.LD.NAU)

    FN.ACCT = 'F.ACCOUNT'
    F.ACCT = ''
    K.ACCT = ''
    R.ACCT = ''
    E.ACCT = ''
    CALL OPF(FN.ACCT,F.ACCT)


    FN.PRODFT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefODUCTS'
    F.PREB.SystemTables.setE('')
    R.PRODUIT=''
    ERR.PRODUIT=''

    CALL OPF(FN.PRODUIT,F.PRODUIT)


    Y.ID = COMI
    Y.COMPTE = R.NEW(FT.DEBIT.ACCT.NO)
    CALL F.READ(FN.ACCT,Y.COMPTE,R.ACCT,F.ACCT,E.ACCT)
    Y.CUS = R.ACCT<AC.CUSTOMER>

    RETURN

MAIN.PROCESS:
*main subroutine processing

****
***    CALL GET.LOC.REF("LD.LOANS.AND.DEPOSITS","LOAN.TYPE",POS.LOAN.TYPE)
    *** "ZIT-UPG-R09-R13 S"
       Y.APP = "LD.LOANS.AND.DEPOSITS":@FM:"FUNDS.TRANSFER"
       Y.FIELD = "LOAN.TYPE"
       Y.POS = ''
       CALL MULTI.GET.LOC.REF(Y.APP, Y.FIELD, Y.POS)
       POS.LOAN.TYPE = Y.POS<1,1> 
    *** "ZIT-UPG-R09-R13 E" 

    CALL F.READ(FN.LD.NAU,Y.ID,R.LD.NAU,F.LD.NAU,E.LD.NAU)
    IF R.LD.NAU EQ "" THEN
        CALL F.READ(FN.LD,Y.ID,R.LD,F.LD,E.LD)
        IF R.LD NE "" THEN
            Y.CUSTOMER = R.LD<LD.CUSTOMER.ID>
            Y.LOAN.TYPE = R.LD<LD.LOCAL.REF,POS.LOAN.TYPE>

        END ELSE
            ETEXT = "REF NON EXISTANT"
            CALL STORE.END.ERROR
        END
    END ELSE
        Y.CUSTOMER = R.LD.NAU<LD.CUSTOMER.ID>
        Y.LOAN.TYPE = R.LD.NAU<LD.LOCAL.REF,POS.LOAN.TYPE>
    END

    IF Y.CUSTOMER NE Y.CUS THEN
        ETEXT = "NE CORRESPOND PAS AU CLIENT"
        CALL STORE.END.ERROR
    END
***    CALL GET.LOC.REF("FUNDS.TRANSFER","LOAN.TYPE",POS.LOAN.TYPE)
        POS.LOAN.TYPE = ""
       POS.LOAN.TYPE = Y.POS<2,1>

    R.NEW(FT.LOCAL.REF)<1,POS.LOAN.TYPE> = Y.LOAN.TYPE

* CALL F.READ(FN.PRD.TAKAFUL,Y.LOAN.TYPE,R.PRD.TAKAFUL,F.PRD.TAKAFUL,E.PRD.TAKAFUL)
* Y.DESC = R.PRD.TAKAFUL<PRD.TAKAFUL.DESCRIPTION>
    CALL F.READ(FN.PRODUIT,Y.LOAN.TYPE,R.PRODUIT,F.PRODUIT,ERR.PRODUIT)
    Y.DESC = R.PRODUIT<IS.PROD.DESCRIPTION>
    OFS$ENRI<FT.LOCAL.REF,POS.LOAN.TYPE> = Y.DESC

    RETURN
*-----------------------------------------------------------------------------
END
