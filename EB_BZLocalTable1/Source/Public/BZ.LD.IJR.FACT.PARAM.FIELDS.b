* @ValidationCode : MjotNDMxMjA1NzE4OkNwMTI1MjoxNjAwNDc5MDk3NDQ1OkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTp0cnVlOk4vQTpSMThfQU1SLjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 19 Sep 2020 02:31:37
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : Administrateur
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : true
* @ValidationInfo : Bypass GateKeeper : true
* @ValidationInfo : Compiler Version  : R18_AMR.0
*---------------------------------------------------------------------------------------
* <Rating>0</Rating>
* Version 1 02/02/2018 Globus Release R13.55
*---------------------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable1
SUBROUTINE BZ.LD.IJR.FACT.PARAM.FIELDS
*-----------------------------------------------------------------------------
*<doc>
* @author : firasjmalt24@gmail.com | fjmal@itssglobal.com
* @stereotype H
* @classification FIN
* @desc Parametrage : Generation des factures IJARA
*</doc>
*-----------------------------------------------------------------------------
*Modification History:
*ZIT-UPG-R13-R19-FM TO @FM
*---------------------------------------------------------------------------------------

*** <region name= Header>
*** <desc>Inserts and control logic</desc>
* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;
* $INSERT I_F.TRANSACTION - Not Used anymore;
* $INSERT I_F.IS.H.PRODUCTS - Not Used anymore;
* $INSERT I_F.LMM.CHARGE.CONDITIONS - Not Used anymore;
    $USING EB.SystemTables
    $USING EB.API
    $USING EB.Template
    $USING ST.Config
    $USING LM.Fees
*** </region>

    GOSUB INITIALISE
    GOSUB DEFINE.FIELDS:
RETURN

*** <region name="INIT">
***********
INITIALISE:
***********
    EB.SystemTables.clearF() ; EB.SystemTables.clearN() ; EB.SystemTables.clearT()
    EB.SystemTables.clearCheckfile() ; EB.SystemTables.clearConcatfile()
    EB.SystemTables.setIdCheckfile(""); EB.SystemTables.setIdConcatfile("")
    Z = 0
RETURN
*** </region>

*** <region name="Define fields">
**************
DEFINE.FIELDS:
**************
    EB.SystemTables.setIdF("ID");   EB.SystemTables.setIdN(20.1);  EB.SystemTables.setIdT("A")

    Z+=1 ; EB.SystemTables.setF(Z, "XX.VAT.CHRG.CODE"); EB.SystemTables.setN(Z, 3.1);  EB.SystemTables.setT(Z, "");
    EB.SystemTables.setCheckfile(Z, "LMM.CHARGE.CONDITIONS" : @FM : LM.Fees.LmmChargeConditions.LdTwoOneShortName : @FM : "..S")

    Z+=1 ; EB.SystemTables.setF(Z, "XX.MAT.CHRG.CODE"); EB.SystemTables.setN(Z, 3.1);  EB.SystemTables.setT(Z, "");
    EB.SystemTables.setCheckfile(Z, "LMM.CHARGE.CONDITIONS" : @FM : LM.Fees.LmmChargeConditions.LdTwoOneShortName : @FM : "..S")

    Z+=1 ; EB.SystemTables.setF(Z, "XX.MAT.VAT.CHRG.CODE"); EB.SystemTables.setN(Z, 3.1);  EB.SystemTables.setT(Z, "");
    EB.SystemTables.setCheckfile(Z, "LMM.CHARGE.CONDITIONS" : @FM : LM.Fees.LmmChargeConditions.LdTwoOneShortName : @FM : "..S")

    Z+=1 ; EB.SystemTables.setF(Z, "XX.STAMP.CHRG.CODE"); EB.SystemTables.setN(Z, 3);  EB.SystemTables.setT(Z, "");
    EB.SystemTables.setCheckfile(Z, "LMM.CHARGE.CONDITIONS" : @FM : LM.Fees.LmmChargeConditions.LdTwoOneShortName : @FM : "..S")

    Z+=1 ; EB.SystemTables.setF(Z, "XX.CARR.CHRG.CODE"); EB.SystemTables.setN(Z, 3);  EB.SystemTables.setT(Z, "");
    EB.SystemTables.setCheckfile(Z, "LMM.CHARGE.CONDITIONS" : @FM : LM.Fees.LmmChargeConditions.LdTwoOneShortName : @FM : "..S")

    Z+=1 ; EB.SystemTables.setF(Z, "XX.TAKAFUL.CHRG.CODE"); EB.SystemTables.setN(Z, 3);  EB.SystemTables.setT(Z, "");
    EB.SystemTables.setCheckfile(Z, "LMM.CHARGE.CONDITIONS" : @FM : LM.Fees.LmmChargeConditions.LdTwoOneShortName : @FM : "..S")

*-----------------------------------------------------------------------------
** RESERVED FIELDS

    Z+=1 ; EB.SystemTables.setF(Z, "XX.LOCAL.REF"); EB.SystemTables.setN(Z, 35);  EB.SystemTables.setT(Z, "")

    Z+=1 ; EB.SystemTables.setF(Z, "RESERVED10"); EB.SystemTables.setN(Z, 35);  tmp=EB.SystemTables.getT(Z); tmp<1>="A"; EB.SystemTables.setT(Z, tmp);   tmp=EB.SystemTables.getT(Z); tmp<3>="NOINPUT"; EB.SystemTables.setT(Z, tmp);

    Z+=1 ; EB.SystemTables.setF(Z, "RESERVED09"); EB.SystemTables.setN(Z, 35);  tmp=EB.SystemTables.getT(Z); tmp<1>="A"; EB.SystemTables.setT(Z, tmp);   tmp=EB.SystemTables.getT(Z); tmp<3>="NOINPUT"; EB.SystemTables.setT(Z, tmp);

    Z+=1 ; EB.SystemTables.setF(Z, "RESERVED08"); EB.SystemTables.setN(Z, 35);  tmp=EB.SystemTables.getT(Z); tmp<1>="A"; EB.SystemTables.setT(Z, tmp);   tmp=EB.SystemTables.getT(Z); tmp<3>="NOINPUT"; EB.SystemTables.setT(Z, tmp);

    Z+=1 ; EB.SystemTables.setF(Z, "RESERVED07"); EB.SystemTables.setN(Z, 35);  tmp=EB.SystemTables.getT(Z); tmp<1>="A"; EB.SystemTables.setT(Z, tmp);   tmp=EB.SystemTables.getT(Z); tmp<3>="NOINPUT"; EB.SystemTables.setT(Z, tmp);

    Z+=1 ; EB.SystemTables.setF(Z, "RESERVED06"); EB.SystemTables.setN(Z, 35);  tmp=EB.SystemTables.getT(Z); tmp<1>="A"; EB.SystemTables.setT(Z, tmp);   tmp=EB.SystemTables.getT(Z); tmp<3>="NOINPUT"; EB.SystemTables.setT(Z, tmp);

    Z+=1 ; EB.SystemTables.setF(Z, "RESERVED05"); EB.SystemTables.setN(Z, 35);  tmp=EB.SystemTables.getT(Z); tmp<1>="A"; EB.SystemTables.setT(Z, tmp);   tmp=EB.SystemTables.getT(Z); tmp<3>="NOINPUT"; EB.SystemTables.setT(Z, tmp);

    Z+=1 ; EB.SystemTables.setF(Z, "RESERVED04"); EB.SystemTables.setN(Z, 35);  tmp=EB.SystemTables.getT(Z); tmp<1>="A"; EB.SystemTables.setT(Z, tmp);   tmp=EB.SystemTables.getT(Z); tmp<3>="NOINPUT"; EB.SystemTables.setT(Z, tmp);

    Z+=1 ; EB.SystemTables.setF(Z, "RESERVED03"); EB.SystemTables.setN(Z, 35);  tmp=EB.SystemTables.getT(Z); tmp<1>="A"; EB.SystemTables.setT(Z, tmp);   tmp=EB.SystemTables.getT(Z); tmp<3>="NOINPUT"; EB.SystemTables.setT(Z, tmp);

    Z+=1 ; EB.SystemTables.setF(Z, "RESERVED02"); EB.SystemTables.setN(Z, 35);  tmp=EB.SystemTables.getT(Z); tmp<1>="A"; EB.SystemTables.setT(Z, tmp);   tmp=EB.SystemTables.getT(Z); tmp<3>="NOINPUT"; EB.SystemTables.setT(Z, tmp);

    Z+=1 ; EB.SystemTables.setF(Z, "RESERVED01"); EB.SystemTables.setN(Z, 35);  tmp=EB.SystemTables.getT(Z); tmp<1>="A"; EB.SystemTables.setT(Z, tmp);   tmp=EB.SystemTables.getT(Z); tmp<3>="NOINPUT"; EB.SystemTables.setT(Z, tmp);

*-----------------------------------------------------------------------------
    Z+=1 ; EB.SystemTables.setF(Z, "XX.OVERRIDE"); EB.SystemTables.setN(Z, 35);  tmp=EB.SystemTables.getT(Z); tmp<1>="A"; EB.SystemTables.setT(Z, tmp);   tmp=EB.SystemTables.getT(Z); tmp<3>="NOINPUT"; EB.SystemTables.setT(Z, tmp);
    EB.SystemTables.setV(Z + 9)
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
