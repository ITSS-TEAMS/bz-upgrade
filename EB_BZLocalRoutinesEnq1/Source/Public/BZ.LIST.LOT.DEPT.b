*-----------------------------------------------------------------------------
* <Rating>-2</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.LIST.LOT.DEPT(ENQ.DATA)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*----------------------------------------------------------------------------
* Modification History :                                                     
*----------------------------------------------------------------------------
*ZIT-UPG-R09-R13  : $INSERT BP to $INCLUDE BZDEV.BP                          
*ZIT-UPG-R13-R19  : Converted FM TO @FM and Initialized OPF (Missing OPF for FN.SS) 
*----------------------------------------------------------------------------
$INSERT I_COMMON
$INSERT I_EQUATE
$INSERT I_F.USER
*ZIT-UPG-R09-R13/S   
*$INSERT BP I_F.BZ.CPT.SS.SYSTEME
$INSERT I_F.BZ.CPT.SS.SYSTEME
*ZIT-UPG-R09-R13/E
$INSERT I_ENQUIRY.COMMON

    FN.SS= 'F.BZ.CPT.SS.SYSTEME'
    R.SS=''
    F.SS=''
    E.SS =''
* $INSERT I_COMMON - Not Used anymore;.SS)             ;* Initialized OPF (Missing OPF for FN.SS)

    FN.USER='F.USER'
    F.USER=''
    R.USER=''
    ERR1=''


    CALL OPF (FN.USER,F.USER)
    CALL F.READ (FN.USER,OPERATOR,R.USER,F.USER,ERR1)

    DEPART.CODE = R.USER<EB.USE.DEPARTMENT.CODE>


    SEL.COMMAND="SELECT ": FN.SS : "WITH DEPARTEMENT EQ " : DEPART.CODE

    CALL EB.READLIST(SEL.COMMAND,SEL.LIST,'',NO.OF.REC,ERR1)

    IF SEL.LIST EQ '' THEN


    END ELSE
        LOOFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusMOVE ID FROM SEL.LIST SETTING POS
        WHIFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus        CALL F.READ(FN.SS,ID,R.SS,F.SS,E.SS)

            SS = R.SS <SS.SYS.SYSTEME>

            IF SS NE '' THEN

                TABLEAU<-1> = SS
            END


        REPEAT

        CHANGE @FM TO SPACE(1) IN TABLEAU

        ENQ.DATA<2,1> = 'SS.SYSTEME'
        ENQ.DATA<3,1> = 'EQ'
        ENQ.DATA<4,1> = TABLEAU

        RETURN

    END
EB.DataAccess.Opf
