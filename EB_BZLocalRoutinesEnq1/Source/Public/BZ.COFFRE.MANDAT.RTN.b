*-----------------------------------------------------------------------------
* <Rating>-41</Rating>
*-----------------------------------------------------------------------------
*Modification History:
*-----------------------------------------------------------------------------
**ZIT-UPG-R13-R19: Converted FM,VM to @FM,@VM
**               : Variables Initialized
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13  : $INSERT BP to $INCLUDE BZDEV.BP
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.COFFRE.MANDAT.RTN
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
    $INSERT I_F.CUSTOMER

*ZIT-UPG-R09-R13/S
    *$INSERT BP I_F.BZ.COFFRE.MANDAT
    *$INSERT BP I_F.BZ.COFFRE.CONTRAT

$INSERT I_F.BZ.COFFRE.MANDAT
* $INSERT I_COMMON - Not Used anymore;E.CONTRAT

*ZIT-UPG-R09-R13/E
MAIN:
    GOSUB INITIALISATION
    GOSUB OPEN.FILES
    GOSUB PROCESS

    RETURN

*----------------------------------------------------------------------------*
INITIALISATION:
*----------------------------------------------------------------------------*

    FN.MDT = "F.BZ.COFFRE.MANDAT"
    F.MDT = ""

    FN.CEB.SystemTables.getVFunction()COFFRE.CONTRAEB.SystemTables.getVFunction()CT = ""
	
    FNFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusR"
    F.CUS = ""

    Y.ID.CONTRAT=O.DATAFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus-----------------------------------------------------------------*
OPEN.FILES:
*----------------------------------------------------------------------------*
    CALL OPF(FN.MDT, F.MDT)
    CALL OPF(FN.CT, F.CT)
    CALL OPF(FN.CUS, F.CUS)
    RETURN
*----------------------------------------------------------------------------*
PROCESS:
*----------------------------------------------------------------------------*
    NO.SEL = '' ; SEL.ERR = ''
    SELECTION = "SELECT ":FN.MDT:" WITH ID.CONTRAT EQ " : Y.ID.CONTRAT
    CALL EB.READLIST(SELECTION,SEL.LIST,'',NO.SEL,SEL.ERR)
    O.DATA=""
    FOR COMPTEUR=1 TO NO.SEL
        	
        MANDAT.ID=SEL.LIST<COMPTEUR>
		MDT.REC = '' ; ERR.MDT = ''
        CALL F.READ(FN.MDT,MANDAT.ID,MDT.REC,F.MDT,ERR.MDT)
        Y.MANDAT.ANNULE=MDT.REC<CF.MDT.MANDAT.ANNULE>
        IEB.DataAccess.Opf.MANDAT.ANNULE EQ "YES" THEN
         EB.DataAccess.OpfCONTINUE
        END ELSE

            Y.CLT.MDT<-1>=MDT.REC<CF.MDT.ID.CLIENT>
*
            CUS.REEB.SystemTables.getRNew()'FT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRef
            CALL F.READ(FN.CUS,Y.CLT.MDT,CUS.REC,F.CUS,ERR.CUS)
         EB.DataAccess.FReadAME.MDT<1,COMPTEUR>=CUS.REC<EB.CUS.SHORT.NAME>
*
        END
    NEXT COMPTEUR

    CHANGE @FM TO @VM IN YEB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyerTA=YEB.SystemTables.setE()*-----------------------------------------------------------------------------
* <Rating>-41</Rating>
*-----------------------------------------------------------------------------
*Modification History:
*-----------------------------------------------------------------------------
**ZIT-UPG-R13-R19: Converted FM,VM to @FM,@VM
**               : Variables Initialized
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13  : $INSERT BP to $INCLUDE BZDEV.BP
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.COFFRE.MANDAT.RTN
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
    $INSERT I_F.CUSTOMER

*ZIT-UPG-R09-R13/S
    *$INSERT BP I_F.BZ.COFFRE.MANDAT
    *$INSERT BP I_F.BZ.COFFRE.CONTRAT

$INSERT I_F.BZ.COFFRE.MANDAT
$INSERT I_F.BZ.COFFRE.CONTRAT

*ZIT-UPG-R09-R13/E
MAIN:
    GOSUB INITIALISATION
    GOSUB OPEN.FILES
    GOSUB PROCESS

    RETURN

*----------------------------------------------------------------------------*
INITIALISATION:
*----------------------------------------------------------------------------*

    FN.MDT = "F.BZ.COFFRE.MANDAT"
    F.MDT = ""

    FN.CT = "F.BZ.COFFRE.CONTRAT"
    F.CT = ""
	
    FN.CUS = "F.CUSTOMER"
    F.CUS = ""

    Y.ID.CONTRAT=O.DATA


*----------------------------------------------------------------------------*
OPEN.FILES:
*----------------------------------------------------------------------------*
    CALL OPF(FN.MDT, F.MDT)
    CALL OPF(FN.CT, F.CT)
    CALL OPF(FN.CUS, F.CUS)
    RETURN
*----------------------------------------------------------------------------*
PROCESS:
*----------------------------------------------------------------------------*
    NO.SEL = '' ; SEL.ERR = ''
    SELECTION = "SELECT ":FN.MDT:" WITH ID.CONTRAT EQ " : Y.ID.CONTRAT
    CALL EB.READLIST(SELECTION,SEL.LIST,'',NO.SEL,SEL.ERR)
    O.DATA=""
    FOR COMPTEUR=1 TO NO.SEL
        	
        MANDAT.ID=SEL.LIST<COMPTEUR>
		MDT.REC = '' ; ERR.MDT = ''
        CALL F.READ(FN.MDT,MANDAT.ID,MDT.REC,F.MDT,ERR.MDT)
        Y.MANDAT.ANNULE=MDT.REC<CF.MDT.MANDAT.ANNULE>
        IF Y.MANDAT.ANNULE EQ "YES" THEN
            CONTINUE
        END ELSE

            Y.CLT.MDT<-1>=MDT.REC<CF.MDT.ID.CLIENT>
*
            CUS.REC = '' ; ERR.CUS = ''
            CALL F.READ(FN.CUS,Y.CLT.MDT,CUS.REC,F.CUS,ERR.CUS)
            Y.NAME.MDT<1,COMPTEUR>=CUS.REC<EB.CUS.SHORT.NAME>
*
        END
    NEXT COMPTEUR

    CHANGE @FM TO @VM IN Y.CLT.MDT
    O.DATA=Y.CLT.MDT

    RETURN
END
***EB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyerataAccess.FWriteINFO CLIENT*********************
