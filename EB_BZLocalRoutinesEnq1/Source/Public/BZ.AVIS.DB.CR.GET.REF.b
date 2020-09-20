*-----------------------------------------------------------------------------
* <Rating>0</Rating>
*** MODIFICATION HISTORY:
*** "ZIT-UPG-R13-R19"
*** Variables has been initialized
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.AVIS.DB.CR.GET.REF
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
$INSERT I_F.BZ.CPT.GEN.COMPTA


    FN.COMPTA = "F.BZ.CPT.GEN.COMPTA"
    F.COMPTA = ""

    FN.COMPTA.HIS = "F.BZ.CPT.GEN.COMPTA$HIS"
    F.COMPTA.HIS = ""

    CALL OPF(FN.COMPTA,F.COMPTA)
    CALL OPF(FN.COMPTA.HIS,F.COMPTA.HIS)


* $INSERT I_EQUATE - Not Used anymore;TA
* $INSERT I_ENQUIRY.COMMON - Not Used anymore;.COMPTE

    REF.COMPTABLE.HIS = REF.COMPTE:";1"
    
    ERR3 = ''
    R.COMPTA = ''
    CALL F.READ(FN.COMPTA,REF.COMPTE,R.COMPTA,F.COMPTA,ERR3)

    IF R.COMPTA THEN
        Y.REF.TXN = R.COMPTA<GEN.CPT.REF.TRANSACTION>
    END ELSE
    ERR3 = ''
    R.COMPTA = ''
        CALL F.READ(FN.COMPTA.HIS,REF.COMPTABLE.HIS,R.COMPTA,F.COMPTA.HIS,ERR3)
        Y.REF.TXN = R.COMPTA<GEN.CPT.REF.TRANSACTION>
    END

    O.DATA = Y.REF.TXN

    RETURN

END
