* <Rating>-1</Rating>
*----------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
SUBROUTINE COB.MAJ.ACC.LIBELE.SELECT
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*-------------------------------------------------------------
* @author azdadou@temenos.com
*
*------------------------------------------------------------------------
* 05 / 02 / 10  par azdadou
*------------------------------------------------
* Modification History :
*ZIT-UPG-R13-R19 : removed BP's and changed INCLUDE to INSERT         
*--------------------------------------------------------------------------- 
$INSERT I_COMMON  
$INSERT I_EQUATE
$INSERT I_ENQUIRY.COMMON
$INSERT I_F.ACCOUNT
$INSERT I_COB.MAJ.ACC.LIBELE.COMMON      

*RECHERCHE DES LISTES DE COMPTES AVEC SHORT.TITLE EQ RECORD.AUTOMATICALLY.OPENED et devise egal TND

SEL.LIST = ""
SEL.ERR =""
SEL.CMD = "SELECT ":FN.ACC:" WITH SHORT.TITLE EQ RECORD.AUTOMATICALLY.OPENED AND CURRENCY EQ TND"
* $INSERT I_COMMON - Not Used anymore;.CMD,SEL.LIST,'',NO.OF.REC,SEL.ERR)
* $INSERT I_EQUATE - Not Used anymore;T('',SEL.LIST)    
RETURN
END
