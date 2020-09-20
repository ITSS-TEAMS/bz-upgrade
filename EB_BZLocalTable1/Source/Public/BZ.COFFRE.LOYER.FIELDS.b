* @ValidationCode : MjotNzgzNTg2NjQzOkNwMTI1MjoxNjAwNDc4OTgwMjE2OkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTp0cnVlOk4vQTpSMTlfQU1SLjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 19 Sep 2020 02:29:40
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
* <Rating>-1</Rating>
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------
*ZIT_UPG_R13_TO_R19      :   changed FM to @FM
*----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable1
SUBROUTINE BZ.COFFRE.LOYER.FIELDS

*---------------------------------------------------------------------------

* ----------------------------------------------------------------------------

*** <region name= Header>
*** <desc>Inserts and control logic</desc>
* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;
* $INSERT I_DataTypes - Not Used anymore;
    $USING EB.SystemTables
    $USING EB.API
    $USING EB.Template

*** </region>

*-----------------------------------------------------------------------------
    EB.Template.TableDefineid("ID", "" : @FM : "40" : @FM : "A")   ;*changed
*-----------------------------------------------------------------------------
*******
    EB.Template.TableAddfielddefinition("ID.CONTRAT", "12","A","")
    EB.Template.FieldSetcheckfile("BZ.COFFRE.CONTRAT")
    EB.Template.TableAddfielddefinition("DATE.LOYER", "8","D","")
    EB.Template.TableAddfielddefinition("REF.OFS", "35","A","")
    EB.Template.TableAddfielddefinition("REF.LOYER", "35","A","")
    EB.Template.TableAddfielddefinition("DATE.PRELEVEMENT", "8","D","")
    EB.Template.TableAddfielddefinition("MONTANT", "10","A","")
    EB.Template.TableAddfielddefinition("COMPTE", "10","A","")
    EB.Template.TableAddfielddefinition("DEVISE", "10","A","")
    EB.Template.TableAddfielddefinition("NUM.COFFRE", "10","A","")
    EB.Template.TableAddfielddefinition("CHARGE.CODE", "10","A","")

*-----------------------------------------------------------------------------
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
