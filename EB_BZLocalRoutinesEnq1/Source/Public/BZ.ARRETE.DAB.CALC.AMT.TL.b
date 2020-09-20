* Modification History :
*-----------------------                                                     
*ZIT-UPG-R13-R19 : NO CHANGE                    
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.ARRETE.DAB.CALC.AMT.TL
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3

   $INSERT I_COMMON
   $INSERT I_EQUATE
   $INSERT I_ENQUIRY.COMMON
   $INSERT I_F.BZ.TL.REGISTRE
   $INSERT I_F.BZ.ARRETE.DAB
   $INSERT I_F.BZ.DAB.TRAIT
   $INSERT I_F.DATES


    GOSUB INIT
    GOSUB OPENFILES
    GOSUB PROCESS

INIT:

    FN.ARRETE.DAB= 'F.BZ.ARRETE.DAB'
    F.ARRETE.DAB=''
* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;'

* $INSERT I_F.AC.CHARGE.REQUEST - Not Used anymore;'
    F.TL.REGIS=''
    R.TL.REGIS=''
    ERR.TL.REGIS=''

    FN.TRAIT= 'F.BZ.DAB.TRAIT'
    F.TRAIT=''
    R.TRAIT=''
    ERR.TRAIT=''

*    FN.DATES='F.DATES'
*    F.DATES=''
    REC.DATE=''
    ERR.DATE=''

    V.MONTANT='0'
    V.AMT.DIST.TL='0'

    RETURN
OFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusV$FUNCTION = EB.SystemTables.getVFunction()
    CALL OPF(FN.ARRETEtmp.V$FUNCTIONETE.DAB)
EB.SystemTables.setVFunction(tmp.V$FUNCTION)
    CALLFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusF.TL.REGIS)
    CALL OPF(FN.TRAIT,F.TRAIT)
*    CALL OPF(FN.DATES,F.DATES) ;*NOT USED 

    RETURN

PROCESS:

    ID.TICKET=O.DATA
    ID.DAB=ID.TICKET[1,10]
    V.DATE.SAISIE=ID.TICKET[12,8]
    V.DATE.CLOTURE=V.DATE.SAISIE
    CALL CDT('',V.DATE.CLOTURE,'-1C')
*------------------------------------------------------------*
IDS.LIST =''
NO.REC =''
ERR1 =''
    SEL.CMD = "SSELECT ":FN.TRAIT : " WITH NUMERO.DAB EQ " : ID.DAB : " AND DATE.SAISIE LT " : V.DATE.SAISIE
    CALL EB.READLIST(SEL.CMD,IDS.LIST,'',NO.REC,ERR1)
    IF IDS.LIST THEN
        ID.LAST=IDS.LIST<NO.REC>
        VEB.DataAccess.OpfST.DATE=ID.LAST[12,8]
        DEB.DataAccess.Opf.DEB=V.LAST.DATE
        CALL CDT('',DATE.DEB,'+1C')
        DIFF='C'
        CALL CDD("",V.LAST.DATE,V.DATE.SAISIE,DIFF)
        BEGIN CASE
        CASE DIFF EB.SystemTables.getRNew()'FT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRef.DataAccess.FReadALC MONTANT DIST TL ***********************
IDS.REG =''
NO.REC.REG =''
REG.ERR =''
            SEL.REG = "SELECEB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyer" WITH REF.DAB EQ " : ID.DAB : " AND DATE.CLOTURE EQ " : V.DATE.SAISIE
            CALL EB.READLIST(SEL.REG,IDS.REG,'',NO.REC.REG,REG.ERR)
            EB.SystemTables.setE()* Modification History :
*-----------------------                                                     
*ZIT-UPG-R13-R19 : NO CHANGE                    
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.ARRETE.DAB.CALC.AMT.TL
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3

   $INSERT I_COMMON
   $INSERT I_EQUATE
   $INSERT I_ENQUIRY.COMMON
   $INSERT I_F.BZ.TL.REGISTRE
   $INSERT I_F.BZ.ARRETE.DAB
   $INSERT I_F.BZ.DAB.TRAIT
   $INSERT I_F.DATES


    GOSUB INIT
    GOSUB OPENFILES
    GOSUB PROCESS

INIT:

    FN.ARRETE.DAB= 'F.BZ.ARRETE.DAB'
    F.ARRETE.DAB=''
    R.ARRETE.DAB=''
    ERR.ARRETE.DAB=''

    FN.TL.REGIS='F.BZ.TL.REGISTRE'
    F.TL.REGIS=''
    R.TL.REGIS=''
    ERR.TL.REGIS=''

    FN.TRAIT= 'F.BZ.DAB.TRAIT'
    F.TRAIT=''
    R.TRAIT=''
    ERR.TRAIT=''

*    FN.DATES='F.DATES'
*    F.DATES=''
    REC.DATE=''
    ERR.DATE=''

    V.MONTANT='0'
    V.AMT.DIST.TL='0'

    RETURN
OPENFILES:

    CALL OPF(FN.ARRETE.DAB,F.ARRETE.DAB)
    CALL OPF(FN.TL.REGIS,F.TL.REGIS)
    CALL OPF(FN.TRAIT,F.TRAIT)
*    CALL OPF(FN.DATES,F.DATES) ;*NOT USED 

    RETURN

PROCESS:

    ID.TICKET=O.DATA
    ID.DAB=ID.TICKET[1,10]
    V.DATE.SAISIE=ID.TICKET[12,8]
    V.DATE.CLOTURE=V.DATE.SAISIE
    CALL CDT('',V.DATE.CLOTURE,'-1C')
*------------------------------------------------------------*
IDS.LIST =''
NO.REC =''
ERR1 =''
    SEL.CMD = "SSELECT ":FN.TRAIT : " WITH NUMERO.DAB EQ " : ID.DAB : " AND DATE.SAISIE LT " : V.DATE.SAISIE
    CALL EB.READLIST(SEL.CMD,IDS.LIST,'',NO.REC,ERR1)
    IF IDS.LIST THEN
        ID.LAST=IDS.LIST<NO.REC>
        V.LAST.DATE=ID.LAST[12,8]
        DATE.DEB=V.LAST.DATE
        CALL CDT('',DATE.DEB,'+1C')
        DIFF='C'
        CALL CDD("",V.LAST.DATE,V.DATE.SAISIE,DIFF)
        BEGIN CASE
        CASE DIFF EQ '1'

**************CALC MONTANT DIST TL ***********************
IDS.REG =''
NO.REC.REG =''
REG.ERR =''
            SEL.REG = "SELECT ":FN.TL.REGIS : " WITH REF.DAB EQ " : ID.DAB : " AND DATE.CLOTURE EQ " : V.DATE.SAISIE
            CALL EB.READLIST(SEL.REG,IDS.REG,'',NO.REC.REG,REG.ERR)
            IF IDS.REG THEN
                FOR COMPTEUR.REG = 1 TO NO.REC.REG

                  EB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyerOM IDS.REG SETTING REG.POS
                 EB.DataAccess.FWrite F.READ(FN.TL.REGIS,ID.REG,R.TL.REGIS,F.TL.REGIS,ERR.TL.REGIS)
                    ID.DAB=R.TL.REGIS<REG.TL.REF.DAB>

                    V.MONTANT=R.TL.REGIS<REG.TL.MONTANT>
        EB.SystemTables.setAf(R.TL.REGIS<REG.TL.TYPE.MESSAGE>)
        EB.SystemTables.setE()* Modification History :
*-----------------------                                                     
*ZIT-UPG-R13-R19 : NO CHANGE                    
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.ARRETE.DAB.CALC.AMT.TL
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3

   $INSERT I_COMMON
   $INSERT I_EQUATE
   $INSERT I_ENQUIRY.COMMON
   $INSERT I_F.BZ.TL.REGISTRE
   $INSERT I_F.BZ.ARRETE.DAB
   $INSERT I_F.BZ.DAB.TRAIT
   $INSERT I_F.DATES


    GOSUB INIT
    GOSUB OPENFILES
    GOSUB PROCESS

INIT:

    FN.ARRETE.DAB= 'F.BZ.ARRETE.DAB'
    F.ARRETE.DAB=''
    R.ARRETE.DAB=''
    ERR.ARRETE.DAB=''

    FN.TL.REGIS='F.BZ.TL.REGISTRE'
    F.TL.REGIS=''
    R.TL.REGIS=''
    ERR.TL.REGIS=''

    FN.TRAIT= 'F.BZ.DAB.TRAIT'
    F.TRAIT=''
    R.TRAIT=''
    ERR.TRAIT=''

*    FN.DATES='F.DATES'
*    F.DATES=''
    REC.DATE=''
    ERR.DATE=''

    V.MONTANT='0'
    V.AMT.DIST.TL='0'

    RETURN
OPENFILES:

    CALL OPF(FN.ARRETE.DAB,F.ARRETE.DAB)
    CALL OPF(FN.TL.REGIS,F.TL.REGIS)
    CALL OPF(FN.TRAIT,F.TRAIT)
*    CALL OPF(FN.DATES,F.DATES) ;*NOT USED 

    RETURN

PROCESS:

    ID.TICKET=O.DATA
    ID.DAB=ID.TICKET[1,10]
    V.DATE.SAISIE=ID.TICKET[12,8]
    V.DATE.CLOTURE=V.DATE.SAISIE
    CALL CDT('',V.DATE.CLOTURE,'-1C')
*------------------------------------------------------------*
IDS.LIST =''
NO.REC =''
ERR1 =''
    SEL.CMD = "SSELECT ":FN.TRAIT : " WITH NUMERO.DAB EQ " : ID.DAB : " AND DATE.SAISIE LT " : V.DATE.SAISIE
    CALL EB.READLIST(SEL.CMD,IDS.LIST,'',NO.REC,ERR1)
    IF IDS.LIST THEN
        ID.LAST=IDS.LIST<NO.REC>
        V.LAST.DATE=ID.LAST[12,8]
        DATE.DEB=V.LAST.DATE
        CALL CDT('',DATE.DEB,'+1C')
        DIFF='C'
        CALL CDD("",V.LAST.DATE,V.DATE.SAISIE,DIFF)
        BEGIN CASE
        CASE DIFF EQ '1'

**************CALC MONTANT DIST TL ***********************
IDS.REG =''
NO.REC.REG =''
REG.ERR =''
            SEL.REG = "SELECT ":FN.TL.REGIS : " WITH REF.DAB EQ " : ID.DAB : " AND DATE.CLOTURE EQ " : V.DATE.SAISIE
            CALL EB.READLIST(SEL.REG,IDS.REG,'',NO.REC.REG,REG.ERR)
            IF IDS.REG THEN
                FOR COMPTEUR.REG = 1 TO NO.REC.REG

                    REMOVE ID.REG FROM IDS.REG SETTING REG.POS
                    CALL F.READ(FN.TL.REGIS,ID.REG,R.TL.REGIS,F.TL.REGIS,ERR.TL.REGIS)
                    ID.DAB=R.TL.REGIS<REG.TL.REF.DAB>

                    V.MONTANT=R.TL.REGIS<REG.TL.MONTANT>
                    V.TYPE.MESSAGE=R.TL.REGIS<REG.TL.TYPE.MESSAGE>
                    IF V.TYPE.MESSAGE EQ "0210" THEN
                        V.MONTANT=V.MONTANT/1000
                        V.AMT.DIST.TL= V.AMT.DIST.TL+V.MONTANT
                        O.DATA=V.AMT.DIST.TL

                    END ELSE
                        V.MONTANT= - V.MONTANT/1000
                        V.AMT.DIST.TL= V.AMT.DIST.TL+V.MONTANT
                        O.DATA=V.AMT.DIST.TL

                    END

                NEXT COMPTEUR.REG
            END ELSE
                O.DATA='0'
            END

        CASE DIFF GE '2'
            SEL.REG = "SELECT ":FN.TL.REGIS : " WITH REF.DAB EQ " : ID.DAB : " AND DATE.CLOTURE GE " : DATE.DEB : " AND DATE.CLOTURE LE " : V.DATE.SAISIE
            CALL EB.READLIST(SEL.REG,IDS.REG,'',NO.REC.REG,REG.ERR)
            IF IDS.REG THEN
                FOR COMPTEUR.REG = 1 TO NO.REC.REG

                    REMOVE ID.REG FROM IDS.REG SETTING REG.POS
                    CALL F.READ(FN.TL.REGIS,ID.REG,R.TL.REGIS,F.TL.REGIS,ERR.TL.REGIS)
                    ID.DAB=R.TL.REGIS<REG.TL.REF.DAB>

                    V.MONTANT=R.TL.REGIS<REG.TL.MONTANT>
                    V.TYPE.MESSAGE=R.TL.REGIS<REG.TL.TYPE.MESSAGE>
                    IF V.TYPE.MESSAGE EQ "0210" THEN
                        V.MONTANT=V.MONTANT/1000
                        V.AMT.DIST.TL= V.AMT.DIST.TL+V.MONTANT
                        O.DATA=V.AMT.DIST.TL

                    END ELSE
                        V.MONTANT= - V.MONTANT/1000
                        V.AMT.DIST.TL= V.AMT.DIST.TL+V.MONTANT
                        O.DATA=V.AMT.DIST.TL

                    END

                NEXT COMPTEUR.REG
            END ELSE
                O.DATA='0'
            END


        END CASE

    END ELSE

        SEL.REG = "SELECT ":FN.TL.REGIS : " WITH REF.DAB EQ " : ID.DAB : " AND DATE.CLOTURE EQ " : V.DATE.SAISIE
        CALL EB.READLIST(SEL.REG,IDS.REG,'',NO.REC.REG,REG.ERR)
        IF IDS.REG THEN
            FOR COMPTEUR.REG = 1 TO NO.REC.REG

                REMOVE ID.REG FROM IDS.REG SETTING REG.POS
                CALL F.READ(FN.TL.REGIS,ID.REG,R.TL.REGIS,F.TL.REGIS,ERR.TL.REGIS)
                ID.DAB=R.TL.REGIS<REG.TL.REF.DAB>

                V.MONTANT=R.TL.REGIS<REG.TL.MONTANT>
                V.TYPE.MESSAGE=R.TL.REGIS<REG.TL.TYPE.MESSAGE>
                IF V.TYPE.MESSAGE EQ "0210" THEN
                    V.MONTANT=V.MONTANT/1000
                    V.AMT.DIST.TL= V.AMT.DIST.TL+V.MONTANT
                    O.DATA=V.AMT.DIST.TL

                END ELSE
                    V.MONTANT= - V.MONTANT/1000
                    V.AMT.DIST.TL= V.AMT.DIST.TL+V.MONTANT
                    O.DATA=V.AMT.DIST.TL

                END

            NEXT COMPTEUR.REG
        END ELSE
            O.DATA='0'
        END
    END
*-------------------------------------------------------------*
    RETURN
END
