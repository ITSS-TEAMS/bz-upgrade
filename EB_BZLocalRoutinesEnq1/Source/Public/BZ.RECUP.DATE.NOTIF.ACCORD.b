*-----------------------------------------------------------------------------
* <Rating>-4</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.RECUP.DATE.NOTIF.ACCORD
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3

*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13  : $INSERT BP to $INCLUDE BZDEV.BP
*ZIT-UPG-R13-R19  : Converted GET.LOC.REF to MULTI.GET.LOC.REF.
*-----------------------------------------------------------------------------

$INSERT  I_COMMON
$INSERT  I_EQUATE

$INSERT  I_F.ENQUIRY
$INSERT  I_ENQUIRY.COMMON
*ZIT-UPG-R09-R13 / S
*$INSERT BP I_F.BZ.LD.DEMANDE
*$INSERT BP I_F.BZ.DEMANDE.ISB
$INSERT  I_F.BZ.LD.DEMANDE
$INSERT  I_F.BZ.DEMANDE.ISB
*ZIT-UPG-R09-R13 / E
$INSERT  I_F.LIMIT

* $INSERT I_EQUATE - Not Used anymore; = "F.BZ.LD.DEMANDE"
    F.BZ.LD.DEMANDE = ""
    ERR.LD.DEMANDE = ""

    ID.LD = O.DATA

* $INSERT I_F.BZ.COFFRE.LOYER - Not Used anymore;.BZ.LD.DEMANDE)

    SEL.CMD = "SELECT ":FN.BZ.LD.DEMANDE:" WITH REF.LD EQ ":ID.LD

    CALL EB.READLIST(SEL.CMD, SEL.LIST.DF, "", NO.OF.REC.DF, RTN.CODE)

    ID.DF = SEL.LIST.DF<1>

    FN.BZ.DEMANDE.ISB = 'F.BZ.DEMANDE.ISB'
    F.BZ.DEMANDE.ISB = ''
    K.BZEB.SystemTables.getVFunction()SB = ID.DF
    R.BZ.DEMANDE.ISB = ''
  FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusB = ''

    CALL OPF(FN.BZ.DEMANDE.ISB,F.BZ.FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus   CALL F.READ(FN.BZ.DEMANDE.ISB,K.BZ.DEMANDE.ISB,R.BZ.DEMANDE.ISB,F.BZ.DEMANDE.ISB,E.BZ.DEMANDE.ISB)

    REF.LIMIT = R.BZ.DEMANDE.ISB<BZ.DEMANDE.ISB.REF.LIMIT>



    FN.LIMIT = 'F.LIMIT'
    F.LIMIT = ''
    K.LIMIT = REF.LIMIT
    R.LIMIT= ''
    E.LIMIT= ''

    CALL OPF(FN.LIMIT,F.LIMIT)

    CALL F.READ(FN.LIMIT,K.LIMIT,R.LIMIT,F.LIMIT,E.LIMIT)

    DATE.NOTIF = R.LIMIT<LI.APPROVAL.DATE>
*ZIT-UPG-R13-R19/S                               ;*Converted GET.LOC.REF to MULTI.GET.LOC.REF.
  *  CALL GET.LOC.REF("BZ.DEMANDE.ISB","NIV.RISQUE",N.NIV.RISQUE)
	Y.LOC.APP = "BZ.DEMANDE.ISB"
	Y.LOC.FIE = "NIV.RISQUE"
	Y.MPOS = ''
	CALL MULTI.GET.LOC.REF(Y.LOC.APP,Y.LOC.FIE,Y.MPOS)
     N.NIEB.DataAccess.OpfISQUE = Y.MPOS<1,1>
*ZIT-UPG-EB.DataAccess.Opf-R19/E

   * DELEGATAIRE = R.BZ.DEMANDE.ISB<BZ.DEMANDE.ISB.LOCAL.REF><1,N.NIV.RISQUE>
   DELEGATAIRE = R.BZ.DEMANDE.ISB<BZ.DEMANDE.ISB.LOCAL.REF,N.NIV.RISQUE>

    O.DATA = DATE.EB.SystemTables.getRNew():FT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRef


    RETEB.DataAccess.FReadND
