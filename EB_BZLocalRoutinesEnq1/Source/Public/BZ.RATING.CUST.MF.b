$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.RATING.CUST.MF
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*---------------------------------------------------
* Modification History :   	
*ZITUNA-UPG-R13-R19 :  removed BP's and changed INCLUDE to INSERT 
*                      VM converted to @VM    	
*------------------------------------------------------------
    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON        
    $INSERT I_F.CUSTOMER
*------------------------------------------------------------
    GOSUB INIT
    GOSUB MAIN  
    RETURN
* ------------------------------------------------------------
INIT:
    FN.CUSTOMER='F.CUSTOMER'
    F.CUSTOMER=''
    ID.CUSTOMER=O.DATA
    R.CUSTOMER=''
    ERR.CUSTOMER=''
    CALL OPF (FN.CUSTOMER, F.CUSTOMER)
    Y.LEGAL.IDS =''
    Y.MF=''
    RETURN
* $INSERT I_ENQUIRY.COMMON - Not Used anymore;---------------------------------
MAIN:
    R.CUSTOMER = '' ; ERR.CUSTOMER = ''    
    CALL F.READ(    FN.CUSTOMER,    ID.CUSTOMER,    R.CUSTOMER,    F.CUSTOMER,    ERR.CUSTOMER)
    Y.LEGAL.IDS = R.CUSTOMER<EB.CUS.LEGAL.ID>
* $INSERT I_F.BZ.COFFRE.LOYER - Not Used anymore;ER<EB.CUS.LEGAL.DOC.NAME>
    Y.NBRE.LEGAL.DOC.NAME = DCOUNT(Y.LEGAL.DOC.NAME,@VM)
    Y.NBR.LEGAL.IDS = DCOUNT(Y.LEGAL.IDS,@VM)    
    FOR I=1 TO Y.NBR.LEGAL.IDS
        IF Y.LEGAL.DOC.NAME<1,I> EQ 'MF' THEN
            Y.MF = Y.LEGAL.IDS<1,I>   
        END
    NEXT I
    IF Y.MF THEN
        O.DATA=  Y.MF  
    END EB.SystemTables.getVFunction()    O.DATA =''  
    END
    RETURN
END
