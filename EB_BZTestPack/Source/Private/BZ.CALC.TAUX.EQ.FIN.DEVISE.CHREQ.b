* @ValidationCode : MjotMTgzNjg1OTEzOTpDcDEyNTI6MTYwMDYxMzAwNTc1MTpBZG1pbmlzdHJhdGV1cjotMTotMTowOjE6ZmFsc2U6Ti9BOlIyMF9TUDQuMDotMTotMQ==
* @ValidationInfo : Timestamp         : 20 Sep 2020 15:43:25
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : Administrateur
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : true
* @ValidationInfo : Bypass GateKeeper : false
* @ValidationInfo : Compiler Version  : R20_SP4.0
$PACKAGE EB.BZTestPack

SUBROUTINE BZ.CALC.TAUX.EQ.FIN.DEVISE.CHREQ
*-----------------------------------------------------------------------------
*Modification History:

*ZIT-UPG-R13-R19: GET.LOC.REF CHANGED TO MULTI.GET.LOC.REF
*                 VARIABLE INITIALISED
*-----------------------------------------------------------------------------
* description du programme
*
* Ce programme permet le calcul des taux equivalent pour les financements en devise
*-----------------------------------------------------------------------------
*Auteur : FEHMI BOUNAOUARA

    $USING EB.SystemTables
    $USING EB.API
    $USING EB.DataAccess
    $USING LD.Contract
    $USING LD.Schedules
    $USING ST.RateParameters
    

* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;
* $INSERT I_F.LD.SCHEDULE.DEFINE - Not Used anymore;
* $INSERT I_F.LD.LOANS.AND.DEPOSITS - Not Used anymore;
* $INSERT I_F.PERIODIC.INTEREST - Not Used anymore;


    FN.LD = 'F.LD.LOANS.AND.DEPOSITS$NAU'
    F.LD = ''
    LD.REC = ''
    LD.ERR = ''

    EB.DataAccess.Opf(FN.LD,F.LD)
    
    YAPPLICATION.NAME = "LD.LOANS.AND.DEPOSITS"
    YFIELD.NAME ="BILL.DATE"
    LREF.POS = ''
    CALL MULTI.GET.LOC.REF(YAPPLICATION.NAME, YFIELD.NAME, LREF.POS)
    Y.POS.BIL.DATE = LREF.POS<1, 1>
    

*    CALL GET.LOC.REF("LD.LOANS.AND.DEPOSITS","BILL.DATE",Y.POS.BIL.DATE)

   
    EB.DataAccess.FRead(FN.LD,ID.NEW,LD.REC,F.LD,LD.ERR)


    DATE.PREMIER.ECHEANCE.TEST = LD.REC<LD.Contract.LoansAndDeposits.LocalRef,Y.POS.BIL.DATE>

    tmp = ''; tmp =EB.SystemTables.getRNew(LD.Schedules.ScheduleDefine.SdDate); tmp<1,1>=DATE.PREMIER.ECHEANCE.TEST; EB.SystemTables.setRNew(LD.Schedules.ScheduleDefine.SdDate, tmp)

*******************

    TAB.TYPE.ECHEANCE = EB.SystemTables.getRNew(LD.Schedules.ScheduleDefine.SdSchType)
    NO.OF.CPS = DCOUNT(TAB.TYPE.ECHEANCE,@VM)

    MAT.ALT = ''
    TAB.SCH.TMP=""
    TAB.SCHED.DATE.TMP=""
    TAB.SCHED.AMT.TMP=""

    FOR XX = NO.OF.CPS TO 1 STEP -1

        IF EB.SystemTables.getRNew(LD.Schedules.ScheduleDefine.SdSchType)<1,XX> NE "P" THEN
            tmp = ''; tmp = EB.SystemTables.getRNew(LD.Schedules.ScheduleDefine.SdSchType); DEL tmp<1,XX>; EB.SystemTables.setRNew(LD.Schedules.ScheduleDefine.SdSchType, tmp);
            tmp = ''; tmp = EB.SystemTables.getRNew(LD.Schedules.ScheduleDefine.SdDate); DEL tmp<1,XX>; EB.SystemTables.setRNew(LD.Schedules.ScheduleDefine.SdDate, tmp);
            tmp = ''; tmp = EB.SystemTables.getRNew(LD.Schedules.ScheduleDefine.SdAmount); DEL tmp<1,XX>; EB.SystemTables.setRNew(LD.Schedules.ScheduleDefine.SdAmount, tmp);
            tmp = ''; tmp = EB.SystemTables.getRNew(LD.Schedules.ScheduleDefine.SdCycledDates); DEL tmp<1,XX>; EB.SystemTables.setRNew(LD.Schedules.ScheduleDefine.SdCycledDates, tmp);
            tmp = ''; tmp = EB.SystemTables.getRNew(LD.Schedules.ScheduleDefine.SdRate); DEL tmp<1,XX>; EB.SystemTables.setRNew(LD.Schedules.ScheduleDefine.SdRate, tmp);
            tmp = ''; tmp = EB.SystemTables.getRNew(LD.Schedules.ScheduleDefine.SdChargeCode); DEL tmp<1,XX>; EB.SystemTables.setRNew(LD.Schedules.ScheduleDefine.SdChargeCode, tmp);
            tmp = ''; tmp = EB.SystemTables.getRNew(LD.Schedules.ScheduleDefine.SdNumber); DEL tmp<1,XX>; EB.SystemTables.setRNew(LD.Schedules.ScheduleDefine.SdNumber, tmp);
            tmp = ''; tmp = EB.SystemTables.getRNew(LD.Schedules.ScheduleDefine.SdFrequency); DEL tmp<1,XX>; EB.SystemTables.setRNew(LD.Schedules.ScheduleDefine.SdFrequency, tmp);
            tmp = ''; tmp = EB.SystemTables.getRNew(LD.Schedules.ScheduleDefine.SdDiaryAction); DEL tmp<1,XX>; EB.SystemTables.setRNew(LD.Schedules.ScheduleDefine.SdDiaryAction, tmp);
            tmp = ''; tmp = EB.SystemTables.getRNew(LD.Schedules.ScheduleDefine.SdFreqCode); DEL tmp<1,XX>; EB.SystemTables.setRNew(LD.Schedules.ScheduleDefine.SdFreqCode, tmp);

        END
        Y.LD.SD.SCH.TYPE = EB.SystemTables.getRNew(LD.Schedules.ScheduleDefine.SdSchType)
        NO.OF.CPS = DCOUNT(Y.LD.SD.SCH.TYPE,@VM)
    NEXT XX
RETURN
