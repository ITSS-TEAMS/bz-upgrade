$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.RATING.GET.INC.PAI
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
************
* @author : fehmi bounaouara
************
*---------------------------------------------------
* Modification History :   	
*ZITUNA-UPG-R13-R19 :  removed BP's and changed INCLUDE to INSERT   
*                      VM converted to @VM          	
*------------------------------------------------------------	

    $INSERT I_COMMON
    $INSERT I_EQUATE      
    $INSERT I_F.BZ.CNP.INC.PAI       
    $INSERT I_ENQUIRY.COMMON  


    Y.SIGNATAIRES.AFF = O.DATA

    FN.BZ.CNP.INC.PAI = "F.BZ.CNP.INC.PAI"    
    F.BZ.CNP.INC.PAI = ""

    CALL OPF(FN.BZ.CNP.INC.PAI,F.BZ.CNP.INC.PAI)

    INC.COUNT = 0
* $INSERT I_EQUATE - Not Used anymore;FN.BZ.CNP.INC.PAI:" WITH STATUT.CNP NE 5 AND SIGNATAIRE EQ ":Y.SIGNATAIRES.AFF
* $INSERT I_ENQUIRY.COMMON - Not Used anymore;.TMP = '' ; INC.ERROR = ''  
* $INSERT I_F.AC.CHARGE.REQUEST - Not Used anymore;'', INC.COUNT.TMP, INC.ERROR)    

    FOR COMPTEIR= 1 TO INC.COUNT.TMP
        Y.IDENTIF.INC = INC.IDS<COMPTEIR>
* $INSERT I_F.BZ.COFFRE.LOYER - Not Used anymore; = ''  
        CALL F.READ(FN.BZ.CNP.INC.PAI,Y.IDENTIF.INC,UINC.REC,F.BZ.CNP.INC.PAI,IND.ERR)
        IF UINC.REC THEN
            Y.MOTIF.INC = UINC.REC<BZ.CNP.MOTIF.CNP>

            IF NOT(Y.MOTIF.INC MATCHES "01":@VM:"02":@VM:"03":@VM:"04") THEN  
                INC.COUNT += 1      
            END

        END ELSE  
        EB.SystemTables.getVFunction()UNT = 0    
        END  

    NEXT COFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusATA = INC.COUNT  

    RETURN
