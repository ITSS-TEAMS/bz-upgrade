*-----------------------------------------------------------------------------
* Version 1.0 20/06/17  GLOBUS Release No. R13
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.MDP.DOCR.CHQL.AG(ENQUIRY.DATA)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3

*-----------------------------------------------------------------------------
*       @author :       Jmal Firas
*-----------------------------------------------------------------------------
*       @DESC :         Décentralisation de l’édition des ARP reçus au niveau Agence
*-----------------------
* Modification History :
*-----------------------
*ZIT-UPG-R13-R19     :  No Changes.
* ------------------------------------------------------------------------
* <region name= Inserts>
    $INSERT  I_COMMON
    $INSERT  I_EQUATE
    $INSERT  I_ENQUIRY.COMMON
    $INSERT  I_F.USER
* </region>

    UDEPT =  R.USER<EB.USE.DEPARTMENT.CODE>
    UDEPT = "25" : UDEPT[3]
* $INSERT I_COMMON - Not Used anymore;F' IN ENQUIRY.DATA<2.1> SETTING POS.DEPT THEN

* $INSERT I_ENQUIRY.COMMON - Not Used anymore;EPT> = UDEPT
* $INSERT I_F.AC.CHARGE.REQUEST - Not Used anymore;= "BW"

    END ELSE

* $INSERT I_F.BZ.COFFRE.LOYER - Not Used anymore;TA<2.1>,@SM)
        NBC += 1
        ENQUIRY.DATA<4,NBC> = UDEPT
        ENQUIRY.DATA<3,NBC> = "BW"
        ENQUIRY.DATA<2,NBC> = 'RIB.BENEF'

    END

    RETURN
