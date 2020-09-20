* @ValidationCode : MjotMTkxMTY5MDI1OkNwMTI1MjoxNjAwNDc5MDk2NTYzOkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTp0cnVlOk4vQTpSMTlfQU1SLjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 19 Sep 2020 02:31:36
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : Administrateur
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : true
* @ValidationInfo : Bypass GateKeeper : true
* @ValidationInfo : Compiler Version  : R19_AMR.0
*---------------------------------------------------------------------------------------
* <Rating>0</Rating>
* Version 1 11/01/2017 Globus Release R13.55
*---------------------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable1
SUBROUTINE BZ.IJR.TVA.PARAM.FIELDS
*-----------------------------------------------------------------------------
*<doc>
* @author : firasjmalt24@gmail.com | fjmal@itssglobal.com
* @stereotype L
* @classification INT
* @desc Parametrage : TVA sur les biens IJARA
*</doc>
*-----------------------------------------------------------------------------
*Modification History:

*ZIT-UPG-R13-R19: FM TO @FM;
*---------------------------------------------------------------------------------------

*** <region name= Header>
*** <desc>Inserts and control logic</desc>

*ZIT-UPG-R13-R19/S
*	$INSERT I_COMMON
* $INSERT I_EQUATE - Not Used anymore;
* $INSERT I_F.ACCOUNT - Not Used anymore;
    $USING EB.API
    $USING EB.SystemTables
    $USING EB.Template
    $USING AC.AccountOpening
*ZIT-UPG-R13-R19/E
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
    EB.SystemTables.setIdF("ID");   EB.SystemTables.setIdN(30.1);  EB.SystemTables.setIdT("A");

    Z+=1 ; EB.SystemTables.setF(Z, "XX<TVA.RATE"); EB.SystemTables.setN(Z, 18.1);  tmp=EB.SystemTables.getT(Z); tmp<1>="AMT"; EB.SystemTables.setT(Z, tmp);

    Z+=1 ; EB.SystemTables.setF(Z, "XX>TVA.DED.ACCT"); EB.SystemTables.setN(Z, 19.1);  tmp=EB.SystemTables.getT(Z); tmp<1>="ANT"; EB.SystemTables.setT(Z, tmp);
    EB.SystemTables.setCheckfile(Z, "ACCOUNT" : @FM : AC.AccountOpening.Account.ShortTitle : @FM : "..S")

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

