*-----------------------------------------------------------------------------
* <Rating>98</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE TNA.CARD.FILTER.COMMISSION.REMP
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
*ZIT-UPG-R09-R13  : $INSERT BP to $INCLUDE BZDEV.BP  
*ZIT-UPG-R13-R19 : removed BP's and changed INCLUDE to INSERT    
*                  CONVERT replaced with CHANGE                        
*----------------------------------------------------------------------------

$INSERT I_COMMON
$INSERT I_EQUATE
$INSERT I_ENQUIRY.COMMON
  
*ZIT-UPG-R09-R13/S              
*$INSERT BP I_F.TNA.CARD.REASON    
*$INSERT BP I_F.TNA.CARD.CAPTURE
$INSERT I_F.TNA.CARD.REASON      
$INSERT I_F.TNA.CARD.CAPTURE  
*ZIT-UPG-R09-R13/E    

    TEXT = R.NEW(CAPTURE.PRODUCT.CODE)
    CALL REM
* $INSERT I_EQUATE - Not Used anymore;ATA
* $INSERT I_ENQUIRY.COMMON - Not Used anymore;<RSN.TYPE.CARTE>
* $INSERT I_F.AC.CHARGE.REQUEST - Not Used anymore;RSN.CODE.COMMISSION>

  *  CONVERT @VM TO @FM IN V.TYPE.CARTE
     CHANGE @VM TO @FM IN V.TYPE.CARTE  

    LOCATE TYPE.CARTE IN V.TYPE.CARTE SETTING POS.TYPE.CARTE ELSE POS.TYPE.CARTE = 0
    IF POS.TYPE.CARTE NE 0 THEN
        CODE.COMMISSION = V.CODE.COMMISSION<1,POS.TYPE.CARTE>
        IF CODE.COMMISSION NE ''  THEN    
            O.DATA = "Oui"
        END ELSE
            O.DATA = "Non"  
        END
    END
END
