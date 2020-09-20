* @ValidationCode : MjoxODczMDExOTY1OkNwMTI1MjoxNjAwNTYyNzUzMjU2OkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTp0cnVlOk4vQTpSMjBfU1A0LjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 20 Sep 2020 01:45:53
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : Administrateur
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : true
* @ValidationInfo : Bypass GateKeeper : true
* @ValidationInfo : Compiler Version  : R20_SP4.0
*-----------------------------------------------------------------------------
* <Rating>-1</Rating>
* Modification History :
*ZIT-UPG-R13-R19     : Converted FM to @FM.
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable3
SUBROUTINE BZ.PWC.COMMISSION.REGISTRY.FIELDS

* @author BOUNOUARA FEHMI

* $INSERT I_COMMON - Not Used anymore;N
* $INSERT I_EQUATE - Not Used anymore;E
* $INSERT I_DataTypes - Not Used anymore;s
    $USING EB.SystemTables
    $USING EB.API
    $USING EB.Template

    EB.Template.TableDefineid("ID", "" : @FM : "70" : @FM : "A")

    EB.Template.TableAddfielddefinition("TYPE.FRAIS", "10", "A", "")
    EB.Template.FieldSetcheckfile('BZ.PWC.TYPE.FRAIS')
    EB.Template.TableAddfielddefinition("CODE.COM", "10", "A", "")

    EB.Template.TableAddfielddefinition("MONTANT.BRUT", "15", "AMT", "")
    EB.Template.TableAddfielddefinition("MONTANT.PRIME", "15", "AMT", "")
    EB.Template.TableAddfielddefinition("COM.BZI.PRIME", "15", "AMT", "")
    EB.Template.TableAddfielddefinition("DEVISE.CPT", "3", "A", "")
    EB.Template.TableAddfielddefinition("EVT.CPT", "10", "A", "")
    EB.Template.TableAddfielddefinition("ID.CARTE", "19", "", "")
    EB.Template.TableAddfielddefinition("ID.CLIENT", "10", "CUS", "")
    EB.Template.FieldSetcheckfile('CUSTOMER')
    EB.Template.TableAddfielddefinition("ID.COMPTE", "15", "ACC", "")
    EB.Template.FieldSetcheckfile('ACCOUNT')
    EB.Template.TableAddfielddefinition("DAO.PL", "10", "A", "")
    EB.Template.FieldSetcheckfile('DEPT.ACCT.OFFICER')
    EB.Template.TableAddfielddefinition("CATEGORY.PL", "10", "A", "")
    EB.Template.FieldSetcheckfile('CATEGORY')
    EB.Template.TableAddfielddefinition("NARRATIVE", "35", "A", "")
    EB.Template.TableAddfielddefinition("REF.PWC", "70", "A", "")

    EB.Template.TableAddfielddefinition("DATE.OPERATION", "8", "D", "")
    EB.Template.TableAddfielddefinition("STATUT", "3", "A", "")
    EB.Template.TableAddfielddefinition("XX<REF.OFS", "12", "A", "")
    EB.Template.TableAddfielddefinition("XX>REF.TRANS", "12", "A", "")

*-----------------------------------------------------------------------------
    EB.Template.TableAddlocalreferencefield("")
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
