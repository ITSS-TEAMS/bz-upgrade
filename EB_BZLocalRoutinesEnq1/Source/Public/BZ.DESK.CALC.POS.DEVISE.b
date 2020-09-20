*-----------------------------------------------------------------------------
* <Rating>0</Rating>
*---------------------------------------------------------------------------
*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13  : INCLUDE GLOBUS.BP to $INCLUDE ../T24_BP
*                   INCLUDE BP to $INCLUDE BZDEV.BP
* ZIT-UPG-R13-R19 : NO CHANGE
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE  BZ.DESK.CALC.POS.DEVISE
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*ZIT-UPG-R09-R13/S
*INCLUDE GLOBUS.BP I_COMMON
*INCLUDE GLOBUS.BP I_EQUATE
*INCLUDE GLOBUS.BP I_ENQUIRY.COMMON
*INCLUDE BP I_F.BZ.DESK.COURS.PERIOD
*INCLUDE BP I_F.BZ.DESK.POSITION.PERIOD
    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
$INSERT I_F.BZ.DESK.COURS.PERIOD
$INSERT I_F.BZ.DESK.POSITION.PERIOD

*ZIT-UPG-R09-R13/E

* $INSERT I_EQUATE - Not Used anymore;D="F.BZ.DESK.COURS.PERIOD"
    F.DESK.COURS.PRD=""
    R.DESK.COURS.PRD=''
    ERR.DESK.COURS.PRD=''


* $INSERT I_F.BZ.COFFRE.LOYER - Not Used anymore;POSITION.PERIOD"
    F.DESK.POS.PRD=""
    R.DESK.POS.PRD=''
    ERR.DESK.POS.PRD=''

    CALL OPF(FN.DESK.POS.PRD,F.DESK.POS.PRD)
    CALL OPF(FN.DESK.COURS.PRD,F.DESK.COURS.PRD)

    V.DEVISE=FIELD(O.DATA,"*",1)
    V.DEV.MNT=FIELD(O.DATA,"*",2)
    V.PEEB.SystemTables.getVFunction()D(O.DATA,"*",EB.SystemTables.getVFunction()AGENCE = FIELD(O.DFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus.DEALER.DESK = FIELD(O.DATA,"*",6)
    V.MOISFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus
    V.ANNEE=V.PERIODE[1,4]

    IF V.MOIS EQ '01' THEN
        V.ANNEE= V.ANNEE - 1
        V.ANNEE=FMT(V.ANNEE, "R%4")
        V.MOIS="12"
        V.PERIODE.LAST=V.ANNEE:V.MOIS
    END ELSE

        V.MOIS= V.MOIS - 1
        V.MOIS=FMT(V.MOIS, "R%2")
        V.PERIODE.LAST=V.ANNEE:V.MOIS

    END

    V.ID.PERIOD=V.DEVISE: "-" : V.PERIODE.LAST : "-" : V.AGENCE : "-" : V.DEALER.DESK
    CALL F.READ(FN.DESK.POS.PRD,V.ID.PERIOD,R.DESK.POS.PRD,F.DESK.POS.PRD,ERR.DESK.POS.PRD)

    POS.DEV.DEPART=R.DESK.POS.PRD<DESK.PP.POSITION.DEVISE>
    NOUV.POS=V.DEV.MNT + POS.DEV.DEPART
    O.DATA= NOUV.POS


    CALL EB.ROUND.AMOUNT(V.DEVISE,O.DATA,"","")
    RETUREB.DataAccess.OpfEND
