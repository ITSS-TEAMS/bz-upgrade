* @ValidationCode : MjoxNzAwMDMyNjg6Q3AxMjUyOjE2MDA0ODQ3MTgxNTk6QWRtaW5pc3RyYXRldXI6LTE6LTE6MDoxOnRydWU6Ti9BOlIyMF9TUDQuMDotMTotMQ==
* @ValidationInfo : Timestamp         : 19 Sep 2020 04:05:18
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : Administrateur
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : true
* @ValidationInfo : Bypass GateKeeper : true
* @ValidationInfo : Compiler Version  : R20_SP4.0
$PACKAGE EB.BZLocalTable2
*-----------------------------------------------------------------------------
* <Rating>-4</Rating>
*-----------------------------------------------------------------------------
SUBROUTINE BZ.AVA.DOSSIER.FIELDS
*-----------------------------------------------------------------------------
*MODIFICATION HISTORY:
*ZIT-UPG-R13-R19-FM TO @FM
********************************************************

* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;
* $INSERT I_DataTypes - Not Used anymore;
    $USING EB.SystemTables
    $USING EB.API
    $USING EB.Template
*-----------------------------------------------------------------------------
    EB.Template.TableDefineid("ID", "" : @FM : "16" : @FM : "A")
*-----------------------------------------------------------------------------
    EB.Template.TableAddfielddefinition("ID.TITUL.AVA","10","CUS","")
    EB.Template.FieldSetcheckfile('CUSTOMER')
    EB.Template.TableAddfielddefinition("TYPE.OUVERTURE","25","A","")
    EB.Template.FieldSetcheckfile('BZ.AVA.TYPE.OUVERTURE')


*------------------ TABLE /  BZ.AVA.TYPE  -------------------*
    EB.Template.TableAddfielddefinition("TYPE.AVA","2","A","")
    EB.Template.FieldSetcheckfile('BZ.AVA.TYPE')
*--------------------------------------------------------------
    EB.Template.TableAddfielddefinition("ANCIEN.REF.AVA","20","A","")
    EB.Template.TableAddfielddefinition("CODE.ANCIEN.IA","5","A","")
    EB.Template.FieldSetcheckfile('BC.SORT.CODE')
    EB.Template.TableAddfielddefinition("DATE.DOMICIL","8","D","")
    EB.Template.TableAddfielddefinition("NUM.AUTORIS.BCT","20","A","")
    EB.Template.TableAddfielddefinition("DATE.AUTORIS.BCT","8","D","")
    EB.Template.TableAddfielddefinition("MNT.BASE.CALCUL","15","AMT","")
    EB.Template.TableAddfielddefinition("MNT.INIT.AVA","15","AMT","")
    EB.Template.TableAddfielddefinition("SOLDE.AVA","15","AMT","")
    EB.Template.TableAddfielddefinition("DATE.VALIDITE","8","D","")

*-------------------- TABLE /  DEPT.ACCT.OFFICER  -------------------*
    EB.Template.TableAddfielddefinition("CODE.AGENCE","4","A","")
    EB.Template.FieldSetcheckfile('DEPT.ACCT.OFFICER')
*------------------ TABLE /  BZ.AVA.STATUT  -------------------*
    EB.Template.TableAddfielddefinition("STATUT","2","A","")
    EB.Template.FieldSetcheckfile('BZ.AVA.STATUT')
*--------------------------------------------------------------
    EB.Template.TableAddfielddefinition("DATE.CREATION","8","D","")

    EB.Template.TableAddfielddefinition("MOTIF.CLOTURE","2","A","")
    EB.Template.FieldSetcheckfile('BZ.AVA.MOTIF.CLOTURE')

    EB.Template.TableAddfielddefinition("DATE.CLOTURE","8","D","")

    EB.Template.TableAddfielddefinition("CPTE.CHARGE.DEB","10","ACC","")

*------------------ TABLE /  BZ.AVA.MOTIF.SUSPENSION  -------------------*
    EB.Template.TableAddfielddefinition("MOTIF.SUSPENS","2","A","")
    EB.Template.FieldSetcheckfile('BZ.AVA.MOTIF.SUSPENSION')

    EB.Template.TableAddfielddefinition("DATE.SUSPENSION","8","D","")
    EB.Template.TableAddfielddefinition("TOTAL.ALIM","15","AMT","")
    EB.Template.TableAddfielddefinition("TOTAL.UTILISE","15","AMT","")

    EB.Template.TableAddfielddefinition("LAST.VERSION","50","A","")
    EB.Template.TableAddfielddefinition("DECLARATION.DOU","20","A","")
    EB.Template.TableAddfielddefinition("NUM.CARTE","20","A","")
    EB.Template.TableAddfielddefinition("DECL.FISCALE","3","":@FM:"OUI_NON","")
    EB.Template.TableAddfielddefinition("COMMENTAIRE","70","A","")
    EB.Template.TableAddfielddefinition("CHIFFRE.AFFAIRES","15","AMT","")
    EB.Template.TableAddfielddefinition("A.ACTIVITE","10","A","")
    EB.Template.FieldSetcheckfile('BZ.AVA.ACTIVITE')
    EB.Template.TableAddfielddefinition("RESERVED1","15", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED2","15", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED3","15", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED4","15", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED5","15", "A", "")
*-----------------------------------------------------------------------------
    EB.Template.TableAddlocalreferencefield("")
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
