*-----------------------------------------------------------------------------
* <Rating>-16</Rating>
*-----------------------------------------------------------------------------
*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13: INCLUDE GLOBUS.BP to $INCLUDE ../T24_BP
*ZIT-UPG-R13-R19-INITIALISED VARIABLES;CONVERT TO CHANGE
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.CPT.RESPONSE.QUEUE
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*-----------------------------------------------------------------------------
* Nom du Source    : BZ.CPT.RESPONSE.QUEUE
* Nature du Source : ROUTINE
* Nom Developpeur  : Zeki BEN OTHMEN
*-----------------------------------------------------------------------------

*ZIT-UPG-R09-R13/S
    *INCLUDE GLOBUS.BP I_COMMON
    *INCLUDE GLOBUS.BP I_EQUATE
    *INCLUDE GLOBUS.BP I_ENQUIRY.COMMON
$INSERT I_COMMON        
$INSERT I_EQUATE        
$INSERT I_ENQUIRY.COMMON


* $INSERT I_EQUATE - Not Used anymore;    IF O.DATA EQ '' THEN
        O.DATA = ''

        RETURN

    END
    FN.RES= 'F.OFS.RESPONSE.QUEUE'
    R.RES=''
    F.RES=''
    E.RES=''
	CALL OPF(FN.RES,F.RES) ;*ADDED
	SEL.LIST=''
	NO.OF.REC=''
	ERR1=''
    SEL.COMMAND="SELECT ":FN.RES:" WITH @ID LIKE ":O.DATA:"..."

    CALL EB.READLIST(SEL.COMMAND,SEL.LIST,'',NO.OF.REC,ERFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus'
    IF SEL.LIST EQ '' THEN
        O.DATA FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusE

        REMOVE ID FROM SEL.LIST SETTING POS

        CALL F.READ(FN.RES,ID,R.RES,F.RES,E.RES)

*    NBR = DCOUNT(R.RES,@FM)
*   FOR I = 1 TO NBR+1


*      O.DATA= O.DATA :@VM: R.RES<I>

* NEXT I

* END

*        CONVERT @FM TO @VM IN R.RES
		CHANGE @FM TO @VM IN R.RES
*   TMP= EREPLACE(R.RES,@VM,@FM)
        O.DATA = R.RES
        RETURN
    END
