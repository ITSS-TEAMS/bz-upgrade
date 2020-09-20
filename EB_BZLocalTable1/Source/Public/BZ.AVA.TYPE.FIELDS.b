* @ValidationCode : MjoxNTI1MjA0NzE1OkNwMTI1MjoxNjAwNDc4OTUwMDg1OkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTp0cnVlOk4vQTpSMTlfQU1SLjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 19 Sep 2020 02:29:10
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
*---- Revision History ------------------------------------------------
* ZIT_UPG_R13_TO_R19 - changed FM to @FM
*----------------------------------------------------------------------
$PACKAGE EB.BZLocalTable1
SUBROUTINE BZ.AVA.TYPE.FIELDS
*-----------------------------------------------------------------------------
* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;
* $INSERT I_DataTypes - Not Used anymore;
    $USING EB.SystemTables
    $USING EB.API
    $USING EB.Template
*-----------------------------------------------------------------------------
    EB.Template.TableDefineid("ID", "" : @FM : "10" : @FM : "A")
*-----------------------------------------------------------------------------
    EB.Template.TableAddfielddefinition("DESCRIPTION","40","A","")

    EB.Template.TableAddfielddefinition("PERIODE.VALIDITE","2","","")

    EB.Template.TableAddfielddefinition("XX<MINT.AMT","15","AMT","")
    EB.Template.TableAddfielddefinition("XX-LIMIT.AMOUNT","15","AMT","")
    EB.Template.TableAddfielddefinition("XX-FLAT.AMT","15","AMT","")
    EB.Template.TableAddfielddefinition("XX>TAUX.AMT","10","R","")

    EB.Template.TableAddfielddefinition("PLAFOND","15","AMT","")

    EB.Template.TableAddfielddefinition("CODE.NAT.OP","4","A","")
    EB.Template.FieldSetcheckfile('BZ.AVA.NAT.OP')
    EB.Template.TableAddfielddefinition("TAUX.FIXE","10","R","")
    EB.Template.TableAddfielddefinition("MONTANT.FIXE","15","AMT","")

    EB.Template.TableAddfielddefinition("TYPE.BCT","10","A","")

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
