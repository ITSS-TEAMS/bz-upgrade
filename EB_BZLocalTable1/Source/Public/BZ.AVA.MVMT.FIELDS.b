* @ValidationCode : MjotMTI4NTcyNDg1ODpDcDEyNTI6MTYwMDQ3ODkzOTUzOTpBZG1pbmlzdHJhdGV1cjotMTotMTowOjE6dHJ1ZTpOL0E6UjE5X0FNUi4wOi0xOi0x
* @ValidationInfo : Timestamp         : 19 Sep 2020 02:28:59
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : Administrateur
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : true
* @ValidationInfo : Bypass GateKeeper : true
* @ValidationInfo : Compiler Version  : R19_AMR.0
*-----------------------------------------------------------------------------
* <Rating>-9</Rating>
*------------------------------------------------------------------------
* Modification History :
*--------------------------------------------------------------------
**ZIT-UPG-R13-R19:Converted FM to @FM

*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable1
SUBROUTINE BZ.AVA.MVMT.FIELDS
*-----------------------------------------------------------------------------
* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;
* $INSERT I_DataTypes - Not Used anymore;

    $USING EB.API
    $USING EB.SystemTables
    $USING EB.Template
*-----------------------------------------------------------------------------
    EB.Template.TableDefineid("ID", "" : @FM : "35" : @FM : "A")
*-----------------------------------------------------------------------------

*-------------------- TABLE /  DEPT.ACCT.OFFICER  -------------------*
    EB.Template.TableAddfielddefinition("CODE.AGENCE","4","A","")
    EB.Template.FieldSetcheckfile('DEPT.ACCT.OFFICER')

*------------------ TABLE /  BZ.AVA.BENEFICIAIRE  -------------------*
    EB.Template.TableAddfielddefinition("ID.BENEF","10","A","")
*    CALL Field.setCheckFile('BZ.AVA.BENEF')


    EB.Template.TableAddfielddefinition("SENS","1","":@FM:"C_D","")


*------------------ TABLE /  BZ.AVA.LIB.MVMT  -------------------*
    EB.Template.TableAddfielddefinition("LIBELLE","4","A","")
    EB.Template.FieldSetcheckfile('BZ.AVA.LIB.MVMT')

    EB.Template.TableAddfielddefinition("REF.MVMT","20","A","")
    EB.Template.TableAddfielddefinition("DATE.MVMT","8","D","")
    EB.Template.TableAddfielddefinition("MONTANT.TND","15","AMT","")

*------------------ TABLE /  BZ.AVA.ORIG.FOND-------------------*
    EB.Template.TableAddfielddefinition("ORIGINE.FOND","3","A","")
    EB.Template.FieldSetcheckfile('BZ.AVA.ORIG.FOND')

    EB.Template.TableAddfielddefinition("BASE.CALCUL","15","AMT","")
    EB.Template.TableAddfielddefinition("DROIT.CUMULE","15","AMT","")
    EB.Template.TableAddfielddefinition("TRANS.CUMULE","15","AMT","")
    EB.Template.TableAddfielddefinition("COMMENTAIRE","35","A","")

*------------------ TABLE /  BZ.AVA.MVMT.STATUT------------------*
    EB.Template.TableAddfielddefinition("STATUT","15","A","")
    EB.Template.FieldSetcheckfile('BZ.AVA.MVMT.STATUT')


    EB.Template.TableAddfielddefinition("DATE.CREATION","8","D","")

*------------------ TABLE / BZ.AVA.DOSSIER  ------------------*
    EB.Template.TableAddfielddefinition("REF.DOSSIER","15","A","")
    EB.Template.FieldSetcheckfile('BZ.AVA.DOSSIER')

    EB.Template.TableAddfielddefinition("DATE.DEPART","8","D","")
    EB.Template.TableAddfielddefinition("DATE.RETOUR","8","D","")

*------------------ TABLE / BZ.AVA.NAT.OP  ------------------*
    EB.Template.TableAddfielddefinition("NATURE.OP","4","A","")
    EB.Template.FieldSetcheckfile('BZ.AVA.NAT.OP')

*------------------ TABLE /  BZ.AVA.MVMT ------------------*
    EB.Template.TableAddfielddefinition("REF.MVMT.CR.BBE","35","A","")
    EB.Template.FieldSetcheckfile('BZ.AVA.MVMT')

    EB.Template.TableAddfielddefinition("LAST.VERSION","50","A","")
    EB.Template.TableAddfielddefinition("RESERVED1","15", "A", "")
    EB.Template.TableAddfielddefinition("PAYS.DESTINATION","2", "A", "")
    EB.Template.FieldSetcheckfile('COUNTRY')

*-----------------------------------------------------------------------------
    EB.Template.TableAddlocalreferencefield("")
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
