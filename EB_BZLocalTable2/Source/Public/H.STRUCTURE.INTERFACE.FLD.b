* @ValidationCode : MjotMTM2NTk5NDgxOTpDcDEyNTI6MTYwMDU2MDQzNzE3MzpBZG1pbmlzdHJhdGV1cjotMTotMTowOjE6ZmFsc2U6Ti9BOlIyMF9TUDQuMDotMTotMQ==
* @ValidationInfo : Timestamp         : 20 Sep 2020 01:07:17
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : Administrateur
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : true
* @ValidationInfo : Bypass GateKeeper : false
* @ValidationInfo : Compiler Version  : R20_SP4.0

*-----------------------------------------------------------------------------
* <Rating>-22</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable2
SUBROUTINE H.STRUCTURE.INTERFACE.FLD
*-----------------------------------------------------------------------------------
* Modification History :
*ZIT-UPG-R09-R13  :   INCLUDE GLOBUS.BP CHANGED TO ../T24_BP
*ZIT-UPG-R13-R19  :   NO CHANGES
*------------------------------------------------------------------------------------
*ZIT-UPG-R09-R13/S
*INCLUDE GLOBUS.BP I_COMMON
*INCLUDE GLOBUS.BP I_EQUATE
* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;
*ZIT-UPG-R09-R13/S
* $INSERT I_F.ACCOUNT - Not Used anymore;
    $USING EB.SystemTables
    $USING EB.API
    $USING EB.Template
    $USING AC.AccountOpening
    

*-----------------------------------------------------------------------------
    GOSUB INITIALISE

    GOSUB DEFINE.FIELDS

RETURN
*
*-----------------------------------------------------------------------------
*
DEFINE.FIELDS:


    EB.SystemTables.setIdF("VIR.ID"); EB.SystemTables.setIdN("50"); EB.SystemTables.setIdT("A");

*
    Z=0
*
    Z += 1 ; EB.SystemTables.setF(Z, "TYPE.STRUCTURE"); EB.SystemTables.setN(Z, "4"); EB.SystemTables.setT(Z, "A"); tmp=EB.SystemTables.getT(Z); tmp<2>="F_V"; EB.SystemTables.setT(Z, tmp)
    Z += 1 ; EB.SystemTables.setF(Z, "SEPARATEUR"); EB.SystemTables.setN(Z, "4"); EB.SystemTables.setT(Z, "A")
    Z += 1 ; EB.SystemTables.setF(Z, "XX.LL.DESCRIPTION"); EB.SystemTables.setN(Z, "35"); EB.SystemTables.setT(Z, "A")
    Z += 1 ; EB.SystemTables.setF(Z, "NOM.TABLE"); EB.SystemTables.setN(Z, "35"); EB.SystemTables.setT(Z, "A")
    Z += 1 ; EB.SystemTables.setF(Z, "XX<CHAMP.FICHIER"); EB.SystemTables.setN(Z, "35"); EB.SystemTables.setT(Z, "A")
    Z += 1 ; EB.SystemTables.setF(Z, "XX-POSITION"); EB.SystemTables.setN(Z, "4"); EB.SystemTables.setT(Z, "")
    Z += 1 ; EB.SystemTables.setF(Z, "XX-LONGUEUR"); EB.SystemTables.setN(Z, "4"); EB.SystemTables.setT(Z, "")
    Z += 1 ; EB.SystemTables.setF(Z, "XX-CHAMP.T24"); EB.SystemTables.setN(Z, "35"); EB.SystemTables.setT(Z, "A")
    Z += 1 ; EB.SystemTables.setF(Z, "XX>TYPE"); EB.SystemTables.setN(Z, "15"); EB.SystemTables.setT(Z, "A")

    Z +=1   ; EB.SystemTables.setF(Z, "XX.LOCAL.REF"); EB.SystemTables.setN(Z, "35"); EB.SystemTables.setT(Z, "A"); tmp=EB.SystemTables.getT(Z); tmp<3>="NOINPUT"; EB.SystemTables.setT(Z, tmp)
    Z += 1 ; EB.SystemTables.setF(Z, "XX.STMT.NOS"); EB.SystemTables.setN(Z, "35"); EB.SystemTables.setT(Z, "A"); tmp=EB.SystemTables.getT(Z); tmp<3>="NOINPUT"; EB.SystemTables.setT(Z, tmp)
    Z += 1 ; EB.SystemTables.setF(Z, "XX.OVERRIDE"); EB.SystemTables.setN(Z, "35"); tmp=EB.SystemTables.getT(Z); tmp<3>="NOINPUT"; EB.SystemTables.setT(Z, tmp)
*
    EB.SystemTables.setV(Z + 9)

*

*

RETURN
*-----------------------------------------------------------------------------
*
INITIALISE:
    EB.SystemTables.clearF() ; EB.SystemTables.clearN() ; EB.SystemTables.clearT()
    EB.SystemTables.clearCheckfile() ; EB.SystemTables.clearConcatfile()
    EB.SystemTables.setIdCheckfile(""); EB.SystemTables.setIdConcatfile("")
*
* Define often used checkfile variables
*
* CHK.ACCOUNT = "ACCOUNT" : FM : AC.SHORT.TITLE
RETURN
*
*-----------------------------------------------------------------------------
*
END
