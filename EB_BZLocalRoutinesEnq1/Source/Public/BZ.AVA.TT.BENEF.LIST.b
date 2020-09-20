*-----------------------------------------------------------------------------
* <Rating>0</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.AVA.TT.BENEF.LIST(ENQ.DATA)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*-------------------------------------------------------
*MODIFICATION HISTORY:
*ZIT-UPG-R13-R19-GET.LOC.REF TO MULTI.GET.LOC.REF
********************************************************
$INSERT I_COMMON
$INSERT I_EQUATE
$INSERT I_ENQUIRY.COMMON
$INSERT I_F.TELLER

*ZIT-UPG-R13-R19 S 
*    CALL GET.LOC.REF('TELLER','REFERENCE',REFERENCE.POS)
		Y.APP='TELLER'
		Y.FIELD='REFERENCE'
		Y.POS=''
		CALL MULTI.GET.LOC.REF(Y.APP,Y.FIELD,Y.POS)
		REFERENCE.POS=Y.POS<1,1>
*ZIT-UPG-R13-R19 E 
    REF.DOSSIER = R.NEW(TT.TE.LOCAL.REF)<1,REFERENCE.POS>

* $INSERT I_COMMON - Not Used anymore;HEN

* $INSERT I_ENQUIRY.COMMON - Not Used anymore;.AVA'
        ENQ.DATA<3,1> = 'EQ'
        ENQ.DATA<4,1> =  REF.DOSSIER
    END

    RETURN

END
