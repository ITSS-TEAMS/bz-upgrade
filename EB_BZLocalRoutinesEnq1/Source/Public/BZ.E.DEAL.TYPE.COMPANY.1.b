*-----------------------------------------------------------------------------
* <Rating>80</Rating>
*-----------------------------------------------------------------------------

* @Author : lzazouli@temenos.com
* @Desc   : Routine Nofile pour sortir la liste des DEAL.SUB.TYPE comrrespondant a la compagnie sur MD.PARAMETER
* @Desc   : Regle REG02 STD Garanties Recues
* @Date   : Le 03/01/2011

*********************************************************************
* Modification History :
*-----------------------
* ZIT-UPG-R13-R19      : changed Arithematic operator to T24 operator 
*                        F.READ CHANGED TO CACHE.READ 
* ----------------------------------------------------------------------------

$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.E.DEAL.TYPE.COMPANY.1(Y.LIST.TYPE)
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
$INSERT I_F.USER
$INSERT I_F.MD.PARAMETER
* $INSERT I_COMMON - Not Used anymore;

* $INSERT I_ENQUIRY.COMMON - Not Used anymore;-------------------------------------------
    GOSUB INITIALISATION
    GOSUB MAIN.PROCESS

    RETURN

***************************************************************************
INITIALISATION:

    FN.MD.PARAM = "F.MD.PARAMETER"
    F.MD.PARAM = ""
    R.MD.PARAM = ""
    ERR.MD.PARAM = ""
    CALL OPF(FN.MD.PARAM, F.MD.PARAM)

    FN.CEB.SystemTables.getVFunction()CATEGORY"
    F.CATEG = ""
    R.CATEG FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusEG = ""
    CALL OPF(FN.CATEG, F.CATEG)

  FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus= R.USER<EB.USE.CO.CODE>

    I = 0
    J = 0
    NB = 0
    NC = 0


    RETURN
***************************************************************************




*---------------------------------------------------------------------------
MAIN.PROCESS:

*    CALL F.READ(FN.MD.PARAM, CODE.COMPAGNIE, R.MD.PARAM, F.MD.PARAM, ERR.MD.PARAM)
	CALL CACHE.READ (FN.MD.PARAM, CODE.COMPAGNIE, R.MD.PARAM, ERR.MD.PARAM)
    NC = DCOUNT(R.MD.PARAM<MD.PAR.CONTRACT.TYPE>, @VM)

    FOR J = 1 TO NC

        IEB.DataAccess.Opf.MD.PARAM<MD.PAR.CONTRACT.TYPE, J> EQ 'CL' THEN   ;*Changed 

       EB.DataAccess.Opf  NB = DCOUNT(R.MD.PARAM<MD.PAR.DEAL.SUB.TYP,J>, @SM)

            FOR I= 1 TO NB

                TYEB.SystemTables.getRNew()AFT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefMD.PAR.DEAL.SUB.TYP,J,I>

         EB.DataAccess.FRead IF TYPE.DEAL MATCHES 'GR...' THEN
                    CATEGORIE = R.MD.PARAM<MD.PAR.SUB.CAT.STRT,J,I>
                    CALL F.READ(FN.CATEG,CATEGORIE,R.CATEG,F.CATEG,ERR.CATEG)
                    IF ERR.CATEG EQ '' THEN
                        DESCEB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyerAT.DESCRIPTION>
                    END
            EB.SystemTables.setE(TYPE.DEAL:'*':DESCRIP)

                ENDEB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyerI
        END

  EB.DataAccess.FWriteJ


    REEB.SystemTables.setAf()*-----------------------------------------------------------------------------
* <Rating>80</Rating>
*-----------------------------------------------------------------------------

* @Author : lzazouli@temenos.com
* @Desc   : Routine Nofile pour sortir la liste des DEAL.SUB.TYPE comrrespondant a la compagnie sur MD.PARAMETER
* @Desc   : Regle REG02 STD Garanties Recues
* @Date   : Le 03/01/2011

*********************************************************************
* Modification History :
*-----------------------
* ZIT-UPG-R13-R19      : changed Arithematic operator to T24 operator 
*                        F.READ CHANGED TO CACHE.READ 
* ----------------------------------------------------------------------------

$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.E.DEAL.TYPE.COMPANY.1(Y.LIST.TYPE)
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
$INSERT I_F.USER
$INSERT I_F.MD.PARAMETER
$INSERT I_F.CATEGORY

*----------------------------------------------------------------------
    GOSUB INITIALISATION
    GOSUB MAIN.PROCESS

    RETURN

***************************************************************************
INITIALISATION:

    FN.MD.PARAM = "F.MD.PARAMETER"
    F.MD.PARAM = ""
    R.MD.PARAM = ""
    ERR.MD.PARAM = ""
    CALL OPF(FN.MD.PARAM, F.MD.PARAM)

    FN.CATEG = "F.CATEGORY"
    F.CATEG = ""
    R.CATEG = ""
    ERR.CATEG = ""
    CALL OPF(FN.CATEG, F.CATEG)

    CODE.COMPAGNIE = R.USER<EB.USE.CO.CODE>

    I = 0
    J = 0
    NB = 0
    NC = 0


    RETURN
***************************************************************************




*---------------------------------------------------------------------------
MAIN.PROCESS:

*    CALL F.READ(FN.MD.PARAM, CODE.COMPAGNIE, R.MD.PARAM, F.MD.PARAM, ERR.MD.PARAM)
	CALL CACHE.READ (FN.MD.PARAM, CODE.COMPAGNIE, R.MD.PARAM, ERR.MD.PARAM)
    NC = DCOUNT(R.MD.PARAM<MD.PAR.CONTRACT.TYPE>, @VM)

    FOR J = 1 TO NC

        IF R.MD.PARAM<MD.PAR.CONTRACT.TYPE, J> EQ 'CL' THEN   ;*Changed 

            NB = DCOUNT(R.MD.PARAM<MD.PAR.DEAL.SUB.TYP,J>, @SM)

            FOR I= 1 TO NB

                TYPE.DEAL = R.MD.PARAM<MD.PAR.DEAL.SUB.TYP,J,I>

                IF TYPE.DEAL MATCHES 'GR...' THEN
                    CATEGORIE = R.MD.PARAM<MD.PAR.SUB.CAT.STRT,J,I>
                    CALL F.READ(FN.CATEG,CATEGORIE,R.CATEG,F.CATEG,ERR.CATEG)
                    IF ERR.CATEG EQ '' THEN
                        DESCRIP = R.CATEG<EB.CAT.DESCRIPTION>
                    END
                    Y.LIST.TYPE<-1> = TYPE.DEAL:'*':DESCRIP

                END
            NEXT I
        END

    NEXT J


    RETUEFT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefsetE()*-----------------------------------------------------------------------------
* <Rating>80</Rating>
*-----------------------------------------------------------------------------

* @Author : lzazouli@temenos.com
* @Desc   : Routine Nofile pour sortir la liste des DEAL.SUB.TYPE comrrespondant a la compagnie sur MD.PARAMETER
* @Desc   : Regle REG02 STD Garanties Recues
* @Date   : Le 03/01/2011

*********************************************************************
* Modification History :
*-----------------------
* ZIT-UPG-R13-R19      : changed Arithematic operator to T24 operator 
*                        F.READ CHANGED TO CACHE.READ 
* ----------------------------------------------------------------------------

$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.E.DEAL.TYPE.COMPANY.1(Y.LIST.TYPE)
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
$INSERT I_F.USER
$INSERT I_F.MD.PARAMETER
$INSERT I_F.CATEGORY

*----------------------------------------------------------------------
    GOSUB INITIALISATION
    GOSUB MAIN.PROCESS

    RETURN

***************************************************************************
INITIALISATION:

    FN.MD.PARAM = "F.MD.PARAMETER"
    F.MD.PARAM = ""
    R.MD.PARAM = ""
    ERR.MD.PARAM = ""
    CALL OPF(FN.MD.PARAM, F.MD.PARAM)

    FN.CATEG = "F.CATEGORY"
    F.CATEG = ""
    R.CATEG = ""
    ERR.CATEG = ""
    CALL OPF(FN.CATEG, F.CATEG)

    CODE.COMPAGNIE = R.USER<EB.USE.CO.CODE>

    I = 0
    J = 0
    NB = 0
    NC = 0


    RETURN
***************************************************************************




*---------------------------------------------------------------------------
MAIN.PROCESS:

*    CALL F.READ(FN.MD.PARAM, CODE.COMPAGNIE, R.MD.PARAM, F.MD.PARAM, ERR.MD.PARAM)
	CALL CACHE.READ (FN.MD.PARAM, CODE.COMPAGNIE, R.MD.PARAM, ERR.MD.PARAM)
    NC = DCOUNT(R.MD.PARAM<MD.PAR.CONTRACT.TYPE>, @VM)

    FOR J = 1 TO NC

        IF R.MD.PARAM<MD.PAR.CONTRACT.TYPE, J> EQ 'CL' THEN   ;*Changed 

            NB = DCOUNT(R.MD.PARAM<MD.PAR.DEAL.SUB.TYP,J>, @SM)

            FOR I= 1 TO NB

                TYPE.DEAL = R.MD.PARAM<MD.PAR.DEAL.SUB.TYP,J,I>

                IF TYPE.DEAL MATCHES 'GR...' THEN
                    CATEGORIE = R.MD.PARAM<MD.PAR.SUB.CAT.STRT,J,I>
                    CALL F.READ(FN.CATEG,CATEGORIE,R.CATEG,F.CATEG,ERR.CATEG)
                    IF ERR.CATEG EQ '' THEN
                        DESCRIP = R.CATEG<EB.CAT.DESCRIPTION>
                    END
                    Y.LIST.TYPE<-1> = TYPE.DEAL:'*':DESCRIP

                END
            NEXT I
        END

    NEXT J


    RETURN

END
