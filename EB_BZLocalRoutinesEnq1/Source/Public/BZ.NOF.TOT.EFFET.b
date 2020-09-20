 *-----------------------------------------------------------------------------------------------
* Version 1.0 14/06/17  GLOBUS Release No. R13
* Modification History:
* ZIT-UPG-R13-R19 : Converted $INCLUDE TO $INSERT, Variables initialized, READ to F.READ, READNEXT to LOOP REMOVE
* -----------------------------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.NOF.TOT.EFFET(OUTPUT)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*-----------------------------------------------------------------------------------------------
*-- @DESC    : Routine permet de calculer le total des effets conserves et le total des montants
*-- @Author  : Maroua Chikhaoui
*------------------------------------------------------------------------------------------------
    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.BZ.MDP.REGISTRE.EFF

    F.BZ.MDP.REGISTRE.EFF = ''
    FN.BZ.MDP.REGISTRE.EFF = 'FBNK.BZ.MDP.REGISTRE.EFF'
    CALL OPF(FN.BZ.MDP.REGISTRE.EFF,F.BZ.MDP.REGISTRE.EFF)

    LIST.REC=''
    NB.REC=''
    ERR.SEL=''
    NB.REC = 0
    ERR.SEL = 0
    LIST.REC = 0

* $INSERT I_F.AC.CHARGE.REQUEST - Not Used anymore;DP.REGISTRE.EFF WITH STATUT EQ 'EFF.OUT.3' AND REF.LEASING NE '' BY CODE.CLIENT"
    CALL EB.READLIST(MY.SELECT,LIST.REC,"",NB.REC,ERR.SEL)

    TOTAL.CLIENT = 0
    NB.EFF.CLIENT = 0
    DERNIER.CLIENT = ""
    POS = ''
    LOOP
*       READNEXT ID.EFF FROM LIST.REC ELSE BREAK
        LOOP
            REMOVE ID.EFF FROM LIST.REC SETTING POS
        WHILE ID.EFF: POS
        REPEAT
*   READ R.EFF FROM F.BZ.MDP.REGISTRE.EFF,ID.EFF THEN
tmp.R.NEW.FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusEFF.EFF.ERR = EB.SystemTables.getRNew(FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusEFF, EFF.ERR)
        EB.SystemTables.getVFunction()D(FN.BZ.MDP.REGISTRE.EFF, ID.EFF, Rtmp.R.NEW.FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusEFF.EFF.ERR
EB.SystemTables.setRNew(FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusEFF, EFF.ERR, tmp.R.NEW.FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusEFF.EFF.ERR)
            
            
   FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusRS = R.EFF<REG.EFF.CODE.CLIENT>

        IF (CLIENT.ENCOURS EQ DERNIER.CLIENT) OR (DERNIER.CLIENT EQ "") THEN
            DERNIER.CLIENT = CLIENT.ENCOURS
            TOTAL.CLIENT += R.EFF<REG.EFF.MNT.LCN>
            NB.EFF.CLIENT +=1
        END ELSE
            OUTPUT<-1> = DERNIER.CLIENT : "*" : NB.EFF.CLIENT : "*" : TOTAL.CLIENT
            TOTAL.CLIENT = R.EFF<REG.EFF.MNT.LCN>
            NB.EFF.CLIENT = 1
            DERNIER.CLIENT = CLIENT.ENCOURS
        END
    
    REPEAT

    OUTPUT<-1> = CLIENT.ENCOURS : "*" : NB.EFF.CLIENT : "*" : TOTAL.CLIENT

RETURN
