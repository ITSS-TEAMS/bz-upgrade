*-------------------------------------------------------
*AUTHOR : FEHMI BOUNOUARA
*-------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.GAR.CATEG.AFF.ENQ
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*-------------------------------------------------------
*MODIFICATION HISTORY:
*ZIT-UPG-R13-R19-INITIALISED F.READ VARIABLES;
********************************************************

    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.LD.LOANS.AND.DEPOSITS
    $INSERT I_F.ACCOUNT

    FN.LD="F.LD.LOANS.AND.DEPOSITS"
    F.LD=""
	LD.REC=""
	LD.ERR=""
	
    FN.AC="F.ACCOUNT"
    F.AC=""
	AC.REC=""
	AC.ERR=""
	
    CALL OPF(FN.LD,F.LD)
    CALL OPF(FN.AC, F.AC)

    Y.APPLICATION = O.DATA[1,2]

    Y.IDENTIF = O.DATA[3,12]


    BEGIN CASE

    CASE Y.APPLICATION EQ "AC"
        CALL F.READ(FN.AC,Y.IDENTIF,AC.REC,F.AC,AC.ERR)

        IF AC.REC THEN
            Y.CATEG = AC.REC<AC.CATEGORY>

        END


    CASE Y.APPLICATION EQ "LD"
tmp.V$FUFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusmTables.getVFunction()
        CALL F.READ(FN.LD,Y.IDENTIF,LD.REC,tmp.V$FUNCTIONR)
EB.SystemTables.setVFunction(tmp.V$FUNCTION)

        IF LFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus       Y.CATEG =LD.REC<LD.CATEGORY>

        END
    END CASE

    IF Y.CATEG THEN
        O.DATA =Y.CATEG
    END ELSE
        O.DATA =""
    END

    RETURN
