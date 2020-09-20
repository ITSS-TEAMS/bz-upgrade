*-----------------------------------------------------------------------------
* <Rating>100</Rating>
*-----------------------------------------------------------------------------
*Modification History:
*ZIT-UPG-R13-R19:CONVERT converted to CHANGE
*               :FM,VM converted to @FM,@VM
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.SET.ELIGIBILITE.AC
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
    $INSERT I_F.CHEQUE.TYPE
    $INSERT I_F.ACCOUNT


    FN.TYPE="F.CHEQUE.TYPE"
    F.TYPE=""
    TYPE.REC=''
	TYPE.ERR=''
    Y.TYPE="CURR"

    CALL OPF(FN.TYPE,F.TYPE)

* $INSERT I_EQUATE - Not Used anymore;A

    ELIGIBILITE="NO"

    CALL F.READ(FN.TYPE,Y.TYPE,TYPE.REC,F.TYPE,TYPE.ERR)

    IF TYPE.REC THEN

        CATEGORY.PERMISE=TYPE.REC<CHEQUE.TYPE.CATEGORY>

*ZIT-UPG-R13-R19 S
*       CONVERT VM TO FM IN CATEGORY.PERMISE
		CHANGE @VM TO @FM IN CATEGORY.PERMISE
*ZIT-UPG-R13-R19 E
        LOCATE Y.CATEGORY IN CATEGORY.PERMISE SETTING POS.CATEG ELSE POS.CATEG=0

        EB.SystemTables.getVFunction()EG NE 0 THEN
            ELIGIBILITE="YEFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus
    END

    O.DATA=ELIGIBILITE

    RETURN
END
