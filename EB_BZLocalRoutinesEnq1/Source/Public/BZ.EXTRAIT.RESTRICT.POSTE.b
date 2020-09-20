*-----------------------------------------------------------------------------
* <Rating>0</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.EXTRAIT.RESTRICT.POSTE(ENQ.DATA)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*-------------------------------------------------------------
* @author BounouaraFehmi
*--------------------------------------------------------------
* Modification History :
**ZIT-UPG-R13-R19 :     No change                                      
*-------------------------------------------------------------------------------
    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.USER
    $INSERT I_F.ACCOUNT

*-------------------------------------------------------------
    FN.USER='F.USER'
    F.USER=''
    FN.AC='F.ACCOUNT'
    F.AC=''
    ERR1=''

* $INSERT I_COMMON - Not Used anymore;R,F.USER)
* $INSERT I_EQUATE - Not Used anymore;F.AC)
* $INSERT I_ENQUIRY.COMMON - Not Used anymore;USE.DEPARTMENT.CODE>

    Y.DATE=ENQ.DATA<4,1>
    Y.COMPTE=ENQ.DATA<4,2>
	
    AC.REC = ''
    CALL F.READ(FN.AC,Y.COMPTE,AC.REC,F.AC,ERR1)  
    Y.CATEGORY=AC.REC<AC.CATEGORY>
    IF Y.CATEGORY NE '6100' THEN
        ENQ.DATA<4,1> = " "
        ENQ.DATA<4,2> = " "    
        RETURN
    END
