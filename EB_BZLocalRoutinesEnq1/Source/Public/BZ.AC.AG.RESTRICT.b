* @ValidationCode : MjotMTI4MzE2MzU0NTpDcDEyNTI6MTYwMDYxNzkzNDM0NDpBZG1pbmlzdHJhdGV1cjotMTotMTowOjA6ZmFsc2U6Ti9BOlIyMF9TUDQuMDotMTotMQ==
* @ValidationInfo : Timestamp         : 20 Sep 2020 17:05:34
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : Administrateur
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : N/A
* @ValidationInfo : Bypass GateKeeper : false
* @ValidationInfo : Compiler Version  : R20_SP4.0
*-----------------------------------------------------------------------------
* <Rating>0</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
SUBROUTINE BZ.AC.AG.RESTRICT(ENQ.DATA)
    $USING EB.API
    $USING EB.SystemTables
    $USING EB.Reports
    $USING EB.DataAccess
*-------------------------------------------------------------l,xwm,l
* @author BounouaraFehmi
*ZIT-UPG-R13-R19     :  Converted VM TO @VM.
*-------------------------------------------------------------
    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.USER

*-------------------------------------------------------------
    FN.USER='F.USER'
    F.USER=''
    CALL OPF (FN.USER,F.USER)
    DEPART.CODE = R.USER<EB.USE.DEPARTMENT.CODE>

    NOMBRE=0
    NOMBRE=DCOUNT(ENQ.DATA<2>,@VM)
    NOMBRE=NOMBRE+1

* $INSERT I_COMMON - Not Used anymore;E> = 'ACCOUNT.OFFICER'
* $INSERT I_EQUATE - Not Used anymore;E> = 'EQ'
* $INSERT I_ENQUIRY.COMMON - Not Used anymore;ART.CODE

RETURN
END
