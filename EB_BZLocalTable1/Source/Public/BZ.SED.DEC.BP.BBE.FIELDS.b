* @ValidationCode : MjoxMDM5MzQ3MTU5OkNwMTI1MjoxNjAwNDc5MjcwOTk5OkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTp0cnVlOk4vQTpSMTlfQU1SLjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 19 Sep 2020 02:34:30
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
* <Rating>0</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable1
SUBROUTINE BZ.SED.DEC.BP.BBE.FIELDS
* Modification History :
*ZIT-UPG-R13-R19     : Converted FM to @FM.
*-----------------------------------------------------------------------------
* $INSERT I_COMMON - Not Used anymore;N
* $INSERT I_EQUATE - Not Used anymore;E
* $INSERT I_DataTypes - Not Used anymore;s
    $USING EB.SystemTables
    $USING EB.API
    $USING EB.Template
*-----------------------------------------------------------------------------
    EB.Template.TableDefineid("ID", "" : @FM : "33" : @FM : "A")
*-----------------------------------------------------------------------------
    EB.Template.TableAddfielddefinition("TYPE.MOUVEMENT","2","A","")
    EB.Template.FieldSetcheckfile('BZ.SED.BP.BBE.MVMT')

    EB.Template.TableAddfielddefinition("DEVISE","3","A","")
    EB.Template.FieldSetcheckfile('CURRENCY')

    EB.Template.TableAddfielddefinition("CODE.BP","6","A","")
    EB.Template.FieldSetcheckfile('BZ.SED.BP.REF')

    EB.Template.TableAddfielddefinition("MONTANT.SIGNE","20","A","")
    EB.Template.TableAddfielddefinition("MONTANT.DEBIT","15","AMT","")
    EB.Template.TableAddfielddefinition("MONTANT.CREDIT","15","AMT","")
    EB.Template.TableAddfielddefinition("CODE.PAYS","5","A","")
    EB.Template.TableAddfielddefinition("CODE.IA","4","A","")
    EB.Template.TableAddfielddefinition("DATE.OPERATION","8","D","")

    EB.Template.TableAddfielddefinition("REF.TRANSACTION","12","A","")
    EB.Template.FieldSetcheckfile('TELLER')

    EB.Template.TableAddfielddefinition("CODE.AGENCE","4","A","")
    EB.Template.FieldSetcheckfile('DEPT.ACCT.OFFICER')

    EB.Template.TableAddfielddefinition("STATUT","15","A","")
    EB.Template.TableAddfielddefinition("CODE.NATIONALITE","3","A","")

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
