* @ValidationCode : MjoxNTA1MDYxODU3OkNwMTI1MjoxNjAwNDc5Mjk2MTUyOkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTp0cnVlOk4vQTpSMTlfQU1SLjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 19 Sep 2020 02:34:56
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
$PACKAGE EB.BZLocalTable1
SUBROUTINE BZ.SOLDE.MOYEN.CONTRACT.FIELDS
*-----------------------------------------------------------------------------
*Modification History:
*ZIT-UPG-R13-R19:FM converted to @FM
* ----------------------------------------------------------------------------

*** <region name= Header>
*** <desc>Inserts and control logic</desc>
* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;
* $INSERT I_DataTypes - Not Used anymore;

    $USING EB.API
    $USING EB.SystemTables
    $USING EB.Template
*** </region>
*-----------------------------------------------------------------------------
    EB.Template.TableDefineid("ID", "" : @FM : "35":@FM:"A")
*-----------------------------------------------------------------------------

    EB.Template.TableAddfielddefinition("CONTRAT","20", "A", "")
    EB.Template.TableAddfielddefinition("DEVISE","3", "CCY", "")
    EB.Template.TableAddfielddefinition("NBR.JOUS.MOIS","2", "", "")

    EB.Template.TableAddfielddefinition("XX<NBR.JOURS","10", "", "")
    EB.Template.TableAddfielddefinition("XX>SOLDE","19", "AMT", "")

    EB.Template.TableAddfielddefinition("SOLDE.MOYEN","19", "AMT", "")
*-----------------------------------------------------------------------------
    EB.Template.TableAddlocalreferencefield("")
*-----------------------------------------------------------------------------

    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
