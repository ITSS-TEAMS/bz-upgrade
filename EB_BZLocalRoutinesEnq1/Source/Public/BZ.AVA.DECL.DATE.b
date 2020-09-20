*-----------------------------------------------------------------------------
* <Rating>-2</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.AVA.DECL.DATE(TABLEAU)
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

*ZIT-UPG-R13-R19: VARIABLE IN ITIALISED                         
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13/S
    *$INSERT GLOBUS.BP I_COMMON
    *$INSERT GLOBUS.BP I_EQUATE
    *$INSERT GLOBUS.BP I_ENQUIRY.COMMON
    *$INSERT BP I_F.BZ.AVA.MVMT
    
    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
$INSERT I_F.BZ.AVA.MVMT
*ZIT-UPG-R09-R13/E

	REF.POS = ''; CAP.IDS = ''; CAP.COUNT = '' ; CAP.ERROR = ''

* $INSERT I_EQUATE - Not Used anymore;A.MVMT"
    F.MVMT=""

    CALL OPF(FN.MVMT,F.MVMT)

    LOCATE "REF.AVA" IN D.FIELDS<1> SETTING REF.POS THEN
* $INSERT I_F.BZ.COFFRE.LOYER - Not Used anymore;ALUE<REF.POS>
    END

    IF REF.AVA THEN
        CONDITION="REF.AVA EQ ":REF.AVA
    END

    DATE.CAP=TODAY
    CALL CDT('',DATE.CAP,'-30C')

*DATE.AUEB.SystemTables.getVFunction()
*CALL CDT('',DATE.AUTRE,'-90C')

    IFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus
        CMD.CAP= "SELECT ":FN.MVMT:" WITH LIBFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus SENS EQ 'D' AND ( DATE.DEPART EQ '' OR DATE.RETOUR EQ '' ) AND DATE.MVMT LT ":DATE.CAP:" AND ":CONDITION

*CMD.AUTRE= "SELECT ":FN.MVMT:" WITH SENS EQ 'D' AND LIBELLE NE 'CAP' AND DATE.MVMT LE ":DATE.AUTRE:" AND ":CONDITION
    END ELSE
        CMD.CAP= "SELECT ":FN.MVMT:" WITH LIBELLE NE 'BBA' AND SENS EQ 'D' AND ( DATE.DEPART EQ '' OR DATE.RETOUR EQ '' ) AND DATE.MVMT LT ":DATE.CAP

*CMD.AUTRE= "SELECT ":FN.MVMT:" WITH SENS EQ 'D' AND LIBELLE NE 'CAP' AND DATE.MVMT LE ":DATE.AUTRE
    END

******************
    CALL EB.READLIST(CMD.CAP,CAP.IDS, '', CAP.COUNT, CAP.ERROR)
    IF CAP.IDS NE "" THEN
        TABLEAU<-1>=CAP.IDS
    END
*****************

******************
*CALL EB.READLIST(CMD.AUTRE,AUTRE.IDS, '', AUTRE.COUNT, AUTRE.ERROR)
*IF AUTRE.IDS NE "" THEN
*    TABLEAU<-1>=AUTRE.IDS
*END
*****************
    RETURN
END
