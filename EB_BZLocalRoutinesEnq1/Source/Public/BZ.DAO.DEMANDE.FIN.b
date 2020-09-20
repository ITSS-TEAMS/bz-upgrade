$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.DAO.DEMANDE.FIN(ENQ.DATA)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*----------------------------------------
* Modification History :

*ZIT-UPG-R13-R19 : VARIABLE INITIALISED
*----------------------------------------
    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.USER
    $INSERT I_F.CUSTOMER
$INSERT I_F.BZ.DEMANDE.ISB

*----------------------------------------

    GOSUB INITIALISE
    GOSUB OPEN.FILES
    GOSUB PROCESS

    RETURN
*----------------------------------------
INITIALISE:

	FN.USER='F.USER'
    F.USER=''

* $INSERT I_F.AC.CHARGE.REQUEST - Not Used anymore;    F.DEM = ''
	R.DEM = ''
    ERR.DEM = ''

    FN.CUS = 'F.CUSTOMER'
    F.CUS = ''
	R.CUS = ''
    ERR.CUS = ''

    REF.DEMANDE = ENQ.DATA<4,1>
    RETURN
*-----------------------------------------------------------------------------
OPEN.FILES:

    CALL OPF(FN.DEM,F.DEM)
    CALL OPF(FN.CUS,F.CUS)
 FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusSER,F.USER)
    RETURN
*--------------------FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus----------------------------------------
PROCESS:
    CALL F.READ(FN.DEM,REF.DEMANDE,R.DEM,F.DEM,ERR.DEM)

    CLIENT = R.DEM<BZ.DEMANDE.ISB.CUSTOMER>

    CALL F.READ(FN.CUS,CLIENT,R.CUS,F.CUS,ERR.CUS)

    DAO.CLIENT = R.CUS<EB.CUS.ACCOUNT.OFFICER>

    DEPART.CODE = R.USER<EB.USE.DEPARTMENT.CODE>

    IF DEPART.CODE EQ DAO.CLIENT THEN

        ENQ.DATA<2,1> = '@ID'
        ENQ.DATA<3,1> = 'EQ'
        ENQ.DATA<4,1> = REF.DEMANDE

    END ELSE
        ENQ.DATA<2,1> = '@ID'
        ENQ.DATA<3,1> = 'EQ'
        ENQ.DATA<4,1> = ''

    END
    RETUREB.DataAccess.OpfEND
